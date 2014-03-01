pac
===

Package management for Lua libraries.

Usage
-----

Define the dependencies in the `.pacs` file:

```
$ cat .pacs
resp 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.github.com/soveran/resp/master/resp.lua
```

Then run `pac`:

```
$ pac
installed: ./pacs/resp-31bf5e0.lua
```

For loading libraries:

```lua
local pac = require("pac")
local resp = pac("resp", "31bf5e0")
```

Of course, you can avoid requiring `pac`:

```lua
local resp = require("pacs.resp-31bf5e0")
```

Installation
------------

Copy `./bin/pac` to your `path`.
Copy `./lib/pac.lua` to your `package.path`.
