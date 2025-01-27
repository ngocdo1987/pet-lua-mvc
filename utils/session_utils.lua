local session = require("resty.session")  -- Import the session library

local SessionUtils = {}

-- Function to start a new session
function SessionUtils.start_session()
    local sess = session.new()
    sess:start()
    return sess
end

-- Function to set a session variable
function SessionUtils.set_session_variable(sess, key, value)
    sess.data[key] = value
    sess:save()
end

-- Function to get a session variable
function SessionUtils.get_session_variable(sess, key)
    return sess.data[key]
end

-- Function to destroy a session
function SessionUtils.destroy_session(sess)
    sess:destroy()
end

return SessionUtils