local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

--// Settings
local EGG_DELAY = 0.1
local CHEST_DELAY = 30

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- Main
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 180)
main.Position = UDim2.new(0.5, -125, 0.5, -90)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(65, 65, 80)
stroke.Thickness = 1
stroke.Transparency = 0.25
stroke.Parent = main

-- Shadow
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 5)
shadow.Size = UDim2.new(1, 35, 1, 35)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993"
shadow.ImageTransparency = 0.45
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(49, 49, 450, 450)
shadow.ZIndex = 0
shadow.Parent = main

--// Top bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 45)
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 34)
topBar.BorderSizePixel = 0
topBar.ZIndex = 2
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 14)
topCorner.Parent = topBar

-- Prevent bottom corners of top bar from staying rounded
local topCover = Instance.new("Frame")
topCover.Size = UDim2.new(1, 0, 0, 15)
topCover.Position = UDim2.new(0, 0, 1, -15)
topCover.BackgroundColor3 = Color3.fromRGB(25, 25, 34)
topCover.BorderSizePixel = 0
topCover.ZIndex = 2
topCover.Parent = topBar

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "✦  Nightmare Egg"
title.TextColor3 = Color3.fromRGB(245, 245, 255)
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3
title.Parent = topBar

-- Status dot
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 7, 0, 7)
statusDot.Position = UDim2.new(1, -92, 0.5, -3)
statusDot.BackgroundColor3 = Color3.fromRGB(120, 120, 130)
statusDot.BorderSizePixel = 0
statusDot.ZIndex = 3
statusDot.Parent = topBar

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

-- Minimize
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -68, 0.5, -15)
minimize.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
minimize.Text = "−"
minimize.TextColor3 = Color3.fromRGB(220, 220, 230)
minimize.TextSize = 18
minimize.Font = Enum.Font.GothamBold
minimize.AutoButtonColor = false
minimize.ZIndex = 3
minimize.Parent = topBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minimize

-- Close
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -34, 0.5, -15)
close.BackgroundColor3 = Color3.fromRGB(55, 35, 40)
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 130, 140)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.AutoButtonColor = false
close.ZIndex = 3
close.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

--// Content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -57)
content.Position = UDim2.new(0, 12, 0, 52)
content.BackgroundTransparency = 1
content.ZIndex = 2
content.Parent = main

-- Helper for buttons
local function createButton(text, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 52)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 46)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(230, 230, 240)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.ZIndex = 3
    button.Parent = content

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(70, 70, 85)
    buttonStroke.Transparency = 0.4
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button

    -- Hover animation
    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = Color3.fromRGB(45, 45, 58),
                Size = UDim2.new(1, 4, 0, 52),
                Position = UDim2.new(0, -2, position.Y.Scale, position.Y.Offset)
            }
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = Color3.fromRGB(35, 35, 46),
                Size = UDim2.new(1, 0, 0, 52),
                Position = position
            }
        ):Play()
    end)

    -- Press animation
    button.MouseButton1Down:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.08),
            {Size = UDim2.new(1, -4, 0, 48)}
        ):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.08),
            {Size = UDim2.new(1, 0, 0, 52)}
        ):Play()
    end)

    return button
end

local eggButton = createButton("🥚  Egg: OFF", UDim2.new(0, 0, 0, 0))
local chestButton = createButton("🪙  Chest: OFF", UDim2.new(0, 0, 0, 62))

--// State
local eggEnabled = false
local chestEnabled = false
local minimized = false
local closing = false
local lastCloseClick = 0

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

--// Update status dot
local function updateStatus()
    if eggEnabled or chestEnabled then
        TweenService:Create(
            statusDot,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(70, 220, 120)}
        ):Play()
    else
        TweenService:Create(
            statusDot,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(120, 120, 130)}
        ):Play()
    end
end

--// Egg toggle
eggButton.MouseButton1Click:Connect(function()
    eggEnabled = not eggEnabled

    if eggEnabled then
        eggButton.Text = "🥚  Egg: ON"

        TweenService:Create(
            eggButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(35, 115, 70)}
        ):Play()
    else
        eggButton.Text = "🥚  Egg: OFF"

        TweenService:Create(
            eggButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 46)}
        ):Play()
    end

    updateStatus()
end)

--// Chest toggle
chestButton.MouseButton1Click:Connect(function()
    chestEnabled = not chestEnabled

    if chestEnabled then
        chestButton.Text = "🪙  Chest: ON"

        TweenService:Create(
            chestButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(35, 115, 70)}
        ):Play()
    else
        chestButton.Text = "🪙  Chest: OFF"

        TweenService:Create(
            chestButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 46)}
        ):Play()
    end

    updateStatus()
end)

--// Minimize animation
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 250, 0, 45)}
        ):Play()

        task.delay(0.12, function()
            content.Visible = false
        end)

        minimize.Text = "+"

    else
        content.Visible = true

        TweenService:Create(
            main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 250, 0, 180)}
        ):Play()

        minimize.Text = "−"
    end
end)

--// Double-click X confirmation
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
        close.TextColor3 = Color3.fromRGB(255, 210, 80)

        TweenService:Create(
            close,
            TweenInfo.new(0.12),
            {BackgroundColor3 = Color3.fromRGB(80, 65, 35)}
        ):Play()

        task.delay(0.6, function()
            if not closing and tick() - lastCloseClick >= 0.6 then
                close.Text = "×"
                close.TextColor3 = Color3.fromRGB(255, 130, 140)

                TweenService:Create(
                    close,
                    TweenInfo.new(0.15),
                    {BackgroundColor3 = Color3.fromRGB(55, 35, 40)}
                ):Play()
            end
        end)
    end
end)

--// Dragging
local dragging = false
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        -- Don't start dragging when clicking buttons
        if input.Target == minimize or input.Target == close then
            return
        end

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

--// Opening animation
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(
    main,
    TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {
        Size = UDim2.new(0, 250, 0, 180),
        Position = UDim2.new(0.5, -125, 0.5, -90)
    }
):Play()
