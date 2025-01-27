-- redis_utils.lua
local redis = require("redis")
local load_env = require("load_env")  -- Import the load_env function

-- Load environment variables
local env_vars = load_env(".env")

local RedisUtils = {}

-- Connect to Redis
local client = redis.connect(env_vars["REDIS_HOST"], env_vars["REDIS_PORT"])

-- Function to get data from Redis cache
function RedisUtils.get_from_cache(key)
    local data = client:get(key)
    if data then
        return true, data  -- Return true and the cached data
    end
    return false, nil  -- Return false if the key doesn't exist
end

-- Function to set data in Redis cache
function RedisUtils.set_in_cache(key, value, ttl)
    client:set(key, value)
    client:expire(key, ttl)  -- Set TTL (in seconds)
end

return RedisUtils
