local _p=(function() return function() local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local _a = Players.LocalPlayer
local _b = 215
local _c = 285
local _d = Color3.fromRGB(12, 10, 18)
local _e = Color3.fromRGB(19, 16, 28)
local _f = Color3.fromRGB(28, 23, 39)
local _g = Color3.fromRGB(38, 29, 54)
local _h = Color3.fromRGB(180, 55, 255)
local _i = Color3.fromRGB(215, 105, 255)
local _j = Color3.fromRGB(245, 242, 255)
local _k = Color3.fromRGB(145, 138, 160)
local _l = Color3.fromRGB(65, 230, 130)
local _m = Color3.fromRGB(255, 75, 105)
local _n = Instance.new("ScreenGui")
_n.Name = "EggGUI"
_n.ResetOnSpawn = false
_n.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_n.Parent = _a:WaitForChild("PlayerGui")
local _o = Instance.new("Frame")
_o.Name = "Main"
_o.Size = UDim2.new(0, _b, 0, _c)
_o.Position = UDim2.new(
	0.5,
	-(_b / 2),
	0.5,
	-(_c / 2)
)
_o.BackgroundColor3 = _d
_o.BorderSizePixel = 0
_o.ClipsDescendants = false
_o.Parent = _n
local _p = Instance.new("UICorner")
_p.CornerRadius = UDim.new(0, 13)
_p.Parent = _o
local _q = Instance.new("UIStroke")
_q.Color = _h
_q.Thickness = 1
_q.Transparency = 0.45
_q.Parent = _o
local _r = Instance.new("ImageLabel")
_r.Name = "Glow"
_r.AnchorPoint = Vector2.new(0.5, 0.5)
_r.Position = UDim2.new(0.5, 0, 0.5, 2)
_r.Size = UDim2.new(1, 35, 1, 35)
_r.BackgroundTransparency = 1
_r.Image = "rbxassetid://6014261993"
_r.ImageColor3 = _h
_r.ImageTransparency = 0.82
_r.ScaleType = Enum.ScaleType.Slice
_r.SliceCenter = Rect.new(49, 49, 450, 450)
_r.ZIndex = 0
_r.Parent = _o
local _s = Instance.new("Frame")
_s.Name = "TitleBar"
_s.Size = UDim2.new(1, 0, 0, 48)
_s.BackgroundColor3 = _e
_s.BorderSizePixel = 0
_s.ZIndex = 5
_s.Parent = _o
local _t = Instance.new("UICorner")
_t.CornerRadius = UDim.new(0, 13)
_t.Parent = _s
local _u = Instance.new("Frame")
_u.Size = UDim2.new(1, 0, 0, 13)
_u.Position = UDim2.new(0, 0, 1, -13)
_u.BackgroundColor3 = _e
_u.BorderSizePixel = 0
_u.ZIndex = 5
_u.Parent = _s
local _v = Instance.new("Frame")
_v.Size = UDim2.new(0, 4, 0, 25)
_v.Position = UDim2.new(0, 12, 0.5, -12)
_v.BackgroundColor3 = _h
_v.BorderSizePixel = 0
_v.ZIndex = 6
_v.Parent = _s
local _w = Instance.new("UICorner")
_w.CornerRadius = UDim.new(1, 0)
_w.Parent = _v
local _x = Instance.new("TextLabel")
_x.Size = UDim2.new(1, -95, 0, 22)
_x.Position = UDim2.new(0, 23, 0, 6)
_x.BackgroundTransparency = 1
_x.Text = "EGG HUB"
_x.TextColor3 = _j
_x.TextSize = 15
_x.Font = Enum.Font.GothamBold
_x.TextXAlignment = Enum.TextXAlignment.Left
_x.ZIndex = 6
_x.Parent = _s
local _y = Instance.new("TextLabel")
_y.Size = UDim2.new(1, -95, 0, 15)
_y.Position = UDim2.new(0, 23, 0, 27)
_y.BackgroundTransparency = 1
_y.Text = "premium automation"
_y.TextColor3 = _k
_y.TextSize = 9
_y.Font = Enum.Font.Gotham
_y.TextXAlignment = Enum.TextXAlignment.Left
_y.ZIndex = 6
_y.Parent = _s
local function makeWindowButton(text, position, normal, hover)
	local _z = Instance.new("TextButton")
	_z.Size = UDim2.new(0, 27, 0, 25)
	_z.Position = position
	_z.BackgroundColor3 = normal
	_z.Text = text
	_z.TextColor3 = _j
	_z.TextSize = 16
	_z.Font = Enum.Font.GothamBold
	_z.BorderSizePixel = 0
	_z.AutoButtonColor = false
	_z.ZIndex = 7
	_z.Parent = _s
	local _aa = Instance.new("UICorner")
	_aa.CornerRadius = UDim.new(0, 7)
	_aa.Parent = _z
	_z.MouseEnter:Connect(function()
		TweenService:Create(
			_z,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = hover
			}
		):Play()
	end)
	_z.MouseLeave:Connect(function()
		TweenService:Create(
			_z,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = normal
			}
		):Play()
	end)
	return _z
