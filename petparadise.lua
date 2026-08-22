local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

--==================================================
-- SETTINGS
--==================================================

local EGG_DELAY = 0.1
local CHEST_DELAY = 30

--==================================================
-- COLORS
--==================================================

local BG = Color3.fromRGB(20, 20, 25)
local HEADER = Color3.fromRGB(27, 27, 33)

local OFF = Color3.fromRGB(31, 31, 38)
local OFF_HOVER = Color3.fromRGB(42, 42, 50)

local ON = Color3.fromRGB(45, 190, 85)
local ON_HOVER = Color3.fromRGB(55, 210, 95)

local TEXT = Color3.fromRGB(240, 240, 245)
local MUTED = Color3.fromRGB(155, 155, 165)

local BORDER = Color3.fromRGB(65, 65, 75)
local PURPLE = Color3.fromRGB(145, 85, 255)
local RED = Color3.fromRGB(225, 70, 80)

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

--==================================================
-- MAIN WINDOW
--==================================================

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(270, 190)
main.Position = UDim2.new(0.5, -135, 0.5, -95)
main.BackgroundColor3 = BG
main.BorderSizePixel = 0
main.ClipsDescendants = false
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 13)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = BORDER
mainStroke.Thickness = 1
mainStroke.Transparency = 0.15
mainStroke.Parent = main

--==================================================
-- HEADER
-- THIS IS THE ACTUAL DRAG BUTTON
--==================================================

local header = Instance.new("TextButton")
header.Name = "Header"
header.Size = UDim2.new(1, -70, 0, 45)
header.Position = UDim2.fromOffset(0, 0)
header.BackgroundColor3 = HEADER
header.BorderSizePixel = 0
header.Text = ""
header.AutoButtonColor = false
header.Active = true
header.Selectable = false
header.ZIndex = 10
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 13)
headerCorner.Parent = header

--==================================================
-- HEADER BOTTOM FILL
--==================================================

local headerFill = Instance.new("Frame")
headerFill.Name = "HeaderFill"
headerFill.Size = UDim2.new(1, 0, 0, 13)
headerFill.Position = UDim2.new(0, 0, 1, -13)
headerFill.BackgroundColor3 = HEADER
headerFill.BorderSizePixel = 0
headerFill.Active = false
headerFill.ZIndex = 10
headerFill.Parent = header

--==================================================
-- PURPLE ACCENT
--==================================================

local accent = Instance.new("Frame")
accent.Size = UDim2.fromOffset(3, 19)
accent.Position = UDim2.fromOffset(7, 13)
accent.BackgroundColor3 = PURPLE
accent.BorderSizePixel = 0
accent.Active = false
accent.ZIndex = 11
accent.Parent = header

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

--==================================================
-- TITLE
--==================================================

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "Nightmare Egg"
title.TextColor3 = TEXT
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Active = false
title.ZIndex = 11
title.Parent = header

--==================================================
-- MINIMIZE BUTTON
--==================================================

local minimize = Instance.new("TextButton")
minimize.Name = "Minimize"
minimize.Size = UDim2.fromOffset(30, 30)
minimize.Position = UDim2.new(1, -67, 0, 7)
minimize.BackgroundTransparency = 1
minimize.BorderSizePixel = 0
minimize.Text = "−"
minimize.TextColor3 = MUTED
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.AutoButtonColor = false
minimize.ZIndex = 30
minimize.Parent = main

--==================================================
-- CLOSE BUTTON
--==================================================

local close = Instance.new("TextButton")
close.Name = "Close"
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -34, 0, 7)
close.BackgroundTransparency = 1
close.BorderSizePixel = 0
close.Text = "×"
close.TextColor3 = MUTED
close.TextSize = 21
close.Font = Enum.Font.GothamBold
close.AutoButtonColor = false
close.ZIndex = 30
close.Parent = main

--==================================================
-- CONTENT
--==================================================

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -20, 1, -57)
content.Position = UDim2.fromOffset(10, 52)
content.BackgroundTransparency = 1
content.Parent = main

