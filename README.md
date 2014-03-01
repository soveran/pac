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

Our preferred way to do it is to run `pac env`, which creates a
subshell where `./lib` is prepended to `LUA_PATH`. Once you run
it, you can require the libraries without any prefix:

```lua
local resp = require("resp-31bf5e0")
```

Installation
------------

Copy `./bin/*` to your `path`. You can use the makefile to ease
the process:

```
$ BIN=/usr/local/bin make
```

If you prefer to use the `pac` helper in your code, copy
`./lib/pac.lua` to your `package.path`.
