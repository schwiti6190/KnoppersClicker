

---@class Machine : Item 
Machine = Class(Item)
Machine.defaultPrice = 550
Machine.masterPrice = 10 
Machine.priceModifier = 5
Machine.timer = 3
Machine.cookieRewardModifier = 0.33 
Machine.defaultWorkerAmount = 3
Machine.workerAmountModifier = 1

function Machine:add()
	local masterValue = self.itemHandler:getItemValue(Items.master)
	if masterValue >= self.masterPrice then
		if Item.add(self) then 
			self.itemHandler:decreaseItemValue(Items.master,self.masterPrice)
			local workerValue = self.itemHandler:getItemValue(Items.worker)
			self.itemHandler:increaseItemValue(Items.worker,1)
			return true
		end
	end
end

function Machine:update()
	local time = math.floor(os.clock())
	if self.lastTick then 
		if (self.timer + self.lastTick) < time then 
			self:changeCookies()
			self.lastTick  = time
		end
	else 
		self.lastTick = time
	end

	Item.update(self)
end

function Machine:changeCookies()
	self.itemHandler:increaseItemValue(Items.cookie,self:getCookieReward())
end

function Machine:getCookieReward()
	local workerValue = self.itemHandler:getItemValue(Items.worker)
	return self.cookieRewardModifier*workerValue*self.itemHandler:getMachineModifier()*self.itemHandler:getWorkerModifier()
end

function Machine:getWorkerFreeSpace()
	return self.defaultWorkerAmount*self.workerAmountModifier*self.value
end

function Machine:canInteract()
	local masterValue = self.itemHandler:getItemValue(Items.master)
	return masterValue >= self.masterPrice and Item.canInteract(self)
end

function Machine:getCps()
	return self:getCookieReward()/self.timer
end