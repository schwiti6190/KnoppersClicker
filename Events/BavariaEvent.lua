---@class BavariaEvent : Event
BavariaEvent = Class(Event)
BavariaEvent.text = "Knappers ersetzt Bratwurst in Bayern!"

function BavariaEvent:handleEvent()
	local modifier = math.random(1,2)*0.25
	self.itemHandler:applyItemFactor(Items.cookie,modifier)
end
