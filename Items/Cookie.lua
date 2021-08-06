

---@class Cookie : Item 
Cookie = Class(Item)
Cookie.baseBakerModifier = 0.1
Cookie.baseMasterModifier = 0.2
Cookie.priceModifier = 0
function Cookie:add()
	self:increaseValue(self:getClickAmount())
	self:applyModifiers()
	return true
end

function Cookie:applyModifiers()
	self:increaseValue(self.itemHandler:getItemValue(Items.baker)*self.baseBakerModifier*self.itemHandler:getBackerModifier())
	self:increaseValue(self.itemHandler:getItemValue(Items.master)*self.baseMasterModifier*self.itemHandler:getMasterModifier())
end

function Cookie:getClickAmount()
	return self.itemHandler:getCookieModifier()
end

function Cookie:getBuyAmount()
	return 1
end