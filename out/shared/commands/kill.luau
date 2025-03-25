-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local function kill(player)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = 0
			print(`{player.Name} wurde getötet`)
		end
	end
end
local function killAll()
	for _, otherPlayer in Players:GetPlayers() do
		local otherCharacter = otherPlayer.Character
		if otherCharacter then
			local otherHumanoid = otherCharacter:FindFirstChildOfClass("Humanoid")
			if otherHumanoid then
				otherHumanoid.Health = 0
				print(`{otherPlayer.Name} wurde getötet`)
			end
		end
	end
end
return {
	kill = kill,
	killAll = killAll,
}
