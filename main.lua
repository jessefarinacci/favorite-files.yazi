--- @since 26.1.22
--- @class Options Plugin options
--- @field favorites table List of file names to auto-select
--- @field favorites_append table List of file names to auto-select
--- @field favorites_prepend table List of file names to auto-select

local DEFAULT_FAVORITES = { "README.html", "README.md", "README.txt", "README" }

--- @param opts Options
local function setup(opts)
	-- load user config
	local favorites = (opts and opts.favorites) or DEFAULT_FAVORITES
	local favorites_append = (opts and opts.favorites_append) or {}
	local favorites_prepend = (opts and opts.favorites_prepend) or {}
	-- FIXME: favorites = concat(favorites_prepend, favorites, favorites_append)

	-- handle all Yazi 'load' events
	ps.sub("load", function(args)
		if (args ~= nil) and (args.url == cx.active.current.cwd) then
			for _, file in ipairs(cx.active.current.files) do
				for _, favorite in ipairs(favorites_prepend) do
					if file.name == favorite then
						ya.emit("reveal", { file.url })
						return
					end
				end
				for _, favorite in ipairs(favorites) do
					if file.name == favorite then
						ya.emit("reveal", { file.url })
						return
					end
				end
				for _, favorite in ipairs(favorites_append) do
					if file.name == favorite then
						ya.emit("reveal", { file.url })
						return
					end
				end
			end
		end
	end)
end

return { setup = setup }
