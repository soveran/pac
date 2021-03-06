pac
===

Package management for single file dependencies.

Description
-----------

Pac is a collection of [rc][rc] scripts that let you manage your
project's dependencies. Installing [rc][rc] is trivial on
Unix-like systems.

Usage
-----

Define the dependencies in the `packages` file:

```
$ cat packages
./lib/resp.lua 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.githubusercontent.com/soveran/resp/1.2.0/resp.lua
```

Then run `pac install`:

```
$ pac install
installed: ./lib/resp.lua
```

For loading libraries:

```lua
local resp = require("lib/resp")
```

Commands
--------

Whenever you call `pac <command>`, the program `pac-<command>`
is executed. Below are the core commands:

#### `pac-help`

Lists the installed commands. A command is any program in the
executable path with the pattern `pac-*`.

#### `pac-fetch`

Receives a module `name`, a `sha` and a `URL`, and installs the
module locally.

#### `pac-install`

Calls `pac-fetch` for every three values in the `packages` file.

Requirements
------------

Pac uses [rc][rc], [xargs][xargs], [curl][curl] and
[shasum][shasum]. Make sure you have these tools available.

[rc]: http://www.scs.stanford.edu/nyu/04fa/sched/readings/rc.pdf
[xargs]: http://en.wikipedia.org/wiki/Xargs
[curl]: http://en.wikipedia.org/wiki/CURL
[shasum]: http://en.wikipedia.org/wiki/Shasum

Installation
------------

Copy `./bin/*` to your `path`. You can use the makefile to ease
the process:

```
$ BIN=/usr/local/bin make
```

Case Study: Lua modules
-----------------------

This use case makes the assumption that a Lua module is contained
in a single file. It may depend on other modules, but in all cases
a module should be indistinguishable from a file.

For better explaining what this project does, we will start by
describing the `packages` file format. Here's an example with only
one referenced module:

```
$ cat packages
./lib/resp.lua 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.githubusercontent.com/soveran/resp/1.2.0/resp.lua
```

There are three space separated fields. The first one is the name
we want to give to that module. Note that it's the user of the
module, not its author, the person in charge of defining that
name. In this case, it happens to match the name of the file, but
you can get creative if you need to.

The second field is the `shasum` of the file. This serves the
purpose of versioning, but it also lets `pac` perform integrity
checks when fetching new files.

The third field is the URL where the file is located. It is used
by `pac` for downloading the file.

Given that `packages` file, you can install the module with this
command:

```
$ pac install
```

Internally, it calls the `fetch` subcommand for every three
arguments. You can call `fetch` directly and provide the three
values as parameters:

```
$ pac fetch ./lib/resp.lua 31bf5e0408f122ee4f8ae4c21c07804564a55382 https://raw.githubusercontent.com/soveran/resp/1.2.0/resp.lua
```

The `pac fetch` command creates the `./lib` directory if
necessary, and after validating the `shasum` of the downloaded
file, it creates a copy with the following pattern:

```
$ ls ./lib/
resp.lua
```

The goal of this approach is to have a simple, yet bullet proof
system. Note that this tool is not designed to deal with compiled
packages, or with executables, man pages, or any other code aside
from single file modules. Those are separate concerns that can be
addressed with other tools.
