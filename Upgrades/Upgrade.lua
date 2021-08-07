
---@class Upgrade 
Upgrade = Class()
Upgrade.basePrice = 0
Upgrade.priceModifier = 1

function Upgrade:init(upgradeHandler,itemHandler)
	self.itemHandler = itemHandler
	self.upgradeHandler = upgradeHandler
	self.value = 0
end

function Upgrade:update()
	
end

function Upgrade:getText()
	return string.format("x%s",GuiUtils.getFormattedMoneyText(self:getModifier()))
end

function Upgrade:getModifier()
	return 2^self.value
end

function Upgrade:getPrice()
	return (self.basePrice + 2^(self.priceModifier * self.value))*self.upgradeHandler:getReductionModifier() * self:getBuyAmount()
end

function Upgrade:getPriceText()
	return GuiUtils.getFormattedMoneyText(self:getPrice())
end

function Upgrade:onClick()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	if cookieValue >= self:getPrice() then 
		self:add()
	end
end

function Upgrade:add()
	self.value = self.value + self:getBuyAmount()
	self.itemHandler:decreaseItemValue(Items.cookie,self:getPrice())
end

function Upgrade:isDisabled()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	return cookieValue < self:getPrice()
end

function Upgrade:isVisible()
	return not (self:isDisabled() and self.value == 0)
end

function Upgrade:getBuyAmount()
	return self.upgradeHandler:getBuyAmount()
end

function Upgrade:getValue()
	return self.value
end

function Upgrade:setValue(value)
	self.value = value
end