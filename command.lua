-- Require "lummander"
local Lummander = require "lummander"

-- Create a lummander instance
local cli = Lummander.new{
    title = "My Custom App", -- <string> title for CLI. Default: ""
    tag = "myapp", -- <string> CLI Command to execute your program. Default: "".
    description = "My App description", -- <string> CLI description. Default: ""
    version = "0.1.1", -- <string> CLI version. Default: "0.1.0"
    author = "Myself", -- <string> author. Default: ""
    root_path = "", -- <string> root_path. Default "". Concat this path to load commands of a subfolder
    theme = "acid", -- Default = "default". "default" and "acid" are built-in themes
    flag_prevent_help = false -- <boolean> Prevent help message if not command found. Default: false
}

-- Add commands
cli:command("mycmd", "My command description")
    :action(function(parsed, command, app)
        print("You activated `mycmd` command")
    end)

cli:command("sum <value1> <value2>", "Sum 2 values")
    :option(
        "option1","o","Option1 description",nil,"normal","option_default_value")
    :option(
        "option2","p","Option2 description",nil,"normal","option2_default_value")
    :action(function(parsed, command, app)
        print("".. parsed.value1.. "+"..parsed.value2.." = " ..
              tostring(tonumber(parsed.value1) + tonumber(parsed.value2)))
    end)

-- Parse and execute the command wrote
cli:parse(arg) -- parse arg and execute if a command was written