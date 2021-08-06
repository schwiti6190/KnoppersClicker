
InputHandler = Class()

function InputHandler:init(cookieClicker,renderer,eventHandler)
	self.cookieClicker = cookieClicker
	self.eventHandler = eventHandler
	self.renderer = renderer
end

function InputHandler:update()
	
	local inputTimer = os.startTimer(0.2)

	repeat
		local event, id, x , y = os.pullEvent()
		if event == "monitor_touch" then
			self:onMouseClick(id,x,y)
		elseif event == "key" and id == keys.q then
			print("Q was pressed!")
			os.exit()
		elseif event == "timer" and id ~= inputTimer then 
			self:handleTimer(id)
		end
	until (event == "timer" and id == inputTimer)
	
end

function InputHandler:handleTimer(timerID)
	self.eventHandler:handleEvent(timerID)
end

function InputHandler:onMouseClick(monitorID,x,y)
	self.renderer:onClick(monitorID,x,y)
end