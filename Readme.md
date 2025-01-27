# Install packages
- Install Lua
- Install Luarocks
```bash
sudo luarocks install luasocket # handling HTTP requests and responses
sudo luarocks install luafilesystem # file handling
sudo luarocks install luasql-mysql # MySQL support
sudo luarocks install redis-lua # Redis support
```
# Run
- Copy .env.example to .env, change DB information
```bash
lua server.lua
```