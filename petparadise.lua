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

local COLORS = {
    Background = Color3.fromRGB(20, 20, 25),
    Header = Color3.fromRGB(27, 27, 33),

    ButtonOff = Color3.fromRGB(31, 31, 38),
    ButtonOffHover = Color3.fromRGB(40, 40, 48),

    ButtonOn = Color3.fromRGB(45, 190, 85),
    ButtonOnHover = Color3.fromRGB(55, 210, 95),

    Text = Color3.fromRGB(240, 240, 245),
    Muted = Color3.fromRGB(155, 155, 165),

    Border = Color3.fromRGB(65, 65, 75),

    Purple = Color3.fromRGB(145, 85, 255),

    Red = Color3.fromRGB(225, 70, 80)
}

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

--==================================================
-- MAIN
--==================================================

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(270, 190)
main.Position = UDim2.new(0.5, -135, 0.5, -95)
main.BackgroundColor3 = COLORS.Background
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 13)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Border
mainStroke.Thickness = 1
mainStroke.Transparency = 0.2
mainStroke.Parent = main

--==================================================
-- HEADER
--==================================================

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = COLORS.Header
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 13)
headerCorner.Parent = header

-- Fills the lower corners of header
local headerFill = Instance.new("Frame")
headerFill.Size = UDim2.new(1, 0, 0, 15)
headerFill.Position = UDim2.new(0, 0, 1, -15)
headerFill.BackgroundColor3 = COLORS.Header
headerFill.BorderSizePixel = 0
headerFill.Parent = header

--==================================================
-- DRAG BUTTON
--==================================================

local dragButton = Instance.new("TextButton")
dragButton.Name = "DragButton"
dragButton.Size = UDim2.new(1, -70, 1, 0)
dragButton.Position = UDim2.fromOffset(0, 0)
dragButton.BackgroundTransparency = 1
dragButton.BorderSizePixel = 0
dragButton.Text = ""
dragButton.AutoButtonColor = false
dragButton.Active = true
dragButton.ZIndex = 20
dragButton.Parent = header

--==================================================
-- TITLE
--==================================================

local accent = Instance.new("Frame")
accent.Size = UDim2.fromOffset(3, 19)
accent.Position = UDim2.fromOffset(7, 13)
accent.BackgroundColor3 = COLORS.Purple
accent.BorderSizePixel = 0
accent.ZIndex = 21
accent.Parent = dragButton

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -25, 1, 0)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "Nightmare Egg"
title.TextColor3 = COLORS.Text
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 21
title.Active = false
title.Parent = dragButton

--==================================================
-- MINIMIZE
--==================================================

local minimize = Instance.new("TextButton")
minimize.Name = "Minimize"
minimize.Size = UDim2.fromOffset(30, 30)
minimize.Position = UDim2.new(1, -68, 0, 8)
minimize.BackgroundTransparency = 1
minimize.BorderSizePixel = 0
minimize.Text = "−"
minimize.TextColor3 = COLORS.Muted
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.AutoButtonColor = false
minimize.ZIndex = 100
minimize.Parent = header

--==================================================
-- CLOSE
--==================================================

local close = Instance.new("TextButton")
close.Name = "Close"
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -35, 0, 8)
close.BackgroundTransparency = 1
close.BorderSizePixel = 0
close.Text = "×"
close.TextColor3 = COLORS.Muted
close.TextSize = 21
close.Font = Enum.Font.GothamBold
close.AutoButtonColor = false
close.ZIndex = 100
close.Parent = header

--==================================================
-- CONTENT
--==================================================

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -24, 1, -57)
content.Position = UDim2.fromOffset(12, 52)
content.BackgroundTransparency = 1
content.Parent = main

--==================================================
-- CREATE BUTTON
--==================================================

