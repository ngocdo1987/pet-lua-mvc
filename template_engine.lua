-- template_engine.lua
local pl = require("pl.template")
local path = require("pl.path")

local TemplateEngine = {}

-- Function to render a template
function TemplateEngine.render(template_name, data)
    -- Construct the full path to the template file
    local template_path = "app/views/" .. template_name .. ".lua.html"

    -- Check if the template file exists
    if not path.isfile(template_path) then
        error("Template file not found: " .. template_path)
    end

    -- Read the template file
    local template_content = pl.template.compile(template_path)

    -- Render the template with the provided data
    return template_content(data)
end

return TemplateEngine