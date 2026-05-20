local weaponValues = require("weaponValues")
local weaponTweaker = require("weaponTweaker")
local ammoValues = require("ammoValues")
local ammoTweaker = require("ammoTweaker")

local oldUE4SSCompat = require("oldUE4SSCompat")

-- Honestly this should just be cut out of the mod, only magazine sizes work
local function runOldUE4SSCompat(weaponValues, ammoValues)
    print("[Half Factor Lua] Detected older UE4SS version, falling back to ONLY changing magazine sizes. Please use the Half Factor .pak version or update UE4SS.\n")
    oldUE4SSCompat:setupWeapons(weaponValues)
    oldUE4SSCompat:setupAmmo(ammoValues)
end

-- Tweak values immediately on game start. This runs in the menu, before a game is loaded.
-- ExecuteInGameThread is necessary to use LoadAsset
ExecuteInGameThread(function()
    -- Weapon values are stored in two separate DataTables, a Weapons and a Global one.
    -- We at least have to tweak the Global one, but we probably have to tweak both.

    -- Load DataTables manually as they're not loaded in the menu
    LoadAsset("/Game/Blueprints/Items/ItemTable_Weapons.ItemTable_Weapons")
    local weaponsDt = StaticFindObject("/Game/Blueprints/Items/ItemTable_Weapons.ItemTable_Weapons")
    LoadAsset("/Game/Blueprints/Items/ItemTable_Global.ItemTable_Global")
    local globalDt = StaticFindObject("/Game/Blueprints/Items/ItemTable_Global.ItemTable_Global")

    -- Check for old or new UE4SS versions
    if not weaponsDt or not weaponsDt.FindRow then
        -- Old version
        runOldUE4SSCompat(weaponValues, ammoValues)
        return
    end
    local testWeaponRow = weaponsDt:FindRow("pistol_security")
    if not testWeaponRow or not testWeaponRow.IsValid then
        -- Old version
        runOldUE4SSCompat(weaponValues, ammoValues)
        return
    end

    -- New version

    -- Change weapon stats
    weaponTweaker:applyToDataTable(weaponsDt, weaponValues)
    weaponTweaker:applyToDataTable(globalDt, weaponValues)

    print("[Half Factor Lua] Applied weapon rebalances successfully\n")

    -- Change ammo drop rates
    LoadAsset("/Game/Blueprints/DataTables/DT_Salvage.DT_Salvage")
    local salvageDt = StaticFindObject("/Game/Blueprints/DataTables/DT_Salvage.DT_Salvage")
    ammoTweaker:applyToDataTable(salvageDt, ammoValues)

    print("[Half Factor Lua] Applied ammo drop rebalances successfully\n")
end)
