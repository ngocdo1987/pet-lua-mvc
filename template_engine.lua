-- template_engine.lua
local pl = require("pl.template")  -- Correctly require the template module
local path = require("pl.path")    -- For file path operations

local TemplateEngine = {}

-- Function to render a template
function TemplateEngine.render(template_name, data)
    -- Construct the full path to the template file
    local template_path = "app/views/" .. template_name .. ".lua.html"

    -- Check if the template file exists
    if not path.isfile(template_path) then
        error("Template file not found: " .. template_path)
    end

    -- Read and compile the template file
    print("Template path:", template_path)
    local template_content = pl.compile(template_path)

    -- Render the template with the provided data
    print("Template content type:", type(template_content))
    return template_content:render(data)  -- Call the :render() method
end

return TemplateEngine