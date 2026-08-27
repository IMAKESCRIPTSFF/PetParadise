local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

--------------------------------------------------
-- SETTINGS
--------------------------------------------------

local GUI_WIDTH = 215
local GUI_HEIGHT = 285

local BG = Color3.fromRGB(12, 10, 18)
local PANEL = Color3.fromRGB(19, 16, 28)
local BUTTON_OFF = Color3.fromRGB(28, 23, 39)
local BUTTON_HOVER = Color3.fromRGB(38, 29, 54)

local PURPLE = Color3.fromRGB(180, 55, 255)
local PURPLE_LIGHT = Color3.fromRGB(215, 105, 255)

local TEXT = Color3.fromRGB(245, 242, 255)
local SUBTEXT = Color3.fromRGB(145, 138, 160)

local GREEN = Color3.fromRGB(65, 230, 130)
local RED = Color3.fromRGB(255, 75, 105)

--------------------------------------------------
-- GUI
--------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "EggGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- MAIN WINDOW
--------------------------------------------------

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
main.Position = UDim2.new(
	0.5,
	-(GUI_WIDTH / 2),
	0.5,
	-(GUI_HEIGHT / 2)
)
main.BackgroundColor3 = BG
main.BorderSizePixel = 0
main.ClipsDescendants = false
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 13)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = PURPLE
mainStroke.Thickness = 1
mainStroke.Transparency = 0.45
mainStroke.Parent = main

--------------------------------------------------
-- OUTER GLOW
--------------------------------------------------

local glow = Instance.new("ImageLabel")
glow.Name = "Glow"
glow.AnchorPoint = Vector2.new(0.5, 0.5)
glow.Position = UDim2.new(0.5, 0, 0.5, 2)
glow.Size = UDim2.new(1, 35, 1, 35)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://6014261993"
glow.ImageColor3 = PURPLE
glow.ImageTransparency = 0.82
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(49, 49, 450, 450)
glow.ZIndex = 0
glow.Parent = main

--------------------------------------------------
-- TOP BAR
--------------------------------------------------

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = PANEL
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 5
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 13)
titleCorner.Parent = titleBar

local titleBottom = Instance.new("Frame")
titleBottom.Size = UDim2.new(1, 0, 0, 13)
titleBottom.Position = UDim2.new(0, 0, 1, -13)
titleBottom.BackgroundColor3 = PANEL
titleBottom.BorderSizePixel = 0
titleBottom.ZIndex = 5
titleBottom.Parent = titleBar

--------------------------------------------------
-- TITLE ACCENT
--------------------------------------------------

local accent = Instance.new("Frame")
accent.Size = UDim2.new(0, 4, 0, 25)
accent.Position = UDim2.new(0, 12, 0.5, -12)
accent.BackgroundColor3 = PURPLE
accent.BorderSizePixel = 0
accent.ZIndex = 6
accent.Parent = titleBar

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -95, 0, 22)
title.Position = UDim2.new(0, 23, 0, 6)
title.BackgroundTransparency = 1
title.Text = "EGG HUB"
title.TextColor3 = TEXT
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 6
title.Parent = titleBar

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -95, 0, 15)
subtitle.Position = UDim2.new(0, 23, 0, 27)
subtitle.BackgroundTransparency = 1
subtitle.Text = "premium automation"
subtitle.TextColor3 = SUBTEXT
subtitle.TextSize = 9
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.ZIndex = 6
subtitle.Parent = titleBar

--------------------------------------------------
-- WINDOW BUTTON CREATOR
--------------------------------------------------

local function makeWindowButton(text, position, normal, hover)
	local button = Instance.new("TextButton")

	button.Size = UDim2.new(0, 27, 0, 25)
	button.Position = position
	button.BackgroundColor3 = normal
	button.Text = text
	button.TextColor3 = TEXT
	button.TextSize = 16
	button.Font = Enum.Font.GothamBold
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.ZIndex = 7
	button.Parent = titleBar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 7)
	corner.Parent = button

	button.MouseEnter:Connect(function()
		TweenService:Create(
			button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = hover
			}
		):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(
			button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = normal
			}
		):Play()
	end)

	return button
end

