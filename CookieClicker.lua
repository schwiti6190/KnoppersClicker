require("Basics/Class")
require("Gui/Renderer")
require("Handlers/Handler")
require("Handlers/InputHandler")
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
	self.upgradeHandler = UpgradeHandler(self,self.renderer,self.itemHandler)
	self.eventHandler = EventHandler(self,self.renderer,self.itemHandler)
	self.inputHandler = InputHandler(self,self.renderer,self.eventHandler)
	
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

function CookieClicker:getInputHandler()
	return self.inputHandler
end

function CookieClicker:update()
	if not peripheral.find("monitor") then 
		print("Monitor is missing!")
		return 
	end

	self.upgradeHandler:update()	
	self.itemHandler:update()
	self.renderer:draw()
	self.eventHandler:update()
	self.inputHandler:update()
end

CookieClicker()