local User = require("app.models.user_model")

local admin_user_controller = {}

-- List users
function admin_user_controller.index()
    
    return TemplateEngine.render("about", {
        title = "List users",
        message = "List users"
    })
end

-- Create user form
function admin_user_controller.create()

end

-- Create new user
function admin_user_controller.store(post_data)

end

-- Show user information
function admin_user_controller.show(post_data)

end

-- Edit user form
function admin_user_controller.edit(post_data)

end

-- Update existed user
function admin_user_controller.update(post_data)

end

-- Delete user
function admin_user_controller.destroy(post_data)

end

return admin_user_controller