end
local _ab = makeWindowButton(
	"−",
	UDim2.new(1, -64, 0, 11),
	Color3.fromRGB(31, 26, 42),
	Color3.fromRGB(48, 38, 62)
)
local _ac = makeWindowButton(
	"×",
	UDim2.new(1, -33, 0, 11),
	Color3.fromRGB(48, 24, 35),
	Color3.fromRGB(75, 30, 48)
)
_ac.TextColor3 = Color3.fromRGB(255, 105, 135)
local _ad = Instance.new("Frame")
_ad.Name = "Page"
_ad.Size = UDim2.new(1, -20, 1, -57)
_ad.Position = UDim2.new(0, 10, 0, 51)
_ad.BackgroundTransparency = 1
_ad.ZIndex = 4
_ad.Parent = _o
local _ae = Instance.new("UIListLayout")
_ae.Padding = UDim.new(0, 7)
_ae.HorizontalAlignment = Enum.HorizontalAlignment.Center
_ae.SortOrder = Enum.SortOrder.LayoutOrder
_ae.Parent = _ad
local _af = Instance.new("UIPadding")
_af.PaddingTop = UDim.new(0, 4)
_af.PaddingBottom = UDim.new(0, 4)
_af.Parent = _ad
local function createButton(text, order)
	local _z = Instance.new("TextButton")
	_z.Name = text
	_z.Size = UDim2.new(1, 0, 0, 40)
	_z.BackgroundColor3 = _f
	_z.Text = ""
	_z.BorderSizePixel = 0
	_z.AutoButtonColor = false
	_z.LayoutOrder = order
	_z.ZIndex = 5
	_z.Parent = _ad
	local _aa = Instance.new("UICorner")
	_aa.CornerRadius = UDim.new(0, 9)
	_aa.Parent = _z
	local _ag = Instance.new("UIStroke")
	_ag.Color = Color3.fromRGB(60, 50, 75)
	_ag.Thickness = 1
	_ag.Transparency = 0.35
	_ag.Parent = _z
	local _ah = Instance.new("TextLabel")
	_ah.Size = UDim2.new(1, -62, 1, 0)
	_ah.Position = UDim2.new(0, 15, 0, 0)
	_ah.BackgroundTransparency = 1
	_ah.Text = text
	_ah.TextColor3 = _j
	_ah.TextSize = 11
	_ah.Font = Enum.Font.GothamBold
	_ah.TextXAlignment = Enum.TextXAlignment.Left
	_ah.ZIndex = 6
	_ah.Parent = _z
	local _ai = Instance.new("Frame")
	_ai.Size = UDim2.new(0, 34, 0, 18)
	_ai.Position = UDim2.new(1, -46, 0.5, -9)
	_ai.BackgroundColor3 = Color3.fromRGB(47, 40, 56)
	_ai.BorderSizePixel = 0
	_ai.ZIndex = 6
	_ai.Parent = _z
	local _aj = Instance.new("UICorner")
	_aj.CornerRadius = UDim.new(1, 0)
	_aj.Parent = _ai
	local _ak = Instance.new("Frame")
	_ak.Size = UDim2.new(0, 12, 0, 12)
	_ak.Position = UDim2.new(0, 3, 0.5, -6)
	_ak.BackgroundColor3 = Color3.fromRGB(150, 145, 160)
	_ak.BorderSizePixel = 0
	_ak.ZIndex = 7
	_ak.Parent = _ai
	local _al = Instance.new("UICorner")
	_al.CornerRadius = UDim.new(1, 0)
	_al.Parent = _ak
	local _am = false
	local function setEnabled(state)
		_am = state
		_z:SetAttribute("Enabled", state)
		if state then
			TweenService:Create(
				_z,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					BackgroundColor3 = Color3.fromRGB(45, 25, 61)
				}
			):Play()
			TweenService:Create(
				_ag,
				TweenInfo.new(0.18),
				{
					Color = _h,
					Transparency = 0.05
				}
			):Play()
			TweenService:Create(
				_ai,
				TweenInfo.new(0.18),
				{
					BackgroundColor3 = _h
				}
			):Play()
			TweenService:Create(
				_ak,
				TweenInfo.new(0.18, Enum.EasingStyle.Back),
				{
					Position = UDim2.new(1, -15, 0.5, -6),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				}
			):Play()
		else
			TweenService:Create(
				_z,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					BackgroundColor3 = _f
				}
			):Play()
			TweenService:Create(
				_ag,
				TweenInfo.new(0.18),
				{
					Color = Color3.fromRGB(60, 50, 75),
					Transparency = 0.35
				}
			):Play()
			TweenService:Create(
				_ai,
				TweenInfo.new(0.18),
				{
					BackgroundColor3 = Color3.fromRGB(47, 40, 56)
				}
			):Play()
			TweenService:Create(
				_ak,
				TweenInfo.new(0.18, Enum.EasingStyle.Quad),
				{
					Position = UDim2.new(0, 3, 0.5, -6),
					BackgroundColor3 = Color3.fromRGB(150, 145, 160)
				}
			):Play()
		end
	end
	_z.MouseEnter:Connect(function()
		local _an
		if _am then
			_an = Color3.fromRGB(52, 28, 70)
		else
			_an = _g
		end
		TweenService:Create(
			_z,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = _an
			}
		):Play()
	end)
	_z.MouseLeave:Connect(function()
		local _an
		if _am then
			_an = Color3.fromRGB(45, 25, 61)
		else
			_an = _f
		end
		TweenService:Create(
			_z,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = _an
			}
		):Play()
	end)
	_z.MouseButton1Down:Connect(function()
		TweenService:Create(
			_z,
			TweenInfo.new(0.06),
			{
				Size = UDim2.new(1, -3, 0, 38)
			}
		):Play()
	end)
	_z.MouseButton1Up:Connect(function()
		TweenService:Create(
			_z,
			TweenInfo.new(0.08),
			{
				Size = UDim2.new(1, 0, 0, 40)
			}
		):Play()
	end)
	return _z, setEnabled
