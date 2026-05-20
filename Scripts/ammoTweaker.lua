local ammoTweaker = {}

function ammoTweaker:applyToDataTable(dataTable, ammoValues)
    for salvage_id, salvage_tweakvalues in pairs(ammoValues) do
        local salvageRow = dataTable:FindRow(salvage_id)
        if salvageRow and salvageRow:IsValid() then
            self:applyToItemDropTable(salvageRow, salvage_tweakvalues)
        else
            print("[Half Factor Lua] Unable to find datatable row for salvage " .. salvage_id)
        end
    end
end

function ammoTweaker:applyToItemDropTable(itemDropTable, tweakValues)
    itemDropTable.SalvageDropItems_4_6F67F05F401125FAC788E4B1800CBC93:ForEach(function(index, elem)
        local entry = elem:get()
        -- Doesn't work in old UE4SS because FName is broken.
        -- So for old UE4SS, we do something really stupid, which is check if the current drop is affected by the Sigil of the Hearth trinket.
        -- If it is, triple the min/max values.
        -- But here we just look up and mess with the values
        local itemName = entry.ItemDataTable_16_C430AEEE4D16DC471206DBBAA9F6796F.RowName:ToString()
        if tweakValues[itemName] ~= nil then
            self:applyToItemDropTableEntry(entry, tweakValues[itemName])
            elem:set(entry)
        end
    end)
end

function ammoTweaker:applyToItemDropTableEntry(itemDropTableEntry, tweakValue)
    -- Set min/max
    if tweakValue.values ~= nil then
        if tweakValue.values.min ~= nil then
            itemDropTableEntry.QuantityMin_13_08A3850648D7ADA008D57FB0855F1474 = tweakValue.values.min
        end
        if tweakValue.values.max ~= nil then
            itemDropTableEntry.QuantityMax_14_6E8D8DF64637C2DD2E9DA59CBF7FAADF = tweakValue.values.max
        end
    end

    -- Set chance
    if tweakValue.chance ~= nil then
        itemDropTableEntry.ChanceToDrop_12_45BEC64444296AFBC69AD280F4D2BEDB = tweakValue.chance
    end
end

return ammoTweaker
