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

Fr3ckzAC = {}

-- // VERSION // -- (IK RØR)
Fr3ckzAC.Version = "v1.0"

-- // DEFAULT // --
Fr3ckzAC.BlacklistWeapon = true -- Blacklisted Våben System
Fr3ckzAC.DisableAllWeapons = false -- Blacklisted Alle våben
Fr3ckzAC.BlacklistVehicle = true -- Blacklisted Køretøj System
Fr3ckzAC.BlacklistPed = true -- Blacklisted Ped System
Fr3ckzAC.EjerTool = true -- Fjern muligheden for at bruge EjerTool (banner folk)
Fr3ckzAC.BlacklistPlanke = true -- Blacklisted Planke Commands
Fr3ckzAC.TriggerProtection = true -- Blacklist Forskellige TriggerEvents
Fr3ckzAC.AntiWord = true -- Blacklist af ord
Fr3ckzAC.AntiSpectate = true -- Fjern muligheden for at spectate andre

-- // BAN/KICK-REASON // --
Fr3ckzAC.BanReason = "Stop med at modde..." -- Ban/Kick grunden, når man bliver taget.

-- // EKSTRA // --
Fr3ckzAC.Permission = "player.kick" -- Hvilken "staff" permission, så at staff får de forskellige beskeder.
Fr3ckzAC.AutoClear = true -- Fjern automatisk beskeder, hver stykke tid
Fr3ckzAC.AutoClearDelay = "600000" -- Hvor langt skal der være imellem hver auto clear? (1000 = 1 sec)
Fr3ckzAC.AutoMessage = true -- Send automatiske beskeder hvor mange der er blevet bannet af anticheatet imens servern har været oppe.
Fr3ckzAC.AutoMessageDelay = "300000" -- Hvor langt skal der være imellem hver besked? (1000 = 1 sec)

-- // DISCORDLOG // --
Fr3ckzAC.Webhook = "INDSÆT HER" -- Dit webhook, så du får beskeder om hvem der modder og hvem der bliver taget.

-- // LICENSE // --
Fr3ckzAC.License = "" -- Dit discord navn.

-- // WEAPON BLACKLIST // --
Fr3ckzAC.BlacklistedWeapons = { -- Blacklisted Våben
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_RAYPISTOL",
    "WEAPON_RPG",
    "WEAPON_COMBATMG",
    "WEAPON_MICROSMG",
    "WEAPON_COMBATMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MG",
    "WEAPON_FIREWORK",
    "WEAPON_MARKSMANRIFLE"
}

-- // VEHICLE BLACKLIST // --
Fr3ckzAC.BlacklistedVehicle = { -- Blacklisted Køretøjer
	"RHINO",
	"HYDRA",
	"LAZER",
	"JET"
}

-- // PED BLACKLIST // --
Fr3ckzAC.DefaultPed = "mp_m_freemode_01"
Fr3ckzAC.BlacklistedPed = { -- Blacklisted Peds
    "a_m_m_beach_01"
}

-- // TRIGGER PROTECTION // --
Fr3ckzAC.BlacklistedEvents = { -- Blacklisted Events
	"adminmenu:allowall",
    "scrap:SellVehicle",
}

-- // WORD BLACKLIST // --
Fr3ckzAC.AntiWords = { -- Blacklisted Ord
    "G0LD-K1DS",
	"neger",
    "nigger",
    "nigga",
    "Unex",
    "Desudo",
    "RedENGINE",
    "FiveM Modding",
    "Eulen",
    "Troldemanden",
    "Azure",
    "GOLD-KIDS",
    "GOLDKIDS",
	"Alokas",
	"SkullExec",
}
