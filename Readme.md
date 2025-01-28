# Install packages
- Install Lua
- Install Luarocks
```bash
sudo luarocks install luasocket # handling HTTP requests and responses
sudo luarocks install luafilesystem # file handling
sudo luarocks install luasql-mysql # MySQL support (install with MySQL path)
sudo luarocks install luasql-sqlite3
sudo luarocks install luasql-postgres # Postgres support (install with Postgres path)
sudo luarocks install redis-lua # Redis support
sudo luarocks install lua-cjson # serializing and deserializing Lua tables to/from JSON
sudo luarocks install etlua # template engine with features like variable interpolation, loops, conditionals, and more
sudo luarocks install bcrypt
sudo luarocks install lummander # Create a simple command-line interface (CLI) application with Lua
sudo luarocks install lualog # This is a simple logger for Lua
sudo luarocks install Lua-cURL # CURL but install with curl.h installed path
sudo luarocks install lua-resty-session
sudo luarocks install elasticsearch --check-lua-versions
```
# Run
- Copy .env.example to .env, change DB information
```bash
lua server.lua
```
# Run command lines
```bash
lua command.lua
```
Thanks for [DeepSeek](https://www.deepseek.com/) support me.