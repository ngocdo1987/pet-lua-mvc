-- server.lua
local socket = require("socket")  -- Import LuaSocket for networking
local lfs = require("lfs")        -- Import LuaFileSystem for file handling (optional)
local session_manager = require "session_manager"
local csrf_manager = require "csrf_manager"

-- Import logging middleware
local logging = require("middleware.logging_middleware")

-- Create a TCP server listening on port 8080
local server = assert(socket.bind("*", 5678))
local ip, port = server:getsockname()

print("Server running on http://" .. ip .. ":" .. port)

-- Function to serve static files (e.g., CSS, JS)
local function serve_static_file(path)
    -- Remove the leading "/public" from the path
    local file_path = path:gsub("^/public", "public")
    print("Serving static file:", file_path)  -- Debug statement
    local file = io.open(file_path, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return content
    end
    return nil
end

-- Function to parse HTTP request headers
local function parse_headers(client)
    local headers = {}
    while true do
        local line = client:receive()
        if not line or line == "" then break end  -- End of headers
        local key, value = line:match("^(.-):%s*(.+)")
        if key and value then
            headers[key:lower()] = value
        end
    end
    return headers
end

-- Function to parse POST request body
local function parse_post_body(client, content_length)
    local body = client:receive(tonumber(content_length))
    local params = {}
    for key, value in body:gmatch("([^&=]+)=([^&=]+)") do
        params[key] = value
    end
    return params
end

local function parse_cookies(cookie_header)
    local cookies = {}
    if cookie_header then
        for cookie in cookie_header:gmatch("([^;]+)") do
            local name, value = cookie:match("([^%s=]+)=([^%s=]+)")
            if name and value then
                cookies[name] = value
            end
        end
    end
    return cookies
end

-- Main server loop
while true do
    -- Accept a client connection
    local client = server:accept()
    client:settimeout(10)  -- Set a timeout for receiving data

    -- Receive the HTTP request line
    local request = client:receive()
    if not request then
        client:close()
        goto continue
    end

    -- Parse the request method and path
    local method, path = request:match("^(%u+)%s+(.-)%s+HTTP/%d%.%d")
    path = path or "/"

    -- Call logging middleware
    logging.middleware(method, path)

    -- Parse request headers
    local headers = parse_headers(client)

    -- START COOKIES + SESSIONS
    -- Get the client's IP address
    local ip_address = client:getpeername()
    if not ip_address then
        ip_address = "unknown" -- Fallback if IP address cannot be retrieved
    end

    local cookies = parse_cookies(headers["cookie"])
    -- Get or create session_id from cookies
    local session_id = cookies["session_id"]
    local session
    if not session_id then
        -- Create a new session for first-time users
        session_id = session_manager.create_session(ip_address)
        session = session_manager.get_session(session_id)
    else
        -- Retrieve the session
        session = session_manager.get_session(session_id)
        if not session then
            -- If the session is invalid, create a new one
            session_id = session_manager.create_session(ip_address)
            session = session_manager.get_session(session_id)
        end
    end
    print("CSRF: ", session.csrf_token)
    -- END COOKIES + SESSIONS

    -- Handle POST requests
    local post_data = {}
    if method == "POST" and headers["content-length"] then
        post_data = parse_post_body(client, headers["content-length"])
    end

    -- Serve static files if the path starts with /public
    if path:match("^/public/") then
        local static_content = serve_static_file(path)
	
        if static_content then
            client:send("HTTP/1.1 200 OK\r\nContent-Type: text/css\r\n\r\n" .. static_content)
        else
            client:send("HTTP/1.1 404 Not Found\r\n\r\nFile not found")
        end
        client:close()
        goto continue
    end

    -- Route the request to the appropriate handler
    local routes = require("config.routes")  -- Load the routing table
    local handler = routes[path] or routes["/404"]  -- Get the handler for the path

    -- Execute the handler and get the response
    local response = handler(post_data)  -- Pass POST data to the handler

    -- Send the HTTP response
    client:send("HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n" .. response)
    client:close()

    ::continue::
end
