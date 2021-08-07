---25%/50% of cookie loss.
---@class NorthKoreaEvent : Event
NorthKoreaEvent = Class(Event)
NorthKoreaEvent.text = "Atombombe zerstört die Konkurenz!"

function NorthKoreaEvent:handleEvent()
	local modifier = 1-math.random(1,2)*0.25
	self.itemHandler:applyItemFactor(Items.cookie,modifier)
	Event.handleEvent(self)
end