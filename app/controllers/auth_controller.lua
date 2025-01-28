local User = require("app.models.user_model")
local RedisUtils = require("utils.redis_utils")  -- Import Redis utilities
local cjson = require("cjson")
local utils = require("utils")
local TemplateEngine = require("template_engine")  -- Import template engine

local auth_controller = {}

function auth_controller.login() 
    return TemplateEngine.render("auth/login", {
        title = "Login"
    })
end

function auth_controller.register()
    return TemplateEngine.render("auth/register", {
        title = "Register"
    })
end

return auth_controller