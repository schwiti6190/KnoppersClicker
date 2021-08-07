require("Gui/GuiUtils")
require("Gui/Elements/GuiElement")
require("Gui/Elements/GuiTextElement")
require("Gui/Elements/GuiButtonElement")
require("Gui/Screens/GuiScreen")
require("Gui/Screens/GuiMenuScreen")
require("Gui/Screens/GuiClickerScreen")
require("Gui/Screens/GuiUpgradeScreen")

---@class Renderer
Renderer = Class()

Screens = {
	menu = "menu",
	upgrade = "upgrade",
	clicker = "clicker"
}

GuiElements = {
	["GuiElement"] = GuiElement,
	["GuiTextElement"] = GuiTextElement,
	["GuiButtonElement"] = GuiButtonElement,
}

function Renderer:init(cookieClicker)
	self.cookieClicker = cookieClicker
	self.monitor = peripheral.find("monitor")
	self:setupScreens()
end

function Renderer:setupScreens()
	self.screens = {
		menu = GuiMenuScreen(self),
		upgrade = GuiUpgradeScreen(self),
		clicker = GuiClickerScreen(self)
	}
	self.currentScreen = self.screens.menu
end

function Renderer:getMainMonitor()
	return self.monitor
end

function Renderer:getMenuScreen()
	return self.screens.menu
end

function Renderer:getUpgradeScreen()
	return self.screens.upgrade
end

function Renderer:getClickerScreen()
	return self.screens.clicker
end

function Renderer:clear()
	self.monitor.clear()
end

function Renderer:draw()
	self:clear()
	for _,element in pairs(self.currentScreen:getElements()) do 
		element:draw()
	end
end

function Renderer:onClick(monitorID,x,y)
	for _,element in pairs(self.currentScreen:getElements()) do 
		if element.onClick then 
			element:onClick(x,y)
		end
	end
end

function Renderer:changeScreen(newScreen)
	self.currentScreen = self.screens[newScreen]
end

function Renderer:changeBackToMenu()
	self:changeScreen(Screens.menu)
end