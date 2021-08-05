require("Items/Item")
require("Items/Cookie")
require("Items/Baker")
require("Items/Master")
require("Items/Machine")
require("Items/Worker")
require("Items/Engineer")

Items = {
	cookie = "cookie",
	baker = "baker",
	master = "master",
	machine = "machine",
	worker = "worker",
	engineer = "engineer"
}


---@class ItemHandler
ItemHandler = Class()

ItemHandler.itemData = {
	cookie = Cookie,
	baker = Baker,
	master = Master,
	machine = Machine,
	worker = Worker,
}


function ItemHandler:init(cookieClicker,renderer)
	self.cookieClicker = cookieClicker
	self.renderer = renderer
	local screen = renderer:getClickerScreen()
	self:addItems(screen)
end

function ItemHandler:addItems(screen)
	self.items = {}
	for itemName,class in pairs(self.itemData) do 
		local item = class(self)
		self.items[itemName] = item
	end
	screen:setCallbackClassToElements(self.items)
end

function ItemHandler:update()
	for _,i in pairs(self.items) do 
		i:update()
	end
end

function ItemHandler:getItem(item)
	return self.items[item]
end

function ItemHandler:getItemValue(item)
	return self.items[item]:getValue()
end

function ItemHandler:setItemValue(item,value)
	self.items[item]:setValue(value)
end

function ItemHandler:increaseItemValue(item,value)
	self.items[item]:increaseValue(value)
end

function ItemHandler:decreaseItemValue(item,value)
	self.items[item]:decreaseValue(value)
end

function ItemHandler:applyItemFactor(item,factor)
	self.items[item]:applyFactor(factor)
end

function ItemHandler:getEvent(event)
	return self.cookieClicker:getEventHandler():getEvent(event)
end

function ItemHandler:getUpgrade(upgrade)
	return self.cookieClicker:getUpgradeHandler():getUpgrade(upgrade)
end

function ItemHandler:getReductionModifier()
	return self:getEvent(Events.ChinaEvent):getModifier()
end

function ItemHandler:getCookieModifier()
	return self:getEvent(Events.ObamaEvent):getModifier()*self:getUpgrade(Upgrades.cookie):getModifier()
end

function ItemHandler:getBackerModifier()
	return self:getEvent(Events.ObamaEvent):getModifier()*self:getUpgrade(Upgrades.baker):getModifier()
end

function ItemHandler:getMasterModifier()
	return self:getEvent(Events.ObamaEvent):getModifier()*self:getUpgrade(Upgrades.master):getModifier()
end

function ItemHandler:getMachineModifier()
	return self:getEvent(Events.PutinEvent):getModifier()*self:getUpgrade(Upgrades.machine):getModifier()
end

function ItemHandler:getWorkerModifier()
	return self:getEvent(Events.ObamaEvent):getModifier()*self:getUpgrade(Upgrades.worker):getModifier()
end
