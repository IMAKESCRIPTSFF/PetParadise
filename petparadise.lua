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
main.Size = UDim2.new(0, 220, 0, 315)
main.Position = UDim2.new(0.5, -110, 0.5, -157)
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
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Nightmare Egg"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Page 1 button
local page1Button = Instance.new("TextButton")
page1Button.Size = UDim2.new(0, 22, 0, 25)
page1Button.Position = UDim2.new(1, -112, 0, 2)
page1Button.BackgroundTransparency = 1
page1Button.Text = "1"
page1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
page1Button.TextSize = 14
page1Button.Font = Enum.Font.GothamBold
page1Button.Parent = titleBar

-- Page 2 button
local page2Button = Instance.new("TextButton")
page2Button.Size = UDim2.new(0, 22, 0, 25)
page2Button.Position = UDim2.new(1, -88, 0, 2)
page2Button.BackgroundTransparency = 1
page2Button.Text = "2"
page2Button.TextColor3 = Color3.fromRGB(170, 170, 170)
page2Button.TextSize = 14
page2Button.Font = Enum.Font.GothamBold
page2Button.Parent = titleBar

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

-- Pages
local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, 0, 1, -30)
page1.Position = UDim2.new(0, 0, 0, 30)
page1.BackgroundTransparency = 1
page1.Parent = main

local autoPath = Instance.new("Frame")
autoPath.Size = UDim2.new(1, 0, 1, -30)
autoPath.Position = UDim2.new(0, 0, 0, 30)
autoPath.BackgroundTransparency = 1
autoPath.Visible = false
autoPath.Parent = main

