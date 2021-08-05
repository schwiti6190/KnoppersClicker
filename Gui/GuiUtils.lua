
---@field GuiUtils table
GuiUtils = {}

function GuiUtils.setButtonsFromTable(data,renderer,callbackClass)
	local elements = {}
	for elementName,Data in pairs(data) do
		for _,elementData in pairs(Data) do
			local element = elementData.class(renderer,elementData.x,elementData.y,elementData.label,"")
			element:setCallbacks(elementData.callbacks,callbackClass)
			table.insert(elements,element)
			element:setClassName(elementName) 
		end
	end
	return elements
end