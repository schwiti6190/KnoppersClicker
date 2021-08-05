
---@class Upgrade 
Upgrade = Class()
Upgrade.basePrice = 0
Upgrade.priceModifier = 1

function Upgrade:init(itemHandler)
	self.itemHandler = itemHandler
	self.value = 0
end

function Upgrade:update()
	
end

function Upgrade:getText()
	return string.format("x%d",self:getModifier())
end

function Upgrade:getModifier()
	return 2^self.value
end

function Upgrade:getPrice()
	return self.basePrice + self.priceModifier * self.value
end

function Upgrade:onClick()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	if cookieValue >= self:getPrice() then 
		self:add()
	end
end

function Upgrade:add()
	self.value = self.value + 1
	self.itemHandler:decreaseItemValue(Items.cookie,self:getPrice())
end

function Upgrade:isDisabled()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	return cookieValue < self:getPrice()
end

function Upgrade:isVisible()
	return not (self:isDisabled() and self.value == 0)
end