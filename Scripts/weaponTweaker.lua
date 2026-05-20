local weaponTweaker = {}

function weaponTweaker:applyToDataTable(dataTable, weaponValues)

    for weapon_id, weapon_tweakvalues in pairs(weaponValues) do
        local weaponRow = dataTable:FindRow(weapon_id)
        if weaponRow and weaponRow:IsValid() then
            self:applyToItemData(weaponRow, weapon_tweakvalues)
        else
            print("[Half Factor Lua] Unable to find datatable row for weapon " .. weapon_id)
        end
    end
end

function weaponTweaker:applyToItemData(itemData, tweakValues)
    local weaponData = itemData.WeaponData_61_3C29CF6C4A7F9DD435F9318FEE4B033D

    -- Damage
    if tweakValues.damage ~= nil then
        weaponData.DamagePerHit_16_F95199D1425C37191C55CDA0DC07BDDC = tweakValues.damage
    end
    -- Magazine size
    if tweakValues.magazine ~= nil then
        weaponData.MagazineSize_57_E890A3944240BB8D07EF0B9251F1FBD4 = tweakValues.magazine
    end
    -- Recoil
    if tweakValues.recoil ~= nil then
        weaponData.RecoilAmount_42_85AFA9834A1CABF8183C088D857840EE = tweakValues.recoil
    end

    -- Weight
    if tweakValues.weight ~= nil then
        itemData.Weight_119_CE7DB430417207921D739CAF458D4D7C = tweakValues.weight
    end
    -- Durability
    if tweakValues.durability ~= nil then
        itemData.MaxItemDurability_31_6EBCEFC943F9E85DE9350BBC0E249447 = tweakValues.durability
    end
end

return weaponTweaker