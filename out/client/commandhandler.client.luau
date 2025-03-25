-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players = _services.Players
local ReplicatedStorage = _services.ReplicatedStorage
local TextChatService = _services.TextChatService
local RoleList = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "IsAdmin").default
local Player = Players.LocalPlayer
local healEvent = ReplicatedStorage:WaitForChild("HealEvent")
local healAllEvent = ReplicatedStorage:WaitForChild("HealAllEvent")
local killEvent = ReplicatedStorage:WaitForChild("KillEvent")
local killAllEvent = ReplicatedStorage:WaitForChild("KillAllEvent")
local function executeHealCommand(command)
	if command == "!hp me" then
		healEvent:FireServer()
	elseif command == "!hp all" then
		healAllEvent:FireServer()
	elseif command == "!kill me" then
		killEvent:FireServer()
	elseif command == "!kill all" then
		killAllEvent:FireServer()
	end
	print(`Command executed: {command}`)
end
TextChatService.MessageReceived:Connect(function(message)
	local _owners = RoleList.Owners
	local _userId = Player.UserId
	if _owners[_userId] ~= nil then
		executeHealCommand(message.Text)
	end
end)
