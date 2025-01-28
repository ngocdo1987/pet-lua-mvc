local sum = {}

function sum.execute(value1, value2)
    print("".. value1.. "+"..value2.." = " ..
              tostring(tonumber(value1) + tonumber(value2)))
end

return sum