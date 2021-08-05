---@class GuiButtonElement : GuiTextElement
GuiButtonElement = Class(GuiTextElement)

function GuiButtonElement:init(renderer,x,y,label,text)
	GuiTextElement.init(self,renderer,x,y,label,text)
end

function GuiButtonElement:isInMouseArea(x,y)
	return y == self.y and x>=self.x and x <= (self.x + self:getWidth())
end

function GuiButtonElement:isClickable()
	return self:isVisible() and not self:isDisabled() 
end

function GuiButtonElement:onClick(x,y)
	if self:isInMouseArea(x,y) and self:isClickable() then
		self:raiseCallback(self.onClickCall)
	end
end