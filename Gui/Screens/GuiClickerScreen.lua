
---@class GuiClickerScreen : GuiScreen
GuiClickerScreen = Class(GuiScreen)

GuiClickerScreen.data = {
	cookie = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 2,
			label = "Knoppers: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
				onClickCall = "onClick"
			}
		},
		price = {
			class = GuiTextElement,
			x = 18,
			y = 2,
			label = "Price: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getPrice"
			}
		}
	},
	baker = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 3,
			label = "Baker: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
				onClickCall = "onClick"
			}
		},
		price = {
			class = GuiTextElement,
			x = 18,
			y = 3,
			label = "Price: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getPrice"
			}
		}
	},
	master = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 4,
			label = "Master: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
				onClickCall = "onClick"
			}
		},
		price = {
			class = GuiTextElement,
			x = 18,
			y = 4,
			label = "Price: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getPrice"
			}
		}
	},
	machine = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 5,
			label = "Machine: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
				onClickCall = "onClick"
			}
		},
		price = {
			class = GuiTextElement,
			x = 18,
			y = 5,
			label = "Price: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getPrice"
			}
		}
	},
	worker = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 6,
			label = "Worker: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
				onClickCall = "onClick"
			}
		},
		price = {
			class = GuiTextElement,
			x = 18,
			y = 6,
			label = "Price: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getPrice"
			}
		}
	},
	back = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 10,
			label = "back: ",
			callbacks = {
				onClickCall = "onClickBack"
			}
		}
	},
	event = {
		base = {
			class = GuiTextElement,
			x = 1,
			y = 1,
			label = "Event: ",
			callbacks = {
				disabledCall = "isDisabled",
				visibleCall = "isVisible",
				textCall = "getText",
			}
		}
	}
}