end
local _ao, neonVisual =
	createButton("Neon Egg", 1)
local _ap, hellVisual =
	createButton("Hell Egg", 2)
local _aq, chestVisual =
	createButton("Coin Chest", 3)
local _ar, merchantVisual =
	createButton("Auto Merchant", 4)
local _as, rebirthVisual =
	createButton("Auto Rebirth", 5)
local _at = false
local _au = false
local _av = false
local _aw = false
local _ax = false
local _ay = false
local _az = {
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
	"hugeEgg3",
	"Valk"
}
task.spawn(function()
	while _n.Parent do
		if _at then
			pcall(function()
				local _ba = {
					[1] = "Neon Egg",
					[2] = "Triple"
				}
				ReplicatedStorage.Functions.Hatch:InvokeServer(
					unpack(_ba)
				)
			end)
			task.wait(0.1)
		else
			task.wait(0.1)
		end
	end
end)
task.spawn(function()
	while _n.Parent do
		if _au then
			pcall(function()
				local _ba = {
					[1] = "Hell Egg",
					[2] = "Triple"
				}
				ReplicatedStorage.Functions.Hatch:InvokeServer(
					unpack(_ba)
				)
			end)
			task.wait(0.1)
		else
			task.wait(0.1)
		end
	end
end)
task.spawn(function()
	while _n.Parent do
		if _av then
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
task.spawn(function()
	while _n.Parent do
		if _aw then
			for _, itemName in ipairs(_az) do
				if not _aw or not _n.Parent then
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
	while _n.Parent do
		if _ax then
			pcall(function()
				ReplicatedStorage.Events.Rebirth:FireServer(1)
			end)
			task.wait(0.1)
		else
			task.wait(0.1)
		end
	end
end)
local function updateButton(_z, visual, _am)
	_z:SetAttribute("Enabled", _am)
	visual(_am)
end
_ao.MouseButton1Click:Connect(function()
	_at = not _at
	updateButton(
		_ao,
		neonVisual,
		_at
	)
end)
_ap.MouseButton1Click:Connect(function()
	_au = not _au
	updateButton(
		_ap,
		hellVisual,
		_au
	)
end)
_aq.MouseButton1Click:Connect(function()
	_av = not _av
	updateButton(
		_aq,
		chestVisual,
		_av
	)
end)
_ar.MouseButton1Click:Connect(function()
	_aw = not _aw
	updateButton(
		_ar,
		merchantVisual,
		_aw
	)
end)
_as.MouseButton1Click:Connect(function()
	_ax = not _ax
	updateButton(
		_as,
		rebirthVisual,
		_ax
	)
end)
local _bb = Instance.new("Frame")
_bb.Name = "ConfirmOverlay"
_bb.Size = UDim2.new(1, 0, 1, 0)
_bb.BackgroundColor3 = Color3.fromRGB(5, 4, 8)
_bb.BackgroundTransparency = 0.15
_bb.Visible = false
_bb.ZIndex = 20
_bb.Parent = _o
local _bc = Instance.new("UICorner")
_bc.CornerRadius = UDim.new(0, 13)
_bc.Parent = _bb
local _bd = Instance.new("Frame")
_bd.Size = UDim2.new(0, 175, 0, 108)
_bd.Position = UDim2.new(0.5, -87, 0.5, -54)
_bd.BackgroundColor3 = Color3.fromRGB(24, 19, 33)
_bd.BorderSizePixel = 0
_bd.ZIndex = 21
_bd.Parent = _bb
local _be = Instance.new("UICorner")
_be.CornerRadius = UDim.new(0, 11)
_be.Parent = _bd
local _bf = Instance.new("UIStroke")
_bf.Color = _h
_bf.Thickness = 1
_bf.Transparency = 0.25
_bf.Parent = _bd
local _bg = Instance.new("TextLabel")
_bg.Size = UDim2.new(1, 0, 0, 25)
_bg.Position = UDim2.new(0, 0, 0, 10)
_bg.BackgroundTransparency = 1
_bg.Text = "Close GUI?"
_bg.TextColor3 = _j
_bg.TextSize = 14
_bg.Font = Enum.Font.GothamBold
_bg.ZIndex = 22
_bg.Parent = _bd
local _bh = Instance.new("TextLabel")
_bh.Size = UDim2.new(1, -20, 0, 20)
_bh.Position = UDim2.new(0, 10, 0, 34)
_bh.BackgroundTransparency = 1
_bh.Text = "Are you sure you want to close?"
_bh.TextColor3 = _k
_bh.TextSize = 9
_bh.Font = Enum.Font.Gotham
_bh.ZIndex = 22
_bh.Parent = _bd
local _bi = Instance.new("TextButton")
_bi.Size = UDim2.new(0, 65, 0, 27)
_bi.Position = UDim2.new(0, 18, 1, -38)
_bi.BackgroundColor3 = _h
_bi.Text = "YES"
_bi.TextColor3 = Color3.fromRGB(255, 255, 255)
_bi.TextSize = 10
_bi.Font = Enum.Font.GothamBold
_bi.BorderSizePixel = 0
_bi.AutoButtonColor = false
_bi.ZIndex = 22
_bi.Parent = _bd
local _bj = Instance.new("UICorner")
_bj.CornerRadius = UDim.new(0, 7)
_bj.Parent = _bi
local _bk = Instance.new("TextButton")
_bk.Size = UDim2.new(0, 65, 0, 27)
_bk.Position = UDim2.new(1, -83, 1, -38)
_bk.BackgroundColor3 = Color3.fromRGB(48, 42, 57)
_bk.Text = "NO"
_bk.TextColor3 = _j
_bk.TextSize = 10
_bk.Font = Enum.Font.GothamBold
_bk.BorderSizePixel = 0
_bk.AutoButtonColor = false
_bk.ZIndex = 22
_bk.Parent = _bd
local _bl = Instance.new("UICorner")
_bl.CornerRadius = UDim.new(0, 7)
_bl.Parent = _bk
_bi.MouseEnter:Connect(function()
	TweenService:Create(
		_bi,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = _i
		}
	):Play()
end)
_bi.MouseLeave:Connect(function()
	TweenService:Create(
		_bi,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = _h
		}
	):Play()
