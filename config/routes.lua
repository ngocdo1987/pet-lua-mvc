local routes = {
    ["/"] = function(post_data)
        local home_controller = require("app.controllers.home_controller")
        return home_controller.index(post_data)
    end,
    ["/submit"] = function(post_data)
        local home_controller = require("app.controllers.home_controller")
        return home_controller.submit(post_data)
    end,
    ["/about"] = function()
        local home_controller = require("app.controllers.home_controller")
        return home_controller.about()
    end,
    ["/404"] = function()
        return "404 Not Found"
    end,
    -- Admin routes for user
    ["/admin/user"] = function()
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.index()
    end,
    ["/admin/user/create"] = function()
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.create()
    end,
    ["/admin/user/store"] = function(post_data)
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.store(post_data)
    end,
    ["/admin/user/edit"] = function(post_data)
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.edit(post_data)
    end,
    ["/admin/user/update"] = function(post_data)
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.update(post_data)
    end,
    ["/admin/user/destroy"] = function(post_data)
        local admin_user_controller = require("app.controllers.admin_user_controller")
        return admin_user_controller.destroy(post_data)
    end
}

return routes
