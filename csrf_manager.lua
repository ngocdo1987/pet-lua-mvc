-- csrf_manager.lua
local function generate_csrf_token()
    local random = math.random
    local token = ""
    for i = 1, 32 do
        token = token .. string.format("%02x", random(0, 255))
    end
    return token
end

return {
    generate_csrf_token = generate_csrf_token
}