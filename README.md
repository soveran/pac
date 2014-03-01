pac
===

Package management for Lua libraries.

Usage
-----

Define the dependencies in the `packages` file:

```
$ cat packages
resp 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.github.com/soveran/resp/master/resp.lua
```

Then run `pac install`:

```
$ pac install
installed: ./lib/resp-31bf5e0.lua
```

For loading libraries:

```lua
local pac = require("pac")
local resp = pac("resp", "31bf5e0")
```

Of course, you can avoid requiring `pac`:

```lua
local resp = require("lib.resp-31bf5e0")
```

Installation
------------

Copy `./bin/pac` to your `path`.
Copy `./lib/pac.lua` to your `package.path`.
