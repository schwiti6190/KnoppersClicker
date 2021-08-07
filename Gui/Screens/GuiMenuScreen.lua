
---@class GuiMenuScreen : GuiScreen
GuiMenuScreen = Class(GuiScreen)
GuiMenuScreen.filePath = "GuiMenuScreen.json"

function GuiMenuScreen:onClickClicker()
	self.renderer:changeScreen(Screens.clicker)
end

function GuiMenuScreen:onClickUpgrade()
	self.renderer:changeScreen(Screens.upgrade)
end
