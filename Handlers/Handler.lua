
---@class Handler 
Handler = Class()
Handler.elementsData = {}

function Handler:init()


end

function Handler:update()
	for _,i in pairs(self.elements) do 
		i:update()
	end
end

function Handler:addElements(screen,parameter)
	self.elements = {}
	for elementName,class in pairs(self.elementsData) do 
		local element = class(self)
		self.elements[elementName] = element
	end
	screen:setCallbackClassToElements(self.elements)
end

function Handler:getElements()
	return self.elements
end