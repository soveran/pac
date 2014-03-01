pac
===

Script in rc shell for installing Lua libraries.

Usage
-----

Define the dependencies in the .pacs file:

```
$ cat .pacs
resp 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.github.com/soveran/resp/master/resp.lua
```

Then run `pac`:

```
$ pac
installed: ./pacs/resp-31bf5e0408f122ee4f8ae4c21c07804564a55382.lua
```

Installation
------------

Copy `./bin/pac` to your path.
