
---@class MexicoEvent : Event
MexicoEvent = Class(Event)
MexicoEvent.text = "Die klauen unsere Jobs."
MexicoEvent.threshold = 10
MexicoEvent.modifier = 0.9

function MexicoEvent:handleEvent()
	local masterValue = self.itemHandler:getItemValue(Items.master)
	if masterValue >= self.threshold then 
		self.itemHandler:setItemValue(Items.master,math.ceil(masterValue*self.modifier))
	end
end