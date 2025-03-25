import { Players } from "@rbxts/services";

function heal(player: Player) {
	const character = player.Character;
	if (character) {
		const humanoid = character.FindFirstChildOfClass("Humanoid");
		if (humanoid) {
			humanoid.Health = humanoid.MaxHealth;
			print(`${player.Name} wurde geheilt!`);
		}
	}
}

function healall(player: Player) {
	const character = player.Character;
	if (character) {
		const humanoid = character.FindFirstChildOfClass("Humanoid");
		for (const otherPlayer of Players.GetPlayers()) {
			const otherCharacter = otherPlayer.Character;
			if (otherCharacter) {
				const otherHumanoid = otherCharacter.FindFirstAncestorOfClass("Humanoid");
				if (otherHumanoid) {
					otherHumanoid.Health = 0;
				}
			}
		}
	}
}

export { heal, healall };