local function createToggle(text, y)

    local button = Instance.new("TextButton")

    button.Size = UDim2.new(1, 0, 0, 52)
    button.Position = UDim2.fromOffset(0, y)

    button.BackgroundColor3 = COLORS.ButtonOff
    button.BorderSizePixel = 0

    button.Text = text
    button.TextColor3 = COLORS.Text
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold

    button.AutoButtonColor = false
    button.Active = true

    button.Parent = content

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORS.Border
    stroke.Thickness = 1
    stroke.Transparency = 0.4
    stroke.Parent = button

    return button
end

local eggButton = createToggle("Egg: OFF", 0)
local chestButton = createToggle("Chest: OFF", 62)

--==================================================
-- STATES
--==================================================

local eggEnabled = false
local chestEnabled = false
local minimized = false

local lastCloseClick = 0
local closing = false

--==================================================
-- BUTTON STATE
--==================================================

local function updateButton(button, enabled, name)

    if enabled then

        button.Text = name .. ": ON"

        TweenService:Create(
            button,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 = COLORS.ButtonOn,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        ):Play()

    else

        button.Text = name .. ": OFF"

        TweenService:Create(
            button,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 = COLORS.ButtonOff,
                TextColor3 = COLORS.Text
            }
        ):Play()

    end
end

--==================================================
-- EGG HOVER
--==================================================

eggButton.MouseEnter:Connect(function()

    TweenService:Create(
        eggButton,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 =
                eggEnabled
                and COLORS.ButtonOnHover
                or COLORS.ButtonOffHover
        }
    ):Play()

end)

eggButton.MouseLeave:Connect(function()

    TweenService:Create(
        eggButton,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 =
                eggEnabled
                and COLORS.ButtonOn
                or COLORS.ButtonOff
        }
    ):Play()

end)

--==================================================
-- CHEST HOVER
--==================================================

chestButton.MouseEnter:Connect(function()

    TweenService:Create(
        chestButton,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 =
                chestEnabled
                and COLORS.ButtonOnHover
                or COLORS.ButtonOffHover
        }
    ):Play()

end)

chestButton.MouseLeave:Connect(function()

    TweenService:Create(
        chestButton,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 =
                chestEnabled
                and COLORS.ButtonOn
                or COLORS.ButtonOff
        }
    ):Play()

end)

--==================================================
-- EGG TOGGLE
--==================================================

eggButton.MouseButton1Click:Connect(function()

    eggEnabled = not eggEnabled

    updateButton(
        eggButton,
        eggEnabled,
        "Egg"
    )

end)

--==================================================
-- CHEST TOGGLE
--==================================================

chestButton.MouseButton1Click:Connect(function()

    chestEnabled = not chestEnabled

    updateButton(
        chestButton,
        chestEnabled,
        "Chest"
    )

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
            TextColor3 = COLORS.Text
        }
    ):Play()

end)

minimize.MouseLeave:Connect(function()

    TweenService:Create(
        minimize,
        TweenInfo.new(0.12),
        {
            TextColor3 = COLORS.Muted
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
            TextColor3 = COLORS.Red
        }
    ):Play()

end)

close.MouseLeave:Connect(function()

    TweenService:Create(
        close,
        TweenInfo.new(0.12),
        {
            TextColor3 = COLORS.Muted
        }
    ):Play()

end)

close.MouseButton1Click:Connect(function()

    local now = tick()

    if now - lastCloseClick <= 0.6 then

        closing = true

        TweenService:Create(
            main,
            TweenInfo.new(
                0.25,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.In
            ),
            {
                Size = UDim2.fromOffset(0, 0),
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
                close.TextColor3 = COLORS.Muted

            end

        end)

    end

end)

--==================================================
-- DRAGGING
-- MB1 DOWN
--==================================================

local dragging = false
local dragStart = nil
local startPosition = nil

dragButton.MouseButton1Down:Connect(function(x, y)

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

--==================================================
-- OPEN ANIMATION
--==================================================

main.Size = UDim2.fromOffset(0, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(
    main,
    TweenInfo.new(
        0.4,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = UDim2.fromOffset(270, 190),
        Position = UDim2.new(0.5, -135, 0.5, -95)
    }
):Play()
