local User = require("app.models.user_model")
local cjson = require("cjson")
local utils = require("utils")
local TemplateEngine = require("template_engine")  -- Import template engine

local home_controller = {}

function home_controller.index()
    -- local view = require("app.views.home_view")
    local users = User.all()  -- Fetch all users from the database
    
    -- Render the home template with data
    return TemplateEngine.render("home", {
        title = "Lua MVC Home",
        message = "Welcome to the Home Page!",
        users = users
    })
end

function home_controller.submit(post_data)
    -- local view = require("app.views.home_view")
    if post_data and post_data["name"] and post_data["email"] then
        -- Decode URL-encoded form data
        local name = utils.url_decode(post_data["name"])
        local email = utils.url_decode(post_data["email"])

        -- Create a new user in the database
        local success, err = User.create(name, email)
        if not success then
            return TemplateEngine.render("error", { message = "Error: " .. err })
        end
        return TemplateEngine.render("success", { message = "User created successfully!" })
    end
    return TemplateEngine.render("error", { message = "Please provide a name and email." })
end

function home_controller.about()
    local view = require("app.views.home_view")
    return view.render("About Us")
end

return home_controller