--==================================================
-- EGG BUTTON
--==================================================

local eggButton = Instance.new("TextButton")
eggButton.Name = "EggButton"
eggButton.Size = UDim2.new(1, 0, 0, 52)
eggButton.Position = UDim2.fromOffset(0, 0)
eggButton.BackgroundColor3 = OFF
eggButton.BorderSizePixel = 0
eggButton.Text = "Egg: OFF"
eggButton.TextColor3 = TEXT
eggButton.TextSize = 14
eggButton.Font = Enum.Font.GothamSemibold
eggButton.AutoButtonColor = false
eggButton.Active = true
eggButton.ZIndex = 5
eggButton.Parent = content

local eggCorner = Instance.new("UICorner")
eggCorner.CornerRadius = UDim.new(0, 10)
eggCorner.Parent = eggButton

local eggStroke = Instance.new("UIStroke")
eggStroke.Color = BORDER
eggStroke.Thickness = 1
eggStroke.Transparency = 0.4
eggStroke.Parent = eggButton

--==================================================
-- CHEST BUTTON
--==================================================

local chestButton = Instance.new("TextButton")
chestButton.Name = "ChestButton"
chestButton.Size = UDim2.new(1, 0, 0, 52)
chestButton.Position = UDim2.fromOffset(0, 62)
chestButton.BackgroundColor3 = OFF
chestButton.BorderSizePixel = 0
chestButton.Text = "Chest: OFF"
chestButton.TextColor3 = TEXT
chestButton.TextSize = 14
chestButton.Font = Enum.Font.GothamSemibold
chestButton.AutoButtonColor = false
chestButton.Active = true
chestButton.ZIndex = 5
chestButton.Parent = content

local chestCorner = Instance.new("UICorner")
chestCorner.CornerRadius = UDim.new(0, 10)
chestCorner.Parent = chestButton

local chestStroke = Instance.new("UIStroke")
chestStroke.Color = BORDER
chestStroke.Thickness = 1
chestStroke.Transparency = 0.4
chestStroke.Parent = chestButton

--==================================================
-- STATES
--==================================================

local eggEnabled = false
local chestEnabled = false
local minimized = false

local lastCloseClick = 0
local closing = false

--==================================================
-- EGG BUTTON
--==================================================

eggButton.MouseEnter:Connect(function()

	TweenService:Create(
		eggButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = eggEnabled and ON_HOVER or OFF_HOVER
		}
	):Play()

end)

eggButton.MouseLeave:Connect(function()

	TweenService:Create(
		eggButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = eggEnabled and ON or OFF
		}
	):Play()

end)

eggButton.MouseButton1Click:Connect(function()

	eggEnabled = not eggEnabled

	if eggEnabled then

		eggButton.Text = "Egg: ON"

		TweenService:Create(
			eggButton,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = ON
			}
		):Play()

	else

		eggButton.Text = "Egg: OFF"

		TweenService:Create(
			eggButton,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = OFF
			}
		):Play()

	end

end)

--==================================================
-- CHEST BUTTON
--==================================================

chestButton.MouseEnter:Connect(function()

	TweenService:Create(
		chestButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = chestEnabled and ON_HOVER or OFF_HOVER
		}
	):Play()

end)

chestButton.MouseLeave:Connect(function()

	TweenService:Create(
		chestButton,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = chestEnabled and ON or OFF
		}
	):Play()

end)

chestButton.MouseButton1Click:Connect(function()

	chestEnabled = not chestEnabled

	if chestEnabled then

		chestButton.Text = "Chest: ON"

		TweenService:Create(
			chestButton,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = ON
			}
		):Play()

	else

		chestButton.Text = "Chest: OFF"

		TweenService:Create(
			chestButton,
			TweenInfo.new(0.2),
			{
				BackgroundColor3 = OFF
			}
		):Play()

	end

end)

--==================================================
-- EGG LOOP
--==================================================

