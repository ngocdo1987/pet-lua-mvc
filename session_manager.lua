-- session_manager.lua
local csrf_manager = require "csrf_manager"

local sessions = {} -- In-memory session storage

-- Create session
local function create_session(user_id)
    local session_id = csrf_manager.generate_csrf_token() -- Use token as session ID
    sessions[session_id] = {
        user_id = user_id,
        csrf_token = csrf_manager.generate_csrf_token()
    }

    -- Then save it
    save_session()

    return session_id
end

-- Get session by ID
local function get_session(session_id)
    return sessions[session_id]
end

-- Save sessions to a file
local function save_session()
    local file = io.open("sessions.txt", "w") -- Change file name here
    for session_id, data in pairs(sessions) do
        file:write(session_id .. " " .. data.user_id .. " " .. data.csrf_token .. "\n")
    end
    file:close()
end

-- Load sessions from a file
local function load_session()
    local file = io.open("sessions.txt", "r") -- Change file name here
    if not file then return end
    for line in file:lines() do
        local session_id, user_id, csrf_token = line:match("(%S+) (%S+) (%S+)")
        sessions[session_id] = { user_id = user_id, csrf_token = csrf_token }
    end
    file:close()
end

local function verify_csrf_token(session_id, submitted_csrf_token)
    local session = get_session(session_id)
    if not session then
        return false, "Session not found"
    end

    if session.csrf_token ~= submitted_csrf_token then
        return false, "CSRF token verification failed"
    end

    -- Regenerate CSRF token for the next request
    session.csrf_token = csrf_manager.generate_csrf_token()
    return true, "CSRF token verified successfully"
end

return {
    create_session = create_session,
    get_session = get_session,
    save_session = save_session,
    load_session = load_session,
    verify_csrf_token = verify_csrf_token
}