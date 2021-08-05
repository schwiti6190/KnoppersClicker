---@class GuiTextElement : GuiElement
GuiTextElement = Class(GuiElement)

function GuiTextElement:init(renderer,x,y,label,text)
	self.text = text 
	self.label = label or ""
	GuiElement.init(self,renderer,x,y)
end


function GuiTextElement:setText(text)
	self.text = text
end

function GuiTextElement:getText()
	return string.format("%s%s",self.label, self:raiseCallback(self.textCall,""))
end

function GuiTextElement:getWidth()
	return string.len(self:getText())
end

function GuiTextElement:draw()
	if self:isVisible() then
		local monitor = self.renderer:getMainMonitor()
		monitor.setTextColor(self:getColor())
		monitor.setCursorPos(self.x,self.y)
		monitor.write(self:getText())
	end
end
