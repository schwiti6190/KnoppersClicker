
---@class GreeceEvent : Event
GreeceEvent = Class(Event)
GreeceEvent.text = "Du Pleitegeier"

function GreeceEvent:handleEvent()
	local modifier = 1-math.random(2,4) * 0.025
	self.itemHandler:applyItemFactor(Items.cookie,modifier)
	Event.handleEvent(self)
end

