fx_version('adamant')
game('gta5')

author 'TakeFy'
description 'Autowipe by TakeFy'
version '1.2'

client_scripts {
	"NativeUILua/Wrapper/Utility.lua",

	"NativeUILua/UIElements/UIVisual.lua",
	"NativeUILua/UIElements/UIResRectangle.lua",
	"NativeUILua/UIElements/UIResText.lua",
	"NativeUILua/UIElements/Sprite.lua",
	
	"NativeUILua/UIMenu/elements/Badge.lua",
	"NativeUILua/UIMenu/elements/Colours.lua",
	"NativeUILua/UIMenu/elements/ColoursPanel.lua",
	"NativeUILua/UIMenu/elements/StringMeasurer.lua",

	"NativeUILua/UIMenu/items/UIMenuItem.lua",
	"NativeUILua/UIMenu/items/UIMenuCheckboxItem.lua",
	"NativeUILua/UIMenu/items/UIMenuListItem.lua",
	"NativeUILua/UIMenu/items/UIMenuColouredItem.lua",

	"NativeUILua/UIMenu/UIMenu.lua",
	"NativeUILua/UIMenu/MenuPool.lua",
	
	"NativeUILua/NativeUI.lua",

	'@es_extended/locale.lua',
	"client/menu.lua",
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	"client/main.lua"

}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'

}