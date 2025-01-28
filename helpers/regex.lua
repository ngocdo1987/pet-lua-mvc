local rex = require 'rex_pcre'
local regex_helper = {}

-- Looks like PHP's preg_match function
function preg_match(pattern, subject)
    local match = rex.match(subject, pattern)
    
    if match then
        return 1
    else
        return 0
    end
end

-- Looks like PHP's preg_match_all function
function preg_match_all(pattern, subject)
    local matches = {}
    local count = 0

    -- Use rex.gmatch to find all matches (PCRE-compatible)
    for match in rex.gmatch(subject, pattern) do
        table.insert(matches, match)
        count = count + 1
    end

    return matches, count
end

-- Looks like PHP's preg_replace function
function preg_replace(pattern, replacement, subject)
    -- Use rex.gsub to replace all occurrences of the pattern with the replacement (PCRE-compatible)
    local result, count = rex.gsub(subject, pattern, replacement)
    
    -- Return the modified string and the number of replacements made
    return result, count
end

return regex_helper