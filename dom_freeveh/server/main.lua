TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local database = LoadResourceFile(GetCurrentResourceName(), "database.json") or "{}";
database = database and database ~= "" and json.decode(database) or {};

local freeCar = 'i30npriordesign';

RegisterCommand('freecar', function(source)
  local xPlayer = ESX.GetPlayerFromId(source);
  
  if database[xPlayer.identifier] == true then
    return TriggerEvent("ws_notify", "error", "Free-Car", "Du hast bereits ein gratis Auto erhalten!", 5000);
  end

  database[xPlayer.identifier] = true;
  SaveResourceFile(GetCurrentResourceName(), "database.json", json.encode(database), -1);

  ExecuteCommand('_givecar ' .. xPlayer.source .. ' ' .. freeCar);
  return TriggerEvent("ws_notify", "success", "Free-Car", "Dominik hat gegönnt viel Spaß mit deinem Auto!", 5000);
end);