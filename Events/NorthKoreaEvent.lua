
---@class NorthKoreaEvent : Event
NorthKoreaEvent = Class(Event)
NorthKoreaEvent.text = "Atombombe zerstört die Konkurenz!"

function NorthKoreaEvent:handleEvent()
	local modifier = math.random(1,2)*0.25
	self.itemHandler:applyItemFactor(Items.cookie,modifier)
	Event.handleEvent(self)
end