local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 220, 0, 150)
main.Position = UDim2.new(0.5, -110, 0.5, -75)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Nightmare Egg"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Minimize button
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Position = UDim2.new(1, -55, 0, 2)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.Parent = titleBar

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -28, 0, 2)
close.BackgroundTransparency = 1
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.Parent = titleBar

-- Egg button
local eggButton = Instance.new("TextButton")
eggButton.Size = UDim2.new(0, 180, 0, 45)
eggButton.Position = UDim2.new(0.5, -90, 0, 40)
eggButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
eggButton.Text = "Egg: OFF"
eggButton.TextColor3 = Color3.fromRGB(255, 255, 255)
eggButton.TextSize = 15
eggButton.Font = Enum.Font.GothamBold
eggButton.Parent = main

local eggCorner = Instance.new("UICorner")
eggCorner.CornerRadius = UDim.new(0, 6)
eggCorner.Parent = eggButton

-- Chest button
local chestButton = Instance.new("TextButton")
chestButton.Size = UDim2.new(0, 180, 0, 45)
chestButton.Position = UDim2.new(0.5, -90, 0, 95)
chestButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
chestButton.Text = "Chest: OFF"
chestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
chestButton.TextSize = 15
chestButton.Font = Enum.Font.GothamBold
chestButton.Parent = main

local chestCorner = Instance.new("UICorner")
chestCorner.CornerRadius = UDim.new(0, 6)
chestCorner.Parent = chestButton

-- States
local eggEnabled = false
local chestEnabled = false
local minimized = false

-- Nightmare Egg loop
task.spawn(function()
    while gui.Parent do
        if eggEnabled then
            pcall(function()
                ReplicatedStorage.Functions.Hatch:InvokeServer(
                    "Nightmare Egg",
                    "Triple"
                )
            end)

            task.wait(0.1)
        else
            task.wait(0.1)
        end
    end
end)

-- Coin Chest loop
-- Claims immediately, then every 30 seconds
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

-- Egg toggle
eggButton.MouseButton1Click:Connect(function()
    eggEnabled = not eggEnabled

    if eggEnabled then
        eggButton.Text = "Egg: ON"
        eggButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        eggButton.Text = "Egg: OFF"
        eggButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

-- Chest toggle
chestButton.MouseButton1Click:Connect(function()
    chestEnabled = not chestEnabled

    if chestEnabled then
        chestButton.Text = "Chest: ON"
        chestButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        chestButton.Text = "Chest: OFF"
        chestButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

-- Minimize
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        main.Size = UDim2.new(0, 220, 0, 30)

        eggButton.Visible = false
        chestButton.Visible = false

        minimize.Text = "+"
    else
        main.Size = UDim2.new(0, 220, 0, 150)

        eggButton.Visible = true
        chestButton.Visible = true

        minimize.Text = "−"
    end
end)

-- Close
close.MouseButton1Click:Connect(function()
    eggEnabled = false
    chestEnabled = false
    gui:Destroy()
end)

-- Dragging
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
