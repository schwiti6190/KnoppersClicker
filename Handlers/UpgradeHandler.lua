require("Upgrades/Upgrade")
require("Upgrades/CookieUpgrade")
require("Upgrades/BakerUpgrade")
require("Upgrades/MasterUpgrade")
require("Upgrades/MachineUpgrade")
require("Upgrades/WorkerUpgrade")


---@class UpgradeHandler : Handler
UpgradeHandler = Class(Handler)

Upgrades = {
	cookie = "cookie",
	baker = "baker",
	master = "master",
	machine = "machine",
	worker = "worker"
}

UpgradeHandler.elementsData = {
	cookie = CookieUpgrade,
	baker = BakerUpgrade,
	master = MasterUpgrade,
	machine = MachineUpgrade,
	worker = WorkerUpgrade,
}

function UpgradeHandler:init(cookieClicker,renderer,itemHandler)
	self.itemHandler = itemHandler
	local screen = renderer:getUpgradeScreen()
	self:addElements(screen,self,itemHandler)
	screen:setCallbackClassToElements({buyAmount = self})
	Handler.init(self,cookieClicker,renderer)
end

function UpgradeHandler:getUpgrade(upgrade)
	return self.elements[upgrade]
end

function UpgradeHandler:getReductionModifier()
	return self:getEvent(Events.bavaria):getModifier()
end
