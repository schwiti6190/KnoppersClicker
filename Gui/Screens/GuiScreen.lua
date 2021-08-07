
---@class GuiScreen 
GuiScreen = Class()
GuiScreen.basePath = "KnoppersClicker/Gui/Screens/"

function GuiScreen:init(renderer)
	self.renderer = renderer
	self.elements = self:addGuiElements(self.basePath..self.filePath)
end

function GuiScreen:addGuiElements(filePath)
	if filePath then 
		return GuiUtils.setButtonsFromTable(filePath,self.renderer,self)
	else 
		return {}
	end
end

function GuiScreen:isVisible()
	return true
end

function GuiScreen:isDisabled()

end

function GuiScreen:setCallbackClassToElements(data)
	for elementName,callbackClass in pairs(data) do 
		for _,element in pairs(self.elements) do 
			if element:getClassName() == elementName then 
				element:setCallbackClass(callbackClass)
			end
		end
	end
end

function GuiScreen:getElements()
	return self.elements
end

function GuiScreen:onClickBack()
	self.renderer:changeBackToMenu()
end