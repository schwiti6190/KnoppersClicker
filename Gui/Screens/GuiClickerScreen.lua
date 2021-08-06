
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
				textCall = "getPriceText"
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
				textCall = "getPriceText"
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
				textCall = "getPriceText"
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
				textCall = "getPriceText"
			}
		}
	},
	back = {
		base = {
			class = GuiButtonElement,
			x = 1,
			y = 10,
			label = "back",
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
				visibleCall = "isVisible",
				textCall = "getText",
			}
		}
	},
	cps = {
		base = {
			class = GuiTextElement,
			x = 18,
			y = 2,
			label = "Cps: ",
			callbacks = {
				textCall = "getCps"
			}
		}
	},
	buyAmount = {
		base = {
			class = GuiButtonElement,
			x = 18,
			y = 10,
			label = "Buy amount:",
			callbacks = {
				onClickCall = "changeBuyAmount",
				textCall = "getBuyAmount"
			}
		}
	}
}