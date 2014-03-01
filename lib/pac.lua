return function(mod, sha)
	return require("pacs." .. mod .. "-" .. sha)
end
