local routes = {
    ["/"] = function(post_data)
        local home_controller = require("app.controllers.home_controller")
        return home_controller.index(post_data)
    end,
    ["/submit"] = function(post_data)
        local home_controller = require("app.controllers.home_controller")
        return home_controller.submit(post_data)
    end,
    ["/404"] = function()
        return "404 Not Found"
    end
}

return routes
