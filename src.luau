--[[
	@@ Slacker
	
	thread controller class
	
	~ Reflinders
]]

--[[
	Version => 1.3
]]

--@ Class `Slacker`

local Slacker = {}
Slacker.__index = Slacker

function Slacker:fulfill(...)
	if #self < 1 then
		return
	end

	for _, thread in self do
		task.spawn(thread, ...)
	end

	table.clear(self)
end

function Slacker:await()
	table.insert(self, coroutine.running())
	
	return coroutine.yield()
end

function Slacker.new()
	return setmetatable({}, Slacker)
end

Slacker.slack = Slacker.await
Slacker.defer = Slacker.await
Slacker.resume = Slacker.fulfill

return Slacker
