import { Players, ReplicatedStorage } from "@rbxts/services";
import { heal, healall } from "shared/commands/heal";
import { kill, killAll } from "shared/commands/kill";

function getOrCreateRemoteEvent(name: string): RemoteEvent {
	let event = ReplicatedStorage.FindFirstChild(name) as RemoteEvent | undefined;
	if (!event) {
		event = new Instance("RemoteEvent");
		event.Name = name;
		event.Parent = ReplicatedStorage;
	}
	return event;
}

const healEvent = getOrCreateRemoteEvent("HealEvent");
const healAllEvent = getOrCreateRemoteEvent("HealAllEvent");
const killEvent = getOrCreateRemoteEvent("KillEvent");
const killAllEvent = getOrCreateRemoteEvent("KillAllEvent");

healEvent.OnServerEvent.Connect((player) => heal(player));
healAllEvent.OnServerEvent.Connect((player) => healall(player));
killEvent.OnServerEvent.Connect((player) => kill(player));
killAllEvent.OnServerEvent.Connect(() => killAll());
