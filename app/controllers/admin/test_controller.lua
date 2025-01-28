local User = require("app.models.user_model")
local RedisUtils = require("utils.redis_utils")  -- Import Redis utilities
local cjson = require("cjson")
local utils = require("utils")
local TemplateEngine = require("template_engine")  -- Import template engine

local test_controller = {}

function test_controller.index(post_data)
    return TemplateEngine.render("admin/test/index", {
        title = "Test index"
    })
end

return test_controller