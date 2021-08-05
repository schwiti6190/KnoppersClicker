require("Basics/Class")
require("Gui/Renderer")
require("Handlers/Handler")
require("Handlers/ItemHandler")
require("Handlers/UpgradeHandler")
require("Handlers/EventHandler")


---@class CookieClicker
CookieClicker = Class()
CookieClicker.debug = true

function CookieClicker:init()
	self:setup()
	while true do
		self:update()
	end
end

function CookieClicker:setup()
	self.renderer = Renderer(self)
	self.itemHandler = ItemHandler(self,self.renderer)
	self.upgradeHandler = UpgradeHandler(self.itemHandler,self.renderer)
	self.eventHandler = EventHandler(self.itemHandler,self.renderer)
	
end

function CookieClicker:getRenderer()
	return self.renderer
end

function CookieClicker:getEventHandler()
	return self.eventHandler
end

function CookieClicker:getUpgradeHandler()
	return self.upgradeHandler
end

function CookieClicker:update()
	self.upgradeHandler:update()	
	self.itemHandler:update()
	self.renderer:draw()
	self.eventHandler:update()
end

CookieClicker()