local minimize = makeWindowButton(
	"−",
	UDim2.new(1, -64, 0, 11),
	Color3.fromRGB(31, 26, 42),
	Color3.fromRGB(48, 38, 62)
)

local close = makeWindowButton(
	"×",
	UDim2.new(1, -33, 0, 11),
	Color3.fromRGB(48, 24, 35),
	Color3.fromRGB(75, 30, 48)
)

close.TextColor3 = Color3.fromRGB(255, 105, 135)

--------------------------------------------------
-- CONTENT
--------------------------------------------------

local page = Instance.new("Frame")
page.Name = "Page"
page.Size = UDim2.new(1, -20, 1, -57)
page.Position = UDim2.new(0, 10, 0, 51)
page.BackgroundTransparency = 1
page.ZIndex = 4
page.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 7)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = page

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 4)
padding.PaddingBottom = UDim.new(0, 4)
padding.Parent = page

--------------------------------------------------
-- PREMIUM BUTTON
--------------------------------------------------

local function createButton(text, order)

	local button = Instance.new("TextButton")
	button.Name = text
	button.Size = UDim2.new(1, 0, 0, 40)
	button.BackgroundColor3 = BUTTON_OFF
	button.Text = ""
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.LayoutOrder = order
	button.ZIndex = 5
	button.Parent = page

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 9)
	corner.Parent = button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(60, 50, 75)
	stroke.Thickness = 1
	stroke.Transparency = 0.35
	stroke.Parent = button

	--------------------------------------------------
	-- LABEL
	--------------------------------------------------

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -62, 1, 0)
	label.Position = UDim2.new(0, 15, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = TEXT
	label.TextSize = 11
	label.Font = Enum.Font.GothamBold
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.ZIndex = 6
	label.Parent = button

	--------------------------------------------------
	-- TOGGLE BACKGROUND
	--------------------------------------------------

	local toggle = Instance.new("Frame")
	toggle.Size = UDim2.new(0, 34, 0, 18)
	toggle.Position = UDim2.new(1, -46, 0.5, -9)
	toggle.BackgroundColor3 = Color3.fromRGB(47, 40, 56)
	toggle.BorderSizePixel = 0
	toggle.ZIndex = 6
	toggle.Parent = button

	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(1, 0)
	toggleCorner.Parent = toggle

	--------------------------------------------------
	-- TOGGLE KNOB
	--------------------------------------------------

	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0, 12, 0, 12)
	knob.Position = UDim2.new(0, 3, 0.5, -6)
	knob.BackgroundColor3 = Color3.fromRGB(150, 145, 160)
	knob.BorderSizePixel = 0
	knob.ZIndex = 7
	knob.Parent = toggle

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

	--------------------------------------------------
	-- STATE
	--------------------------------------------------

	local enabled = false

	local function setEnabled(state)
		enabled = state
		button:SetAttribute("Enabled", state)

		if state then

			TweenService:Create(
				button,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					BackgroundColor3 = Color3.fromRGB(45, 25, 61)
				}
			):Play()

			TweenService:Create(
				stroke,
				TweenInfo.new(0.18),
				{
					Color = PURPLE,
					Transparency = 0.05
				}
			):Play()

			TweenService:Create(
				toggle,
				TweenInfo.new(0.18),
				{
					BackgroundColor3 = PURPLE
				}
			):Play()

			TweenService:Create(
				knob,
				TweenInfo.new(0.18, Enum.EasingStyle.Back),
				{
					Position = UDim2.new(1, -15, 0.5, -6),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				}
			):Play()

		else

			TweenService:Create(
				button,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					BackgroundColor3 = BUTTON_OFF
				}
			):Play()

			TweenService:Create(
				stroke,
				TweenInfo.new(0.18),
				{
					Color = Color3.fromRGB(60, 50, 75),
					Transparency = 0.35
				}
			):Play()

			TweenService:Create(
				toggle,
				TweenInfo.new(0.18),
				{
					BackgroundColor3 = Color3.fromRGB(47, 40, 56)
				}
			):Play()

			TweenService:Create(
				knob,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					Position = UDim2.new(0, 3, 0.5, -6),
					BackgroundColor3 = Color3.fromRGB(150, 145, 160)
				}
			):Play()
		end
	end

	--------------------------------------------------
	-- HOVER
	--------------------------------------------------

	button.MouseEnter:Connect(function()

		local target

		if enabled then
			target = Color3.fromRGB(52, 28, 70)
		else
			target = BUTTON_HOVER
		end

		TweenService:Create(
			button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = target
			}
		):Play()
	end)

	button.MouseLeave:Connect(function()

		local target

		if enabled then
			target = Color3.fromRGB(45, 25, 61)
		else
			target = BUTTON_OFF
		end

		TweenService:Create(
			button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = target
			}
		):Play()
	end)

	--------------------------------------------------
	-- PRESS ANIMATION
	--------------------------------------------------

	button.MouseButton1Down:Connect(function()

		TweenService:Create(
			button,
			TweenInfo.new(0.06),
			{
				Size = UDim2.new(1, -3, 0, 38)
			}
		):Play()
	end)

	button.MouseButton1Up:Connect(function()

		TweenService:Create(
			button,
			TweenInfo.new(0.08),
			{
				Size = UDim2.new(1, 0, 0, 40)
			}
		):Play()
	end)

	return button, setEnabled
