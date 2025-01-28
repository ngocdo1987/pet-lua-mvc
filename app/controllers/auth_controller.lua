local User = require("app.models.user_model")
local RedisUtils = require("utils.redis_utils")  -- Import Redis utilities
local cjson = require("cjson")
local utils = require("utils")
local TemplateEngine = require("template_engine")  -- Import template engine
local load_env = require("load_env")  -- Import the load_env function

-- Load environment variables
local env_vars = load_env(".env")

local auth_controller = {}

function auth_controller.login() 
    local recaptcha_site_key = env_vars["RECAPTCHA_SITE_KEY"]

    return TemplateEngine.render("auth/login", {
        title = "Login",
        recaptcha_site_key = recaptcha_site_key
    })
end

function auth_controller.register()
    return TemplateEngine.render("auth/register", {
        title = "Register"
    })
end

return auth_controller