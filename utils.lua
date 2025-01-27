-- utils.lua
local utils = {}

-- Function to decode URL-encoded strings
function utils.url_decode(str)
    str = str:gsub("+", " ")  -- Replace '+' with spaces
    str = str:gsub("%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end)
    return str
end

return utils