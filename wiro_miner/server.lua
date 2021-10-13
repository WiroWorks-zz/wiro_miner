ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('pickaxe', function(source)
	TriggerClientEvent('wiro_miner:eleKazma', source)
end)


RegisterServerEvent('wiro_miner:givekaya')
AddEventHandler('wiro_miner:givekaya', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	local xItem = xPlayer.getInventoryItem("das")

	xPlayer.addInventoryItem("das", 1)
end)

RegisterServerEvent('wiro_miner:giveToken')
AddEventHandler('wiro_miner:giveToken', function(count)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem("dastoken", count)
end)

RegisterServerEvent('wiro_miner:givePara')
AddEventHandler('wiro_miner:givePara', function(tokenmik, mik)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local xItem = xPlayer.getInventoryItem("dastoken")
	if xItem.count <= tokenmik then
		xPlayer.removeInventoryItem("dastoken", tokenmik)
		xPlayer.addMoney(mik)
	end

end)

RegisterServerEvent('wiro_miner:kayalariver')
AddEventHandler('wiro_miner:kayalariver', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	local xItem = xPlayer.getInventoryItem("das")

	if xItem.count > 0 then
		xPlayer.removeInventoryItem("das", xItem.count)
		TriggerClientEvent('wiro_miner:tokensayac', source, xItem.count * Config.KayaBasinaTokenMik)
		TriggerClientEvent('wiro_notify:show', source, "success", "Kayaları eritmeye bıraktın.", 3000)
		TriggerClientEvent('wiro_miner:verchance', source, true)
	else
		TriggerClientEvent('wiro_notify:show', source, "error", "Üstünde Taş yok.", 3000)
	end
end)

RegisterServerEvent('wiro_miner:arac')
AddEventHandler('wiro_miner:arac', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config.aracfiyat < xPlayer.getMoney() then
		xPlayer.removeMoney(Config.aracfiyat)
		TriggerClientEvent('wiro_miner:AracOlustur', _source)
	else
		TriggerClientEvent('wiro_notify:show', _source, "error", "Yeterli Paranız yok", 4000)
	end
end)

RegisterServerEvent('wiro_miner:paraver')
AddEventHandler('wiro_miner:paraver', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addMoney(Config.aracfiyat)
end)
