playerJob = "unemployed"

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
	playerJob = playerData.job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	playerJob = job.name
end)

Citizen.CreateThread(function()
	while true do
		local interval = Config.Interval["check"]
		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed)
		if vehicle ~= 0 then
			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				model = GetEntityModel(vehicle)
				if Config.Vehicles[model] ~= nil then
					if not has_value(Config.Vehicles[model].jobs, playerJob) then
						if Config.Vehicles[model].kick then
							TaskLeaveVehicle(playerPed, vehicle, 0)
							TriggerEvent('esx:showNotification', Config.Messages["kick"])
						else
							SetVehicleEngineOn(vehicle, false, true, false)
							TriggerEvent('esx:showNotification', Config.Messages["disable"])
							interval = Config.Interval["disable"]
						end
					end
				end
			end
		end
		Citizen.Wait(interval)
	end
end)

-- Source: https://stackoverflow.com/a/33511182
function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
