local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

--// Settings
local EGG_DELAY = 0.1
local CHEST_DELAY = 30

--// Colors
local BG = Color3.fromRGB(20, 20, 24)
local TOP = Color3.fromRGB(27, 27, 33)

local BUTTON_OFF = Color3.fromRGB(31, 31, 38)
local BUTTON_OFF_HOVER = Color3.fromRGB(42, 42, 51)

local BUTTON_ON = Color3.fromRGB(45, 190, 85)
local BUTTON_ON_HOVER = Color3.fromRGB(55, 215, 100)

local STROKE = Color3.fromRGB(60, 60, 72)
local TEXT = Color3.fromRGB(240, 240, 245)
local MUTED = Color3.fromRGB(155, 155, 170)
local RED = Color3.fromRGB(220, 75, 85)

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

--// Main
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 185)
main.Position = UDim2.new(0.5, -130, 0.5, -92)
main.BackgroundColor3 = BG
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = STROKE
mainStroke.Thickness = 1
mainStroke.Transparency = 0.25
mainStroke.Parent = main

--// Top bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 42)
topBar.BackgroundColor3 = TOP
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 12)
topCorner.Parent = topBar

local topFill = Instance.new("Frame")
topFill.Size = UDim2.new(1, 0, 0, 12)
topFill.Position = UDim2.new(0, 0, 1, -12)
topFill.BackgroundColor3 = TOP
topFill.BorderSizePixel = 0
topFill.Parent = topBar

--// Dedicated drag area
local dragArea = Instance.new("TextButton")
dragArea.Size = UDim2.new(1, -75, 1, 0)
dragArea.Position = UDim2.new(0, 0, 0, 0)
dragArea.BackgroundTransparency = 1
dragArea.Text = ""
dragArea.AutoButtonColor = false
dragArea.Active = true
dragArea.ZIndex = 10
dragArea.Parent = topBar

--// Purple accent
local accent = Instance.new("Frame")
accent.Size = UDim2.new(0, 3, 0, 18)
accent.Position = UDim2.new(0, 7, 0.5, -9)
accent.BackgroundColor3 = Color3.fromRGB(145, 85, 255)
accent.BorderSizePixel = 0
accent.Parent = topBar

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

--// Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -95, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Nightmare Egg"
title.TextColor3 = TEXT
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 2
title.Parent = topBar

--// Minimize
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 28, 0, 28)
minimize.Position = UDim2.new(1, -66, 0.5, -14)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = MUTED
minimize.TextSize = 19
minimize.Font = Enum.Font.GothamBold
minimize.AutoButtonColor = false
minimize.ZIndex = 20
minimize.Parent = topBar

--// Close
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 28, 0, 28)
close.Position = UDim2.new(1, -35, 0.5, -14)
close.BackgroundTransparency = 1
close.Text = "×"
close.TextColor3 = MUTED
close.TextSize = 21
close.Font = Enum.Font.GothamBold
close.AutoButtonColor = false
close.ZIndex = 20
close.Parent = topBar

--// Button content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -55)
content.Position = UDim2.new(0, 12, 0, 50)
content.BackgroundTransparency = 1
content.Parent = main

--// Create toggle
local function createButton(text, y)
    local button = Instance.new("TextButton")

    button.Size = UDim2.new(1, 0, 0, 52)
    button.Position = UDim2.new(0, 0, 0, y)
    button.BackgroundColor3 = BUTTON_OFF
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = TEXT
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.Parent = content

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 9)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = STROKE
    stroke.Thickness = 1
    stroke.Transparency = 0.35
    stroke.Parent = button

    return button
end

local eggButton = createButton("🥚  Egg: OFF", 0)
local chestButton = createButton("🪙  Chest: OFF", 62)

--// State
local eggEnabled = false
local chestEnabled = false
local minimized = false
local lastCloseClick = 0
local closing = false

--// Button state
local function setButtonState(button, enabled, label)
    if enabled then
        button.Text = label .. ": ON"

        TweenService:Create(
            button,
            TweenInfo.new(0.2),
            {
                BackgroundColor3 = BUTTON_ON,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        ):Play()
    else
        button.Text = label .. ": OFF"

        TweenService:Create(
            button,
            TweenInfo.new(0.2),
            {
                BackgroundColor3 = BUTTON_OFF,
                TextColor3 = TEXT
            }
        ):Play()
    end
end

--// Hover
eggButton.MouseEnter:Connect(function()
    TweenService:Create(
        eggButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = eggEnabled
                and BUTTON_ON_HOVER
                or BUTTON_OFF_HOVER
        }
    ):Play()
end)

eggButton.MouseLeave:Connect(function()
    TweenService:Create(
        eggButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = eggEnabled
                and BUTTON_ON
                or BUTTON_OFF
        }
    ):Play()
end)

chestButton.MouseEnter:Connect(function()
    TweenService:Create(
        chestButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = chestEnabled
                and BUTTON_ON_HOVER
                or BUTTON_OFF_HOVER
        }
    ):Play()
end)

chestButton.MouseLeave:Connect(function()
    TweenService:Create(
        chestButton,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 = chestEnabled
                and BUTTON_ON
                or BUTTON_OFF
        }
    ):Play()
end)

--// Egg loop
task.spawn(function()
    while gui.Parent do
        if eggEnabled then
            pcall(function()
                ReplicatedStorage.Functions.Hatch:InvokeServer(
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

--// Chest loop
task.spawn(function()
    while gui.Parent do
        if chestEnabled then
            pcall(function()
                ReplicatedStorage.Functions.CollectChest:InvokeServer(
                    "CoinChest"
                )
            end)

            task.wait(CHEST_DELAY)
        else
            task.wait(0.1)
        end
    end
end)

--// Egg toggle
eggButton.MouseButton1Click:Connect(function()
    eggEnabled = not eggEnabled
    setButtonState(eggButton, eggEnabled, "🥚  Egg")
end)

--// Chest toggle
chestButton.MouseButton1Click:Connect(function()
    chestEnabled = not chestEnabled
    setButtonState(chestButton, chestEnabled, "🪙  Chest")
end)

--// Minimize
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        content.Visible = false
        minimize.Text = "+"

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart),
            {
                Size = UDim2.new(0, 260, 0, 42)
            }
        ):Play()
    else
        content.Visible = true
        minimize.Text = "−"

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart),
            {
                Size = UDim2.new(0, 260, 0, 185)
            }
        ):Play()
    end
end)

--// Double-click close
close.MouseButton1Click:Connect(function()
    local now = tick()

    if now - lastCloseClick <= 0.6 then
        closing = true

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        ):Play()

        task.wait(0.25)

        eggEnabled = false
        chestEnabled = false
        gui:Destroy()
    else
        lastCloseClick = now

        close.Text = "?"
        close.TextColor3 = Color3.fromRGB(255, 200, 80)

        task.delay(0.6, function()
            if not closing and tick() - lastCloseClick >= 0.6 then
                close.Text = "×"
                close.TextColor3 = MUTED
            end
        end)
    end
end)

--// DRAGGING
-- Dedicated drag button makes this reliable.
local dragging = false
local dragStart = nil
local startPosition = nil

dragArea.MouseButton1Down:Connect(function(x, y)
    dragging = true
    dragStart = Vector2.new(x, y)
    startPosition = main.Position
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
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

--// Opening animation
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(
    main,
    TweenInfo.new(
        0.45,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = UDim2.new(0, 260, 0, 185),
        Position = UDim2.new(0.5, -130, 0.5, -92)
    }
):Play()
