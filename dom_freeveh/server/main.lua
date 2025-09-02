TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local database = LoadResourceFile(GetCurrentResourceName(), "database.json") or "{}"
database = database and database ~= "" and json.decode(database) or {}

local freeCar = 'i30npriordesign'

RegisterCommand('freecar', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if database[xPlayer.identifier] == true then
        return xPlayer.showNotification("Du hast bereits ein gratis Auto erhalten!")
    end

    database[xPlayer.identifier] = true
    SaveResourceFile(GetCurrentResourceName(), "database.json", json.encode(database), -1)

    ExecuteCommand('_givecar ' .. xPlayer.source .. ' ' .. freeCar)
    xPlayer.showNotification("Dominik hat gegönnt! Viel Spaß mit deinem Auto!")
end)
