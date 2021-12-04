Config = {}

Config.Interval = {
	["check"] = 1000,
	["disable"] = 250
}

Config.Messages = {
	["kick"] = "~r~Sorry, you don't have access to this vehicle..",
	["disable"] = "~r~Sorry, you don't have a key for this vehicle.."
}

Config.Vehicles = {
	[`police3`] = {
		jobs = {"police", "sheriff"},   -- Which jobs can access vehicle
		kick = true		-- Kick player out of vehicle? If false the vehicle will be disabled
	},
	[`ambulance`] = {
		jobs = {"ambulance"},   -- Which jobs can access vehicle
		kick = false		-- Kick player out of vehicle? If false the vehicle will be disabled
	}
}