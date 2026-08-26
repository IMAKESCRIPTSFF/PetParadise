local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "EggGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 220, 0, 315)
main.Position = UDim2.new(0.5, -110, 0.5, -157)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

--------------------------------------------------
-- TITLE BAR
--------------------------------------------------

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Egg GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

--------------------------------------------------
-- MINIMIZE BUTTON
--------------------------------------------------

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Position = UDim2.new(1, -55, 0, 2)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.Parent = titleBar

--------------------------------------------------
-- CLOSE BUTTON
--------------------------------------------------

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -28, 0, 2)
close.BackgroundTransparency = 1
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.Parent = titleBar

--------------------------------------------------
-- MAIN PAGE
--------------------------------------------------

local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, 0, 1, -30)
page1.Position = UDim2.new(0, 0, 0, 30)
page1.BackgroundTransparency = 1
page1.Parent = main

--------------------------------------------------
-- BUTTON CREATOR
--------------------------------------------------

local function createButton(parent, text, y, textSize)
    local button = Instance.new("TextButton")

    button.Size = UDim2.new(0, 180, 0, 40)
    button.Position = UDim2.new(0.5, -90, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = textSize or 14
    button.Font = Enum.Font.GothamBold
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Parent = parent

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button

    return button
end

--------------------------------------------------
-- BUTTONS
--------------------------------------------------

local neonButton = createButton(
    page1,
    "Neon Egg: OFF",
    10,
    14
)

local hellButton = createButton(
    page1,
    "Hell Egg: OFF",
    58,
    14
)

local chestButton = createButton(
    page1,
    "Chest: OFF",
    106,
    14
)

local merchantButton = createButton(
    page1,
    "Auto Buy Merchant: OFF",
    154,
    12
)

local rebirthButton = createButton(
    page1,
    "Auto Rebirth: OFF",
    202,
    14
)

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
    "hugeEgg3"
}

--------------------------------------------------
-- NEON EGG LOOP
--------------------------------------------------

task.spawn(function()
    while gui.Parent do
        if neonEnabled then
            pcall(function()
                local args = {
                    [1] = "Neon Egg",
                    [2] = "Triple"
                }

                ReplicatedStorage.Functions.Hatch:InvokeServer(unpack(args))
            end)

            task.wait(0.1)
        else
            task.wait(0.1)
        end
    end
end)

--------------------------------------------------
-- HELL EGG LOOP
--------------------------------------------------

task.spawn(function()
    while gui.Parent do
        if hellEnabled then
            pcall(function()
                local args = {
                    [1] = "Hell Egg",
                    [2] = "Triple"
                }

                ReplicatedStorage.Functions.Hatch:InvokeServer(unpack(args))
            end)

            task.wait(0.1)
        else
            task.wait(0.1)
        end
    end
end)

--------------------------------------------------
-- COIN CHEST LOOP
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
-- MERCHANT LOOP
-- Attempts each item one by one every second
--------------------------------------------------

task.spawn(function()
    while gui.Parent do
        if merchantEnabled then
            for _, itemName in ipairs(merchantItems) do
                if not merchantEnabled or not gui.Parent then
                    break
                end

                pcall(function()
                    ReplicatedStorage.MerchantPurchase:FireServer(itemName)
                end)

                task.wait(1)
            end
        else
            task.wait(0.1)
        end
    end
end)

--------------------------------------------------
-- REBIRTH LOOP
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
-- NEON EGG TOGGLE
--------------------------------------------------

neonButton.MouseButton1Click:Connect(function()
    neonEnabled = not neonEnabled

    if neonEnabled then
        neonButton.Text = "Neon Egg: ON"
        neonButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        neonButton.Text = "Neon Egg: OFF"
        neonButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

--------------------------------------------------
-- HELL EGG TOGGLE
--------------------------------------------------

hellButton.MouseButton1Click:Connect(function()
    hellEnabled = not hellEnabled

    if hellEnabled then
        hellButton.Text = "Hell Egg: ON"
        hellButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        hellButton.Text = "Hell Egg: OFF"
        hellButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

--------------------------------------------------
-- CHEST TOGGLE
--------------------------------------------------

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

--------------------------------------------------
-- MERCHANT TOGGLE
--------------------------------------------------

merchantButton.MouseButton1Click:Connect(function()
    merchantEnabled = not merchantEnabled

    if merchantEnabled then
        merchantButton.Text = "Auto Buy Merchant: ON"
        merchantButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        merchantButton.Text = "Auto Buy Merchant: OFF"
        merchantButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

--------------------------------------------------
-- REBIRTH TOGGLE
--------------------------------------------------

rebirthButton.MouseButton1Click:Connect(function()
    rebirthEnabled = not rebirthEnabled

    if rebirthEnabled then
        rebirthButton.Text = "Auto Rebirth: ON"
        rebirthButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        rebirthButton.Text = "Auto Rebirth: OFF"
        rebirthButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end
end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        main.Size = UDim2.new(0, 220, 0, 30)
        page1.Visible = false
        minimize.Text = "+"
    else
        main.Size = UDim2.new(0, 220, 0, 315)
        page1.Visible = true
        minimize.Text = "−"
    end
end)

--------------------------------------------------
-- CLOSE
--------------------------------------------------

close.MouseButton1Click:Connect(function()
    neonEnabled = false
    hellEnabled = false
    chestEnabled = false
    merchantEnabled = false
    rebirthEnabled = false

    gui:Destroy()
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
