

---@class Worker : Item 
Worker = Class(Item)
Worker.defaultPrice = 50
Worker.priceModifier = 10

function Worker:add()
	if self:hasFreeSpace() then 
		Item.add(self)
	end	 
end

function Worker:hasFreeSpace()
	local machineItem = self.itemHandler:getItem(Items.machine)
	return machineItem:getWorkerFreeSpace() > self.value
end

function Worker:canInteract()
	return self:hasFreeSpace() and Item.canInteract(self)
end