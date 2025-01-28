-- template_engine.lua
local etlua = require("etlua")  -- Import etlua
local path = require("pl.path")  -- For file path operations

local TemplateEngine = {}

-- Function to render a template
function TemplateEngine.render(sub_path, template_name, data)
    -- Construct the full path to the template file
    if sub_path == "admin/user" then
        local template_path = "app/views/admin/user/" .. template_name .. ".etlua"
    else
        local template_path = "app/views/" .. template_name .. ".etlua"
    end

    -- Check if the template file exists
    if not path.isfile(template_path) then
        error("Template file not found: " .. template_path)
    end

    -- Read the template file content
    local template_file = io.open(template_path, "r")
    if not template_file then
        error("Failed to open template file: " .. template_path)
    end
    local template_content = template_file:read("*a")  -- Read the entire file
    template_file:close()

    -- Compile the template
    local compiled_template = etlua.compile(template_content)

    -- Render the template with the provided data
    return compiled_template(data)  -- Pass the data table directly
end

return TemplateEngine