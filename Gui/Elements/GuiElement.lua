---@class GuiElement
GuiElement = Class()

function GuiElement:init(renderer,x,y)
	self.renderer = renderer
	self.x = x 
	self.y = y 
	self.disabledColor = colors.red
	self.defaultColor = colors.white
end

function GuiElement:setCallbacks(callbacks,callbackClass)
	self.callbackClass = callbackClass
	for callback,func  in pairs(callbacks) do 
		self[callback] = func
	end
end

function GuiElement:setCallbackClass(class)
	self.callbackClass = class
end

function GuiElement:getClassName()
	return self.className
end

function GuiElement:setClassName(name)
	self.className = name
end

function GuiElement:raiseCallback(callback,default)
	if callback and self.callbackClass[callback] then 
		return self.callbackClass[callback](self.callbackClass) 
	else
		return default
	end
end

function GuiElement:setMonitor(monitor)
	self.monitor = monitor
end

function GuiElement:setDisabled(disabled)
	self.disabled = disabled
end

function GuiElement:isDisabled()
	return self.disabled or self:raiseCallback(self.disabledCall,false)
end

function GuiElement:setVisibility(visible)
	self.visible = visible
end

function GuiElement:isVisible()
	return self.visible or self:raiseCallback(self.visibleCall,true)
end

function GuiElement:getColor()
	return self:isDisabled() and self.disabledColor or self.defaultColor
end