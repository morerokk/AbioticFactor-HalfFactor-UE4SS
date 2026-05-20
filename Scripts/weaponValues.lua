-- Weapon tweak values.
-- Any values not listed here means it's vanilla values.
-- Please note that tube-fed shotguns are hardcoded to hold no more than 6 shells,
-- and they get unhappy if you try to give them more.
-- TODO: Can we fix that? I doubt it

-- damage, magazine and recoil is applied to the ItemData.WeaponData. weight and durability is applied to ItemData.
local weaponValues = {
    -- Security pistol 9mm
    pistol_security = {
        magazine = 15,
        recoil = 1,
        weight = 1,
        durability = 150
    },
    -- Security Pistol (Taped Flashlight)
    pistol_security_flashlight = {
        magazine = 15,
        recoil = 0.5,
        weight = 1.2,
        durability = 160
    },
    -- Gutnic Assault Rifle (G36)
    rifle_assault = {
        damage = 85,
        magazine = 30,
        durability = 500
    },
    -- Military SMG
    smg_military = {
        magazine = 50,
        recoil = 1.5,
        durability = 250
    },
    -- Romag Shotgun
    shotgun_military = {
        damage = 30,
        durability = 150
    },
    -- Scrapshot (TODO: add bleed? can we do that? seems low-ish priority but should be looked into)
    -- Should probably take DamageType_Hitscan from another weapon and apply it to this one?
    -- Idk if that works for status effects but it should work for damage types
    scrapshot = {
        damage = 20,
        durability = 250
    },
    -- Talagi Magnum (revolver)
    magnum_military = {
        damage = 150,
        durability = 150,
        weight = 1.5
    },
    -- Pipe Pistol
    pistol_pipe = {
        damage = 100,
        durability = 250
    },
    -- Antique Shotgun (Double Barrel)
    shotgun_doublebarrel = {
        damage = 60,
        durability = 400
    },
    -- Patois Rifle (Burst-fire FAMAS)
    rifle_groupe = {
        damage = 55,
        durability = 400
    },
    -- Wessex Rifle (sniper)
    rifle_sniper = {
        damage = 250,
        durability = 300
    },
    -- Energy Pistol
    pistol_energy = {
        damage = 25
    },
    -- Flamethrower
    flamethrower = {
        damage = 75
    },
    -- Rail Rifle (Wessex Sniper Upgrade 1)
    rifle_sniper_U1 = {
        damage = 350,
        durability = 350
    },
    -- Ice X Rifle (Wessex Sniper Upgrade 2)
    rifle_sniper_U2 = {
        damage = 450,
        magazine = 6,
        durability = 400,
    },
    -- Auto 10 (Security Pistol Upgrade 1)
    pistol_security_U1 = {
        magazine = 16,
        durability = 200,
        weight = 1.6
    },
    -- Z-17 (Security Pistol Upgrade 2)
    pistol_security_U2 = {
        damage = 40,
        magazine = 20,
        durability = 250,
        weight = 2
    },
    -- Night Magnum (Talagi Magnum Revolver Upgrade 1)
    magnum_military_U1 = {
        damage = 175,
        durability = 175,
        weight = 2
    },
    -- Toaster SMG (SMG Upgrade 1)
    smg_military_U1 = {
        damage = 40,
        magazine = 55,
        durability = 300,
        recoil = 1.2
    },
    -- Verenkov's SMG (SMG Upgrade 2)
    smg_military_U2 = {
        damage = 50,
        magazine = 60,
        durability = 350,
        recoil = 1
    },
    -- Thumper Shotgun (Romag Shotgun Upgrade 1)
    shotgun_military_U1 = {
        damage = 35,
        -- TODO: Can we mess with the magazine size? Probably not
        durability = 200
    },
    -- Snowfall Shotgun (Romag Shotgun Upgrade 2)
    shotgun_military_U2 = {
        damage = 40,
        durability = 250
    },
    -- Polished Antique Shotgun (Antique Shotgun Upgrade 1)
    shotgun_doublebarrel_U1 = {
        damage = 75,
        durability = 425
    },
    -- Plasmois Rifle (Patois Rifle FAMAS Upgrade 1)
    rifle_groupe_U1 = {
        damage = 65,
        durability = 500
    },
    -- Shredshot (Scrapshot Upgrade 1)
    scrapshot_U1 = {
        damage = 45,
        durability = 350
    },
    -- Lode Pistol (Pipe Pistol Upgrade 1)
    pistol_pipe_U1 = {
        damage = 200,
        durability = 300
    },
    -- Hypercross Magbow (Magbow Upgrade 1)
    crossbow_magbow_U1 = {
        damage = 350
    },
    -- Laser Pistol (Energy Pistol Upgrade 1)
    pistol_energy_U1 = {
        -- TODO: Both this and the energy pistol are probably too high, this is probably per tick.
        -- There aren't as many ticks as it looks, but it's probably still too much for a rechargeable weapon.
        -- This can one-tap a lot of stuff
        damage = 50
    },
    -- Manomin Magnum (Desert Eagle gatekeeper)
    pistol_gk = {
        -- TODO: Put in generic damage type
        damage = 300,
        durability = 300
    },
}

-- Scrapshot (Taped Flashlight)
weaponValues.scrapshot_flashlight = weaponValues.scrapshot

return weaponValues
