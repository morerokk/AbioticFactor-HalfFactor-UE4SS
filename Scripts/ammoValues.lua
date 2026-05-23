-- Ammo drop values

-- ammo_9mm
local pistol_low = {
    min = 5,
    max = 15
}
local pistol_default = {
    min = 10,
    max = 25
}
local pistol_high = {
    min = 20,
    max = 50
}
local pistol_veryhigh = {
    min = 50,
    max = 100
}
-- ammo_Magnum
local magnum_default = {
    min = 3,
    max = 6
}
local magnum_high = {
    min = 12,
    max = 24
}
local magnum_veryhigh = {
    min = 25,
    max = 50
}
-- ammo_556
local rifle_default = {
    min = 10,
    max = 20
}
local rifle_high = {
    min = 15,
    max = 60 -- Probably a bit high
}
-- ammo_12g
local shotgun_low = {
    min = 2,
    max = 5
}
local shotgun_default = {
    min = 3,
    max = 6
}
local shotgun_high = {
    min = 6,
    max = 20
}
-- ammo_308
local sniper_default = {
    min = 5,
    max = 10
}
local sniper_high = {
    min = 10,
    max = 20
}
local sniper_extreme = {
    min = 60,
    max = 100
}

local dropchance_low = 0.3
local dropchance_default = 0.4 -- This is down from 0.5 to compensate for the new ammo crafting, but that's a matter of personal opinion.
local dropchance_guaranteed = 1.0


-- Kinda convoluted. Structure is:
--[[
    (droptable_name) = {
        (item_name) = {
            values = { min = (min), max = (max) },
            chance = (chance)
        }
    }
]]
local ammoValues = {
    loot_grunt = {
        ["ammo_9mm"] = {
            values = pistol_default,
            chance = dropchance_default
        }
    },
    loot_grunt_captain = {
        ["ammo_Magnum"] = {
            values = magnum_default,
            chance = dropchance_default
        }
    },
    loot_groupe_mountaineer = {
        ["ammo_556"] = {
            values = rifle_default,
            chance = dropchance_default
        }
    },
    loot_groupe_cqc = {
        ["ammo_12g"] = {
            values = shotgun_default,
            chance = dropchance_default
        }
    },
    loot_gatekeeper_chieftain = {
        ["ammo_Magnum"] = {
            values = magnum_high,
            chance = dropchance_default
        }
    },
    loot_gatekeeper_heavy = {
        ["ammo_308"] = {
            values = sniper_high,
            chance = dropchance_low
        }
    },
    loot_gatekeeper_witch = {
        ["ammo_12g"] = {
            values = shotgun_high,
            chance = dropchance_default
        }
    },
    loot_gatekeeper_phyter = {
        ["ammo_556"] = {
            values = rifle_high,
            chance = dropchance_default
        }
    },
    loot_grunt_sniper = {
        ["ammo_308"] = {
            values = sniper_default,
            chance = dropchance_low
        }
    },
    loot_grunt_breacher = {
        ["ammo_12g"] = {
            values = shotgun_low,
            chance = dropchance_default
        }
    },
    loot_grunt_guard = {
        ["ammo_9mm"] = {
            values = pistol_low,
            chance = dropchance_default
        }
    },
    loot_OrnateCrate = {
        ["ammo_Magnum"] = {
            values = magnum_high,
            chance = dropchance_default
        },
        ["ammo_9mm"] = {
            values = pistol_high,
            chance = dropchance_default
        },
        ["ammo_12g"] = {
            values = shotgun_high,
            chance = dropchance_default
        },
        ["ammo_308"] = {
            values = sniper_high,
            chance = dropchance_default
        }
    },
    loot_SecurityCrate = {
        ["ammo_9mm"] = {
            values = pistol_veryhigh,
            chance = dropchance_default
        }
    },
    loot_InqCrate = {
        ["ammo_Magnum"] = {
            values = magnum_veryhigh,
            chance = dropchance_default
        }
    },
    loot_order_trooper = {
        ["ammo_556"] = {
            values = rifle_high,
            chance = dropchance_default
        }
    },
    loot_order_trooper_cqc = {
        ["ammo_12g"] = {
            values = shotgun_high,
            chance = dropchance_default
        }
    },
    loot_gatekeeper_heavy_DarkLens = {
        ["ammo_308"] = {
            values = sniper_extreme,
            chance = dropchance_guaranteed
        }
    }
}

return ammoValues
