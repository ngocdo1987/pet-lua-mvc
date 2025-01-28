local array_helper = {}

-- Looks like PHP's array_combine function
function array_combine(keys_table, values_table)
    -- Check if both tables have the same length
    if #keys_table ~= #values_table then
        error("Both tables must have the same number of elements")
    end

    local combined_table = {}

    -- Iterate over the keys and values tables
    for i = 1, #keys_table do
        local key = keys_table[i]
        local value = values_table[i]
        combined_table[key] = value
    end

    return combined_table
end

-- Looks like PHP's array_count_values function
function array_count_values(input_table)
    local count_table = {}

    -- Iterate over each element in the input table
    for _, value in ipairs(input_table) do
        -- If the value is already a key in the count table, increment its count
        if count_table[value] then
            count_table[value] = count_table[value] + 1
        else
            -- Otherwise, initialize the count to 1
            count_table[value] = 1
        end
    end

    return count_table
end

return array_helper