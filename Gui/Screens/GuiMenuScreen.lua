
---@class GuiMenuScreen : GuiScreen
GuiMenuScreen = Class(GuiScreen)

GuiMenuScreen.data = {
	title = {
		base = {
			class = GuiTextElement,
			x = 1,
			y = 1,
			label = "Willkommen zu Koppers clicker",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
			}
		}
	},
	clicker = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 2,
			label = "Clicker",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				onClickCall = "onClickClicker"
			}
		}
	},
	upgrade = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 3,
			label = "Upgrade",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				onClickCall = "onClickUpgrade"
			}
		}
	},
}

function GuiMenuScreen:onClickClicker()
	self.renderer:changeScreen(Screens.clicker)
end

function GuiMenuScreen:onClickUpgrade()
	self.renderer:changeScreen(Screens.upgrade)
end
