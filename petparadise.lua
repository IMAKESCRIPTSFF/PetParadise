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
local BUTTON = Color3.fromRGB(31, 31, 38)
local BUTTON_HOVER = Color3.fromRGB(42, 42, 51)
local ON_COLOR = Color3.fromRGB(45, 190, 85)
local ON_HOVER = Color3.fromRGB(55, 215, 100)
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
close.Parent = topBar

--// Top button hover
minimize.MouseEnter:Connect(function()
    TweenService:Create(
        minimize,
        TweenInfo.new(0.15),
        {TextColor3 = TEXT}
    ):Play()
end)

minimize.MouseLeave:Connect(function()
    TweenService:Create(
        minimize,
        TweenInfo.new(0.15),
        {TextColor3 = MUTED}
    ):Play()
end)

close.MouseEnter:Connect(function()
    TweenService:Create(
        close,
        TweenInfo.new(0.15),
        {TextColor3 = RED}
    ):Play()
end)

close.MouseLeave:Connect(function()
    TweenService:Create(
        close,
        TweenInfo.new(0.15),
        {TextColor3 = MUTED}
    ):Play()
end)

--// Content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -55)
content.Position = UDim2.new(0, 12, 0, 50)
content.BackgroundTransparency = 1
content.Parent = main

--// Create button
local function createButton(text, y)
    local button = Instance.new("TextButton")

    button.Size = UDim2.new(1, 0, 0, 52)
    button.Position = UDim2.new(0, 0, 0, y)
    button.BackgroundColor3 = BUTTON
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

--// Button animation helper
local function setButtonState(button, enabled, label)
    if enabled then
        button.Text = label .. ": ON"

        TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = ON_COLOR,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        ):Play()
    else
        button.Text = label .. ": OFF"

        TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = BUTTON,
                TextColor3 = TEXT
            }
        ):Play()
    end
end

--// Egg hover
eggButton.MouseEnter:Connect(function()
    local color = eggEnabled and ON_HOVER or BUTTON_HOVER

    TweenService:Create(
        eggButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = color}
    ):Play()
end)

eggButton.MouseLeave:Connect(function()
    local color = eggEnabled and ON_COLOR or BUTTON

    TweenService:Create(
        eggButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = color}
    ):Play()
end)

--// Chest hover
chestButton.MouseEnter:Connect(function()
    local color = chestEnabled and ON_HOVER or BUTTON_HOVER

    TweenService:Create(
        chestButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = color}
    ):Play()
end)

chestButton.MouseLeave:Connect(function()
    local color = chestEnabled and ON_COLOR or BUTTON

    TweenService:Create(
        chestButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = color}
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

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 260, 0, 42)}
        ):Play()

        minimize.Text = "+"

    else
        content.Visible = true

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 260, 0, 185)}
        ):Play()

        minimize.Text = "−"
    end
end)

--// Double-click close confirmation
close.MouseButton1Click:Connect(function()
    local currentTime = tick()

    if currentTime - lastCloseClick <= 0.6 then
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
        lastCloseClick = currentTime

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

--// Dragging
local dragging = false
local dragStart
local startPosition

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        local mousePosition = input.Position

        local minPos = minimize.AbsolutePosition
        local minSize = minimize.AbsoluteSize

        local closePos = close.AbsolutePosition
        local closeSize = close.AbsoluteSize

        local onMinimize =
            mousePosition.X >= minPos.X and
            mousePosition.X <= minPos.X + minSize.X and
            mousePosition.Y >= minPos.Y and
            mousePosition.Y <= minPos.Y + minSize.Y

        local onClose =
            mousePosition.X >= closePos.X and
            mousePosition.X <= closePos.X + closeSize.X and
            mousePosition.Y >= closePos.Y and
            mousePosition.Y <= closePos.Y + closeSize.Y

        if onMinimize or onClose then
            return
        end

        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
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
    TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {
        Size = UDim2.new(0, 260, 0, 185),
        Position = UDim2.new(0.5, -130, 0.5, -92)
    }
):Play()
