
ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

_menuPool = NativeUI.CreatePool()
mainWipeMenu = NativeUI.CreateMenu('Auto Wipe', 'Actions', nil, nil, nil, nil, nil, 180, 0, 0)
_menuPool:Add(mainWipeMenu)

ActualWipe = nil
RegisterNetEvent('aw:SyncWipe')
AddEventHandler('aw:SyncWipe', function(data)
	ActualWipe = data
end)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

	while (UpdateOnscreenKeyboard() ~= 1) and (UpdateOnscreenKeyboard() ~= 2) do
		DisableAllControlActions(0)
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		return GetOnscreenKeyboardResult()
	else
		return nil
	end
end

function ShowNotification(text)
	BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(false, false)
end
	
local addWipeMenu = _menuPool:AddSubMenu(mainWipeMenu, 'Wipe un user', '', true, true)

function DrawWipeMenu()
	local WipeData = {
		
	}

	local IDItem = NativeUI.CreateItem('Steam ID', '')
	addWipeMenu.SubMenu:AddItem(IDItem)
		

	
	local TELItem = NativeUI.CreateItem('Numéro de telephone', '')
	addWipeMenu.SubMenu:AddItem(TELItem)
	

	
	local CONFIRMItem = NativeUI.CreateColouredItem('Confirmer', '', Colours.Green, Colours.GreenLight)
	addWipeMenu.SubMenu:AddItem(CONFIRMItem)	
	


	addWipeMenu.SubMenu.OnItemSelect = function(_, item, index)
		if item == IDItem then
				local result = tostring(KeyboardInput('WIPE_ID', 'Steam ID :', WipeData.ID or '', 30))
				if result ~= nil then
					WipeData.ID = result
					item:RightLabel(result)
				end
			end

		if item == TELItem then
			local result = tostring(KeyboardInput('WIPE_TEL', 'Numéro de téléphone :', WipeData.TEL or '', 30))
			if result ~= nil then
				WipeData.TEL = result
				item:RightLabel(result)												
			end	
		end

		if item == CONFIRMItem then	
			if WipeData.TEL == nil then
				ShowNotification('Aucun numéro de telephone!')
				return
			end
		

			if WipeData.ID == nil then
				ShowNotification('Aucun steam ID !')
				return
			end

			TriggerServerEvent('aw:wipe', WipeData)
			ShowNotification('Wipe effectué ! (Le personnage sera wipe au prochain reboot ! )')
			end
		end


		addWipeMenu.SubMenu.OnMenuClosed = function()
		_menuPool:RefreshIndex()
	end
	
	_menuPool:RefreshIndex()
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		_menuPool:ProcessMenus()
		_menuPool:MouseControlsEnabled(false)
		_menuPool:MouseEdgeEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
	end
end)


DrawWipeMenu()


RegisterNetEvent('aw:OpenMenu') 
AddEventHandler('aw:OpenMenu', function()
	mainWipeMenu:Visible(true)
end)

RegisterCommand('wipe', function(source)
	ESX.TriggerServerCallback('KorioZ-PersonalMenu:Admin_getUsergroup', function(plyGroup)
		if plyGroup ~= nil and (plyGroup == 'admin' or plyGroup == 'superadmin' or plyGroup == 'server' or plyGroup == '_dev') then
			TriggerEvent('aw:OpenMenu', source)
		else
			ESX.ShowNotification('Vous devez être ~r~Admin ~w~pour pouvoir utiliser le ~g~AutoWipe.')
		end
	end)
end, false)
