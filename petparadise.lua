local Players = game:GetService("\080\108\097\121\101\114\115")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")
local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local TweenService = game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101")
local Workspace = game:GetService("\087\111\114\107\115\112\097\099\101")
local player = Players.LocalPlayer
local GUI_WIDTH = 215
local GUI_HEIGHT = 379
local XRAY_MESH_ID = "\114\098\120\097\115\115\101\116\105\100\058\047\047\049\048\052\054\054\048\051\049\052\057\054\050\048\054\048"
local XRAY_TRANSPARENCY = 0.95
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
local gui = Instance.new("\083\099\114\101\101\110\071\117\105")
gui.Name = "\069\103\103\071\085\073"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("\080\108\097\121\101\114\071\117\105")
local main = Instance.new("\070\114\097\109\101")
main.Name = "\077\097\105\110"
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
local mainCorner = Instance.new("\085\073\067\111\114\110\101\114")
mainCorner.CornerRadius = UDim.new(0, 13)
mainCorner.Parent = main
local mainStroke = Instance.new("\085\073\083\116\114\111\107\101")
mainStroke.Color = PURPLE
mainStroke.Thickness = 1
mainStroke.Transparency = 0.45
mainStroke.Parent = main
local glow = Instance.new("\073\109\097\103\101\076\097\098\101\108")
glow.Name = "\071\108\111\119"
glow.AnchorPoint = Vector2.new(0.5, 0.5)
glow.Position = UDim2.new(0.5, 0, 0.5, 2)
glow.Size = UDim2.new(1, 35, 1, 35)
glow.BackgroundTransparency = 1
glow.Image = "\114\098\120\097\115\115\101\116\105\100\058\047\047\054\048\049\052\050\054\049\057\057\051"
glow.ImageColor3 = PURPLE
glow.ImageTransparency = 0.82
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(49, 49, 450, 450)
glow.ZIndex = 0
glow.Parent = main
local titleBar = Instance.new("\070\114\097\109\101")
titleBar.Name = "\084\105\116\108\101\066\097\114"
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = PANEL
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 5
titleBar.Parent = main
local titleCorner = Instance.new("\085\073\067\111\114\110\101\114")
titleCorner.CornerRadius = UDim.new(0, 13)
titleCorner.Parent = titleBar
local titleBottom = Instance.new("\070\114\097\109\101")
titleBottom.Size = UDim2.new(1, 0, 0, 13)
titleBottom.Position = UDim2.new(0, 0, 1, -13)
titleBottom.BackgroundColor3 = PANEL
titleBottom.BorderSizePixel = 0
titleBottom.ZIndex = 5
titleBottom.Parent = titleBar
local accent = Instance.new("\070\114\097\109\101")
accent.Size = UDim2.new(0, 4, 0, 25)
accent.Position = UDim2.new(0, 12, 0.5, -12)
accent.BackgroundColor3 = PURPLE
accent.BorderSizePixel = 0
accent.ZIndex = 6
accent.Parent = titleBar
local accentCorner = Instance.new("\085\073\067\111\114\110\101\114")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent
local title = Instance.new("\084\101\120\116\076\097\098\101\108")
title.Size = UDim2.new(1, -95, 0, 22)
title.Position = UDim2.new(0, 23, 0, 6)
title.BackgroundTransparency = 1
title.Text = "\069\071\071\032\072\085\066"
title.TextColor3 = TEXT
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 6
title.Parent = titleBar
local subtitle = Instance.new("\084\101\120\116\076\097\098\101\108")
subtitle.Size = UDim2.new(1, -95, 0, 15)
subtitle.Position = UDim2.new(0, 23, 0, 27)
subtitle.BackgroundTransparency = 1
subtitle.Text = "\112\114\101\109\105\117\109\032\097\117\116\111\109\097\116\105\111\110"
subtitle.TextColor3 = SUBTEXT
subtitle.TextSize = 9
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.ZIndex = 6
subtitle.Parent = titleBar
local function makeWindowButton(text, position, normal, hover)
local button = Instance.new("\084\101\120\116\066\117\116\116\111\110")
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
local corner = Instance.new("\085\073\067\111\114\110\101\114")
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
"\226\136\146",
UDim2.new(1, -64, 0, 11),
Color3.fromRGB(31, 26, 42),
Color3.fromRGB(48, 38, 62)
)
local close = makeWindowButton(
"\195\151",
UDim2.new(1, -33, 0, 11),
Color3.fromRGB(48, 24, 35),
Color3.fromRGB(75, 30, 48)
)
close.TextColor3 = Color3.fromRGB(255, 105, 135)
local page = Instance.new("\070\114\097\109\101")
page.Name = "\080\097\103\101"
page.Size = UDim2.new(1, -20, 1, -57)
page.Position = UDim2.new(0, 10, 0, 51)
page.BackgroundTransparency = 1
page.ZIndex = 4
page.Parent = main
local layout = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116")
layout.Padding = UDim.new(0, 7)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = page
local padding = Instance.new("\085\073\080\097\100\100\105\110\103")
padding.PaddingTop = UDim.new(0, 4)
padding.PaddingBottom = UDim.new(0, 4)
padding.Parent = page
local function createButton(text, order)
local button = Instance.new("\084\101\120\116\066\117\116\116\111\110")
button.Name = text
button.Size = UDim2.new(1, 0, 0, 40)
button.BackgroundColor3 = BUTTON_OFF
button.Text = ""
button.BorderSizePixel = 0
button.AutoButtonColor = false
button.LayoutOrder = order
button.ZIndex = 5
button.Parent = page
local corner = Instance.new("\085\073\067\111\114\110\101\114")
corner.CornerRadius = UDim.new(0, 9)
corner.Parent = button
local stroke = Instance.new("\085\073\083\116\114\111\107\101")
stroke.Color = Color3.fromRGB(60, 50, 75)
stroke.Thickness = 1
stroke.Transparency = 0.35
stroke.Parent = button
local label = Instance.new("\084\101\120\116\076\097\098\101\108")
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
local toggle = Instance.new("\070\114\097\109\101")
toggle.Size = UDim2.new(0, 34, 0, 18)
toggle.Position = UDim2.new(1, -46, 0.5, -9)
toggle.BackgroundColor3 = Color3.fromRGB(47, 40, 56)
toggle.BorderSizePixel = 0
toggle.ZIndex = 6
toggle.Parent = button
local toggleCorner = Instance.new("\085\073\067\111\114\110\101\114")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggle
local knob = Instance.new("\070\114\097\109\101")
knob.Size = UDim2.new(0, 12, 0, 12)
knob.Position = UDim2.new(0, 3, 0.5, -6)
knob.BackgroundColor3 = Color3.fromRGB(150, 145, 160)
knob.BorderSizePixel = 0
knob.ZIndex = 7
knob.Parent = toggle
local knobCorner = Instance.new("\085\073\067\111\114\110\101\114")
knobCorner.CornerRadius = UDim.new(1, 0)
knobCorner.Parent = knob
local enabled = false
local function setEnabled(state)
enabled = state
button:SetAttribute("\069\110\097\098\108\101\100", state)
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
local neonButton, neonVisual =
createButton("\078\101\111\110\032\069\103\103", 1)
local hellButton, hellVisual =
createButton("\072\101\108\108\032\069\103\103", 2)
local chestButton, chestVisual =
createButton("\067\111\105\110\032\067\104\101\115\116", 3)
local merchantButton, merchantVisual =
createButton("\065\117\116\111\032\077\101\114\099\104\097\110\116", 4)
local rebirthButton, rebirthVisual =
createButton("\065\117\116\111\032\082\101\098\105\114\116\104", 5)
local xrayButton, xrayVisual =
createButton("\079\114\101\032\088\045\082\097\121", 6)
local cameraButton, cameraVisual =
createButton("\085\110\108\111\099\107\032\067\097\109\101\114\097", 7)
local neonEnabled = false
local hellEnabled = false
local chestEnabled = false
local merchantEnabled = false
local rebirthEnabled = false
local xrayEnabled = false
local cameraUnlocked = false
local minimized = false
local merchantItems = {
"\067\111\105\110\049",
"\076\117\099\107\049",
"\083\112\101\101\100\049",
"\067\111\105\110\050",
"\076\117\099\107\050",
"\083\112\101\101\100\050",
"\067\111\105\110\051",
"\076\117\099\107\051",
"\083\112\101\101\100\051",
"\077\101\103\097\049",
"\104\117\103\101\069\103\103\051",
"\086\097\108\107"
}
task.spawn(function()
while gui.Parent do
if neonEnabled then
pcall(function()
local args = {
[1] = "\078\101\111\110\032\069\103\103",
[2] = "\084\114\105\112\108\101"
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
task.spawn(function()
while gui.Parent do
if hellEnabled then
pcall(function()
local args = {
[1] = "\072\101\108\108\032\069\103\103",
[2] = "\084\114\105\112\108\101"
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
task.spawn(function()
while gui.Parent do
if chestEnabled then
pcall(function()
ReplicatedStorage.Functions.CollectChest:InvokeServer(
"\067\111\105\110\067\104\101\115\116"
)
end)
task.wait(30)
else
task.wait(0.1)
end
end
end)
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
local savedCameraMinZoom = player.CameraMinZoomDistance
local savedCameraMaxZoom = player.CameraMaxZoomDistance
local savedCameraMode = player.CameraMode
local function setCameraUnlocked(state)
cameraUnlocked = state
if state then
player.CameraMode = Enum.CameraMode.Classic
player.CameraMinZoomDistance = 0.5
player.CameraMaxZoomDistance = 10000
else
player.CameraMode = savedCameraMode
player.CameraMinZoomDistance = savedCameraMinZoom
player.CameraMaxZoomDistance = savedCameraMaxZoom
end
end
local function normalizeMeshId(meshId)
return tostring(meshId)
:gsub("\114\098\120\097\115\115\101\116\105\100\058\047\047", "")
:gsub("\104\116\116\112\058\047\047\119\119\119\046\114\111\098\108\111\120\046\099\111\109\047\097\115\115\101\116\047\037\063\105\100\061", "")
:gsub("\104\116\116\112\115\058\047\047\119\119\119\046\114\111\098\108\111\120\046\099\111\109\047\097\115\115\101\116\047\037\063\105\100\061", "")
end
local XRAY_TARGET_ID = normalizeMeshId(XRAY_MESH_ID)
local function isXrayBlock(obj)
if not obj:IsA("\077\101\115\104\080\097\114\116") then
return false
end
return normalizeMeshId(obj.MeshId) == XRAY_TARGET_ID
end
local function updateXrayPart(obj)
if not isXrayBlock(obj) then
return
end
if xrayEnabled then
obj.LocalTransparencyModifier = XRAY_TRANSPARENCY
else
obj.LocalTransparencyModifier = 0
end
end
local function updateAllXrayBlocks()
for _, obj in ipairs(Workspace:GetDescendants()) do
updateXrayPart(obj)
end
end
local function setXrayEnabled(state)
xrayEnabled = state
updateAllXrayBlocks()
end
Workspace.DescendantAdded:Connect(function(obj)
if xrayEnabled and obj:IsA("\077\101\115\104\080\097\114\116") then
task.defer(function()
if obj.Parent then
updateXrayPart(obj)
end
end)
end
end)
local function updateButton(button, visual, enabled)
button:SetAttribute("\069\110\097\098\108\101\100", enabled)
visual(enabled)
end
neonButton.MouseButton1Click:Connect(function()
neonEnabled = not neonEnabled
updateButton(
neonButton,
neonVisual,
neonEnabled
)
end)
hellButton.MouseButton1Click:Connect(function()
hellEnabled = not hellEnabled
updateButton(
hellButton,
hellVisual,
hellEnabled
)
end)
chestButton.MouseButton1Click:Connect(function()
chestEnabled = not chestEnabled
updateButton(
chestButton,
chestVisual,
chestEnabled
)
end)
merchantButton.MouseButton1Click:Connect(function()
merchantEnabled = not merchantEnabled
updateButton(
merchantButton,
merchantVisual,
merchantEnabled
)
end)
rebirthButton.MouseButton1Click:Connect(function()
rebirthEnabled = not rebirthEnabled
updateButton(
rebirthButton,
rebirthVisual,
rebirthEnabled
)
end)
xrayButton.MouseButton1Click:Connect(function()
setXrayEnabled(not xrayEnabled)
updateButton(
xrayButton,
xrayVisual,
xrayEnabled
)
end)
cameraButton.MouseButton1Click:Connect(function()
setCameraUnlocked(not cameraUnlocked)
updateButton(
cameraButton,
cameraVisual,
cameraUnlocked
)
end)
local confirmOverlay = Instance.new("\070\114\097\109\101")
confirmOverlay.Name = "\067\111\110\102\105\114\109\079\118\101\114\108\097\121"
confirmOverlay.Size = UDim2.new(1, 0, 1, 0)
confirmOverlay.BackgroundColor3 = Color3.fromRGB(5, 4, 8)
confirmOverlay.BackgroundTransparency = 0.15
confirmOverlay.Visible = false
confirmOverlay.ZIndex = 20
confirmOverlay.Parent = main
local overlayCorner = Instance.new("\085\073\067\111\114\110\101\114")
overlayCorner.CornerRadius = UDim.new(0, 13)
overlayCorner.Parent = confirmOverlay
local confirmBox = Instance.new("\070\114\097\109\101")
confirmBox.Size = UDim2.new(0, 175, 0, 108)
confirmBox.Position = UDim2.new(0.5, -87, 0.5, -54)
confirmBox.BackgroundColor3 = Color3.fromRGB(24, 19, 33)
confirmBox.BorderSizePixel = 0
confirmBox.ZIndex = 21
confirmBox.Parent = confirmOverlay
local confirmCorner = Instance.new("\085\073\067\111\114\110\101\114")
confirmCorner.CornerRadius = UDim.new(0, 11)
confirmCorner.Parent = confirmBox
local confirmStroke = Instance.new("\085\073\083\116\114\111\107\101")
confirmStroke.Color = PURPLE
confirmStroke.Thickness = 1
confirmStroke.Transparency = 0.25
confirmStroke.Parent = confirmBox
local confirmTitle = Instance.new("\084\101\120\116\076\097\098\101\108")
confirmTitle.Size = UDim2.new(1, 0, 0, 25)
confirmTitle.Position = UDim2.new(0, 0, 0, 10)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "\067\108\111\115\101\032\071\085\073\063"
confirmTitle.TextColor3 = TEXT
confirmTitle.TextSize = 14
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.ZIndex = 22
confirmTitle.Parent = confirmBox
local confirmText = Instance.new("\084\101\120\116\076\097\098\101\108")
confirmText.Size = UDim2.new(1, -20, 0, 20)
confirmText.Position = UDim2.new(0, 10, 0, 34)
confirmText.BackgroundTransparency = 1
confirmText.Text = "\065\114\101\032\121\111\117\032\115\117\114\101\032\121\111\117\032\119\097\110\116\032\116\111\032\099\108\111\115\101\063"
confirmText.TextColor3 = SUBTEXT
confirmText.TextSize = 9
confirmText.Font = Enum.Font.Gotham
confirmText.ZIndex = 22
confirmText.Parent = confirmBox
local yesButton = Instance.new("\084\101\120\116\066\117\116\116\111\110")
yesButton.Size = UDim2.new(0, 65, 0, 27)
yesButton.Position = UDim2.new(0, 18, 1, -38)
yesButton.BackgroundColor3 = PURPLE
yesButton.Text = "\089\069\083"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.TextSize = 10
yesButton.Font = Enum.Font.GothamBold
yesButton.BorderSizePixel = 0
yesButton.AutoButtonColor = false
yesButton.ZIndex = 22
yesButton.Parent = confirmBox
local yesCorner = Instance.new("\085\073\067\111\114\110\101\114")
yesCorner.CornerRadius = UDim.new(0, 7)
yesCorner.Parent = yesButton
local noButton = Instance.new("\084\101\120\116\066\117\116\116\111\110")
noButton.Size = UDim2.new(0, 65, 0, 27)
noButton.Position = UDim2.new(1, -83, 1, -38)
noButton.BackgroundColor3 = Color3.fromRGB(48, 42, 57)
noButton.Text = "\078\079"
noButton.TextColor3 = TEXT
noButton.TextSize = 10
noButton.Font = Enum.Font.GothamBold
noButton.BorderSizePixel = 0
noButton.AutoButtonColor = false
noButton.ZIndex = 22
noButton.Parent = confirmBox
local noCorner = Instance.new("\085\073\067\111\114\110\101\114")
noCorner.CornerRadius = UDim.new(0, 7)
noCorner.Parent = noButton
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
yesButton.MouseButton1Click:Connect(function()
neonEnabled = false
hellEnabled = false
chestEnabled = false
merchantEnabled = false
rebirthEnabled = false
if xrayEnabled then
setXrayEnabled(false)
end
if cameraUnlocked then
setCameraUnlocked(false)
end
gui:Destroy()
end)
noButton.MouseButton1Click:Connect(function()
confirming = false
confirmOverlay.Visible = false
end)
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
minimize.Text = "\043"
else
page.Visible = true
TweenService:Create(
main,
TweenInfo.new(0.2, Enum.EasingStyle.Quad),
{
Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
}
):Play()
minimize.Text = "\226\136\146"
end
end)
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
