local oldUE4SSCompat = {}

-- The ONLY thing we can do here is change weapon magazine size. At this point, the "old UE4SS compatibility" is a consolation prize more than anything.
-- Recoil is unknown
function oldUE4SSCompat:setupWeapons(weaponValues)
    -- We are assumed to already be running on the game thread here, if we aren't then LoadAsset would fail
    LoadAsset("/Game/Blueprints/Items/Weapons/Abiotic_Weapon_Gun_ParentBP.Abiotic_Weapon_Gun_ParentBP_C")
    NotifyOnNewObject("/Game/Blueprints/Items/Weapons/Abiotic_Weapon_Gun_ParentBP.Abiotic_Weapon_Gun_ParentBP_C", function(gun)

        -- Lol
        local function modifyStats()
            if not gun or not gun.ItemData or not gun.ItemDataRow then
                return
            end
            local itemName = gun.ItemDataRow.RowName:ToString()

            local tweakValues = weaponValues[itemName]
            if not tweakValues then
                return
            end

            local itemData = gun.ItemData
            local weaponData = itemData.WeaponData_61_3C29CF6C4A7F9DD435F9318FEE4B033D
            if not weaponData then
                return
            end

            -- Magazine size
            if tweakValues.magazine ~= nil then
                weaponData.MagazineSize_57_E890A3944240BB8D07EF0B9251F1FBD4 = tweakValues.magazine
                gun.MaxMagazineSize = tweakValues.magazine
            end
            -- Recoil (unsure if this even works)
            if tweakValues.recoil ~= nil then
                weaponData.RecoilAmount_42_85AFA9834A1CABF8183C088D857840EE = tweakValues.recoil
            end
        end

        modifyStats()

        -- Lol x2
        ExecuteWithDelay(5, modifyStats)
    end)
end

-- I don't think modifying ammo drops is possible in old UE4SS, which would kinda defeat the purpose of the mod IMO,
-- especially when the only weapon thing we can change is mag size.
-- We can't modify or even inspect DataTables, and we might not even be able to LOOK at the loot name since FName s inside structs are messed up,
-- so we can't even tell what kind of drop it is, maybe.
-- The most we could do is have NPC's spawn more instances of their usual loot which completely borks their other balancing if we want to get the ammo in line.
-- tl;dr: we just don't
function oldUE4SSCompat:setupAmmo(ammoValues)
    
end

return oldUE4SSCompat
