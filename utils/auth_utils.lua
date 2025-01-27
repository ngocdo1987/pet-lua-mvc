local auth_utils = {}

-- Simulated user database (replace with real database queries)
local users = {
    { id = 1, username = "john", password = "password123" },
    { id = 2, username = "jane", password = "password456" }
}

-- Verify user credentials
function auth_utils.authenticate(username, password)
    for _, user in ipairs(users) do
        if user.username == username and user.password == password then
            return user
        end
    end
    return nil
end

-- Generate a token (simulated)
function auth_utils.generate_token(user)
    return "fake_token_" .. user.id
end

-- Verify a token (simulated)
function auth_utils.verify_token(token)
    local user_id = tonumber(token:match("fake_token_(%d+)"))
    if user_id then
        for _, user in ipairs(users) do
            if user.id == user_id then
                return user
            end
        end
    end
    return nil
end

return auth_utils