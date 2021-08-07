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
CookieClicker.autoSaveInterval = 60*2
CookieClicker.saveFile = "KnoppersClicker/saveFile.txt"

function CookieClicker:init()
	self.gameIsRunning = true
	self.autoSaveTimer = nil
	self:setup()
	while self.gameIsRunning do
		self:update()
	end
end

function CookieClicker:setup()
	self.renderer = Renderer(self)
	self.itemHandler = ItemHandler(self,self.renderer)
	self.upgradeHandler = UpgradeHandler(self,self.renderer,self.itemHandler)
	self.eventHandler = EventHandler(self,self.renderer,self.itemHandler)
	self.inputHandler = InputHandler(self,self.renderer,self.eventHandler)
	self:onLoad()
end

function CookieClicker:onLoad()
	local file = fs.open(self.saveFile,"r")
	if not file then print("file error") return end
	local data = textutils.unserialize(file.readAll())
	file.close()
	if not data then print("Data error")  return end
	print("Game loaded successfully")
	self.itemHandler:onLoad(data.items)
	self.upgradeHandler:onLoad(data.upgrades)
end

function CookieClicker:onSave()
	local file = fs.open(self.saveFile,"w")
	if not file then print("file error") return end
	local saveData = {
		items = {},
		upgrades = {}
	}
	print("Game saved successfully")
	self.itemHandler:onSave(saveData.items)
	self.upgradeHandler:onSave(saveData.upgrades)
	file.write(textutils.serialize(saveData))
	file.close()
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
		self:stop()
		return 
	end
	if not self.autoSaveTimer then 
		self.autoSaveTimer = os.startTimer(self.autoSaveInterval)
	end	

	self.upgradeHandler:update()	
	self.itemHandler:update()
	self.renderer:draw()
	self.eventHandler:update()
	self.inputHandler:update()
end

function CookieClicker:handleAutoSave(timerID)
	if timerID == self.autoSaveTimer then 
		print("Autosave")
		self.autoSaveTimer = nil
		self:onSave()
	end

end

function CookieClicker:stop()
	self.renderer:clear()
	self:onSave()
	self.gameIsRunning = false
end

CookieClicker()