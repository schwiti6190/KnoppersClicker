
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

GuiUtils.moneyEndings = {
	"k",
	"M",
	"B",
	"T",
	"aa",
	"ab",
	"ac",
	"ad",
	"ae",
	"af"
}
GuiUtils.numMoneyEndings = 10


function GuiUtils.getFormattedMoneyText(value)
	for i=GuiUtils.numMoneyEndings,1,-1 do 
		if i == 0 then 
			return value
		end
		local x = value/(10^(i*3))
		if x>=1 then 
			return string.format("%.1f %s", x,GuiUtils.moneyEndings[i])
		end
	end
	return string.format("%.1f",value)
end