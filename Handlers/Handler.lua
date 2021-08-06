
---@class Handler 
Handler = Class()
Handler.elementsData = {}
Handler.buyAmounts = {
	1,
	5,
	10,
	50,
	100,
	200
}

function Handler:init(cookieClicker,renderer)
	self.cookieClicker = cookieClicker
	self.renderer = renderer
	self.buyAmountIx = 1
end

function Handler:update()
	for _,i in pairs(self.elements) do 
		i:update()
	end
end

function Handler:addElements(screen,...)
	self.elements = {}
	for elementName,class in pairs(self.elementsData) do 
		local element = class(...)
		self.elements[elementName] = element
	end
	screen:setCallbackClassToElements(self.elements)
end

function Handler:getElements()
	return self.elements
end

function Handler:getEvent(event)
	return self.cookieClicker:getEventHandler():getEvent(event)
end

function Handler:getBuyAmount()
	return self.buyAmounts[self.buyAmountIx]
end

function Handler:changeBuyAmount()
	local ix = self.buyAmountIx + 1
	if ix > #self.buyAmounts then 
		ix = 1
	end
	self.buyAmountIx = ix
end