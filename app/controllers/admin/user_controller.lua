local User = require("app.models.user_model")

local user_controller = {}

-- List users
function user_controller.index(post_data)
    local users = User.all(0, 10)

    return TemplateEngine.render("admin/user", "index", {
        title = "List users",
        users = users
    })
end

-- Create user form
function user_controller.create()

end

-- Create new user
function user_controller.store(post_data)

end

-- Show user information
function user_controller.show(post_data)

end

-- Edit user form
function user_controller.edit(post_data)

end

-- Update existed user
function user_controller.update(post_data)

end

-- Delete user
function user_controller.destroy(post_data)

end

return user_controller