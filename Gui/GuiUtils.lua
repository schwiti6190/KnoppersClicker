
---@field GuiUtils table
GuiUtils = {}

function GuiUtils.setButtonsFromTable(filePath,renderer,callbackClass)
	local elements = {}
	print(filePath)
	local data = GuiUtils.getDataFromJsonFile(filePath)
	for elementName,Data in pairs(data) do
		for _,elementData in pairs(Data) do
			local className = elementData.class
			local class = GuiElements[className]
			local element = class(renderer,elementData.x,elementData.y,elementData.label,"")
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

function GuiUtils.getDataFromJsonFile(filePath)
	local data 
	local file =  fs.open(filePath,"r")
	if file then 
		local jsonData = file.readAll()
		if jsonData then 
			data = textutils.unserializeJSON(jsonData)
			print(data) 
		else 
			print("data error")
		end
		file.close()
	else 
		print("file error")
	end
	return data
end

function GuiUtils.setDataToJson(filePath,data)
	local file = fs.open(filePath,"w")
	if file then 
		local jsonData = textutils.serialiseJSON(data)
		if jsonData then 
			file.write(jsonData)
		else 
			print("json error")
		end
		file.close()
	else 
		print("file error")
	end
end