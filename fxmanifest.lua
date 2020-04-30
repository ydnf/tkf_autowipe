fx_version('adamant')
game('gta5')

author 'TakeFy'
description 'AutoWipe for FiveM'
version '1.0'

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
}

client_scripts {
	'@es_extended/locale.lua',
	'menu.lua',
	
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'wipe_s.lua',
}
