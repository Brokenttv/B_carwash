ESX = nil

ESX = exports["es_extended"]:getSharedObject()


function findNearestPosition(targetCoord)
    local nearestPos = nil
    local nearestDist = nil
    
    for i, position in pairs(pesuloita) do
        local coords = vector3(position.coords.x, position.coords.y, position.coords.z)
        local coords2 = vector3(targetCoord.x, targetCoord.y, targetCoord.z)
        local dist = #(coords - coords2) 
        
        if nearestDist == nil or dist < nearestDist then
            nearestPos = coords
            nearestDist = dist
        end
    end
    
    return nearestPos, nearestDist
end

ESX.RegisterUsableItem('pesukortti', function(source) -- itemi / item
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(source)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local coords = GetEntityCoords(playerPed)
    local nearestPos, nearestDist = findNearestPosition(coords)

    if vehicle == 0 then
        TriggerClientEvent('esx:showNotification', source, ('Et ole autossa')) -- Notify
    return
    end

    if nearestDist > 10 then -- Distance
        TriggerClientEvent('esx:showNotification', source, ('Olet liian kaukana')) -- Notify
    return
    end

        xPlayer.removeInventoryItem('pesukortti', 1)
        SetVehicleDirtLevel(vehicle, 0.0000000001)
        SetVehicleUndriveable(vehicle, false)

        TriggerClientEvent('esx:showNotification', source, ('Ajoneuvosi on pesty')) -- Notify
end)
