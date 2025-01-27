-- init_db.lua
local luasql = require("luasql.mysql")
local load_env = require("load_env")  -- Import the load_env function

-- Load environment variables
local env_vars = load_env(".env")

-- Database connection details
local db_name = env_vars["DB_NAME"]
local db_user = env_vars["DB_USER"]
local db_password = env_vars["DB_PASSWORD"]
local db_host = env_vars["DB_HOST"]
local db_port = env_vars["DB_PORT"]

-- print("DB_NAME:", db_name)
-- print("DB_USER:", db_user)
-- print("DB_PASSWORD:", db_password)
-- print("DB_HOST:", db_host)
-- print("DB_PORT:", db_port)

-- Check if all required environment variables are set
if not db_name or not db_user or not db_password or not db_host or not db_port then
    error("Missing database configuration in .env file. Please check DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, and DB_PORT.")
end

-- Establish the database connection
local env = luasql.mysql()
local conn = env:connect(db_name, db_user, db_password, db_host, tonumber(db_port))

-- Return the database connection
return conn
