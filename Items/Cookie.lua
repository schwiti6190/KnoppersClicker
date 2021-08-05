

---@class Cookie : Item 
Cookie = Class(Item)
Cookie.baseBakerModifier = 0.1
Cookie.baseMasterModifier = 0.2
Cookie.priceModifier = 0
function Cookie:add()
	self:increaseValue(self:getClickAmount())
	return true
end

function Cookie:applyModifiers()
	self:increaseValue(self.itemHandler:getItemValue("baker")*self.baseBakerModifier*self.itemHandler:getBackerModifier())
	self:increaseValue(self.itemHandler:getItemValue("baker")*self.baseMasterModifier*self.itemHandler:getMasterModifier())
end

function Cookie:getClickAmount()
	return 100 * self.itemHandler:getCookieModifier()
end