
---Cookie modifier 25/50 % additional.
---@class ObamaEvent : Event
ObamaEvent = Class(Event)
ObamaEvent.text = "Yes we can!"

function ObamaEvent:handleEvent()
	self.modifier = math.random(2,3)
	Event.handleEvent(self)
end
