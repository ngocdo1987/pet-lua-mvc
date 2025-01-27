local auth_utils = require("utils.auth_utils")

local auth_middleware = {}

function auth_middleware.handle(request, response, next)
    -- Check for an authentication token (e.g., in headers or cookies)
    local token = request.headers["Authorization"] or request.cookies["auth_token"]

    if token then
        -- Verify the token
        local user = auth_utils.verify_token(token)
        if user then
            -- Attach the user to the request object
            request.user = user
            return next(request, response)
        end
    end

    -- If not authenticated, return a 401 Unauthorized response
    response.status_code = 401
    response.body = "Unauthorized"
end

return auth_middleware