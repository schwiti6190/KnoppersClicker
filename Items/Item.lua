

---@class Item 
Item = Class()
Item.defaultPrice = 0
Item.priceModifier = 2

function Item:init(itemHandler)
	self.itemHandler = itemHandler
	self.value = 0
end

function Item:update()

end

function Item:isDisabled()
	return not self:canInteract()
end

function Item:isVisible()
	return self:canInteract() or self.value > 0
end

function Item:canInteract()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	return cookieValue>=self:getPrice()
end

function Item:getValue()
	return self.value
end

function Item:getText()
	local text = ""
	if self.value / 1000000 >= 1 then 
		text = string.format("%dM",math.floor(self.value/1000000))
	elseif self.value / 1000 >=1 then 
		text = string.format("%dk",math.floor(self.value/1000))
	else 
		text = math.floor(self.value)
	end

	return text
end

function Item:setValue(value)
	self.value = value
end

function Item:increaseValue(value)
	self.value = self.value + value
end

function Item:decreaseValue(value)
	self.value = self.value - value
end


function Item:incrementValue()
	self:increaseValue(1)
end

function Item:applyFactor(factor)
	self.value = self.value * factor
end

function Item:onClick()
	self:add()
end

function Item:add()
	local cookieValue = self.itemHandler:getItemValue(Items.cookie)
	local price = self:getPrice()
	if cookieValue>=price then 
		self:increaseValue(self:getClickAmount())
		self.itemHandler:decreaseItemValue(Items.cookie,price)
		return true
	end
end

function Item:getPrice()
	return (self.defaultPrice + self.priceModifier * self.value) * self.itemHandler:getReductionModifier()
end

function Item:getClickAmount()
	return 1
end