

---@class Cookie : Item 
Cookie = Class(Item)
Cookie.baseBakerModifier = 0.1
Cookie.baseMasterModifier = 0.2
Cookie.priceModifier = 0
function Cookie:add()
	self:increaseValue(self:getClickAmount())
	return true
end

function Cookie:getBackerModifier()
	local bakerValue = self.itemHandler:getItemValue(Items.baker)
	return 1 + bakerValue*self.baseBakerModifier*self.itemHandler:getBackerModifier()
end


function Cookie:getMasterModifier()
	local masterValue = self.itemHandler:getItemValue(Items.master)
	return 1 + masterValue*self.baseMasterModifier*self.itemHandler:getMasterModifier()
end

function Cookie:getClickAmount()
	return self.itemHandler:getCookieModifier() * self:getMasterModifier()*self:getBackerModifier()
end

function Cookie:getBuyAmount()
	return 1
end