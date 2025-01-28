-- app/models/user_model.lua
local conn = require("init_db")  -- Import the database connection

local User = {}

-- Function to create a new user
function User.create(name, email)
    local query = string.format("INSERT INTO users (name, email, password) VALUES ('%s', '%s', 'samplepassword')", name, email)
    local cursor, err = conn:execute(query)
    if not cursor then
        return nil, err
    end
    return true
end

-- Function to find a user by ID
function User.find(id)
    local query = string.format("SELECT * FROM users WHERE id = %d", id)
    local cursor, err = conn:execute(query)
    if not cursor then
        return nil, err
    end
    local user = cursor:fetch({}, "a")
    cursor:close()
    return user
end

-- Function to get all users
function User.all(offset, limit)
    local query = string.format("SELECT id, name, email FROM users ORDER BY id DESC LIMIT %d, %d", offset, limit)
    local cursor, err = conn:execute(query)
    if not cursor then
        return nil, err
    end
    local users = {}
    local row = cursor:fetch({}, "a")
    while row do
        table.insert(users, row)
        row = cursor:fetch({}, "a")
    end
    cursor:close()
    return users
end

-- Function to update a user
function User.update(id, name, email)
    local query = string.format("UPDATE users SET name = '%s', email = '%s' WHERE id = %d", name, email, id)
    local cursor, err = conn:execute(query)
    if not cursor then
        return nil, err
    end
    return true
end

-- Function to delete a user
function User.delete(id)
    local query = string.format("DELETE FROM users WHERE id = %d", id)
    local cursor, err = conn:execute(query)
    if not cursor then
        return nil, err
    end
    return true
end

return User
