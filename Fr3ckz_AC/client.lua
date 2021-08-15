--[[
/$$$$$$$$        /$$$$$$            /$$                         /$$$$$$   /$$$$$$ 
| $$_____/       /$$__  $$          | $$                        /$$__  $$ /$$__  $$
| $$     /$$$$$$|__/  \ $$  /$$$$$$$| $$   /$$ /$$$$$$$$       | $$  \ $$| $$  \__/
| $$$$$ /$$__  $$  /$$$$$/ /$$_____/| $$  /$$/|____ /$$/       | $$$$$$$$| $$      
| $$__/| $$  \__/ |___  $$| $$      | $$$$$$/    /$$$$/        | $$__  $$| $$      
| $$   | $$      /$$  \ $$| $$      | $$_  $$   /$$__/         | $$  | $$| $$    $$
| $$   | $$     |  $$$$$$/|  $$$$$$$| $$ \  $$ /$$$$$$$$       | $$  | $$|  $$$$$$/
|__/   |__/      \______/  \_______/|__/  \__/|________//$$$$$$|__/  |__/ \______/ 
                                                       |______/                    --]]

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","Fr3ckz_AC_v1.0")

local disableallweapons = Fr3ckzAC.DisableAllWeapons

Citizen.CreateThread(function()
	while true do
		Wait(1)
		if Fr3ckzAC.BlacklistWeapon == true then
			nothing, weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)
			if disableallweapons then
				RemoveAllPedWeapons(GetPlayerPed(-1), true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(GetPlayerPed(-1), weapon)
					currentWeapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)
					exports['mythic_notify']:SendAlert('error', 'Dette vaaben er blacklisted!')
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Fr3ckzAC.BlacklistedWeapons) do
		if model == GetHashKey(blacklistedWeapon) then
			TriggerServerEvent('Fr3ckz_AC:sendBlacklistNotify', blacklistedWeapon)
			return true
		end
	end

	return false
end

-- Blacklist Koretoj Funktion
Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(Fr3ckzAC.BlacklistedVehicle) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

-- Blacklisted Car
function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			DeleteEntity(car)
			exports['mythic_notify']:SendAlert('error', 'Dette koretoj er blacklisted!')
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Fr3ckzAC.BlacklistedVehicle) do
		if model == GetHashKey(blacklistedCar) then
			TriggerServerEvent('Fr3ckz_AC:sendBlacklistCarNotify', blacklistedCar)
			return true
		end
	end

	return false
end

-- Heal Everyone
RegisterCommand(Fr3ckzAC.HealEveryoneCMD, function()
	if Fr3ckzAC.HealEveryone == true then
		TriggerServerEvent("Fr3ckz_AC:HealEveryone")
	end
end)

RegisterNetEvent("Fr3ckz_AC:HealEveryoneCL")
AddEventHandler("Fr3ckz_AC:HealEveryoneCL", function(everyone)
	local eveyoneped = PlayerPedId(everyone)
    SetEntityHealth(eveyoneped,200)
end)

-- Blacklist Ped Funktion
defaultpedmodel = Fr3ckzAC.DefaultPed

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			playerModel = GetEntityModel(playerPed)

			if not prevPlayerModel then
				if isPedBlacklisted(prevPlayerModel) then
					SetPlayerModel(PlayerId(), GetHashKey(defaultpedmodel))
				else
					prevPlayerModel = playerModel
				end
			else
				if isPedBlacklisted(playerModel) then
					SetPlayerModel(PlayerId(), prevPlayerModel)
					exports['mythic_notify']:SendAlert('error', 'Dette ped er blacklisted!')
				end

				prevPlayerModel = playerModel
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(750)
		local issent = false -- nød til dette ellers spammer den...
		if Fr3ckzAC.AntiSpectate == true then
			if NetworkIsInSpectatorMode() then
				TriggerServerEvent("Fr3ckz_AC:spectaterMode")
				Citizen.Wait(200)
				NetworkSetInSpectatorMode(0, GetPlayerPed(-1))
			end
		end
	end
end)

function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(Fr3ckzAC.BlacklistedPed) do
		if model == GetHashKey(blacklistedPed) then
			TriggerServerEvent('Fr3ckz_AC:sendBlacklistPedNotify', blacklistedPed)
			return true
		end
	end

	return false
end

-- Planke Blacklist
RegisterCommand('ck', function()
	if Fr3ckzAC.BlacklistPlanke == true then
	TriggerServerEvent('Fr3ckz_AC:anticheatPlanke')
	end
end)

-- Start
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	local current = GetCurrentServerEndpoint()
	TriggerServerEvent('Fr3ckz:Start', current)
  end)


-- AntiSay
RegisterCommand('say', function()
	if Fr3ckzAC.AntiSay == true then
	CancelEvent()
	exports['mythic_notify']:SendAlert('error', '[Fr3ckz_AC] Blacklisted!')
	end
end)