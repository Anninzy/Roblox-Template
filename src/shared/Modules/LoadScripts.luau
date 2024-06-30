return function(requiringScript)
	for _, moduleScript in ipairs(requiringScript:GetDescendants()) do
		if not moduleScript:IsA("ModuleScript") then
			continue
		end

		_G[moduleScript.Name] = require(moduleScript)
	end

	for _name, module in pairs(_G) do
		if type(module) == "function" then
			continue
		end

		if not module.Initialize then
			continue
		end

		module.Initialize()
	end
end
