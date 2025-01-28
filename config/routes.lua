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
    ["/adminuser"] = function()
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.index()
    end,
    ["/adminuser/create"] = function()
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.create()
    end,
    ["/adminuser/store"] = function(post_data)
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.store(post_data)
    end,
    ["/adminuser/edit"] = function(post_data)
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.edit(post_data)
    end,
    ["/adminuser/update"] = function(post_data)
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.update(post_data)
    end,
    ["/adminuser/destroy"] = function(post_data)
        local adminuser_controller = require("app.controllers.adminuser_controller")
        return adminuser_controller.destroy(post_data)
    end
}

return routes
