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
	ObamaEvent = "obama",
	PutinEvent = "putin",
	GreeceEvent = "greece",
	ChinaEvent = "china",
	NorthKoreaEvent = "northKorea",
	MexicoEvent = "mexico",
	BavariaEvent = "bavaria",
}

function EventHandler:init(itemHandler,renderer)
	self.itemHandler = itemHandler
	self.renderer = renderer
	
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

	local inputTimer = os.startTimer(0.2)
	
	for _,event in pairs(self.events) do 
		event:update()
	end
	local inputTimer = os.startTimer(0.2)
	if not self.eventTimer then 
		self.eventTimer = os.startTimer(math.random(self.timerMin,self.timerMax))
	end

	repeat
		local event, id, x , y = os.pullEvent()
		if event == "monitor_touch" then
			self:onMouseClick(id,x,y)
		elseif event == "key" and id == keys.q then
			print("Q was pressed!")
			os.exit()
		elseif event == "timer" and id == self.eventTimer then 
			self:handleEvent()
			self.eventTimer = nil
		end
	until (event == "timer" and id == inputTimer)
	
end

function EventHandler:onMouseClick(monitorID,x,y)
	self.renderer:onClick(monitorID,x,y)
end

function EventHandler:handleEvent()
	local eventIx = math.random(1,self.numEvents)
	local i = 1
	for _,event in pairs(self.events) do 
		if i == eventIx then 
			local screen = self.renderer:getClickerScreen()
			screen:setCallbackClassToElements({"event",event})
			event:handleEvent()
			break
		end
		i = i + 1
	end
end

function EventHandler:getEvent(event)
	return self.events[event]
end