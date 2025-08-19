-- Hide noisy runtime warnings in :CheckHealth (Mason etc.)
do
	local patterns = { "ruby", "composer", "php", "javac", "java", "julia" }

	local function is_noisy(msg)
		if type(msg) ~= "string" then
			return false
		end
		local m = msg:lower()
		for _, k in ipairs(patterns) do
			if m:find(k, 1, true) then
				return true
			end
		end
		return false
	end

	local health = vim.health
	local warn0, info0, err0 = health.warn, health.info, health.error

	health.warn = function(msg, ...)
		if is_noisy(msg) then
			return
		end
		return warn0(msg, ...)
	end
	health.info = function(msg, ...)
		if is_noisy(msg) then
			return
		end
		return info0(msg, ...)
	end
	health.error = function(msg, ...)
		if is_noisy(msg) then
			return
		end
		return err0(msg, ...)
	end
end
