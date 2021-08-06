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


---@class ItemHandler : Handler
ItemHandler = Class(Handler)

ItemHandler.elementsData = {
	cookie = Cookie,
	baker = Baker,
	master = Master,
	machine = Machine,
	worker = Worker,
}


function ItemHandler:init(cookieClicker,renderer)
	local screen = renderer:getClickerScreen()
	self:addElements(screen,self)
	screen:setCallbackClassToElements({cps = self,buyAmount = self})
	Handler.init(self,cookieClicker,renderer)
end

function ItemHandler:getCps()
	return string.format("%s/s",GuiUtils.getFormattedMoneyText(self.elements.machine:getCps()))
end

function ItemHandler:getItem(item)
	return self.elements[item]
end

function ItemHandler:getItemValue(item)
	return self.elements[item]:getValue()
end

function ItemHandler:setItemValue(item,value)
	self.elements[item]:setValue(value)
end

function ItemHandler:increaseItemValue(item,value)
	self.elements[item]:increaseValue(value)
end

function ItemHandler:decreaseItemValue(item,value)
	self.elements[item]:decreaseValue(value)
end

function ItemHandler:applyItemFactor(item,factor)
	self.elements[item]:applyFactor(factor)
end
function ItemHandler:getUpgrade(upgrade)
	return self.cookieClicker:getUpgradeHandler():getUpgrade(upgrade)
end

function ItemHandler:getReductionModifier()
	return self:getEvent(Events.china):getModifier()
end

function ItemHandler:getCookieModifier()
	return self:getEvent(Events.obama):getModifier()*self:getUpgrade(Upgrades.cookie):getModifier()
end

function ItemHandler:getBackerModifier()
	return self:getEvent(Events.obama):getModifier()*self:getUpgrade(Upgrades.baker):getModifier()
end

function ItemHandler:getMasterModifier()
	return self:getEvent(Events.obama):getModifier()*self:getUpgrade(Upgrades.master):getModifier()
end

function ItemHandler:getMachineModifier()
	return self:getEvent(Events.putin):getModifier()*self:getUpgrade(Upgrades.machine):getModifier()
end

function ItemHandler:getWorkerModifier()
	return self:getEvent(Events.obama):getModifier()*self:getUpgrade(Upgrades.worker):getModifier()
end