task.spawn(function()

	while gui.Parent do

		if eggEnabled then

			pcall(function()

				ReplicatedStorage
					.Functions
					.Hatch
					:InvokeServer(
						"Nightmare Egg",
						"Triple"
					)

			end)

			task.wait(EGG_DELAY)

		else

			task.wait(0.1)

		end

	end

end)

--==================================================
-- CHEST LOOP
--==================================================

task.spawn(function()

	while gui.Parent do

		if chestEnabled then

			pcall(function()

				ReplicatedStorage
					.Functions
					.CollectChest
					:InvokeServer(
						"CoinChest"
					)

			end)

			task.wait(CHEST_DELAY)

		else

			task.wait(0.1)

		end

	end

end)

--==================================================
-- MINIMIZE
--==================================================

minimize.MouseEnter:Connect(function()

	TweenService:Create(
		minimize,
		TweenInfo.new(0.12),
		{
			TextColor3 = TEXT
		}
	):Play()

end)

minimize.MouseLeave:Connect(function()

	TweenService:Create(
		minimize,
		TweenInfo.new(0.12),
		{
			TextColor3 = MUTED
		}
	):Play()

end)

minimize.MouseButton1Click:Connect(function()

	minimized = not minimized

	if minimized then

		content.Visible = false
		minimize.Text = "+"

		TweenService:Create(
			main,
			TweenInfo.new(
				0.25,
				Enum.EasingStyle.Quart,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.fromOffset(270, 45)
			}
		):Play()

	else

		content.Visible = true
		minimize.Text = "−"

		TweenService:Create(
			main,
			TweenInfo.new(
				0.25,
				Enum.EasingStyle.Quart,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.fromOffset(270, 190)
			}
		):Play()

	end

end)

--==================================================
-- CLOSE / DOUBLE CLICK
--==================================================

close.MouseEnter:Connect(function()

	TweenService:Create(
		close,
		TweenInfo.new(0.12),
		{
			TextColor3 = RED
		}
	):Play()

end)

close.MouseLeave:Connect(function()

	TweenService:Create(
		close,
		TweenInfo.new(0.12),
		{
			TextColor3 = MUTED
		}
	):Play()

end)

close.MouseButton1Click:Connect(function()

	local currentTime = tick()

	if currentTime - lastCloseClick <= 0.6 then

		closing = true

		eggEnabled = false
		chestEnabled = false

		TweenService:Create(
			main,
			TweenInfo.new(
				0.25,
				Enum.EasingStyle.Back,
				Enum.EasingDirection.In
			),
			{
				Size = UDim2.fromOffset(0, 0)
			}
		):Play()

		task.wait(0.25)

		gui:Destroy()

	else

		lastCloseClick = currentTime

		close.Text = "?"
		close.TextColor3 = Color3.fromRGB(255, 200, 80)

		task.delay(0.6, function()

			if not closing
				and gui.Parent
				and tick() - lastCloseClick >= 0.6 then

				close.Text = "×"
				close.TextColor3 = MUTED

			end

		end)

	end

end)

--==================================================
-- DRAGGING
-- MOUSEBUTTON1DOWN
--==================================================

local dragging = false
local dragStart = nil
local startPosition = nil

header.MouseButton1Down:Connect(function(mouseX, mouseY)

	dragging = true

	dragStart = Vector2.new(mouseX, mouseY)
	startPosition = main.Position

end)

UserInputService.InputChanged:Connect(function(input)

	if dragging
		and input.UserInputType == Enum.UserInputType.MouseMovement then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,

			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)

	end

end)

UserInputService.InputEnded:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = false

	end

end)

--==================================================
-- OPENING ANIMATION
--==================================================

main.Size = UDim2.fromOffset(0, 0)

TweenService:Create(
	main,
	TweenInfo.new(
		0.4,
		Enum.EasingStyle.Back,
		Enum.EasingDirection.Out
	),
	{
		Size = UDim2.fromOffset(270, 190)
	}
):Play()
