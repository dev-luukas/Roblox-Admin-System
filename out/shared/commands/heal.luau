-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local function heal(player)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = humanoid.MaxHealth
			print(`{player.Name} wurde geheilt!`)
		end
	end
end
local function healall(player)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		for _, otherPlayer in Players:GetPlayers() do
			local otherCharacter = otherPlayer.Character
			if otherCharacter then
				local otherHumanoid = otherCharacter:FindFirstAncestorOfClass("Humanoid")
				if otherHumanoid then
					otherHumanoid.Health = 0
				end
			end
		end
	end
end
return {
	heal = heal,
	healall = healall,
}
