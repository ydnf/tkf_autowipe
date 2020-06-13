ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

WipeData = {}


function Getwipe()
	local data = LoadResourceFile('tkf_autowipe', 'data.json')
	return data and json.decode(data) or {}
end


RegisterServerEvent('aw:wipe')
AddEventHandler('aw:wipe', function(data)
	MySQL.Async.execute([[
		DELETE FROM addon_account_data WHERE owner = @wipeID;
		DELETE FROM addon_inventory_items WHERE owner = @wipeID;
		DELETE FROM billing WHERE identifier = @wipeID;
		DELETE FROM billing WHERE sender = @wipeID;
		DELETE FROM datastore_data WHERE owner = @wipeID;
		DELETE FROM open_car WHERE identifier = @wipeID;
		DELETE FROM owned_properties WHERE owner = @wipeID;
		DELETE FROM owned_vehicles WHERE owner = @wipeID;
		DELETE FROM owned_boats WHERE owner = @wipeID;
		DELETE FROM rented_vehicles WHERE owner = @wipeID;
		DELETE FROM open_car WHERE identifier = @wipeID;
		DELETE FROM user_accounts WHERE identifier = @wipeID;
		DELETE FROM phone_calls WHERE owner = @wipeTEL;
		DELETE FROM phone_messages WHERE transmitter = @wipeTEL;
		DELETE FROM phone_messages WHERE receiver = @wipeTEL;
		DELETE FROM phone_users_contacts WHERE identifier = @wipeID;
		DELETE FROM phone_users_contacts WHERE number = @wipeTEL;
		DELETE FROM playerstattoos WHERE identifier = @wipeID;
		DELETE FROM user_inventory WHERE identifier = @wipeID;
		DELETE FROM user_licenses WHERE owner = @wipeID;
		DELETE FROM characters WHERE identifier = @wipeID;
		DELETE FROM users WHERE identifier = @wipeID;	]], {
		['@wipeID'] = 'steam:110000' .. data.ID,
		['@wipeTEL'] = data.TEL,
	}, function(rowsChanged)
		table.insert(WipeData, data)
		SaveResourceFile('tkf_autowipe', 'data.json', json.encode(WipeData))
		print('^2wipe effectued successly^0')
	end)
end)

