local weaponValues = require("weaponValues")
local weaponTweaker = require("weaponTweaker")

-- Tweak values immediately on game start. This runs in the menu, before a game is loaded.
ExecuteInGameThread(function()
    -- Weapon values seem to be stored in two separate DataTables, though the global one may also be built at runtime or something?
    -- Either way we HAVE TO tweak at least the global one.
    -- But since replacing the weapons one with a .pak file works, we can assume we have to tweak that one too.

    -- We have to load the DataTables manually as they're not loaded yet.
    LoadAsset("/Game/Blueprints/Items/ItemTable_Weapons.ItemTable_Weapons")
    local weaponsDt = StaticFindObject("/Game/Blueprints/Items/ItemTable_Weapons.ItemTable_Weapons")
    weaponTweaker:applyToDataTable(weaponsDt, weaponValues)

    LoadAsset("/Game/Blueprints/Items/ItemTable_Global.ItemTable_Global")
    local globalDt = StaticFindObject("/Game/Blueprints/Items/ItemTable_Global.ItemTable_Global")
    weaponTweaker:applyToDataTable(globalDt, weaponValues)

    print("[Half Factor Lua] Applied weapon rebalances successfully")
end)
