local User = require("app.models.user_model")
local RedisUtils = require("utils.redis_utils")  -- Import Redis utilities
local cjson = require("cjson")
local utils = require("utils")
local TemplateEngine = require("template_engine")  -- Import template engine

local user_controller = {}

-- List users
function user_controller.index(post_data)
    local users = User.all(0, 10)

    return TemplateEngine.render("admin/user/index", {
        title = "List users",
        users = users
    })
end

-- Create user form
function user_controller.create()
    return TemplateEngine.render("admin/user/create", {
        title = "Create new user"
    })
end

-- Create new user
function user_controller.store(post_data)

end

-- Show user information
function user_controller.show(post_data)
    return TemplateEngine.render("admin/user/show", {
        title = "Show user information"
    })
end

-- Edit user form
function user_controller.edit(post_data)
    return TemplateEngine.render("admin/user/edit", {
        title = "Edit user"
    })
end

-- Update existed user
function user_controller.update(post_data)

end

-- Delete user
function user_controller.destroy(post_data)

end

return user_controller