local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NightmareEggGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 220, 0, 100)
main.Position = UDim2.new(0.5, -110, 0.5, -50)
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

-- Minimize
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Position = UDim2.new(1, -55, 0, 2)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.Parent = titleBar

-- Close
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -28, 0, 2)
close.BackgroundTransparency = 1
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.Parent = titleBar

-- ON/OFF button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 180, 0, 45)
toggle.Position = UDim2.new(0.5, -90, 0, 45)
toggle.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
toggle.Text = "OFF"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.TextSize = 16
toggle.Font = Enum.Font.GothamBold
toggle.Parent = main

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggle

-- State
local enabled = false
local minimized = false

-- Hatch loop
task.spawn(function()
    while gui.Parent do
        if enabled then
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

-- Toggle
toggle.MouseButton1Click:Connect(function()
    enabled = not enabled

    if enabled then
        toggle.Text = "ON"
        toggle.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        toggle.Text = "OFF"
        toggle.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

-- Minimize
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        main.Size = UDim2.new(0, 220, 0, 30)
        toggle.Visible = false
        minimize.Text = "+"
    else
        main.Size = UDim2.new(0, 220, 0, 100)
        toggle.Visible = true
        minimize.Text = "−"
    end
end)

-- Close
close.MouseButton1Click:Connect(function()
    enabled = false
    gui:Destroy()
end)

-- Dragging
local UserInputService = game:GetService("UserInputService")

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
