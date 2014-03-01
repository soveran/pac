return function(mod, sha)
	return require("lib." .. mod .. "-" .. sha)
end