-- Button creator
local function createButton(parent, text, y, textSize)
    local button = Instance.new("TextButton")

    button.Size = UDim2.new(0, 180, 0, 45)
    button.Position = UDim2.new(0.5, -90, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = textSize or 14
    button.Font = Enum.Font.GothamBold
    button.BorderSizePixel = 0
    button.Parent = parent

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button

    return button
end

--------------------------------------------------
-- PAGE 1
--------------------------------------------------

local eggButton = createButton(page1, "Egg: OFF", 10, 15)

local chestButton = createButton(page1, "Chest: OFF", 65, 15)

local merchantButton = createButton(
    page1,
    "Auto Buy Merchant: OFF",
    120,
    13
)

local rebirthButton = createButton(
    page1,
    "Auto Rebirth: OFF",
    175,
    14
)

--------------------------------------------------
-- AUTOPATH PAGE
--------------------------------------------------

local autoPathTitle = Instance.new("TextLabel")
autoPathTitle.Size = UDim2.new(1, 0, 0, 25)
autoPathTitle.Position = UDim2.new(0, 0, 0, 5)
autoPathTitle.BackgroundTransparency = 1
autoPathTitle.Text = "autoPath"
autoPathTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoPathTitle.TextSize = 16
autoPathTitle.Font = Enum.Font.GothamBold
autoPathTitle.Parent = autoPath

local legendaryButton = createButton(
    autoPath,
    "Legendary: OFF",
    35,
    14
)

local mythicButton = createButton(
    autoPath,
    "Mythic: OFF",
    90,
    14
)

local divineButton = createButton(
    autoPath,
    "Divine: OFF",
    145,
    14
)

local luckyBlockButton = createButton(
    autoPath,
    "LuckyBlock: OFF",
    200,
    14
)

local exclusiveButton = createButton(
    autoPath,
    "Exclusive: OFF",
    255,
    14
)

--------------------------------------------------
-- STATES
--------------------------------------------------

local eggEnabled = false
local chestEnabled = false
local merchantEnabled = false
local rebirthEnabled = false

local legendaryEnabled = false
local mythicEnabled = false
local divineEnabled = false
local luckyBlockEnabled = false
local exclusiveEnabled = false

local minimized = false
local currentPage = 1

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
-- NIGHTMARE EGG LOOP
--------------------------------------------------

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
-- Each item is attempted once every 1 second,
-- one after another.
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

                -- Wait 1 second before attempting
                -- the next merchant item.
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
-- AUTOPATH FUNCTION
--------------------------------------------------

local function changeAutoBuy(rarity, enabled)
    pcall(function()
        ReplicatedStorage.Events.ChangeAutoBuy:FireServer(
            rarity,
            enabled
        )
    end)
end

--------------------------------------------------
-- EGG TOGGLE
--------------------------------------------------

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
-- LEGENDARY
--------------------------------------------------

legendaryButton.MouseButton1Click:Connect(function()

    legendaryEnabled = not legendaryEnabled

    changeAutoBuy(
        "Legendary",
        legendaryEnabled
    )

    if legendaryEnabled then
        legendaryButton.Text = "Legendary: ON"
        legendaryButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        legendaryButton.Text = "Legendary: OFF"
        legendaryButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end

end)

--------------------------------------------------
-- MYTHIC
--------------------------------------------------

mythicButton.MouseButton1Click:Connect(function()

    mythicEnabled = not mythicEnabled

    changeAutoBuy(
        "Mythic",
        mythicEnabled
    )

    if mythicEnabled then
        mythicButton.Text = "Mythic: ON"
        mythicButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        mythicButton.Text = "Mythic: OFF"
        mythicButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end

end)

--------------------------------------------------
-- DIVINE
--------------------------------------------------

divineButton.MouseButton1Click:Connect(function()

    divineEnabled = not divineEnabled

    changeAutoBuy(
        "Divine",
        divineEnabled
    )

    if divineEnabled then
        divineButton.Text = "Divine: ON"
        divineButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        divineButton.Text = "Divine: OFF"
        divineButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end

end)

--------------------------------------------------
-- LUCKY BLOCK
--------------------------------------------------

luckyBlockButton.MouseButton1Click:Connect(function()

    luckyBlockEnabled = not luckyBlockEnabled

    changeAutoBuy(
        "LuckyBlock",
        luckyBlockEnabled
    )

    if luckyBlockEnabled then
        luckyBlockButton.Text = "LuckyBlock: ON"
        luckyBlockButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        luckyBlockButton.Text = "LuckyBlock: OFF"
        luckyBlockButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end

end)

--------------------------------------------------
-- EXCLUSIVE
--------------------------------------------------

exclusiveButton.MouseButton1Click:Connect(function()

    exclusiveEnabled = not exclusiveEnabled

    changeAutoBuy(
        "Exclusive",
        exclusiveEnabled
    )

    if exclusiveEnabled then
        exclusiveButton.Text = "Exclusive: ON"
        exclusiveButton.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
    else
        exclusiveButton.Text = "Exclusive: OFF"
        exclusiveButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
    end

end)

--------------------------------------------------
-- PAGE SWITCHING
--------------------------------------------------

page1Button.MouseButton1Click:Connect(function()

    if minimized then
        return
    end

    currentPage = 1

    page1.Visible = true
    autoPath.Visible = false

    title.Text = "Nightmare Egg"

    page1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    page2Button.TextColor3 = Color3.fromRGB(170, 170, 170)

end)

page2Button.MouseButton1Click:Connect(function()

    if minimized then
        return
    end

    currentPage = 2

    page1.Visible = false
    autoPath.Visible = true

    title.Text = "autoPath"

    page1Button.TextColor3 = Color3.fromRGB(170, 170, 170)
    page2Button.TextColor3 = Color3.fromRGB(255, 255, 255)

end)

--------------------------------------------------
-- MINIMIZE
--------------------------------------------------

minimize.MouseButton1Click:Connect(function()

    minimized = not minimized

    if minimized then

        main.Size = UDim2.new(0, 220, 0, 30)

        page1.Visible = false
        autoPath.Visible = false

        minimize.Text = "+"

    else

        main.Size = UDim2.new(0, 220, 0, 315)

        if currentPage == 1 then
            page1.Visible = true
            autoPath.Visible = false
        else
            page1.Visible = false
            autoPath.Visible = true
        end

        minimize.Text = "−"

    end

end)

--------------------------------------------------
-- CLOSE
--------------------------------------------------

close.MouseButton1Click:Connect(function()

    eggEnabled = false
    chestEnabled = false
    merchantEnabled = false
    rebirthEnabled = false

    -- Turn AutoPath options OFF
    changeAutoBuy("Legendary", false)
    changeAutoBuy("Mythic", false)
    changeAutoBuy("Divine", false)
    changeAutoBuy("LuckyBlock", false)
    changeAutoBuy("Exclusive", false)

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
