-- load_env.lua
local function load_env(file)
    local env = {}
    for line in io.lines(file) do
        local key, value = line:match("^(.-)=(.+)$")
        if key and value then
            env[key] = value
        end
    end
    return env
end

return load_env
