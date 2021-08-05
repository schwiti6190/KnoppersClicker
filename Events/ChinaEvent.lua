
---@class ChinaEvent : Event
ChinaEvent = Class(Event)
ChinaEvent.text = "Made in China"

function ChinaEvent:handleEvent()
	self.modifier = math.random(1,2) * 0.25
	Event.handleEvent(self)
end
