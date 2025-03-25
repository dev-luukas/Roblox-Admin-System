import { Players } from "@rbxts/services";

function kill(player: Player) {
	const character = player.Character;
	if (character) {
		const humanoid = character.FindFirstChildOfClass("Humanoid") as Humanoid;
		if (humanoid) {
			humanoid.Health = 0;
			print(`${player.Name} wurde getötet`);
		}
	}
}

function killAll() {
	for (const otherPlayer of Players.GetPlayers()) {
		const otherCharacter = otherPlayer.Character;
		if (otherCharacter) {
			const otherHumanoid = otherCharacter.FindFirstChildOfClass("Humanoid");
			if (otherHumanoid) {
				otherHumanoid.Health = 0;
				print(`${otherPlayer.Name} wurde getötet`);
			}
		}
	}
}

export { kill, killAll };