end

--------------------------------------------------
-- BUTTONS
--------------------------------------------------

local neonButton, neonVisual =
	createButton("Neon Egg", 1)

local hellButton, hellVisual =
	createButton("Hell Egg", 2)

local chestButton, chestVisual =
	createButton("Coin Chest", 3)

local merchantButton, merchantVisual =
	createButton("Auto Merchant", 4)

local rebirthButton, rebirthVisual =
	createButton("Auto Rebirth", 5)

--------------------------------------------------
-- STATES
--------------------------------------------------

local neonEnabled = false
local hellEnabled = false
local chestEnabled = false
local merchantEnabled = false
local rebirthEnabled = false

local minimized = false

--------------------------------------------------
-- MERCHANT ITEMS
--------------------------------------------------

local merchantItems = {
	"Coin1",
	"Luck1",
	"Speed1",
	"Coin2",
	"Luck2",
	"Speed2",
	"Coin3",
	"Luck3",
	"Speed3",
	"Mega1",
	"hugeEgg3",
	"Valk"
}

--------------------------------------------------
-- NEON EGG
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		if neonEnabled then

			pcall(function()

				local args = {
					[1] = "Neon Egg",
					[2] = "Triple"
				}

				ReplicatedStorage.Functions.Hatch:InvokeServer(
					unpack(args)
				)

			end)

			task.wait(0.1)

		else

			task.wait(0.1)
		end
	end
end)

--------------------------------------------------
-- HELL EGG
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		if hellEnabled then

			pcall(function()

				local args = {
					[1] = "Hell Egg",
					[2] = "Triple"
				}

				ReplicatedStorage.Functions.Hatch:InvokeServer(
					unpack(args)
				)

			end)

			task.wait(0.1)

		else

			task.wait(0.1)
		end
	end
end)

--------------------------------------------------
-- CHEST
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		if chestEnabled then

			pcall(function()

				ReplicatedStorage.Functions.CollectChest:InvokeServer(
					"CoinChest"
				)

			end)

			task.wait(30)

		else

			task.wait(0.1)
		end
	end
end)

--------------------------------------------------
-- MERCHANT
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		if merchantEnabled then

			for _, itemName in ipairs(merchantItems) do

				if not merchantEnabled or not gui.Parent then
					break
				end

				pcall(function()

					ReplicatedStorage.MerchantPurchase:FireServer(
						itemName
					)

				end)

				task.wait(1)
			end

		else

			task.wait(0.1)
		end
	end
end)

--------------------------------------------------
-- REBIRTH
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		if rebirthEnabled then

			pcall(function()

				ReplicatedStorage.Events.Rebirth:FireServer(1)

			end)

			task.wait(0.1)

		else

			task.wait(0.1)
		end
	end
end)

--------------------------------------------------
-- TOGGLE HELPER
--------------------------------------------------

local function updateButton(button, visual, enabled)

	button:SetAttribute("Enabled", enabled)
	visual(enabled)

end

--------------------------------------------------
-- NEON
--------------------------------------------------

