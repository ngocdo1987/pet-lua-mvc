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
    -- Test controller
    ["/admin/test"] = function()
        local test_controller = require("app.controllers.admin.test_controller")
        return test_controller.index()
    end,
    -- Admin routes for user
    ["/admin/user"] = function()
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.index()
    end,
    ["/admin/user/create"] = function()
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.create()
    end,
    ["/admin/user/store"] = function(post_data)
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.store(post_data)
    end,
    ["/admin/user/edit"] = function(post_data)
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.edit(post_data)
    end,
    ["/admin/user/update"] = function(post_data)
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.update(post_data)
    end,
    ["/admin/user/destroy"] = function(post_data)
        local user_controller = require("app.controllers.admin.user_controller")
        return user_controller.destroy(post_data)
    end
}

return routes
