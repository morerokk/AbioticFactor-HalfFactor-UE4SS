local weaponValues = require("weaponValues")
local weaponTweaker = require("weaponTweaker")
local ammoValues = require("ammoValues")
local ammoTweaker = require("ammoTweaker")

-- TODO: Make this work on "old" UE4SS, this should be doable for weapons but sadly maybe not ammo drops.
-- Maybe we can use existing resource node duplicator code from igromanru?

-- Tweak values immediately on game start. This runs in the menu, before a game is loaded.
-- ExecuteInGameThread is necessary to use LoadAsset
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

    -- Drop chances for items are defined in globals too, but they're just 1,1 so we have to change them in DT_Salvage
    LoadAsset("/Game/Blueprints/DataTables/DT_Salvage.DT_Salvage")
    local salvageDt = StaticFindObject("/Game/Blueprints/DataTables/DT_Salvage.DT_Salvage")
    ammoTweaker:applyToDataTable(salvageDt, ammoValues)

    print("[Half Factor Lua] Applied ammo drop rebalances successfully")
end)
