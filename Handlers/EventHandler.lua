require("Events/Event")
require("Events/BavariaEvent")
require("Events/ChinaEvent")
require("Events/GreeceEvent")
require("Events/MexicoEvent")
require("Events/NorthKoreaEvent")
require("Events/ObamaEvent")
require("Events/PutinEvent")


---@class EventHandler
EventHandler = Class()
EventHandler.timerMin = 30
EventHandler.timerMax = 30--60*2

Events = {
	obama = "obama",
	putin = "putin",
	greece = "greece",
	china = "china",
	northKorea = "northKorea",
	mexico = "mexico",
	bavaria = "bavaria",
}

function EventHandler:init(cookieClicker,renderer,itemHandler)
	self.itemHandler = itemHandler
	self.renderer = renderer
	self.cookieClicker = cookieClicker
	self.events = {
		obama = ObamaEvent(self,self.itemHandler),
		putin = PutinEvent(self,self.itemHandler),
		greece = GreeceEvent(self,self.itemHandler),
		china = ChinaEvent(self,self.itemHandler),
		northKorea = NorthKoreaEvent(self,self.itemHandler),
		mexico = MexicoEvent(self,self.itemHandler),
		bavaria = BavariaEvent(self,self.itemHandler),
	}
	self.currentEvent = self.events.obama
	self.numEvents = 7

	local screen = renderer:getClickerScreen()
	screen:setCallbackClassToElements({event = self.events.obama})

end

function EventHandler:update()
	
	for _,event in pairs(self.events) do 
		event:update()
	end

	if not self.eventTimer then 
		self.eventTimer = os.startTimer(math.random(self.timerMin,self.timerMax))
	end	
end

function EventHandler:handleEvent(timerID)
	if timerID == self.eventTimer then 
		self.eventTimer = nil
		local eventIx = math.random(1,self.numEvents)
		local i = 1
		for _,event in pairs(self.events) do 
			if i == eventIx then 
				local screen = self.renderer:getClickerScreen()
				screen:setCallbackClassToElements({event = event})
				event:handleEvent()
				print(string.format("Event: %s, eventIx: %d",event:getText(),i))

				break
			end
			i = i + 1
		end
	end
end

function EventHandler:getEvent(event)
	return self.events[event]
end