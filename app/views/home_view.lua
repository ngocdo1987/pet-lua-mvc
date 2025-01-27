-- app/views/home_view.lua
local home_view = {}

function home_view.render(message, users)
    local user_list = ""
    if users then
        for _, user in ipairs(users) do
            user_list = user_list .. string.format("<li>%s (%s)</li>", user.name, user.email)
        end
    end

    return [[
        <!DOCTYPE html>
        <html>
        <head>
            <title>Lua MVC</title>
            <link rel="stylesheet" href="/public/styles.css">
        </head>
        <body>
            <h1>]] .. message .. [[</h1>
            <form action="/submit" method="POST">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
                <button type="submit">Submit</button>
            </form>
            <h2>Users:</h2>
            <ul>]] .. user_list .. [[</ul>
        </body>
        </html>
    ]]
end

return home_view