neonButton.MouseButton1Click:Connect(function()

	neonEnabled = not neonEnabled

	updateButton(
		neonButton,
		neonVisual,
		neonEnabled
	)

end)

--------------------------------------------------
-- HELL
--------------------------------------------------

hellButton.MouseButton1Click:Connect(function()

	hellEnabled = not hellEnabled

	updateButton(
		hellButton,
		hellVisual,
		hellEnabled
	)

end)

--------------------------------------------------
-- CHEST
--------------------------------------------------

chestButton.MouseButton1Click:Connect(function()

	chestEnabled = not chestEnabled

	updateButton(
		chestButton,
		chestVisual,
		chestEnabled
	)

end)

--------------------------------------------------
-- MERCHANT
--------------------------------------------------

merchantButton.MouseButton1Click:Connect(function()

	merchantEnabled = not merchantEnabled

	updateButton(
		merchantButton,
		merchantVisual,
		merchantEnabled
	)

end)

--------------------------------------------------
-- REBIRTH
--------------------------------------------------

rebirthButton.MouseButton1Click:Connect(function()

	rebirthEnabled = not rebirthEnabled

	updateButton(
		rebirthButton,
		rebirthVisual,
		rebirthEnabled
	)

end)

--------------------------------------------------
-- CLOSE CONFIRMATION
--------------------------------------------------

local confirmOverlay = Instance.new("Frame")
confirmOverlay.Name = "ConfirmOverlay"
confirmOverlay.Size = UDim2.new(1, 0, 1, 0)
confirmOverlay.BackgroundColor3 = Color3.fromRGB(5, 4, 8)
confirmOverlay.BackgroundTransparency = 0.15
confirmOverlay.Visible = false
confirmOverlay.ZIndex = 20
confirmOverlay.Parent = main

local overlayCorner = Instance.new("UICorner")
overlayCorner.CornerRadius = UDim.new(0, 13)
overlayCorner.Parent = confirmOverlay

--------------------------------------------------
-- CONFIRM BOX
--------------------------------------------------

local confirmBox = Instance.new("Frame")
confirmBox.Size = UDim2.new(0, 175, 0, 108)
confirmBox.Position = UDim2.new(0.5, -87, 0.5, -54)
confirmBox.BackgroundColor3 = Color3.fromRGB(24, 19, 33)
confirmBox.BorderSizePixel = 0
confirmBox.ZIndex = 21
confirmBox.Parent = confirmOverlay

local confirmCorner = Instance.new("UICorner")
confirmCorner.CornerRadius = UDim.new(0, 11)
confirmCorner.Parent = confirmBox

local confirmStroke = Instance.new("UIStroke")
confirmStroke.Color = PURPLE
confirmStroke.Thickness = 1
confirmStroke.Transparency = 0.25
confirmStroke.Parent = confirmBox

--------------------------------------------------
-- CONFIRM TITLE
--------------------------------------------------

local confirmTitle = Instance.new("TextLabel")
confirmTitle.Size = UDim2.new(1, 0, 0, 25)
confirmTitle.Position = UDim2.new(0, 0, 0, 10)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "Close GUI?"
confirmTitle.TextColor3 = TEXT
confirmTitle.TextSize = 14
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.ZIndex = 22
confirmTitle.Parent = confirmBox

local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(1, -20, 0, 20)
confirmText.Position = UDim2.new(0, 10, 0, 34)
confirmText.BackgroundTransparency = 1
confirmText.Text = "Are you sure you want to close?"
confirmText.TextColor3 = SUBTEXT
confirmText.TextSize = 9
confirmText.Font = Enum.Font.Gotham
confirmText.ZIndex = 22
confirmText.Parent = confirmBox

--------------------------------------------------
-- YES
--------------------------------------------------

local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 65, 0, 27)
yesButton.Position = UDim2.new(0, 18, 1, -38)
yesButton.BackgroundColor3 = PURPLE
yesButton.Text = "YES"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextSize = 10
yesButton.Font = Enum.Font.GothamBold
yesButton.BorderSizePixel = 0
yesButton.AutoButtonColor = false
yesButton.ZIndex = 22
yesButton.Parent = confirmBox

