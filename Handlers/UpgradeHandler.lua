require("Upgrades/Upgrade")
require("Upgrades/CookieUpgrade")
require("Upgrades/BakerUpgrade")
require("Upgrades/MasterUpgrade")
require("Upgrades/MachineUpgrade")
require("Upgrades/WorkerUpgrade")


---@class UpgradeHandler
UpgradeHandler = Class()

Upgrades = {
	cookie = "cookie",
	baker = "baker",
	master = "master",
	machine = "machine",
	worker = "worker"
}

UpgradeHandler.upgradeData = {
	cookie = CookieUpgrade,
	baker = BakerUpgrade,
	master = MasterUpgrade,
	machine = MachineUpgrade,
	worker = WorkerUpgrade,
}

function UpgradeHandler:init(itemHandler,renderer)
	self.itemHandler = itemHandler
	self.renderer = renderer
	self:addUpgrades(renderer:getUpgradeScreen())
end

function UpgradeHandler:addUpgrades(screen)
	self.upgrades = {}
	for upgradeName,class in pairs(self.upgradeData) do 
		local upgrade = class(self.itemHandler)
		self.upgrades[upgradeName] = upgrade
	end
	screen:setCallbackClassToElements(self.upgrades)
end


function UpgradeHandler:update()
	for _,upgrade in pairs(self.upgrades) do 
		upgrade:update()
	end
end

function UpgradeHandler:getUpgrade(upgrade)
	return self.upgrades[upgrade]
end
