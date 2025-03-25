import { Players, ReplicatedStorage, TextChatService } from "@rbxts/services";
import { killAll } from "shared/commands/kill";
import RoleList from "shared/IsAdmin";

const Player = Players.LocalPlayer;

const healEvent = ReplicatedStorage.WaitForChild("HealEvent") as RemoteEvent;
const healAllEvent = ReplicatedStorage.WaitForChild("HealAllEvent") as RemoteEvent;
const killEvent = ReplicatedStorage.WaitForChild("KillEvent") as RemoteEvent;
const killAllEvent = ReplicatedStorage.WaitForChild("KillAllEvent") as RemoteEvent;

function executeHealCommand(command: string) {
	if (command === "!hp me") {
		healEvent.FireServer();
	} else if (command === "!hp all") {
		healAllEvent.FireServer();
	} else if (command === "!kill me") {
		killEvent.FireServer();
	} else if (command === "!kill all") {
		killAllEvent.FireServer();
	}
	print(`Command executed: ${command}`);
}

TextChatService.MessageReceived.Connect((message) => {
	if (RoleList.Owners.has(Player.UserId)) {
		executeHealCommand(message.Text);
	}
});