local yesCorner = Instance.new("UICorner")
yesCorner.CornerRadius = UDim.new(0, 7)
yesCorner.Parent = yesButton

--------------------------------------------------
-- NO
--------------------------------------------------

local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0, 65, 0, 27)
noButton.Position = UDim2.new(1, -83, 1, -38)
noButton.BackgroundColor3 = Color3.fromRGB(48, 42, 57)
noButton.Text = "NO"
noButton.TextColor3 = TEXT
noButton.TextSize = 10
noButton.Font = Enum.Font.GothamBold
noButton.BorderSizePixel = 0
noButton.AutoButtonColor = false
noButton.ZIndex = 22
noButton.Parent = confirmBox

local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 7)
noCorner.Parent = noButton

--------------------------------------------------
-- CONFIRM BUTTON HOVERS
--------------------------------------------------

yesButton.MouseEnter:Connect(function()

	TweenService:Create(
		yesButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = PURPLE_LIGHT
		}
	):Play()

end)

yesButton.MouseLeave:Connect(function()

	TweenService:Create(
		yesButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = PURPLE
		}
	):Play()

end)

noButton.MouseEnter:Connect(function()

	TweenService:Create(
		noButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = Color3.fromRGB(65, 57, 76)
		}
	):Play()

end)

noButton.MouseLeave:Connect(function()

	TweenService:Create(
		noButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = Color3.fromRGB(48, 42, 57)
		}
	):Play()

end)

--------------------------------------------------
-- CLOSE BUTTON
--------------------------------------------------

local confirming = false

close.MouseButton1Click:Connect(function()

	if confirming then
		return
	end

	confirming = true
	confirmOverlay.Visible = true

	confirmBox.Size = UDim2.new(0, 150, 0, 90)
	confirmBox.Position = UDim2.new(0.5, -75, 0.5, -45)

	TweenService:Create(
		confirmBox,
		TweenInfo.new(
			0.2,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			Size = UDim2.new(0, 175, 0, 108),
			Position = UDim2.new(0.5, -87, 0.5, -54)
		}
	):Play()

	task.delay(4, function()

		if confirming and gui.Parent then

			confirming = false
			confirmOverlay.Visible = false

		end
	end)
end)

--------------------------------------------------
-- YES CLOSE
--------------------------------------------------

yesButton.MouseButton1Click:Connect(function()

	neonEnabled = false
	hellEnabled = false
	chestEnabled = false
	merchantEnabled = false
	rebirthEnabled = false

	gui:Destroy()

end)

--------------------------------------------------
-- NO CLOSE
--------------------------------------------------

noButton.MouseButton1Click:Connect(function()

	confirming = false
	confirmOverlay.Visible = false

end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------

minimize.MouseButton1Click:Connect(function()

	if confirming then
		return
	end

	minimized = not minimized

	if minimized then

		page.Visible = false

		TweenService:Create(
			main,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad),
			{
				Size = UDim2.new(0, GUI_WIDTH, 0, 48)
			}
		):Play()

		minimize.Text = "+"

	else

		page.Visible = true

		TweenService:Create(
			main,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad),
			{
				Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
			}
		):Play()

		minimize.Text = "−"

	end
end)

--------------------------------------------------
-- DRAGGING
--------------------------------------------------

local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end

		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)

	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--------------------------------------------------
-- STARTUP ANIMATION
--------------------------------------------------

main.Size = UDim2.new(0, GUI_WIDTH - 15, 0, GUI_HEIGHT - 15)

TweenService:Create(
	main,
	TweenInfo.new(
		0.35,
		Enum.EasingStyle.Back,
		Enum.EasingDirection.Out
	),
	{
		Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
	}
):Play()

--------------------------------------------------
-- ACCENT GLOW ANIMATION
--------------------------------------------------

task.spawn(function()

	while gui.Parent do

		TweenService:Create(
			glow,
			TweenInfo.new(
				1.5,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				ImageTransparency = 0.72
			}
		):Play()

		task.wait(1.5)

		TweenService:Create(
			glow,
			TweenInfo.new(
				1.5,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				ImageTransparency = 0.86
			}
		):Play()

		task.wait(1.5)
	end
end)
