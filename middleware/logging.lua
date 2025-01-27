-- middleware/logging.lua
local logging = {}

-- Logging middleware function
function logging.middleware(method, path)
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")  -- Get current timestamp
    print(string.format("[%s] %s %s", timestamp, method, path))  -- Log the request
end

return logging
