# Install packages
- Install Lua
- Install Luarocks
```bash
sudo luarocks install luasocket # handling HTTP requests and responses
sudo luarocks install luafilesystem # file handling
sudo luarocks install luasql-mysql # MySQL support
sudo luarocks install redis-lua # Redis support
sudo luarocks install lua-cjson # serializing and deserializing Lua tables to/from JSON
sudo luarocks install etlua # template engine with features like variable interpolation, loops, conditionals, and more
sudo luarocks install bcrypt
sudo luarocks install lua-resty-session
sudo luarocks install elasticsearch --check-lua-versions
```
# Run
- Copy .env.example to .env, change DB information
```bash
lua server.lua
```