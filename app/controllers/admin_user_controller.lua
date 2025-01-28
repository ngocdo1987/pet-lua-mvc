local User = require("app.models.user_model")

local adminuser_controller = {}

-- List users
function adminuser_controller.index()
    
    return TemplateEngine.render("about", {
        title = "List users",
        message = "List users"
    })
end

-- Create user form
function adminuser_controller.create()

end

-- Create new user
function adminuser_controller.store(post_data)

end

-- Show user information
function adminuser_controller.show(post_data)

end

-- Edit user form
function adminuser_controller.edit(post_data)

end

-- Update existed user
function adminuser_controller.update(post_data)

end

-- Delete user
function adminuser_controller.destroy(post_data)

end

return admin_user_controller