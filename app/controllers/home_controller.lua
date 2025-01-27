local User = require("app.models.user_model")

local home_controller = {}

function home_controller.index()
    local view = require("app.views.home_view")
    local users = User.all()  -- Fetch all users from the database
    return view.render("Welcome to the Home Page!", users)
end

function home_controller.submit(post_data)
    local view = require("app.views.home_view")
    if post_data and post_data["name"] and post_data["email"] then
        -- Create a new user in the database
        local success, err = User.create(post_data["name"], post_data["email"])
        if not success then
            return view.render("Error: " .. err)
        end
        return view.render("User created successfully!")
    end
    return view.render("Please provide a name and email.")
end

function home_controller.about()
    local view = require("app.views.home_view")
    return view.render("About Us")
end

return home_controller
