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


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","Fr3ckz_AC_v1.0")

ResourceName = GetCurrentResourceName()
Bans = 0

if Fr3ckzAC.AutoMessage then
    Citizen.CreateThread(function()
        while true do
            local delay = Fr3ckzAC.AutoMessageDelay
            local source = source
            local user_id2 = vRP.getUserId({source})
            local allPlayers = vRP.getUsers({v})
            for k,v in pairs(allPlayers) do
                local user_id = vRP.getUserId({v})
                if vRP.hasPermission({user_id, Fr3ckzAC.Permission}) then
                    TriggerClientEvent("chat:addMessage", v, {
                        args = {
                            "🛡️ | ^1Protected By Fr3ckz_AC ^0| Detections imens servern har været oppe: ^1" ..Bans.. "",
                        },
                    }) 
                end
            end
            Citizen.Wait(delay)
            Citizen.Wait(0)
        end
    end)
end

if Fr3ckzAC.AutoClear then
    Citizen.CreateThread(function()
        while true do
            TriggerClientEvent("chat:clear", -1)
            TriggerClientEvent('chatMessage', -1, "🛡️ | ^1Fr3ckz_AC ^0| Auto Cleared!", {249, 77, 20})
            Citizen.Wait(Fr3ckzAC.AutoClearDelay)
            Citizen.Wait(0)
        end
    end)
end

RegisterServerEvent('Fr3ckz_AC:sendBlacklistNotify')
AddEventHandler('Fr3ckz_AC:sendBlacklistNotify', function(blacklistedWeapon)
    local source = source
    local user_id = vRP.getUserId({source})
    
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Blacklisted Vaaben! - Vaaben: ^1".. blacklistedWeapon .." ^0- ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Blacklisted Våben";
                    description = 'Spiller ID: **' ..user_id.. '**\nVåben: **' ..blacklistedWeapon.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    DropPlayer(source, "[🛡️ | Fr3ckz_AC] | " ..Fr3ckzAC.BanReason.. " - "..blacklistedWeapon)
end)

RegisterServerEvent('Fr3ckz_AC:spectaterMode')
AddEventHandler('Fr3ckz_AC:spectaterMode', function()
    local source = source
    local user_id = vRP.getUserId({source})
    
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Spectater! - ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Spectater";
                    description = 'Spiller ID: **' ..user_id.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    vRP.ban({user_id, "[🛡️ | Fr3ckz_AC] | "..Fr3ckzAC.BanReason})
end)

RegisterServerEvent('Fr3ckz_AC:objectDetection')
AddEventHandler('Fr3ckz_AC:objectDetection', function(entity)
    local source = source
    local user_id = vRP.getUserId({source})
    
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Object";
                    description = 'Spiller ID: **' ..user_id.. '**\nObject: **' ..entity.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
end)


RegisterServerEvent('Fr3ckz_AC:sendBlacklistCarNotify')
AddEventHandler('Fr3ckz_AC:sendBlacklistCarNotify', function(blacklistedCar)
    local source = source
    local user_id = vRP.getUserId({source})
    
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Blacklisted Koretoj! - Koretoj: ^1".. blacklistedCar .." ^0- ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Blacklisted Køretøj";
                    description = 'Spiller ID: **' ..user_id.. '**\nKøretøj: **' ..blacklistedCar.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    DropPlayer(source, "[🛡️ | Fr3ckz_AC] | " ..Fr3ckzAC.BanReason.. "  - "..blacklistedCar)
end)

RegisterServerEvent('Fr3ckz_AC:sendBlacklistPedNotify')
AddEventHandler('Fr3ckz_AC:sendBlacklistPedNotify', function(blacklistedPed)
    local source = source
    local user_id = vRP.getUserId({source})
    
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Blacklisted Ped! - Ped: ^1".. blacklistedPed .." ^0- ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Blacklisted Ped";
                    description = 'Spiller ID: **' ..user_id.. '**\nPed: **' ..blacklistedPed.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    DropPlayer(source, "[🛡️ | Fr3ckz_AC] | " ..Fr3ckzAC.BanReason.. " - "..blacklistedPed)
end)

