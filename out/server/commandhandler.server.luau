-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local _heal = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "commands", "heal")
local heal = _heal.heal
local healall = _heal.healall
local _kill = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "commands", "kill")
local kill = _kill.kill
local killAll = _kill.killAll
local function getOrCreateRemoteEvent(name)
	local event = ReplicatedStorage:FindFirstChild(name)
	if not event then
		event = Instance.new("RemoteEvent")
		event.Name = name
		event.Parent = ReplicatedStorage
	end
	return event
end
local healEvent = getOrCreateRemoteEvent("HealEvent")
local healAllEvent = getOrCreateRemoteEvent("HealAllEvent")
local killEvent = getOrCreateRemoteEvent("KillEvent")
local killAllEvent = getOrCreateRemoteEvent("KillAllEvent")
healEvent.OnServerEvent:Connect(function(player)
	return heal(player)
end)
healAllEvent.OnServerEvent:Connect(function(player)
	return healall(player)
end)
killEvent.OnServerEvent:Connect(function(player)
	return kill(player)
end)
killAllEvent.OnServerEvent:Connect(function()
	return killAll()
end)