end)
_bk.MouseEnter:Connect(function()
	TweenService:Create(
		_bk,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = Color3.fromRGB(65, 57, 76)
		}
	):Play()
end)
_bk.MouseLeave:Connect(function()
	TweenService:Create(
		_bk,
		TweenInfo.new(0.12),
		{
			BackgroundColor3 = Color3.fromRGB(48, 42, 57)
		}
	):Play()
end)
local _bm = false
_ac.MouseButton1Click:Connect(function()
	if _bm then
		return
	end
	_bm = true
	_bb.Visible = true
	_bd.Size = UDim2.new(0, 150, 0, 90)
	_bd.Position = UDim2.new(0.5, -75, 0.5, -45)
	TweenService:Create(
		_bd,
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
		if _bm and _n.Parent then
			_bm = false
			_bb.Visible = false
		end
	end)
end)
_bi.MouseButton1Click:Connect(function()
	_at = false
	_au = false
	_av = false
	_aw = false
	_ax = false
	_n:Destroy()
end)
_bk.MouseButton1Click:Connect(function()
	_bm = false
	_bb.Visible = false
end)
_ab.MouseButton1Click:Connect(function()
	if _bm then
		return
	end
	_ay = not _ay
	if _ay then
		_ad.Visible = false
		TweenService:Create(
			_o,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad),
			{
				Size = UDim2.new(0, _b, 0, 48)
			}
		):Play()
		_ab.Text = "+"
	else
		_ad.Visible = true
		TweenService:Create(
			_o,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad),
			{
				Size = UDim2.new(0, _b, 0, _c)
			}
		):Play()
		_ab.Text = "−"
	end
end)
local _bn = false
local _bo
local _bp
_s.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		_bn = true
		_bo = input.Position
		_bp = _o.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				_bn = false
			end
		end)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if _bn and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		local _bq = input.Position - _bo
		_o.Position = UDim2.new(
			_bp.X.Scale,
			_bp.X.Offset + _bq.X,
			_bp.Y.Scale,
			_bp.Y.Offset + _bq.Y
		)
	end
end)
_o.Size = UDim2.new(0, _b - 15, 0, _c - 15)
TweenService:Create(
	_o,
	TweenInfo.new(
		0.35,
		Enum.EasingStyle.Back,
		Enum.EasingDirection.Out
	),
	{
		Size = UDim2.new(0, _b, 0, _c)
	}
):Play()
task.spawn(function()
	while _n.Parent do
		TweenService:Create(
			_r,
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
			_r,
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
end) end end)(); _p()