RegisterServerEvent('RunCode:RunStringRemotelly')
AddEventHandler('RunCode:RunStringRemotelly', function ()
    local source = source
    local user_id = vRP.getUserId({source})
    
    if Fr3ckzAC.EjerTool == true then
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Ejer Tool! - Spiller ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Ejer Tool";
                    description = 'Spiller ID: **' ..user_id.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    vRP.ban({user_id, "[🛡️ | Fr3ckz_AC] | "..Fr3ckzAC.BanReason})
    end
end)

RegisterServerEvent('Fr3ckz_AC:anticheatPlanke')
AddEventHandler('Fr3ckz_AC:anticheatPlanke', function ()
    local source = source
    local user_id = vRP.getUserId({source})
    
    --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Planke Command! - Spiller ID: ^1" ..user_id)
    local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    steamID = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    playerip = v
            end
    end
    Bans = Bans + 1
    PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "🛡️ | Fr3ckz_AC",
            embeds = {
                {              
                    title = "🛡️ | Fr3ckz_AC | Antiplanke";
                    description = 'Spiller ID: **' ..user_id.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                    color = 15731467;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    DropPlayer(source, "[🛡️ | Fr3ckz_AC] | "..Fr3ckzAC.BanReason)
end)

-- https://forum.cfx.re/t/how-to-create-an-anti-cheat-list-of-vulnerable-and-abused-events-updated-january-2020/789618
if Fr3ckzAC.TriggerProtection == true then
    for k, eventName in pairs(Fr3ckzAC.BlacklistedEvents) do
    RegisterNetEvent(eventName)
    AddEventHandler(eventName, function()
            CancelEvent()
            local source = source
            local user_id = vRP.getUserId({source})
            local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
            for k,v in ipairs(GetPlayerIdentifiers(source)) do
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                            steamID = v
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                            playerip = v
                    end
            end
            Bans = Bans + 1
            PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
                {
                    username = "🛡️ | Fr3ckz_AC",
                    embeds = {
                        {              
                            title = "🛡️ | Fr3ckz_AC | TriggerProtection";
                            description = 'Spiller ID: **' ..user_id.. '**\nEvent: **' ..eventName.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                            color = 15731467;
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
                --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Blacklisted Trigger Event! - Event: ^1" ..eventName.. "^0 - Spiller ID: ^1" ..user_id)
                DropPlayer(source, "[🛡️ | Fr3ckz_AC] | "..Fr3ckzAC.BanReason.. " - "..eventName)
            end
        )
    end
end

-- forum
AddEventHandler("chatMessage", function(source, n, message)
    for k, n in pairs(Fr3ckzAC.AntiWords) do
        if string.match(message:lower(), n:lower()) then
            if Fr3ckzAC.AntiWord == true then
            CancelEvent()
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ordet      (' ..message.. ') er blacklisted!', length = 10000, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
            local source = source
            local user_id = vRP.getUserId({source})
            --print("^1[^0🛡️ | Fr3ckz_AC^1] ^0Blacklisted ord! - Ord: ^1".. message .." ^0- ID: ^1" ..user_id)
            local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"
            for k,v in ipairs(GetPlayerIdentifiers(source)) do
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                            steamID = v
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                            playerip = v
                    end
            end
            Bans = Bans + 1
            PerformHttpRequest(Fr3ckzAC.Webhook, function(o,p,q) end,'POST',json.encode(
                {
                    username = "🛡️ | Fr3ckz_AC",
                    embeds = {
                        {              
                            title = "🛡️ | Fr3ckz_AC | Blacklisted Ord";
                            description = 'Spiller ID: **' ..user_id.. '**\nOrd: **' ..message.. '**\nSteam: **' ..steamID.. '**\nIP: **--disabled--**';
                            color = 15731467;
                        }
                    }
                }), { ['Content-Type'] = 'application/json' })
            end
        end
    end
end)
