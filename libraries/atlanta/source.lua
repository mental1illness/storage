-- Reformatted by luamin.

-- rewrote this in my coding style
-- jsut so yk this isn't full pascalcases yet
-- (screw you finobe.)

-- made by finobe

local Uis = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))
local Ws = cloneref(game:GetService("Workspace"))
local HttpService = cloneref(game:GetService("HttpService"))
local GuiService = cloneref(game:GetService("GuiService"))
local Lighting = cloneref(game:GetService("Lighting"))
local Run = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local Debris = cloneref(game:GetService("Debris"))
local TweenService = cloneref(game:GetService("TweenService"))
local SoundService = cloneref(game:GetService("SoundService"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local Rs = cloneref(game:GetService("ReplicatedStorage"))

local Vec2 = clonefunction(Vector2.new)
local Vec3 = clonefunction(Vector3.new)
local Dim2 = clonefunction(UDim2.new)
local Dim = clonefunction(UDim.new)
local Rect = clonefunction(Rect.new)
local Cfr = clonefunction(CFrame.new)
local EmptyCfr = Cfr()
local PointObjectSpace = clonefunction(EmptyCfr.PointToObjectSpace)
local Angle = clonefunction(CFrame.Angles)
local DimOffset = clonefunction(UDim2.fromOffset)

local Color = clonefunction(Color3.new)
local Hsv = clonefunction(Color3.fromHSV)
local Rgb = clonefunction(Color3.fromRGB)
local Hex = clonefunction(Color3.fromHex)
local RgbSeq = clonefunction(ColorSequence.new)
local RgbKey = clonefunction(ColorSequenceKeypoint.new)
local NumSeq = clonefunction(NumberSequence.new)
local NumKey = clonefunction(NumberSequenceKeypoint.new)

local Camera = Ws.CurrentCamera
local Lp = Players.LocalPlayer
local Mouse = Lp:GetMouse()
local GuiOffset = GuiService:GetGuiInset().Y

local Max = clonefunction(math.max)
local Floor = clonefunction(math.floor)
local Min = clonefunction(math.min)
local Abs = clonefunction(math.abs)
local Noise = clonefunction(math.noise)
local Rad = clonefunction(math.rad)
local Random = clonefunction(math.random)
local Pow = clonefunction(math.pow)
local Sin = clonefunction(math.sin)
local Pi = math.pi
local Tan = clonefunction(math.tan)
local Atan2 = clonefunction(math.atan2)
local Cos = clonefunction(math.cos)
local Round = clonefunction(math.round)
local Clamp = clonefunction(math.clamp)
local Ceil = clonefunction(math.ceil)
local Sqrt = clonefunction(math.sqrt)
local Acos = clonefunction(math.acos)

local Insert = clonefunction(table.insert)
local Find = clonefunction(table.find)
local Remove = clonefunction(table.remove)
local Concat = clonefunction(table.concat)

local Library = {
	Directory = "Atlanta",
	Folders = {
		"/fonts",
		"/configs",
		"/images"
	},
	Flags = {},
	ConfigFlags = {},
	VisibleFlags = {},
	Guis = {},
	Connections = {},
	Notifications = {},
	PlayerlistData = {},
	CurrentTab = nil,
	CurrentElementOpen = nil,
	DockButtonHolder = nil,
	OldConfig = nil,
	Font = nil,
	KeybindList = nil,
	Binds = {},
	CopiedFlag = nil,
	IsRainbow = nil,
	Instances = {},
	Drawings = {},
	DisplayOrders = 0,
}
local Flags = Library.Flags
local ConfigFlags = Library.ConfigFlags
local Themes = {
	Preset = {
		["Outline"] = Hex("#0B0B0B"),
		["Inline"] = Hex("#1A1A1A"),
		["Accent"] = Hex("#FF4D8D"),
		["HighContrast"] = Hex("#121212"),
		["LowContrast"] = Hex("#1E1E1E"),
		["Text"] = Hex("#D0D0D0"),
		["TextOutline"] = Rgb(0, 0, 0),
		["Glow"] = Hex("#FF4D8D"),
	},
	Utility = {
		["Outline"] = {
			["BackgroundColor3"] = {},
			["Color"] = {}
		},
		["Inline"] = {
			["BackgroundColor3"] = {},
			["ImageColor3"] = {}
		},
		["Accent"] = {
			["BackgroundColor3"] = {},
			["TextColor3"] = {},
			["ImageColor3"] = {},
			["ScrollBarImageColor3"] = {}
		},
		["Contrast"] = {
			["Color"] = {}
		},
		["Text"] = {
			["TextColor3"] = {}
		},
		["TextOutline"] = {
			["Color"] = {}
		},
		["Glow"] = {
			["ImageColor3"] = {}
		},
		["HighContrast"] = {
			["BackgroundColor3"] = {}
		},
		["LowContrast"] = {
			["BackgroundColor3"] = {}
		}
	},
	Find = {
		["Frame"] = "BackgroundColor3",
		["TextLabel"] = "TextColor3",
		["UIGradient"] = "Color",
		["UIStroke"] = "Color",
		["ImageLabel"] = "ImageColor3",
		["TextButton"] = "BackgroundColor3",
		["ScrollingFrame"] = "ScrollBarImageColor3"
	}
}
local Keys = {
	[Enum.KeyCode.LeftShift] = "LS",
	[Enum.KeyCode.RightShift] = "RS",
	[Enum.KeyCode.LeftControl] = "LC",
	[Enum.KeyCode.RightControl] = "RC",
	[Enum.KeyCode.Insert] = "INS",
	[Enum.KeyCode.Backspace] = "BS",
	[Enum.KeyCode.Return] = "Ent",
	[Enum.KeyCode.LeftAlt] = "LA",
	[Enum.KeyCode.RightAlt] = "RA",
	[Enum.KeyCode.CapsLock] = "CAPS",
	[Enum.KeyCode.One] = "1",
	[Enum.KeyCode.Two] = "2",
	[Enum.KeyCode.Three] = "3",
	[Enum.KeyCode.Four] = "4",
	[Enum.KeyCode.Five] = "5",
	[Enum.KeyCode.Six] = "6",
	[Enum.KeyCode.Seven] = "7",
	[Enum.KeyCode.Eight] = "8",
	[Enum.KeyCode.Nine] = "9",
	[Enum.KeyCode.Zero] = "0",
	[Enum.KeyCode.KeypadOne] = "Num1",
	[Enum.KeyCode.KeypadTwo] = "Num2",
	[Enum.KeyCode.KeypadThree] = "Num3",
	[Enum.KeyCode.KeypadFour] = "Num4",
	[Enum.KeyCode.KeypadFive] = "Num5",
	[Enum.KeyCode.KeypadSix] = "Num6",
	[Enum.KeyCode.KeypadSeven] = "Num7",
	[Enum.KeyCode.KeypadEight] = "Num8",
	[Enum.KeyCode.KeypadNine] = "Num9",
	[Enum.KeyCode.KeypadZero] = "Num0",
	[Enum.KeyCode.Minus] = "-",
	[Enum.KeyCode.Equals] = "=",
	[Enum.KeyCode.Tilde] = "~",
	[Enum.KeyCode.LeftBracket] = "[",
	[Enum.KeyCode.RightBracket] = "]",
	[Enum.KeyCode.RightParenthesis] = ")",
	[Enum.KeyCode.LeftParenthesis] = "(",
	[Enum.KeyCode.Semicolon] = ",",
	[Enum.KeyCode.Quote] = "'",
	[Enum.KeyCode.BackSlash] = "\\",
	[Enum.KeyCode.Comma] = ",",
	[Enum.KeyCode.Period] = ".",
	[Enum.KeyCode.Slash] = "/",
	[Enum.KeyCode.Asterisk] = "*",
	[Enum.KeyCode.Plus] = "+",
	[Enum.KeyCode.Backquote] = "`",
	[Enum.UserInputType.MouseButton1] = "MB1",
	[Enum.UserInputType.MouseButton2] = "MB2",
	[Enum.UserInputType.MouseButton3] = "MB3",
	[Enum.KeyCode.Escape] = "ESC",
	[Enum.KeyCode.Space] = "SPC",
}
Library.__index = Library
for _, Path in next, Library.Folders do
	makefolder(Library.Directory .. Path)
end
writefile("tahoma.ttf", game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf"))
local TaHAHAHAHA = {
	name = "tahoma",
	faces = {
		{
			name = "Regular",
			weight = 400,
			style = "normal",
			assetId = getcustomasset("tahoma.ttf")
		}
	}
}
writefile("tahoma.json", HttpService:JSONEncode(TaHAHAHAHA))
Library.Font = Font.new(getcustomasset("tahoma.json"), Enum.FontWeight.Regular)
local ConfigHolder
function Library:Hoverify(Object, Parent)
	local HoverInstance = Library:Create("Frame", {
		Parent = Parent,
		BackgroundTransparency = 1,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent,
		ZIndex = 1,
	})
	Library:ApplyTheme(HoverInstance, "Accent", "BackgroundColor3")
	Object.MouseEnter:Connect(function()
		Library:Tween(HoverInstance, {
			BackgroundTransparency = 0
		})
	end)
	Object.MouseLeave:Connect(function()
		Library:Tween(HoverInstance, {
			BackgroundTransparency = 1
		})
	end)
	return HoverInstance
end
function Library:Hovering(Object)
	if type(Object) == "table" then
		for _, Obj in Object do
			if Library:Hovering(Obj) then
				return true
			end
		end
	else
		local YCond = Object.AbsolutePosition.Y <= Mouse.Y and Mouse.Y <= Object.AbsolutePosition.Y + Object.AbsoluteSize.Y
		local XCond = Object.AbsolutePosition.X <= Mouse.X and Mouse.X <= Object.AbsolutePosition.X + Object.AbsoluteSize.X
		return (YCond and XCond)
	end
end
function Library:MakeResizable(Frame)
	local ResizeHandle = Instance.new("TextButton")
	ResizeHandle.Position = Dim2(1, -10, 1, -10)
	ResizeHandle.BorderColor3 = Rgb(0, 0, 0)
	ResizeHandle.Size = Dim2(0, 10, 0, 10)
	ResizeHandle.BorderSizePixel = 0
	ResizeHandle.BackgroundColor3 = Rgb(255, 255, 255)
	ResizeHandle.Parent = Frame
	ResizeHandle.BackgroundTransparency = 1
	ResizeHandle.Text = ""
	local Resizing = false
	local StartSize, Start
	local OriginalSize = Frame.Size
	ResizeHandle.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Resizing = true
			Start = Input.Position
			StartSize = Frame.Size
		end
	end)
	ResizeHandle.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Resizing = false
		end
	end)
	Library:Connection(Uis.InputChanged, function(Input)
		if Resizing and Input.UserInputType == Enum.UserInputType.MouseMovement then
			local ViewportX = Camera.ViewportSize.X
			local ViewportY = Camera.ViewportSize.Y
			Frame.Size = Dim2(
					StartSize.X.Scale, math.clamp(StartSize.X.Offset + (Input.Position.X - Start.X), OriginalSize.X.Offset, ViewportX),
					StartSize.Y.Scale, math.clamp(StartSize.Y.Offset + (Input.Position.Y - Start.Y), OriginalSize.Y.Offset, ViewportY)
				)
		end
	end)
end
function Library:Draggify(Frame)
	local Dragging = false
	local StartPos = Frame.Position
	local Start
	Frame.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = true
			Start = Input.Position
			StartPos = Frame.Position
			if Library.CurrentElementOpen then
				Library.CurrentElementOpen.SetVisible(false)
				Library.CurrentElementOpen.Open = false
				Library.CurrentElementOpen = nil
			end
			if Frame.Parent:IsA("ScreenGui") and Frame.Parent.DisplayOrder ~= 999999 then
				Library.DisplayOrders += 1
				Frame.Parent.DisplayOrder = Library.DisplayOrders
			end
		end
	end)
	Frame.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = false
		end
	end)
	Library:Connection(Uis.InputChanged, function(Input)
		if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
			local ViewportX = Camera.ViewportSize.X
			local ViewportY = Camera.ViewportSize.Y
			Frame.Position = Dim2(
					0, Clamp(StartPos.X.Offset + (Input.Position.X - Start.X), 0, ViewportX - Frame.Size.X.Offset),
					0, Clamp(StartPos.Y.Offset + (Input.Position.Y - Start.Y), 0, ViewportY - Frame.Size.Y.Offset)
				)
		end
	end)
end
function Library:NewDrawing(Class, Properties)
	local NewDrawing = Drawing.new(Class)
	for Key, Value in next, Properties do
		NewDrawing[Key] = Value
	end
	Insert(Library.Drawings, NewDrawing)
	return NewDrawing
end
function Library:NewItem(Class, Properties)
	local NewInstance = Instance.new(Class)
	for Key, Value in next, Properties do
		NewInstance[Key] = Value
	end
	Insert(Library.Instances, NewInstance)
	return NewInstance
end
function Library:ConvertEnum(EnumString)
	local EnumParts = {}
	for Part in string.gmatch(EnumString, "[%w_]+") do
		Insert(EnumParts, Part)
	end
	local EnumTable = Enum
	for I = 2, #EnumParts do
		EnumTable = EnumTable[EnumParts[I]]
	end
	return EnumTable
end
function Library:Tween(Object, Properties)
	return TweenService:Create(Object, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), Properties):Play()
end
function Library:ConfigListUpdate()
	if not ConfigHolder then
		return
	end
	local List = {}
	for _, File in next, listfiles(Library.Directory .. "/configs") do
		local Name = string.sub(File:gsub(Library.Directory .. "/configs\\", ""):gsub(Library.Directory .. "\\configs\\", ""), 1, -5)
		List[#List + 1] = Name
	end
	ConfigHolder.RefreshOptions(List)
end
function Library:GetConfig()
	local Config = {}
	for Key, Value in Flags do
		if type(Value) == "table" and Value.Key then
			Config[Key] = {
				Active = Value.Active,
				Mode = Value.Mode,
				Key = tostring(Value.Key)
			}
		elseif type(Value) == "table" and Value["Transparency"] and Value["Color"] then
			Config[Key] = {
				Transparency = Value["Transparency"],
				Color = Value["Color"]:ToHex()
			}
		else
			Config[Key] = Value
		end
	end
	return HttpService:JSONEncode(Config)
end
function Library:LoadConfig(ConfigJson)
	local Config = HttpService:JSONDecode(ConfigJson)
	for Key, Value in next, Config do
		local FunctionSet = Library.ConfigFlags[Key]
		if FunctionSet then
			if type(Value) == "table" and Value["Transparency"] and Value["Color"] then
				FunctionSet(Hex(Value["Color"]), Value["Transparency"])
			elseif type(Value) == "table" and Value["Active"] then
				FunctionSet(Value)
			else
				FunctionSet(Value)
			end
		end
	end
end
function Library:RoundNumber(Number, Float)
	local Multiplier = 1 / (Float or 1)
	return Floor(Number * Multiplier + 0.5) / Multiplier
end
function Library:ApplyTheme(Instance, Theme, Property)
	Insert(Themes.Utility[Theme][Property], Instance)
end
function Library:UpdateTheme(Theme, NewColor)
	for Property, Objects in next, Themes.Utility[Theme] do
		for _, Object in next, Objects do
			if Object[Property] == Themes.Preset[Theme] or Object.ClassName == "UIGradient" then
				Object[Property] = NewColor
			end
		end
	end
	Themes.Preset[Theme] = NewColor
end
function Library:Connection(Signal, Callback)
	local Conn = Signal:Connect(Callback)
	Insert(Library.Connections, Conn)
	return Conn
end
function Library:ApplyStroke(Parent)
	local Stroke = Library:Create("UIStroke", {
		Parent = Parent,
		Color = Themes.Preset.TextOutline,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	Library:ApplyTheme(Stroke, "TextOutline", "Color")
end
function Library:Create(InstanceType, Options)
	local Ins = Instance.new(InstanceType)
	for Prop, Value in next, Options do
		Ins[Prop] = Value
	end
	if InstanceType == "TextLabel" or InstanceType == "TextButton" or InstanceType == "TextBox" then
		Library:ApplyTheme(Ins, "Text", "TextColor3")
		Library:ApplyStroke(Ins)
	elseif InstanceType == "ScreenGui" then
		Insert(Library.Guis, Ins)
	end
	return Ins
end
local TooltipSgui = Library:Create("ScreenGui", {
	Enabled = true,
	Parent = gethui(),
	Name = "",
	DisplayOrder = 500,
})
function Library:ToolTip(Options)
	local Cfg = {
		Name = Options.Name or Options.name or "hi",
		Path = Options.Path or Options.path or nil,
	}
	if Cfg.Path then
		local TooltipOutline = Library:Create("Frame", {
			Parent = TooltipSgui,
			Name = "",
			Size = Dim2(0, 0, 0, 22),
			Position = Dim2(0, 500, 0, 300),
			BorderColor3 = Rgb(0, 0, 0),
			BorderSizePixel = 0,
			Visible = false,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Themes.Preset.Outline
		})
		local TooltipInline = Library:Create("Frame", {
			Parent = TooltipOutline,
			Position = Dim2(0, 1, 0, 1),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(1, -2, 1, -2),
			BorderSizePixel = 0,
			BackgroundColor3 = Themes.Preset.Inline
		})
		local TooltipBg = Library:Create("Frame", {
			Parent = TooltipInline,
			Position = Dim2(0, 1, 0, 1),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(1, -2, 1, -2),
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		local TGrad = Library:Create("UIGradient", {
			Parent = TooltipBg,
			Color = RgbSeq{
				RgbKey(0, Rgb(41, 41, 55)),
				RgbKey(1, Rgb(35, 35, 47))
			}
		})
		Library:ApplyTheme(TGrad, "Contrast", "Color")
		Library:Create("TextLabel", {
			Parent = TooltipBg,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = " " .. Cfg.Name .. " ",
			Size = Dim2(0, 0, 1, 0),
			BackgroundTransparency = 1,
			Position = Dim2(0, 0, 0, -1),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.X,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Cfg.Path.MouseEnter:Connect(function()
			TooltipOutline.Visible = true
		end)
		Cfg.Path.MouseLeave:Connect(function()
			TooltipOutline.Visible = false
		end)
		Library:Connection(Uis.InputChanged, function(Input)
			if TooltipOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseMovement then
				TooltipOutline.Position = DimOffset(Input.Position.X + 10, Input.Position.Y + 10)
			end
		end)
	end
	return Cfg
end
function Library:Panel(Options)
	local Cfg = {
		Name = Options.text or Options.name or "Window",
		Size = Options.size or Dim2(0, 530, 0, 590),
		Position = Options.position or Dim2(0, 500, 0, 500),
		AnchorPoint = Options.anchor_point or Vec2(0, 0),
		Image = Options.image or "rbxassetid://79856374238119",
		Open = Options.open or true,
		Items = {},
	}
	local Items = Cfg.Items
	Items.Sgui = Library:Create("ScreenGui", {
		Enabled = true,
		IgnoreGuiInset = true,
		Parent = gethui(),
		Name = ""
	})
	Items.MainHolder = Library:Create("Frame", {
		Parent = Items.Sgui,
		AnchorPoint = Vec2(Cfg.AnchorPoint.X, Cfg.AnchorPoint.Y),
		Position = Cfg.Position,
		Active = true,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Cfg.Size,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:Draggify(Items.MainHolder)
	Library:MakeResizable(Items.MainHolder)
	local CloseBtn = Library:Create("TextButton", {
		Parent = Items.MainHolder,
		FontFace = Library.Font,
		Name = "\0",
		AnchorPoint = Vec2(1, 0),
		Active = false,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "X",
		Size = Dim2(0, 0, 0, 0),
		Selectable = false,
		Position = Dim2(1, -7, 0, 5),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Right,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextColor3 = Themes.Preset.Text,
		TextSize = 12,
		ZIndex = 100,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = CloseBtn
	})
	CloseBtn.MouseButton1Click:Connect(function()
		Items.Sgui.Enabled = false
	end)
	Items.WindowInline = Library:Create("Frame", {
		Parent = Items.MainHolder,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(Items.WindowInline, "Accent", "BackgroundColor3")
	Items.WindowHolder = Library:Create("Frame", {
		Parent = Items.WindowInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Themes.Preset.Outline,
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local WGrad = Library:Create("UIGradient", {
		Parent = Items.WindowHolder,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(WGrad, "Contrast", "Color")
	Items.TitleText = Library:Create("TextLabel", {
		Parent = Items.WindowHolder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Accent,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		BackgroundTransparency = 1,
		Position = Dim2(0, 2, 0, 4),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(Items.TitleText, "Accent", "TextColor3")
	Library:Create("UIStroke", {
		Parent = Items.TitleText,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	Library:Create("UIPadding", {
		Parent = Items.WindowHolder,
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	Items.Outline = Library:Create("Frame", {
		Parent = Items.WindowHolder,
		Position = Dim2(0, 0, 0, 18),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, -18),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(Items.Outline, "Inline", "BackgroundColor3")
	Items.Inline = Library:Create("Frame", {
		Parent = Items.Outline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(Items.Inline, "Outline", "BackgroundColor3")
	Items.Holder = Library:Create("Frame", {
		Parent = Items.Inline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local HGrad = Library:Create("UIGradient", {
		Parent = Items.Holder,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(HGrad, "Contrast", "Color")
	Library:Create("UIPadding", {
		Parent = Items.Holder,
		PaddingTop = Dim(0, 5),
		PaddingBottom = Dim(0, 5),
		PaddingRight = Dim(0, 5),
		PaddingLeft = Dim(0, 5)
	})
	Items.Glow = Library:Create("ImageLabel", {
		Parent = Items.MainHolder,
		ImageColor3 = Themes.Preset.Glow,
		ScaleType = Enum.ScaleType.Slice,
		BorderColor3 = Rgb(0, 0, 0),
		BackgroundColor3 = Rgb(255, 255, 255),
		Visible = true,
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		ImageTransparency = 0.8,
		Position = Dim2(0, -20, 0, -20),
		Size = Dim2(1, 40, 1, 40),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect(Vec2(21, 21), Vec2(79, 79))
	})
	Library:ApplyTheme(Items.Glow, "Glow", "ImageColor3")
	Items.Button = Library:Create("TextButton", {
		Parent = Library.DockHolder,
		TextColor3 = Rgb(0, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Size = Dim2(0, 25, 0, 25),
		BorderSizePixel = 0,
		TextSize = 14,
		BackgroundColor3 = Themes.Preset.Inline
	})
	local BtnOuter = Library:Create("Frame", {
		Parent = Items.Button,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(BtnOuter, "Outline", "BackgroundColor3")
	local BtnInner = Library:Create("Frame", {
		Parent = BtnOuter,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(BtnInner, "Inline", "BackgroundColor3")
	local BtnGrad = Library:Create("UIGradient", {
		Parent = BtnInner,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(35, 35, 47)),
			RgbKey(1, Rgb(41, 41, 55))
		}
	})
	Library:ApplyTheme(BtnGrad, "Contrast", "Color")
	Items.Icon = Library:Create("ImageLabel", {
		Parent = BtnInner,
		ImageColor3 = Themes.Preset.Accent,
		Image = Cfg.Image,
		BackgroundTransparency = 1,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(Items.Icon, "Accent", "ImageColor3")
	Library:ApplyTheme(Items.Icon, "Inline", "ImageColor3")
	Library:Create("UIPadding", {
		Parent = BtnInner,
		PaddingTop = Dim(0, 4),
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	Library:ToolTip({
		Name = Cfg.Name,
		Path = Items.Button
	})
	Items.Sgui:GetPropertyChangedSignal("Enabled"):Connect(function()
		Items.Icon.ImageColor3 = Items.Sgui.Enabled and Themes.Preset.Accent or Themes.Preset.Inline
	end)
	Items.Button.MouseButton1Click:Connect(function()
		Items.Sgui.Enabled = not Items.Sgui.Enabled
	end)
	return setmetatable(Cfg, Library)
end
local Sgui = Library:Create("ScreenGui", {
	Enabled = true,
	Parent = gethui(),
	Name = "",
	DisplayOrder = 999999,
})
local NotifHolder = Library:Create("ScreenGui", {
	Parent = gethui(),
	Name = "",
	IgnoreGuiInset = true,
	DisplayOrder = 999999,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})
function Library:FoldElements(Origin, Elements)
	for _, Key in next, Elements do
		local FlagFn = Library.VisibleFlags[Key]
		if FlagFn then
			FlagFn(Flags[Origin])
		end
	end
end
function Library:Watermark(Options)
	local Cfg = {
		Default = Options.text or Options.default or os.date("drain.lol | %b %d %Y | %H:%M")
	}
	local WOutline = Library:Create("Frame", {
		Parent = Sgui,
		BorderColor3 = Rgb(0, 0, 0),
		AnchorPoint = Vec2(1, 1),
		Position = Dim2(1, -20, 0, 20),
		Size = Dim2(0, 0, 0, 24),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(WOutline, "Outline", "BackgroundColor3")
	WOutline.Position = DimOffset(WOutline.AbsolutePosition.X, WOutline.AbsolutePosition.Y)
	Library:Draggify(WOutline)
	local WInline = Library:Create("Frame", {
		Parent = WOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(WInline, "Inline", "BackgroundColor3")
	local WBg = Library:Create("Frame", {
		Parent = WInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local WGrad = Library:Create("UIGradient", {
		Parent = WBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(WGrad, "Contrast", "Color")
	local WText = Library:Create("TextLabel", {
		Parent = WBg,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "  drain.lol | Beta | Aug 29 2024 | 07:29:00  ",
		Size = Dim2(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Position = Dim2(0, -1, 0, 1),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = WText,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	local WAccent = Library:Create("Frame", {
		Parent = WOutline,
		Position = Dim2(0, 2, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -4, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(WAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = WAccent,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	function Cfg.ChangeText(Input)
		WText.Text = "  " .. Input .. "  "
	end
	function Cfg.SetVisible(Bool)
		WOutline.Visible = Bool
	end
	Cfg.ChangeText(Cfg.Default)
	return Cfg
end
function Library:Notification(Properties)
	local Cfg = {
		Time = Properties.time or 5,
		Text = Properties.text or Properties.name or "Notification",
	}
	local NOutline = Library:Create("Frame", {
		Parent = NotifHolder,
		Size = UDim2.new(0, 0, 0, 24),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 20, 0, 72 + (#Library.Notifications * 28)),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Themes.Preset.Outline,
		AnchorPoint = Vector2.new(1, 0)
	})
	local NInline = Library:Create("Frame", {
		Parent = NOutline,
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	local NBg = Library:Create("Frame", {
		Parent = NInline,
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIGradient", {
		Parent = NBg,
		Color = ColorSequence.new{
			RgbKey(0, Themes.Preset.HighContrast),
			RgbKey(1, Themes.Preset.LowContrast)
		}
	})
	Library:Create("TextLabel", {
		Parent = NBg,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "  " .. Cfg.Text .. "  ",
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -1),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local NAccent = Library:Create("Frame", {
		Parent = NOutline,
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = UDim2.new(0, 1, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(NAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = NAccent,
		Rotation = 90,
		Color = ColorSequence.new{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local NAccentBottom = Library:Create("Frame", {
		Parent = NOutline,
		Position = UDim2.new(0, 2, 1, -3),
		BorderColor3 = Rgb(0, 0, 0),
		Size = UDim2.new(0, -4, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	local Index = #Library.Notifications + 1
	Library.Notifications[Index] = NOutline
	for I, Notif in next, Library.Notifications do
		TweenService:Create(Notif, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
			Position = Dim2(0, 20, 0, 72 + (I * 28))
		}):Play()
	end
	TweenService:Create(NOutline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
		AnchorPoint = Vector2.new(0, 0)
	}):Play()
	TweenService:Create(NAccentBottom, TweenInfo.new(Cfg.Time, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
		Size = UDim2.new(1, -4, 0, 1)
	}):Play()
	task.spawn(function()
		task.wait(Cfg.Time)
		Library.Notifications[Index] = nil
		TweenService:Create(NOutline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1
		}):Play()
		for _, V in next, NOutline:GetDescendants() do
			if V:IsA("TextLabel") then
				TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					TextTransparency = 1
				}):Play()
			elseif V:IsA("Frame") then
				TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 1
				}):Play()
			elseif V:IsA("ImageLabel") then
				TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					ImageTransparency = 1
				}):Play()
			elseif V:IsA("UIStroke") then
				TweenService:Create(V, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					Transparency = 1
				}):Play()
			end
		end
		task.wait(1)
		NOutline:Destroy()
	end)
end
function Library:Tab(Options)
	local Cfg = {
		Name = Options.name or "Tab",
		Enabled = false
	}
	local TabHolder = Library:Create("TextButton", {
		Parent = self.TabHolder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Name = "\0",
		BorderSizePixel = 0,
		Size = Dim2(0, 0, 1, -2),
		ZIndex = 5,
		TextSize = 12,
		BackgroundColor3 = Themes.Preset.Outline,
		AutoButtonColor = false
	})
	Library:ApplyTheme(TabHolder, "Outline", "BackgroundColor3")
	local TabInline = Library:Create("Frame", {
		Parent = TabHolder,
		Size = Dim2(1, -2, 1, 0),
		Name = "\0",
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 5,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(TabInline, "Inline", "BackgroundColor3")
	local TabBg = Library:Create("Frame", {
		Parent = TabInline,
		Size = Dim2(1, -2, 1, -1),
		Name = "\0",
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 5,
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local TabGrad = Library:Create("UIGradient", {
		Parent = TabBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(TabGrad, "Contrast", "Color")
	local TabText = Library:Create("TextLabel", {
		Parent = TabBg,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		Name = "\0",
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		ZIndex = 5,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(TabText, "Accent", "TextColor3")
	local SectionHolder = Library:Create("Frame", {
		Parent = Library.SectionHolder,
		BackgroundTransparency = 1,
		Name = "\0",
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		Visible = false,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Cfg["Holder"] = SectionHolder
	Library:Create("UIListLayout", {
		Parent = SectionHolder,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	function Cfg.OpenTab()
		if Library.CurrentTab and Library.CurrentTab[1] ~= TabBg then
			local PrevBg = Library.CurrentTab[1]
			PrevBg.Size = Dim2(1, -2, 1, -1)
			PrevBg:FindFirstChildOfClass("UIGradient").Rotation = 90
			PrevBg:FindFirstChildOfClass("TextLabel").TextColor3 = Themes.Preset.Text
			Library.CurrentTab[2].Visible = false
			Library.CurrentTab = nil
		end
		Library.CurrentTab = {
			TabBg,
			SectionHolder
		}
		TabBg.Size = Dim2(1, -2, 1, 0)
		TabBg:FindFirstChildOfClass("UIGradient").Rotation = -90
		TabBg:FindFirstChildOfClass("TextLabel").TextColor3 = Themes.Preset.Accent
		SectionHolder.Visible = true
		if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then
			Library.CurrentElementOpen.SetVisible(false)
			Library.CurrentElementOpen.Open = false
			Library.CurrentElementOpen = nil
		end
	end
	TabHolder.MouseButton1Click:Connect(Cfg.OpenTab)
	return setmetatable(Cfg, Library)
end
function Library:Column(Path)
	local Cfg = {}
	local Holder = Path or self.Holder
	local Column = Library:Create("Frame", {
		Parent = Holder,
		BackgroundTransparency = 1,
		Name = "\0",
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(Column, "Inline", "BackgroundColor3")
	Library:Create("UIListLayout", {
		Parent = Column,
		Padding = Dim(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalFlex = Enum.UIFlexAlignment.Fill
	})
	Cfg["Holder"] = Column
	return setmetatable(Cfg, Library)
end
function Library:Section(Options)
	local Cfg = {
		Name = Options.name or "Section"
	}
	local SFrame = Library:Create("Frame", {
		Parent = self.Holder,
		Name = "\0",
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(SFrame, "Inline", "BackgroundColor3")
	local SInline = Library:Create("Frame", {
		Parent = SFrame,
		Name = "\0",
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(SInline, "Outline", "BackgroundColor3")
	local SBg = Library:Create("Frame", {
		Parent = SInline,
		Name = "\0",
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local STitle = Library:Create("TextLabel", {
		Parent = SBg,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		Name = "\0",
		BackgroundTransparency = 1,
		Position = Dim2(0, 6, 0, 4),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = STitle,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	local SAccent = Library:Create("Frame", {
		Parent = SBg,
		Name = "\0",
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(SAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = SAccent,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local SGrad = Library:Create("UIGradient", {
		Parent = SBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(SGrad, "Contrast", "Color")
	local ScrollFrame = Library:Create("ScrollingFrame", {
		Parent = SBg,
		ScrollBarImageColor3 = Themes.Preset.Accent,
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 2,
		MidImage = "rbxassetid://103468666327206",
		TopImage = "rbxassetid://103468666327206",
		BottomImage = "rbxassetid://103468666327206",
		Size = Dim2(1, 0, 1, -20),
		BackgroundTransparency = 1,
		Position = Dim2(0, 0, 0, 20),
		BackgroundColor3 = Rgb(255, 255, 255),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = Dim2(0, 0, 0, 0)
	})
	Library:ApplyTheme(ScrollFrame, "Accent", "ScrollBarImageColor3")
	ScrollFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		if Library.CurrentElementOpen then
			Library.CurrentElementOpen.SetVisible(false)
			Library.CurrentElementOpen.Open = false
			Library.CurrentElementOpen = nil
		end
	end)
	local Elements = Library:Create("Frame", {
		Parent = ScrollFrame,
		Name = "\0",
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Cfg.Holder = Elements
	Library:Create("UIListLayout", {
		Parent = Elements,
		Padding = Dim(0, 4),
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIPadding", {
		Parent = ScrollFrame,
		PaddingBottom = Dim(0, 10)
	})
	return setmetatable(Cfg, Library)
end
function Library:MultiSection(Options)
	local Cfg = {
		Names = Options.names or {
			"First",
			"Second",
			"Third"
		},
		Sections = {}
	}
	local MSFrame = Library:Create("Frame", {
		Parent = self.Holder,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(MSFrame, "Inline", "BackgroundColor3")
	local MSInline = Library:Create("Frame", {
		Parent = MSFrame,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(MSInline, "Outline", "BackgroundColor3")
	local MSBg = Library:Create("Frame", {
		Parent = MSInline,
		ClipsDescendants = true,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		ZIndex = 1,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local MSAccent = Library:Create("Frame", {
		Parent = MSBg,
		Size = Dim2(1, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 3,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(MSAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = MSAccent,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local MSGrad = Library:Create("UIGradient", {
		Parent = MSBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(MSGrad, "Contrast", "Color")
	local TabHolder = Library:Create("Frame", {
		Parent = MSBg,
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Position = Dim2(0, -1, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 2, 0, 21),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIListLayout", {
		Parent = TabHolder,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, -3),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	for _, TabName in next, Cfg.Names do
		local Multi = {
			Open = false
		}
		local TabBtn = Library:Create("TextButton", {
			Parent = TabHolder,
			AutoButtonColor = false,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = "",
			BorderSizePixel = 0,
			Size = Dim2(0, 0, 1, 0),
			ZIndex = 1,
			TextSize = 12,
			BackgroundColor3 = Themes.Preset.Outline
		})
		Library:ApplyTheme(TabBtn, "Outline", "BackgroundColor3")
		local TabBg = Library:Create("Frame", {
			Parent = TabBtn,
			Size = Dim2(1, 0, 1, -2),
			Position = Dim2(0, 1, 0, 1),
			BorderColor3 = Rgb(0, 0, 0),
			ZIndex = 1,
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		local TGrad = Library:Create("UIGradient", {
			Parent = TabBg,
			Rotation = 90,
			Color = RgbSeq{
				RgbKey(0, Rgb(41, 41, 55)),
				RgbKey(1, Rgb(35, 35, 47))
			}
		})
		Library:ApplyTheme(TGrad, "Contrast", "Color")
		local TText = Library:Create("TextLabel", {
			Parent = TabBg,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = TabName,
			BackgroundTransparency = 1,
			Size = Dim2(1, 0, 1, 0),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.X,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:ApplyTheme(TText, "Accent", "TextColor3")
		Library:Create("UIStroke", {
			Parent = TText,
			LineJoinMode = Enum.LineJoinMode.Miter
		})
		local ScrollFrame = Library:Create("ScrollingFrame", {
			Parent = MSBg,
			ScrollBarImageColor3 = Themes.Preset.Accent,
			Active = true,
			MidImage = "rbxassetid://103468666327206",
			TopImage = "rbxassetid://103468666327206",
			BottomImage = "rbxassetid://103468666327206",
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 2,
			Size = Dim2(1, 0, 1, -20),
			Visible = false,
			BackgroundTransparency = 1,
			Position = Dim2(0, 0, 0, 24),
			BackgroundColor3 = Rgb(255, 255, 255),
			BorderColor3 = Rgb(0, 0, 0),
			BorderSizePixel = 0,
			CanvasSize = Dim2(0, 0, 0, 0)
		})
		Library:ApplyTheme(ScrollFrame, "Accent", "ScrollBarImageColor3")
		local EFrame = Library:Create("Frame", {
			Parent = ScrollFrame,
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(1, 0, 0, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Multi.Holder = EFrame
		Library:Create("UIListLayout", {
			Parent = EFrame,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = Dim(0, 4)
		})
		Library:Create("UIPadding", {
			Parent = ScrollFrame,
			PaddingBottom = Dim(0, 60)
		})
		function Multi:OpenTab(Bool)
			ScrollFrame.Visible = Bool
			TGrad.Rotation = Bool and -90 or 90
			TabBtn.Size = Dim2(0, 0, 1, Bool and 1 or 0)
			TText.TextColor3 = Bool and Themes.Preset.Accent or Themes.Preset.Text
		end
		Library:Connection(TabBtn.MouseButton1Click, function()
			for _, MS in next, Cfg.Sections do
				MS:OpenTab(false)
			end
			if Library.CurrentElementOpen then
				Library.CurrentElementOpen.SetVisible(false)
				Library.CurrentElementOpen.Open = false
				Library.CurrentElementOpen = nil
			end
			Multi:OpenTab(true)
		end)
		Cfg.Sections[#Cfg.Sections + 1] = setmetatable(Multi, Library)
	end
	Cfg.Sections[1]:OpenTab(true)
	return unpack(Cfg.Sections)
end
function Library:Slider(Options)
	local Cfg = {
		Name = Options.name or nil,
		Suffix = Options.suffix or "",
		Flag = Options.flag or tostring(2 ^ 789),
		Callback = Options.callback or function()
		end,
		Visible = Options.visible or true,
		InputDisabled = Options.input or false,
		CustomColor = Options.custom or nil,
		Min = Options.min or Options.minimum or 0,
		Max = Options.max or Options.maximum or 100,
		Intervals = Options.interval or Options.decimal or 1,
		Default = Options.default or 10,
		Dragging = false,
		Value = Options.default or 10,
	}
	local SliderLabel = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Name = "slider",
		ZIndex = 1,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local NameLabel
	if Cfg.Name then
		local LC = Library:Create("Frame", {
			Parent = SliderLabel,
			Name = "left_components",
			BackgroundTransparency = 1,
			Position = Dim2(0, 2, 0, -1),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(0, 0, 0, 14),
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		NameLabel = Library:Create("TextLabel", {
			Parent = LC,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = Cfg.Name,
			Name = "text",
			BackgroundTransparency = 1,
			Size = Dim2(0, 0, 1, -1),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.X,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:Create("UIListLayout", {
			Parent = LC,
			Padding = Dim(0, 5),
			Name = "_",
			FillDirection = Enum.FillDirection.Horizontal
		})
	end
	local BC = Library:Create("Frame", {
		Parent = SliderLabel,
		Name = "bottom_components",
		Position = Dim2(0, 0, 0, Cfg.Name and 15 or 0),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local SliderBtn = Library:Create("TextButton", {
		Parent = BC,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -1, 1, 12),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline,
		Text = "",
		AutoButtonColor = false,
	})
	Library:ApplyTheme(SliderBtn, "Outline", "BackgroundColor3")
	if not Cfg.InputDisabled then
		Library:Hoverify(SliderLabel, SliderBtn)
	end
	local SInline = Library:Create("Frame", {
		Parent = SliderBtn,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		ZIndex = 1,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(SInline, "Inline", "BackgroundColor3")
	local SBg = Library:Create("Frame", {
		Parent = SInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0
	})
	local SContrast = Library:Create("Frame", {
		Parent = SBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local SValueText = Library:Create("TextLabel", {
		Parent = SContrast,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "12.50/100.00",
		Name = "text",
		BackgroundTransparency = 1,
		Position = Dim2(0, 0, 0, -1),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		TextSize = 12,
		ZIndex = 2,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local SFill = Library:Create("Frame", {
		Parent = SContrast,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Cfg.CustomColor or Themes.Preset.Accent
	})
	if not Cfg.CustomColor then
		Library:ApplyTheme(SFill, "Accent", "BackgroundColor3")
	end
	Library:Create("UIGradient", {
		Parent = SFill,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local SCGrad = Library:Create("UIGradient", {
		Parent = SContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(SCGrad, "Contrast", "Color")
	Library:Create("UIGradient", {
		Parent = SBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	Library:Create("UIListLayout", {
		Parent = BC,
		Padding = Dim(0, 10),
		Name = "_",
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	function Cfg.Set(Value)
		if type(Value) == "userdata" then
			return
		end
		Cfg.Value = math.clamp(Library:RoundNumber(Value, Cfg.Intervals), Cfg.Min, Cfg.Max)
		SFill.Size = Dim2((Cfg.Value - Cfg.Min) / (Cfg.Max - Cfg.Min), 0, 1, 0)
		SValueText.Text = tostring(Cfg.Value) .. Cfg.Suffix .. "/" .. tostring(Cfg.Max) .. Cfg.Suffix
		Flags[Cfg.Flag] = Cfg.Value
		Cfg.Callback(Flags[Cfg.Flag])
	end
	function Cfg.SetElementVisible(Bool)
		SliderLabel.Visible = Bool
		if NameLabel then
			NameLabel.Visible = Bool
		end
	end
	if not Cfg.InputDisabled then
		Library:Connection(Uis.InputChanged, function(Input)
			if Cfg.Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
				local SizeX = (Input.Position.X - SliderBtn.AbsolutePosition.X) / SliderBtn.AbsoluteSize.X
				Cfg.Set(((Cfg.Max - Cfg.Min) * SizeX) + Cfg.Min)
			end
		end)
		Library:Connection(Uis.InputEnded, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Cfg.Dragging = false
			end
		end)
		SliderBtn.MouseButton1Down:Connect(function()
			Cfg.Dragging = true
		end)
	end
	Cfg.Set(Cfg.Default)
	Cfg.SetElementVisible(Cfg.Visible)
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	return setmetatable(Cfg, Library)
end
function Library:Toggle(Options)
	local Cfg = {
		Enabled = Options.enabled or nil,
		Name = Options.name or "Toggle",
		Flag = Options.flag or tostring(Random(1, 9999999)),
		Callback = Options.callback or function()
		end,
		Default = Options.default or false,
		Visible = Options.visible or true,
		Tooltip = Options.tooltip or nil,
	}
	local THolder = Library:Create("TextButton", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Rgb(151, 151, 151),
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Name = "toggle",
		ZIndex = 1,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local RC = Library:Create("Frame", {
		Parent = THolder,
		Name = "right_components",
		Position = Dim2(1, -1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 0, 0, 12),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Cfg["RightHolder"] = RC
	Library:Create("UIListLayout", {
		Parent = RC,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		Padding = Dim(0, 4),
		Name = "list",
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIPadding", {
		Parent = THolder
	})
	local LC = Library:Create("Frame", {
		Parent = THolder,
		Name = "left_components",
		BackgroundTransparency = 1,
		Position = Dim2(0, 0, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 0, 0, 14),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local TNameText = Library:Create("TextLabel", {
		Parent = LC,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		Name = "text",
		BackgroundTransparency = 1,
		Size = Dim2(0, 0, 1, -1),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = TNameText,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	Library:Create("UIListLayout", {
		Parent = LC,
		Padding = Dim(0, 5),
		Name = "_",
		FillDirection = Enum.FillDirection.Horizontal
	})
	local TBtn = Library:Create("TextButton", {
		Parent = LC,
		Name = "!toggle",
		Text = "",
		AutoButtonColor = false,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 14, 0, 14),
		BorderSizePixel = 0,
		ZIndex = 1,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(TBtn, "Outline", "BackgroundColor3")
	Library:ApplyTheme(TBtn, "Accent", "BackgroundColor3")
	local TInline = Library:Create("Frame", {
		Parent = TBtn,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		ZIndex = 2,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(TInline, "Inline", "BackgroundColor3")
	local TAccent = Library:Create("Frame", {
		Parent = TInline,
		BackgroundTransparency = 1,
		ZIndex = 3,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(TAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = TAccent,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local TBg = Library:Create("Frame", {
		Parent = TInline,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(TBg, "Accent", "BackgroundColor3")
	local TBgGrad = Library:Create("UIGradient", {
		Parent = TBg,
		Rotation = 90,
		Name = "_",
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(TBgGrad, "Contrast", "Color")
	Library:Hoverify(THolder, TBtn)
	function Cfg.Set(Bool)
		Library:Tween(TAccent, {
			BackgroundTransparency = Bool and 0 or 1
		})
		Flags[Cfg.Flag] = Bool
		Cfg.Callback(Bool)
	end
	function Cfg.SetElementVisible(Bool)
		THolder.Visible = Bool
	end
	Library:Connection(THolder.MouseButton1Click, function()
		Cfg.Enabled = not Cfg.Enabled
		Cfg.Set(Cfg.Enabled)
	end)
	Library:Connection(TBtn.MouseButton1Click, function()
		Cfg.Enabled = not Cfg.Enabled
		Cfg.Set(Cfg.Enabled)
	end)
	if Cfg.Tooltip then
		Library:ToolTip({
			Name = Cfg.Tooltip,
			Path = THolder
		})
	end
	Cfg.Set(Cfg.Default)
	Cfg.SetElementVisible(Cfg.Visible)
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	return setmetatable(Cfg, Library)
end
function Library:Colorpicker(Options)
	local Parent = self.RightHolder
	local Cfg = {
		Name = Options.name or "Color",
		Flag = Options.flag or tostring(2 ^ 789),
		Color = Options.color or Color(1, 1, 1),
		Alpha = Options.alpha or 1,
		Callback = Options.callback or function()
		end,
		RightHolder = self.RightHolder,
	}
	local DraggingSat, DraggingHue, DraggingAlpha = false, false, false
	local H, S, V = Cfg.Color:ToHSV()
	local A = Cfg.Alpha
	local CpBtn = Library:Create("TextButton", {
		Parent = Parent,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 24, 0, 14),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline,
		Text = "",
		AutoButtonColor = false,
	})
	Library:ApplyTheme(CpBtn, "Outline", "BackgroundColor3")
	local CpInline = Library:Create("Frame", {
		Parent = CpBtn,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(CpInline, "Inline", "BackgroundColor3")
	local CpHandler = Library:Create("Frame", {
		Parent = CpInline,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(250, 165, 27)
	})
	Library:Hoverify(CpBtn, CpBtn)
	Library:Create("UIGradient", {
		Parent = CpHandler,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local CpHolder = Library:Create("Frame", {
		Parent = Sgui,
		Position = Dim2(0, CpBtn.AbsolutePosition.X + 1, 0, CpBtn.AbsolutePosition.Y + 17),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 190, 0, 210),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline,
		Visible = false,
		ZIndex = 1
	})
	Library:ApplyTheme(CpHolder, "Outline", "BackgroundColor3")
	Library:MakeResizable(CpHolder)
	local WInline = Library:Create("Frame", {
		Parent = CpHolder,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(WInline, "Accent", "BackgroundColor3")
	local WHolder = Library:Create("Frame", {
		Parent = WInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Themes.Preset.Outline,
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local WGrad = Library:Create("UIGradient", {
		Parent = WHolder,
		Rotation = 90,
		Name = "_",
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(WGrad, "Contrast", "Color")
	Library:Create("TextLabel", {
		Parent = WHolder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		Name = "text",
		BackgroundTransparency = 1,
		Position = Dim2(0, 2, 0, 4),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIPadding", {
		Parent = WHolder,
		Name = "_",
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	local MCHolder = Library:Create("Frame", {
		Parent = WHolder,
		Position = Dim2(0, 0, 0, 20),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, -40),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(MCHolder, "Inline", "BackgroundColor3")
	Cfg.Holder = Library:Create("Frame", {
		Parent = CpHolder,
		Position = Dim2(0, 6, 1, -21),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -120, 0, 0),
		BorderSizePixel = 0,
	})
	local RainbowToggle = setmetatable(Cfg, Library):Toggle({
		name = "Rainbow",
		flag = Cfg.Flag .. "_RAINBOW_FLAG"
	})
	Cfg.Holder = Library:Create("Frame", {
		Parent = CpHolder,
		Position = Dim2(1, 2, 1, -23),
		BorderColor3 = Rgb(0, 0, 0),
		AnchorPoint = Vec2(1, 0),
		Size = Dim2(1, -80, 0, 0),
		BorderSizePixel = 0,
	})
	local CpSection = setmetatable(Cfg, Library)
	CpSection:ButtonHolder({})
	CpSection:Button({
		name = "Copy",
		callback = function()
			Library.CopiedFlag = Flags[Cfg.Flag]
			Library.IsRainbow = Cfg.Flag .. "_RAINBOW_FLAG"
		end
	})
	CpSection:Button({
		name = "Paste",
		callback = function()
			RainbowToggle.Set(Library.IsRainbow)
			Cfg.Set(Library.CopiedFlag.Color, Library.CopiedFlag.Transparency)
		end
	})
	local MCInline = Library:Create("Frame", {
		Parent = MCHolder,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(MCInline, "Outline", "BackgroundColor3")
	local MCBg = Library:Create("Frame", {
		Parent = MCInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local MCGrad = Library:Create("UIGradient", {
		Parent = MCBg,
		Rotation = 90,
		Name = "_",
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(MCGrad, "Contrast", "Color")
	Library:Create("UIPadding", {
		Parent = MCBg,
		PaddingTop = Dim(0, 4),
		Name = "_",
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	local AlphaBar = Library:Create("TextButton", {
		Parent = MCBg,
		AnchorPoint = Vec2(0, 0.5),
		Position = Dim2(0, 0, 1, -8),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -20, 0, 14),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline,
		Text = "",
		AutoButtonColor = false,
	})
	Library:ApplyTheme(AlphaBar, "Inline", "BackgroundColor3")
	local AOutline = Library:Create("Frame", {
		Parent = AlphaBar,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(AOutline, "Outline", "BackgroundColor3")
	local AlphaDrag = Library:Create("Frame", {
		Parent = AOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(0, 221, 255)
	})
	local AlphaInd = Library:Create("ImageLabel", {
		Parent = AlphaDrag,
		ScaleType = Enum.ScaleType.Tile,
		BorderColor3 = Rgb(0, 0, 0),
		Image = "rbxassetid://18274452449",
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 1, 0),
		TileSize = Dim2(0, 6, 0, 6),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIGradient", {
		Parent = AlphaInd,
		Transparency = NumSeq{
			NumKey(0, 0),
			NumKey(1, 1)
		}
	})
	local AlphaPicker = Library:Create("Frame", {
		Parent = AlphaDrag,
		BorderMode = Enum.BorderMode.Inset,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 4, 1, 0),
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local HueBar = Library:Create("TextButton", {
		Parent = MCBg,
		AnchorPoint = Vec2(1, 0),
		Position = Dim2(1, -1, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 14, 1, -20),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline,
		Text = "",
		AutoButtonColor = false
	})
	local HOutline = Library:Create("Frame", {
		Parent = HueBar,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	local HFrame = Library:Create("Frame", {
		Parent = HOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIGradient", {
		Parent = HFrame,
		Rotation = 270,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 0, 0)),
			RgbKey(0.17, Rgb(255, 255, 0)),
			RgbKey(0.33, Rgb(0, 255, 0)),
			RgbKey(0.5, Rgb(0, 255, 255)),
			RgbKey(0.67, Rgb(0, 0, 255)),
			RgbKey(0.83, Rgb(255, 0, 255)),
			RgbKey(1, Rgb(255, 0, 0))
		}
	})
	local HuePicker = Library:Create("Frame", {
		Parent = HFrame,
		BorderMode = Enum.BorderMode.Inset,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 0, 4),
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local VisOuter = Library:Create("Frame", {
		Parent = MCBg,
		AnchorPoint = Vec2(1, 1),
		Position = Dim2(1, -1, 1, -1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 14, 0, 14),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(VisOuter, "Inline", "BackgroundColor3")
	local VisOutline = Library:Create("Frame", {
		Parent = VisOuter,
		Size = Dim2(1, -2, 1, -2),
		Active = true,
		BorderColor3 = Rgb(0, 0, 0),
		Position = Dim2(0, 1, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(VisOutline, "Outline", "BackgroundColor3")
	local VisInner = Library:Create("Frame", {
		Parent = VisOutline,
		Size = Dim2(1, -2, 1, -2),
		Active = true,
		BorderColor3 = Rgb(0, 0, 0),
		Position = Dim2(0, 1, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(0, 221, 255)
	})
	local SVPicker = Library:Create("Frame", {
		Parent = MCBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -20, 1, -20),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(SVPicker, "Inline", "BackgroundColor3")
	local SVOutline = Library:Create("Frame", {
		Parent = SVPicker,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(SVOutline, "Outline", "BackgroundColor3")
	local CpFrame = Library:Create("Frame", {
		Parent = SVOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(0, 221, 255)
	})
	local SatBtn = Library:Create("TextButton", {
		Parent = CpFrame,
		Size = Dim2(1, 0, 1, 0),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255),
		Text = "",
		AutoButtonColor = false,
	})
	Library:Create("UIGradient", {
		Parent = SatBtn,
		Rotation = 270,
		Transparency = NumSeq{
			NumKey(0, 0),
			NumKey(1, 1)
		},
		Color = RgbSeq{
			RgbKey(0, Rgb(0, 0, 0)),
			RgbKey(1, Rgb(0, 0, 0))
		}
	})
	local ValBtn = Library:Create("TextButton", {
		Parent = CpFrame,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255),
		Text = "",
		AutoButtonColor = false,
	})
	Library:Create("UIGradient", {
		Parent = ValBtn,
		Transparency = NumSeq{
			NumKey(0, 0),
			NumKey(1, 1)
		}
	})
	local SVDot = Library:Create("Frame", {
		Parent = CpFrame,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 2, 0, 2),
		BorderSizePixel = 1,
		BackgroundColor3 = Rgb(255, 255, 255),
		ZIndex = 3,
	})
	function Cfg.SetVisible(Bool)
		CpHolder.Visible = Bool
		if Bool then
			if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then
				Library.CurrentElementOpen.SetVisible(false)
				Library.CurrentElementOpen.Open = false
			end
			Library.CurrentElementOpen = Cfg
			CpHolder.Position = Dim2(0, CpBtn.AbsolutePosition.X + 1, 0, CpBtn.AbsolutePosition.Y + 17)
		end
	end
	CpBtn.MouseButton1Click:Connect(function()
		Cfg.Open = not Cfg.Open
		Cfg.SetVisible(Cfg.Open)
	end)
	function Cfg.Set(NewColor, NewAlpha)
		if NewColor then
			H, S, V = NewColor:ToHSV()
		end
		if NewAlpha then
			A = NewAlpha
		end
		local FinalColor = Color3.fromHSV(H, S, V)
		local HueVal = 1 - H
		HuePicker.Position = Dim2(0, 0, HueVal, (HueVal < 1) and 0 or -4)
		AlphaPicker.Position = Dim2(A, (A < 1) and 0 or -4, 0, 0)
		AlphaDrag.BackgroundColor3 = FinalColor
		VisInner.BackgroundColor3 = FinalColor
		CpHandler.BackgroundColor3 = FinalColor
		CpFrame.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
		Cfg.Color = FinalColor
		Cfg.Alpha = A
		SVDot.Position = Dim2(S, (S < 1) and 0 or -3, 1 - V, (1 - V < 1) and 0 or -3)
		Flags[Cfg.Flag] = {
			Color = FinalColor,
			Transparency = A
		}
		Cfg.Callback(FinalColor, A)
	end
	function Cfg.UpdateColor()
		local CurMouse = Uis:GetMouseLocation()
		if DraggingSat then
			S = math.clamp((Vec2(CurMouse.X, CurMouse.Y - GuiOffset) - ValBtn.AbsolutePosition).X / ValBtn.AbsoluteSize.X, 0, 1)
			V = 1 - math.clamp((Vec2(CurMouse.X, CurMouse.Y - GuiOffset) - SatBtn.AbsolutePosition).Y / SatBtn.AbsoluteSize.Y, 0, 1)
		elseif DraggingHue then
			H = math.clamp(1 - (Vec2(CurMouse.X, CurMouse.Y - GuiOffset) - HueBar.AbsolutePosition).Y / HueBar.AbsoluteSize.Y, 0, 1)
		elseif DraggingAlpha then
			A = math.clamp((Vec2(CurMouse.X, CurMouse.Y - GuiOffset) - AlphaBar.AbsolutePosition).X / AlphaBar.AbsoluteSize.X, 0, 1)
		end
		Cfg.Set(nil, nil)
	end
	AlphaBar.MouseButton1Down:Connect(function()
		DraggingAlpha = true
	end)
	HueBar.MouseButton1Down:Connect(function()
		DraggingHue = true
	end)
	SatBtn.MouseButton1Down:Connect(function()
		DraggingSat = true
	end)
	Uis.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			DraggingSat, DraggingHue, DraggingAlpha = false, false, false
		end
	end)
	Uis.InputChanged:Connect(function(Input)
		if (DraggingSat or DraggingHue or DraggingAlpha) and Input.UserInputType == Enum.UserInputType.MouseMovement then
			Cfg.UpdateColor()
		end
	end)
	task.spawn(function()
		while true do
			task.wait()
			if Flags[Cfg.Flag .. "_RAINBOW_FLAG"] then
				Cfg.Set(Hsv(math.abs(math.sin(tick())), S, V), A)
			end
		end
	end)
	Cfg.Set(Cfg.Color, Cfg.Alpha)
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	return setmetatable(Cfg, Library)
end
function Library:Keybind(Options)
	local Parent = self.RightHolder
	local Cfg = {
		Flag = Options.flag or "SetMeAFlag",
		Callback = Options.callback or function()
		end,
		Open = false,
		Binding = nil,
		Name = Options.name or nil,
		IgnoreKey = Options.ignore or false,
		Key = Options.key or nil,
		Mode = Options.mode or "toggle",
		Active = Options.default or false,
	}
	Flags[Cfg.Flag] = {}
	local KbElement
	if Cfg.Name then
		KbElement = Library:Create("TextLabel", {
			Parent = Library.KeybindList,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = "[ Hold ]  Fly - X",
			Size = Dim2(1, -5, 0, 18),
			Visible = false,
			Position = Dim2(0, 5, 0, -1),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Themes.Preset.Text
		})
	end
	local KbOutline = Library:Create("TextButton", {
		Parent = Parent,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Size = Dim2(0, 24, 0, 14),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(KbOutline, "Outline", "BackgroundColor3")
	Library:Create("UIPadding", {
		Parent = KbOutline,
		PaddingRight = Dim(0, 2)
	})
	local HInst = Library:Hoverify(KbOutline, KbOutline)
	HInst.Size = Dim2(1, 2, 1, 0)
	local KbInline = Library:Create("Frame", {
		Parent = KbOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		Size = Dim2(1, -2, 1, -2),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(KbInline, "Inline", "BackgroundColor3")
	Library:Create("UIPadding", {
		Parent = KbInline,
		PaddingRight = Dim(0, 2)
	})
	local KbHandler = Library:Create("Frame", {
		Parent = KbInline,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local KbGrad = Library:Create("UIGradient", {
		Parent = KbHandler,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(KbGrad, "Contrast", "Color")
	local KeyText = Library:Create("TextLabel", {
		Parent = KbHandler,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 2,
		Text = "b",
		Size = Dim2(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Position = Dim2(0, 0, 0, -2),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIPadding", {
		Parent = KeyText,
		PaddingLeft = Dim(0, 3),
		PaddingRight = Dim(0, 2)
	})
	local KbSelector = Library:Create("Frame", {
		Parent = Sgui,
		Position = Dim2(0, KbOutline.AbsolutePosition.X + 1, 0, KbOutline.AbsolutePosition.Y + 17),
		BorderColor3 = Rgb(255, 255, 255),
		BorderSizePixel = 2,
		Visible = false,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIListLayout", {
		Parent = KbSelector,
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, 2)
	})
	Library:Create("UIPadding", {
		Parent = KbSelector,
		PaddingTop = Dim(0, 3),
		PaddingBottom = Dim(0, 5),
		PaddingRight = Dim(0, 5),
		PaddingLeft = Dim(0, 5)
	})
	local function MakeModeBtn(Text)
		local Btn = Library:Create("TextButton", {
			Parent = KbSelector,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = Text,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			BorderSizePixel = 0,
			ZIndex = 2,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:Create("UIStroke", {
			Parent = Btn,
			LineJoinMode = Enum.LineJoinMode.Miter
		})
		return Btn
	end
	local HoldBtn = MakeModeBtn("hold")
	local ToggleBtn = MakeModeBtn("toggle")
	local AlwaysBtn = MakeModeBtn("always")
	local SelGrad = Library:Create("UIGradient", {
		Parent = KbSelector,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(SelGrad, "Contrast", "Color")
	Library:Create("UIStroke", {
		Parent = KbSelector,
		Color = Themes.Preset.Inline,
		LineJoinMode = Enum.LineJoinMode.Miter,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})
	function Cfg.SetVisible(Bool)
		KbSelector.Visible = Bool
		KbSelector.Position = Dim2(0, KbOutline.AbsolutePosition.X + 1, 0, KbOutline.AbsolutePosition.Y + 17)
		if Bool then
			if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg then
				Library.CurrentElementOpen.SetVisible(false)
				Library.CurrentElementOpen.Open = false
			end
			Library.CurrentElementOpen = Cfg
		end
	end
	function Cfg.SetMode(Mode)
		Cfg.Mode = Mode
		if Mode == "always" then
			Cfg.Set(true)
		elseif Mode == "hold" then
			Cfg.Set(false)
		end
		Flags[Cfg.Flag]["Mode"] = Mode
	end
	function Cfg.Set(Input)
		if type(Input) == "boolean" then
			local Cached = (Cfg.Mode == "always") and true or Input
			Cfg.Active = Cached
			Flags[Cfg.Flag]["Active"] = Cached
			Cfg.Callback(Cached)
		elseif tostring(Input):find("Enum") then
			Input = Input.Name == "Escape" and "none" or Input
			Cfg.Key = Input or "none"
			local KStr = Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")
			local KStr2 = (tostring(KStr):gsub("KeyCode.", ""):gsub("UserInputType.", "")) or "none"
			Cfg.KeyName = KStr2
			Flags[Cfg.Flag]["Mode"] = Cfg.Mode
			Flags[Cfg.Flag]["Key"] = Cfg.Key
			KeyText.Text = string.lower(KStr2)
			Cfg.Callback(Cfg.Active or false)
		elseif Find({
			"toggle",
			"hold",
			"always"
		}, Input) then
			Cfg.SetMode(Input)
			if Input == "always" then
				Cfg.Active = true
			end
			Cfg.Callback(Cfg.Active or false)
		elseif type(Input) == "table" then
			Input.key = type(Input.key) == "string" and Input.key ~= "none" and Library:ConvertEnum(Input.key) or Input.key
			Input.key = Input.key == Enum.KeyCode.Escape and "none" or Input.key
			Cfg.Key = Input.key or "none"
			Cfg.Mode = Input.mode or "toggle"
			if Input.active then
				Cfg.Active = Input.active
			end
			local KStr = tostring(Cfg.Key) ~= "Enums" and (Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")) or nil
			local KStr2 = KStr and (tostring(KStr):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
			KeyText.Text = string.lower(KStr2 or "none")
			Cfg.KeyName = KStr2
		end
		Flags[Cfg.Flag] = {
			Mode = Cfg.Mode,
			Key = Cfg.Key,
			Active = Cfg.Active
		}
		if Cfg.Name and KbElement then
			KbElement.Visible = Cfg.Active
			Library:Tween(KbElement, {
				TextTransparency = Cfg.Active and 0 or 1
			})
			Library:Tween(KbElement:FindFirstChildOfClass("UIStroke"), {
				Transparency = Cfg.Active and 0 or 1
			})
			local KStr = tostring(Cfg.Key) ~= "Enums" and (Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")) or nil
			local KStr2 = KStr and (tostring(KStr):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
			KbElement.Text = "[ " .. string.upper(string.sub(Cfg.Mode, 1, 1)) .. string.sub(Cfg.Mode, 2) .. " ] " .. Cfg.Name .. " - " .. (KStr2 or "none")
		end
	end
	HoldBtn.MouseButton1Click:Connect(function()
		Cfg.SetMode("hold");
		Cfg.SetVisible(false);
		Cfg.Open = false
	end)
	ToggleBtn.MouseButton1Click:Connect(function()
		Cfg.SetMode("toggle");
		Cfg.SetVisible(false);
		Cfg.Open = false
	end)
	AlwaysBtn.MouseButton1Click:Connect(function()
		Cfg.SetMode("always");
		Cfg.SetVisible(false);
		Cfg.Open = false
	end)
	KbOutline.MouseButton2Click:Connect(function()
		Cfg.Open = not Cfg.Open;
		Cfg.SetVisible(Cfg.Open)
	end)
	KbOutline.MouseButton1Down:Connect(function()
		task.wait();
		KeyText.Text = "none"
		if Cfg.Binding then
			return
		end
		Cfg.Binding = Library:Connection(Uis.InputBegan, function(Input, GameEvent)
			local SelectedKey = Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode or Input.UserInputType
			Cfg.Set(SelectedKey);
			Cfg.Binding:Disconnect();
			Cfg.Binding = nil
		end)
	end)
	Library:Connection(Uis.InputBegan, function(Input, GameEvent)
		local SelectedKey = Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode or Input.UserInputType
		if not GameEvent and SelectedKey == Cfg.Key then
			if Cfg.Mode == "toggle" then
				Cfg.Active = not Cfg.Active;
				Cfg.Set(Cfg.Active)
			elseif Cfg.Mode == "hold" then
				Cfg.Set(true)
			end
		end
	end)
	Library:Connection(Uis.InputEnded, function(Input, GameEvent)
		if GameEvent then
			return
		end
		local SelectedKey = Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode or Input.UserInputType
		if SelectedKey == Cfg.Key and Cfg.Mode == "hold" then
			Cfg.Set(false)
		end
	end)
	Cfg.Set({
		mode = Cfg.Mode,
		active = Cfg.Active,
		key = Cfg.Key
	})
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	return setmetatable(Cfg, Library)
end
function Library:Dropdown(Options)
	local Parent = self.Holder
	local Cfg = {
		Name = Options.name or nil,
		Flag = Options.flag or tostring(Random(1, 9999999)),
		Items = Options.items or {
			"1",
			"2",
			"3"
		},
		Callback = Options.callback or function()
		end,
		Multi = Options.multi or false,
		Visible = Options.visible or true,
		Open = false,
		OptionInstances = {},
		MultiItems = {},
		Scrolling = Options.scrolling or false,
		Ignore = Options.ignore or nil,
	}
	Cfg.Default = Options.default or (Cfg.Multi and {
		Cfg.Items[1]
	}) or Cfg.Items[1] or nil
	local DLabel = Library:Create("TextLabel", {
		Parent = Parent,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Name = "dropdown",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local DMainText
	if Cfg.Name then
		local LC = Library:Create("Frame", {
			Parent = DLabel,
			Name = "left_components",
			BackgroundTransparency = 1,
			Position = Dim2(0, 2, 0, -1),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(0, 0, 0, 14),
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		DMainText = Library:Create("TextLabel", {
			Parent = LC,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = Cfg.Name,
			Name = "text",
			BackgroundTransparency = 1,
			Size = Dim2(0, 0, 1, -1),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.X,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:Create("UIStroke", {
			Parent = DMainText,
			LineJoinMode = Enum.LineJoinMode.Miter
		})
		Library:Create("UIListLayout", {
			Parent = LC,
			Padding = Dim(0, 5),
			Name = "_",
			FillDirection = Enum.FillDirection.Horizontal
		})
		local RC = Library:Create("Frame", {
			Parent = DLabel,
			Name = "right_components",
			Position = Dim2(1, -1, 0, 1),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(0, 0, 0, 12),
			BorderSizePixel = 0,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Cfg["RightHolder"] = RC
		Library:Create("UIListLayout", {
			Parent = RC,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = Dim(0, 4),
			Name = "list",
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	end
	local BC = Library:Create("Frame", {
		Parent = DLabel,
		Name = "bottom_components",
		Position = Dim2(0, 0, 0, Cfg.Name and 15 or 0),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 26, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local DBtn = Library:Create("TextButton", {
		Parent = BC,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -27, 1, 18),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline,
		Text = "",
		AutoButtonColor = false,
	})
	Library:ApplyTheme(DBtn, "Outline", "BackgroundColor3")
	Library:Hoverify(DLabel, DBtn)
	local DInline = Library:Create("Frame", {
		Parent = DBtn,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(DInline, "Inline", "BackgroundColor3")
	local DBg = Library:Create("Frame", {
		Parent = DInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(DBg, "Accent", "BackgroundColor3")
	local DContrast = Library:Create("Frame", {
		Parent = DBg,
		ZIndex = 2,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local PlusLabel = Library:Create("TextLabel", {
		Parent = DContrast,
		TextWrapped = true,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 2,
		Text = "+",
		Size = Dim2(1, -4, 1, 0),
		Position = Dim2(0, 0, 0, -1),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Right,
		FontFace = Library.Font,
		TextTruncate = Enum.TextTruncate.AtEnd,
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = PlusLabel,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	local SelectedText = Library:Create("TextLabel", {
		Parent = DContrast,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		ZIndex = 2,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "aa",
		Size = Dim2(1, -4, 1, 0),
		Position = Dim2(0, 4, 0, -1),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = SelectedText,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	local KYS = Library:Create("UIGradient", {
		Parent = DContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
    Library:ApplyTheme(KYS, "Contrast", "Color")
	Library:Create("UIGradient", {
		Parent = DBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	Library:Create("UIListLayout", {
		Parent = BC,
		Padding = Dim(0, 10),
		Name = "_",
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	local DHolderFrame = Library:Create("Frame", {
		Parent = Sgui,
		BorderColor3 = Rgb(0, 0, 0),
		BackgroundTransparency = 1,
		Position = Dim2(0, DBtn.AbsolutePosition.X + 1, 0, DBtn.AbsolutePosition.Y + 22),
		Size = Dim2(0, DBtn.AbsoluteSize.X, 0, Cfg.Scrolling and 180 or 0),
		BorderSizePixel = 0,
		AutomaticSize = Cfg.Scrolling and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
		BackgroundColor3 = Themes.Preset.Outline,
		Visible = false
	})
	local DHInline = Library:Create("Frame", {
		Parent = DHolderFrame,
		Size = Dim2(1, -2, 1, 2),
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(DHInline, "Inline", "BackgroundColor3")
	local DHBg
	if not Cfg.Scrolling then
		DHBg = Library:Create("Frame", {
			Parent = DHInline,
			BorderColor3 = Rgb(0, 0, 0),
			BackgroundTransparency = 1,
			Position = Dim2(0, 1, 0, 1),
			Size = Dim2(1, -2, 1, 1),
			ZIndex = 2,
			BorderSizePixel = 0,
			BackgroundColor3 = Themes.Preset.Accent
		})
	else
		DHBg = Library:Create("ScrollingFrame", {
			Parent = DHInline,
			BorderColor3 = Rgb(0, 0, 0),
			BackgroundTransparency = 1,
			MidImage = "rbxassetid://103468666327206",
			TopImage = "rbxassetid://103468666327206",
			BottomImage = "rbxassetid://103468666327206",
			Position = Dim2(0, 1, 0, 1),
			Size = Dim2(1, -2, 1, 1),
			ZIndex = 2,
			BorderSizePixel = 0,
			BackgroundColor3 = Themes.Preset.Accent,
			CanvasSize = Dim2(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = Themes.Preset.Accent
		})
		Library:ApplyTheme(DHBg, "Accent", "ScrollBarImageColor3")
	end
	Library:ApplyTheme(DHBg, "Accent", "BackgroundColor3")
	local DHContrast = Library:Create("Frame", {
		Parent = DHBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, -3),
		BorderSizePixel = 0,
		ZIndex = 2,
		BackgroundColor3 = Rgb(255, 255, 255),
		AutomaticSize = Cfg.Scrolling and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
	})
	Library:Create("UIPadding", {
		Parent = DHContrast,
		PaddingTop = Dim(0, 2),
		PaddingBottom = Dim(0, 2),
		PaddingLeft = Dim(0, 4)
	})
	local DHCGrad = Library:Create("UIGradient", {
		Parent = DHContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(DHCGrad, "Contrast", "Color")
	Library:Create("UIListLayout", {
		Parent = DHContrast,
		Padding = Dim(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIGradient", {
		Parent = DHBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local DStroke = Library:Create("UIStroke", {
		Parent = DHInline,
		Color = Themes.Preset.Outline,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	Library:ApplyTheme(DStroke, "Outline", "Color")
	function Cfg.SetElementVisible(Bool)
		DLabel.Visible = Bool
		if DMainText then
			DMainText.Visible = Bool
		end
	end
	function Cfg.SetVisible(Bool)
		Library.CurrentElementOpen = Cfg.Ignore or Cfg
		DHolderFrame.Visible = Bool
		PlusLabel.Text = Bool and "-" or "+"
		PlusLabel.TextSize = Bool and 12 or 8
		if Bool then
			if Library.CurrentElementOpen and Library.CurrentElementOpen ~= Cfg and not Cfg.Ignore then
				Library.CurrentElementOpen.SetVisible(false)
				Library.CurrentElementOpen.Open = false
			end
			DHolderFrame.Size = Dim2(0, DBtn.AbsoluteSize.X, 0, DHolderFrame.Size.Y.Offset)
			DHolderFrame.Position = Dim2(0, DBtn.AbsolutePosition.X + 1, 0, DBtn.AbsolutePosition.Y + 22)
		end
	end
	function Cfg.Set(Value)
		local Selected = {}
		local IsTable = type(Value) == "table"
		for _, OBtn in next, Cfg.OptionInstances do
			if OBtn.Text == Value or (IsTable and Find(Value, OBtn.Text)) then
				Insert(Selected, OBtn.Text);
				Cfg.MultiItems = Selected
				OBtn.TextColor3 = Themes.Preset.Accent
			else
				OBtn.TextColor3 = Themes.Preset.Text
			end
		end
		SelectedText.Text = IsTable and Concat(Selected, ", ") or Selected[1] or "nun"
		Flags[Cfg.Flag] = IsTable and Selected or Selected[1]
		Cfg.Callback(Flags[Cfg.Flag])
	end
	function Cfg:RefreshOptions(RefreshedList)
		for _, V in next, Cfg.OptionInstances do
			V:Destroy()
		end
		Cfg.OptionInstances = {}
		for _, OptionText in next, RefreshedList do
			local OBtn = Library:Create("TextButton", {
				Parent = DHContrast,
				FontFace = Library.Font,
				TextColor3 = Themes.Preset.Text,
				BorderColor3 = Rgb(0, 0, 0),
				Size = Dim2(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 2,
				Text = OptionText,
				BackgroundColor3 = Rgb(255, 255, 255)
			})
			Library:ApplyTheme(OBtn, "Accent", "TextColor3")
			Library:Create("UIStroke", {
				Parent = OBtn,
				LineJoinMode = Enum.LineJoinMode.Miter
			})
			Insert(Cfg.OptionInstances, OBtn)
			OBtn.MouseButton1Down:Connect(function()
				if Cfg.Multi then
					local Idx = Find(Cfg.MultiItems, OBtn.Text)
					if Idx then
						Remove(Cfg.MultiItems, Idx)
					else
						Insert(Cfg.MultiItems, OBtn.Text)
					end
					Cfg.Set(Cfg.MultiItems)
				else
					Cfg.SetVisible(false);
					Cfg.Open = false;
					Cfg.Set(OBtn.Text)
				end
			end)
		end
	end
	DBtn.MouseButton1Click:Connect(function()
		Cfg.Open = not Cfg.Open;
		Cfg.SetVisible(Cfg.Open)
	end)
	Cfg:RefreshOptions(Cfg.Items)
	Cfg.Set(Cfg.Default)
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	Cfg.SetElementVisible(Cfg.Visible)
	return setmetatable(Cfg, Library)
end
function Library:List(Options)
	local Cfg = {
		Callback = Options and Options.callback or function()
		end,
		Scale = Options and Options.size or 232,
		Items = Options and Options.items or {
			"1",
			"2",
			"3"
		},
		Visible = Options and Options.visible or true,
		OptionInstances = {},
		CurrentInstance = nil,
		Flag = Options and Options.flag or "flag",
	}
	local LHolder = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIPadding", {
		Parent = LHolder,
		PaddingLeft = Dim(0, 1)
	})
	Library:Create("UIStroke", {
		Parent = LHolder
	})
	local LBC = Library:Create("Frame", {
		Parent = LHolder,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 26, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIListLayout", {
		Parent = LBC,
		Padding = Dim(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	local LFrame = Library:Create("Frame", {
		Parent = LBC,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -27, 1, Cfg.Scale),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(LFrame, "Outline", "BackgroundColor3")
	local LInline = Library:Create("Frame", {
		Parent = LFrame,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(LInline, "Inline", "BackgroundColor3")
	local LBg = Library:Create("Frame", {
		Parent = LInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(LBg, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = LBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local LContrast = Library:Create("Frame", {
		Parent = LBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local OMGFUCKYOU = Library:Create("UIGradient", {
		Parent = LContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
    Library:ApplyTheme(OMGFUCKYOU, "Contrast", "Color")
	local LScroll = Library:Create("ScrollingFrame", {
		Parent = LContrast,
		ScrollBarImageColor3 = Themes.Preset.Accent,
		Active = true,
		MidImage = "rbxassetid://103468666327206",
		TopImage = "rbxassetid://103468666327206",
		BottomImage = "rbxassetid://103468666327206",
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 2,
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 1, 0),
		BackgroundColor3 = Rgb(255, 255, 255),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = Dim2(0, 0, 0, 0)
	})
	Library:ApplyTheme(LScroll, "Accent", "ScrollBarImageColor3")
	Library:Create("UIPadding", {
		Parent = LScroll,
		PaddingBottom = Dim(0, 4),
		PaddingTop = Dim(0, 4)
	})
	Library:Create("UIListLayout", {
		Parent = LScroll,
		Padding = Dim(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	function Cfg.RenderOption(Text)
		local Btn = Library:Create("TextButton", {
			Parent = LScroll,
			Text = tostring(Text),
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			BackgroundTransparency = 1,
			Size = Dim2(1, 0, 0, 0),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:ApplyTheme(Btn, "Accent", "TextColor3")
		Library:Create("UIStroke", {
			Parent = Btn
		})
		return Btn
	end
	function Cfg.SetElementVisible(Bool)
		LHolder.Visible = Bool
	end
	function Cfg.RefreshOptions(NewOptions)
		if type(NewOptions) == "function" then
			return
		end
		for _, V in next, Cfg.OptionInstances do
			V:Destroy()
		end
		Cfg.OptionInstances = {}
		for _, Option in next, NewOptions do
			local Btn = Cfg.RenderOption(Option)
			Insert(Cfg.OptionInstances, Btn)
			Btn.MouseButton1Click:Connect(function()
				if Cfg.CurrentInstance and Cfg.CurrentInstance ~= Btn then
					Cfg.CurrentInstance.TextColor3 = Themes.Preset.Text
				end
				Cfg.CurrentInstance = Btn
				Btn.TextColor3 = Themes.Preset.Accent
				Flags[Cfg.Flag] = Btn.Text
				Cfg.Callback(Btn.Text)
			end)
		end
	end
	function Cfg.FilterOptions(Text)
		for _, V in next, Cfg.OptionInstances do
			V.Visible = string.find(V.Text, Text) ~= nil
		end
	end
	function Cfg.Set(Value)
		for _, Btn in next, Cfg.OptionInstances do
			Btn.TextColor3 = Btn.Text == Value and Themes.Preset.Accent or Themes.Preset.Text
		end
		Flags[Cfg.Flag] = Value
		Cfg.Callback(Value)
	end
	Cfg.RefreshOptions(Cfg.Items)
	Cfg.SetElementVisible(Cfg.Visible)
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	return setmetatable(Cfg, Library)
end
function Library:Textbox(Options)
	local Cfg = {
		Placeholder = Options.placeholder or Options.placeholdertext or "type here...",
		Default = Options.default,
		Flag = Options.flag or "flag",
		Callback = Options.callback or function()
		end,
		Visible = Options.visible or true,
	}
	local TbHolder = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIPadding", {
		Parent = TbHolder,
		PaddingLeft = Dim(0, 1)
	})
	Library:Create("UIStroke", {
		Parent = TbHolder
	})
	local TbFrame = Library:Create("Frame", {
		Parent = TbHolder,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -27, 0, 18),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:Hoverify(TbHolder, TbFrame)
	Library:ApplyTheme(TbFrame, "Outline", "BackgroundColor3")
	local TbInline = Library:Create("Frame", {
		Parent = TbFrame,
		Position = Dim2(0, 1, 0, 1),
		ZIndex = 2,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(TbInline, "Inline", "BackgroundColor3")
	local TbBg = Library:Create("Frame", {
		Parent = TbInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 2,
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(TbBg, "Accent", "BackgroundColor3")
	local TextBoxInput = Library:Create("TextBox", {
		Parent = TbBg,
		CursorPosition = -1,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		TextWrapped = true,
		BackgroundTransparency = 1,
		TextTruncate = Enum.TextTruncate.SplitWord,
		PlaceholderText = "Type here...",
		ClearTextOnFocus = false,
		ZIndex = 3,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = TextBoxInput
	})
	local TbOverlay = Library:Create("TextButton", {
		Parent = TbBg,
		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
		TextColor3 = Rgb(0, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		TextSize = 14,
		ZIndex = 2,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local TbGrad = Library:Create("UIGradient", {
		Parent = TbOverlay,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(TbGrad, "Contrast", "Color")
	Library:Create("UIListLayout", {
		Parent = TbHolder,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	TextBoxInput:GetPropertyChangedSignal("Text"):Connect(function()
		Flags[Cfg.Flag] = TextBoxInput.Text
		Cfg.Callback(TextBoxInput.Text)
	end)
	function Cfg.SetElementVisible(Bool)
		TbHolder.Visible = Bool
	end
	function Cfg.Set(Text)
		Flags[Cfg.Flag] = Text;
		TextBoxInput.Text = Text;
		Cfg.Callback(Text)
	end
	if Cfg.Default then
		Cfg.Set(Cfg.Default)
	end
	Cfg.SetElementVisible(Cfg.Visible)
	Library.ConfigFlags[Cfg.Flag] = Cfg.Set
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	return setmetatable(Cfg, Library)
end
function Library:ButtonHolder(Options)
	local Cfg = {
		Flag = Options.flag or "hi",
		Visible = Options.visible or true
	}
	local BHFrame = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255),
	})
	self.CurrentHolder = BHFrame
	Library:Create("UIStroke", {
		Parent = BHFrame
	})
	Library:Create("UIListLayout", {
		Parent = BHFrame,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	function Cfg.SetElementVisible(Bool)
		BHFrame.Visible = Bool
	end
	Cfg.SetElementVisible(Cfg.Visible)
	Library.VisibleFlags[Cfg.Flag] = Cfg.SetElementVisible
	return setmetatable(Cfg, Library)
end
function Library:Button(Options)
	local Cfg = {
		Callback = Options.callback or function()
		end,
		Name = Options.text or Options.name or "Button"
	}
	local BFrame = Library:Create("TextButton", {
		Parent = self.CurrentHolder,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -27, 0, 18),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline,
		Text = ""
	})
	Library:Hoverify(BFrame, BFrame)
	Library:ApplyTheme(BFrame, "Outline", "BackgroundColor3")
	local BInline = Library:Create("Frame", {
		Parent = BFrame,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(BInline, "Inline", "BackgroundColor3")
	local BBg = Library:Create("Frame", {
		Parent = BInline,
		ZIndex = 2,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(BBg, "Accent", "BackgroundColor3")
	local BBgGrad = Library:Create("UIGradient", {
		Parent = BBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	Library:ApplyTheme(BBgGrad, "Contrast", "Color")
	local BContrast = Library:Create("Frame", {
		Parent = BBg,
		ZIndex = 2,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local BCGrad = Library:Create("UIGradient", {
		Parent = BContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(BCGrad, "Contrast", "Color")
	local BLabel = Library:Create("TextLabel", {
		Parent = BContrast,
		TextWrapped = true,
		ZIndex = 2,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		Size = Dim2(1, -4, 1, 0),
		Position = Dim2(0, 4, 0, -1),
		BackgroundTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		BorderSizePixel = 0,
		FontFace = Library.Font,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = BLabel,
		LineJoinMode = Enum.LineJoinMode.Miter
	})
	BFrame.MouseButton1Click:Connect(function()
		Cfg.Callback()
	end)
	return setmetatable(Cfg, Library)
end
function Library:Label(Options)
	local Cfg = {
		Name = Options.text or Options.name or "Label"
	}
	local LFrame = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIStroke", {
		Parent = LFrame
	})
	local LC = Library:Create("Frame", {
		Parent = LFrame,
		BackgroundTransparency = 1,
		Position = Dim2(0, 2, 0, -1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 0, 0, 14),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local LText = Library:Create("TextLabel", {
		Parent = LC,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = Cfg.Name,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local RC = Library:Create("Frame", {
		Parent = LFrame,
		Name = "right_components",
		Position = Dim2(1, -1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 0, 0, 12),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Cfg.RightHolder = RC
	Library:Create("UIListLayout", {
		Parent = RC,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		Padding = Dim(0, 4),
		Name = "list",
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIStroke", {
		Parent = LText
	})
	function Cfg.Set(Text)
		LText.Text = Text
	end
	return setmetatable(Cfg, Library)
end
function Library:Playerlist(Options)
	local Cfg = {
		Callback = Options.callback or function()
		end,
		Labels = {
			Name = nil,
			Display = nil,
			Uid = nil
		}
	}
	local SelectedButton
	local Patterns = {
		["Priority"] = Rgb(255, 255, 0),
		["Enemy"] = Rgb(255, 0, 0),
		["Neutral"] = Themes.Preset.Text,
		["Friendly"] = Rgb(0, 255, 255)
	}
	local PLHolder = Library:Create("TextLabel", {
		Parent = self.Holder,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "",
		ZIndex = 2,
		Size = Dim2(1, -8, 0, 12),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIPadding", {
		Parent = PLHolder,
		PaddingBottom = Dim(0, -2),
		PaddingLeft = Dim(0, 1)
	})
	Library:Create("UIStroke", {
		Parent = PLHolder
	})
	local PLBottom = Library:Create("Frame", {
		Parent = PLHolder,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 26, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIListLayout", {
		Parent = PLBottom,
		Padding = Dim(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	local PLFrame = Library:Create("Frame", {
		Parent = PLBottom,
		Position = Dim2(0, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -27, 1, 232),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(PLFrame, "Outline", "BackgroundColor3")
	local PLInline = Library:Create("Frame", {
		Parent = PLFrame,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(PLInline, "Inline", "BackgroundColor3")
	local PLBg = Library:Create("Frame", {
		Parent = PLInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:Create("UIGradient", {
		Parent = PLBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local PLContrast = Library:Create("Frame", {
		Parent = PLBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	local OMGIHATEYOU = Library:Create("UIGradient", {
		Parent = PLContrast,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
    Library:ApplyTheme(OMGIHATEYOU, "Contrast", "Color")
	local PLScroll = Library:Create("ScrollingFrame", {
		Parent = PLContrast,
		ScrollBarImageColor3 = Themes.Preset.Accent,
		Active = true,
		MidImage = "rbxassetid://103468666327206",
		TopImage = "rbxassetid://103468666327206",
		BottomImage = "rbxassetid://103468666327206",
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 2,
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 1, 0),
		BackgroundColor3 = Rgb(255, 255, 255),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = Dim2(0, 0, 0, 0)
	})
	Library:ApplyTheme(PLScroll, "Accent", "ScrollBarImageColor3")
	Library:Create("UIPadding", {
		Parent = PLScroll,
		PaddingTop = Dim(0, 4),
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	Library:Create("UIListLayout", {
		Parent = PLScroll,
		Padding = Dim(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	function Cfg.CreatePlayer(Player)
		Library.PlayerlistData[tostring(Player)] = {}
		local Path = Library.PlayerlistData[tostring(Player)]
		local PlayerBtn = Library:Create("TextButton", {
			Parent = PLScroll,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = "",
			BackgroundTransparency = 1,
			Size = Dim2(1, 0, 0, 0),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		local PlayerNameLabel = Library:Create("TextLabel", {
			Parent = PlayerBtn,
			FontFace = Library.Font,
			TextColor3 = Themes.Preset.Text,
			BorderColor3 = Rgb(0, 0, 0),
			Text = tostring(Player),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			LayoutOrder = -100,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		Library:ApplyTheme(PlayerNameLabel, "Text", "TextColor3")
		Library:ApplyTheme(PlayerNameLabel, "Accent", "TextColor3")
		local PriorityLabel = Library:Create("TextLabel", {
			Parent = PlayerBtn,
			FontFace = Library.Font,
			TextColor3 = tostring(Player) ~= Lp.Name and Themes.Preset.Text or Rgb(0, 0, 255),
			BorderColor3 = Rgb(0, 0, 0),
			Text = tostring(Player) ~= Lp.Name and "Neutral" or "LocalPlayer",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Rgb(255, 255, 255)
		})
		local Divider = Library:Create("Frame", {
			Parent = PriorityLabel,
			Position = Dim2(0, -10, 0, 0),
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(0, 1, 0, 12),
			BorderSizePixel = 0,
			BackgroundColor3 = Themes.Preset.Outline
		})
		Library:ApplyTheme(Divider, "Outline", "BackgroundColor3")
		Library:Create("UIListLayout", {
			Parent = PlayerBtn,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalFlex = Enum.UIFlexAlignment.Fill
		})
		Library:Create("UIPadding", {
			Parent = PlayerBtn,
			PaddingRight = Dim(0, 2),
			PaddingLeft = Dim(0, 2)
		})
		local LineSep = Library:Create("Frame", {
			Parent = PLScroll,
			BorderColor3 = Rgb(0, 0, 0),
			Size = Dim2(1, 0, 0, 1),
			BorderSizePixel = 0,
			BackgroundColor3 = Themes.Preset.Outline
		})
		Library:ApplyTheme(LineSep, "Outline", "BackgroundColor3")
		Path.Instance = PlayerBtn
		Path.Line = LineSep
		Path.Priority = "Neutral"
		Path.PriorityText = PriorityLabel
		PlayerBtn.MouseButton1Click:Connect(function()
			if PlayerNameLabel.Text == Lp.Name then
				return
			end
			if SelectedButton then
				SelectedButton.TextColor3 = Themes.Preset.Text
				SelectedButton = nil
			end
			SelectedButton = PlayerNameLabel
			PlayerNameLabel.TextColor3 = Themes.Preset.Accent
			Library.SelectedPlayer = PlayerNameLabel.Text
			Library.ConfigFlags["PlayerlistDropdown"](Path.PriorityText.Text)
			if Cfg.Labels.Name then
				Cfg.Labels.Name.Set("User: " .. PlayerNameLabel.Text)
				Cfg.Labels.Display.Set("DisplayName: " .. Players[PlayerNameLabel.Text].DisplayName)
				Cfg.Labels.Uid.Set("User Id: " .. Players[PlayerNameLabel.Text].UserId)
			end
		end)
		return Path
	end
	function Cfg.Search(Text)
		for _, Player in next, Players:GetPlayers() do
			local Name = tostring(Player)
			local Path = Library.PlayerlistData[Name]
			if Path then
				local Match = string.lower(Name):match(string.lower(Text)) and true or false
				Path.Instance.Visible = Match
				Path.Line.Visible = Match
			end
		end
	end
	function Cfg.RemovePlayer(Player)
		local Path = Library.PlayerlistData[tostring(Player)]
		Path.Instance:Destroy()
		Path.Line:Destroy()
		Library.PlayerlistData[tostring(Player)] = nil
	end
	function Library.Prioritize(Text)
		if not Library.SelectedPlayer then
			return
		end
		local Path = Library.PlayerlistData[Library.SelectedPlayer]
		Path.PriorityText.Text = Text
		Path.PriorityText.TextColor3 = Patterns[Text]
		Path.Priority = Text
	end
	function Library.GetPriority(Player)
		local Path = Library.PlayerlistData[tostring(Player)]
		if Path then
			return Path.Priority
		end
	end
	Players.PlayerAdded:Connect(Cfg.CreatePlayer)
	Players.PlayerRemoving:Connect(Cfg.RemovePlayer)
	for _, Player in Players:GetPlayers() do
		local PlayerObj = Cfg.CreatePlayer(Player.Name)
		Insert(Library.PlayerlistData, PlayerObj)
	end
	self:Textbox({
		name = "Search",
		callback = function(Txt)
			Cfg.Search(Txt)
		end
	})
	Cfg.Labels.Name = self:Label({
		name = "Name: ??"
	})
	Cfg.Labels.Display = self:Label({
		name = "Display Name: ??"
	})
	Cfg.Labels.Uid = self:Label({
		name = "User Id: ??"
	})
	return setmetatable(Cfg, Library)
end
function Library:Window(Properties)
	local Window = {
		Opened = true
	}
	local Opened = {}
	local DockOutline
	local Blur = Library:Create("BlurEffect", {
		Parent = Lighting,
		Enabled = true,
		Size = 15
	})
	Library.Cache = Library:Create("ScreenGui", {
		Enabled = false,
		Parent = gethui(),
		Name = ""
	})
	function Window.SetMenuVisibility(Bool)
		Window.Opened = Bool
		if Bool then
			for _, Gui in Opened do
				Gui.Enabled = true
			end
			Opened = {}
		else
			for _, Gui in Library.Guis do
				if Gui.Enabled then
					Gui.Enabled = false;
					table.insert(Opened, Gui)
				end
			end
		end
		Library:Tween(Blur, {
			Size = Bool and (Flags["BlurSize"] or 15) or 0
		})
		DockOutline.Visible = Bool
		Sgui.Enabled = true;
		NotifHolder.Enabled = true;
		TooltipSgui.Enabled = true
		Library.Cache.Enabled = false
		for _, Tooltip in TooltipSgui:GetChildren() do
			Tooltip.Visible = false
		end
		if Library.CurrentElementOpen then
			Library.CurrentElementOpen.SetVisible(false)
			Library.CurrentElementOpen.Open = false
			Library.CurrentElementOpen = nil
		end
	end
	DockOutline = Library:Create("Frame", {
		Parent = Sgui,
		Visible = true,
		BorderColor3 = Rgb(0, 0, 0),
		AnchorPoint = Vec2(0.5, 0),
		Position = Dim2(0.5, 0, 0, 20),
		Size = Dim2(0, 157, 0, 39),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(DockOutline, "Outline", "BackgroundColor3")
	DockOutline.Position = Dim2(0, DockOutline.AbsolutePosition.X, 0, DockOutline.AbsolutePosition.Y)
	DockOutline.AnchorPoint = Vec2(0, 0)
	Library:Draggify(DockOutline)
	local DockInline = Library:Create("Frame", {
		Parent = DockOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(DockInline, "Inline", "BackgroundColor3")
	local DockHolder = Library:Create("Frame", {
		Parent = DockInline,
		Size = Dim2(1, -2, 1, -2),
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Themes.Preset.Outline,
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:ApplyTheme(DockHolder, "Outline", "BackgroundColor3")
	local DockAccent = Library:Create("Frame", {
		Parent = DockHolder,
		Size = Dim2(1, 0, 0, 2),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(DockAccent, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = DockAccent,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	local BtnHolder = Library:Create("Frame", {
		Parent = DockHolder,
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 1, 0),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library.DockHolder = BtnHolder
	Library:Create("UIListLayout", {
		Parent = BtnHolder,
		Padding = Dim(0, 5),
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIPadding", {
		Parent = BtnHolder,
		PaddingTop = Dim(0, 6),
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	local ThisONeAGAINNIGGAOMG = Library:Create("UIGradient", {
		Parent = DockHolder,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
    Library:ApplyTheme(ThisONeAGAINNIGGAOMG, "Contrast", "Color")
	local KbListOutline = Library:Create("Frame", {
		Parent = Sgui,
		Visible = false,
		Active = true,
		Draggable = true,
		Position = Dim2(0, 50, 0, 200),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(0, 182, 0, 25),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(KbListOutline, "Outline", "BackgroundColor3")
	Library:Draggify(KbListOutline)
	Library:MakeResizable(KbListOutline)
	Library.KeybindListFrame = KbListOutline
	local KbListInline = Library:Create("Frame", {
		Parent = KbListOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(KbListInline, "Inline", "BackgroundColor3")
	local KbListBg = Library:Create("Frame", {
		Parent = KbListInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIGradient", {
		Parent = KbListBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Themes.Preset.HighContrast),
			RgbKey(1, Themes.Preset.LowContrast)
		}
	})
	local KbAccentBar = Library:Create("Frame", {
		Parent = KbListBg,
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Accent
	})
	Library:ApplyTheme(KbAccentBar, "Accent", "BackgroundColor3")
	Library:Create("UIGradient", {
		Parent = KbAccentBar,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(255, 255, 255)),
			RgbKey(1, Rgb(167, 167, 167))
		}
	})
	Library:Create("TextLabel", {
		Parent = KbListBg,
		FontFace = Library.Font,
		TextColor3 = Themes.Preset.Text,
		BorderColor3 = Rgb(0, 0, 0),
		Text = "Keybinds",
		BackgroundTransparency = 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = Dim2(1, 0, 1, 0),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Themes.Preset.Text
	})
	local KbTextHolder = Library:Create("Frame", {
		Parent = KbListBg,
		Position = Dim2(0, -2, 1, 1),
		Size = Dim2(1, 4, 0, 0),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(KbTextHolder, "Outline", "BackgroundColor3")
	local KbListInner = Library:Create("Frame", {
		Parent = KbTextHolder,
		Size = Dim2(1, -2, 1, -2),
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(KbListInner, "Inline", "BackgroundColor3")
	local KbListBg2 = Library:Create("Frame", {
		Parent = KbListInner,
		Size = Dim2(1, -2, 1, -2),
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library.KeybindList = KbListBg2
	Library:Create("UIGradient", {
		Parent = KbListBg2,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Themes.Preset.HighContrast),
			RgbKey(1, Themes.Preset.LowContrast)
		}
	})
	Library:Create("UIListLayout", {
		Parent = KbListBg2,
		Padding = Dim(0, -1),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	Library:Create("UIPadding", {
		Parent = KbListBg2,
		PaddingBottom = Dim(0, 4),
		PaddingLeft = Dim(0, 5)
	})
	local MainWindow = Library:Panel({
		name = Properties and Properties.name or "Atlanta | ",
		size = Dim2(0, 604, 0, 628),
		position = Dim2(0, (Camera.ViewportSize.X / 2) - 302 - 96, 0, (Camera.ViewportSize.Y / 2) - 421 - 12),
		image = "rbxassetid://98823308062942",
	})
	local MWItems = MainWindow.Items
	Window["TabHolder"] = Library:Create("Frame", {
		Parent = MWItems.Holder,
		BackgroundTransparency = 1,
		Size = Dim2(1, 0, 0, 22),
		BorderColor3 = Rgb(0, 0, 0),
		ZIndex = 5,
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library:Create("UIListLayout", {
		Parent = Window["TabHolder"],
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = Dim(0, 2),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	local SecHolder = Library:Create("Frame", {
		Parent = MWItems.Holder,
		BackgroundTransparency = 1,
		Position = Dim2(0, -1, 0, 19),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, -22),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Window["SectionHolder"] = SecHolder
	local SecOutline = Library:Create("Frame", {
		Parent = SecHolder,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, 0, 1, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Outline
	})
	Library:ApplyTheme(SecOutline, "Outline", "BackgroundColor3")
	local SecInline = Library:Create("Frame", {
		Parent = SecOutline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Themes.Preset.Inline
	})
	Library:ApplyTheme(SecInline, "Inline", "BackgroundColor3")
	local SecBg = Library:Create("Frame", {
		Parent = SecInline,
		Position = Dim2(0, 1, 0, 1),
		BorderColor3 = Rgb(0, 0, 0),
		Size = Dim2(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Rgb(255, 255, 255)
	})
	Library.SectionHolder = SecBg
	Library:Create("UIPadding", {
		Parent = SecBg,
		PaddingTop = Dim(0, 4),
		PaddingBottom = Dim(0, 4),
		PaddingRight = Dim(0, 4),
		PaddingLeft = Dim(0, 4)
	})
	local SecGrad = Library:Create("UIGradient", {
		Parent = SecBg,
		Rotation = 90,
		Color = RgbSeq{
			RgbKey(0, Rgb(41, 41, 55)),
			RgbKey(1, Rgb(35, 35, 47))
		}
	})
	Library:ApplyTheme(SecGrad, "Contrast", "Color")
	Library:MakeResizable(MWItems.MainHolder)
	local StylePanel = Library:Panel({
		name = "Style",
		anchor_point = Vec2(0, 0),
		size = Dim2(0, 394, 0, 464),
		position = Dim2(0, MWItems.MainHolder.AbsolutePosition.X + MWItems.MainHolder.AbsoluteSize.X + 2, 0, MWItems.MainHolder.AbsolutePosition.Y),
		image = "rbxassetid://115194686863276",
	})
	local Watermark = Library:Watermark({
		default = os.date("Atlanta |  - %b %d %Y - %H:%M:%S")
	})
	task.spawn(function()
		while task.wait(1) do
			Watermark.ChangeText(os.date("Atlanta - Beta - %b %d %Y - %H:%M:%S"))
		end
	end)
	local SItems = StylePanel.Items
	local SCol = setmetatable(SItems, Library):Column()
	local SSec = SCol:Section({
		name = "Theme"
	})
	SSec:Label({
		name = "Accent"
	}):Colorpicker({
		name = "Accent",
		color = Themes.Preset.Accent,
		flag = "Accent",
		callback = function(C)
			Library:UpdateTheme("Accent", C)
		end
	})
	SSec:Label({
		name = "Contrast"
	})
		:Colorpicker({
		name = "Low",
		color = Themes.Preset.LowContrast,
		flag = "LowContrast",
		callback = function()
			if Flags["HighContrast"] and Flags["LowContrast"] then
				Library:UpdateTheme("Contrast", RgbSeq{
					RgbKey(0, Flags["LowContrast"].Color),
					RgbKey(1, Flags["HighContrast"].Color)
				})
			end
			Library:UpdateTheme("LowContrast", Flags["LowContrast"].Color)
		end
	})
		:Colorpicker({
		name = "High",
		color = Themes.Preset.HighContrast,
		flag = "HighContrast",
		callback = function()
			Library:UpdateTheme("Contrast", RgbSeq{
				RgbKey(0, Flags["LowContrast"].Color),
				RgbKey(1, Flags["HighContrast"].Color)
			})
			Library:UpdateTheme("HighContrast", Flags["HighContrast"].Color)
		end
	})
	SSec:Label({
		name = "Inline"
	}):Colorpicker({
		name = "Inline",
		color = Themes.Preset.Inline,
		flag = "Inline",
		callback = function(C)
			Library:UpdateTheme("Inline", C)
		end
	})
	SSec:Label({
		name = "Outline"
	}):Colorpicker({
		name = "Outline",
		color = Themes.Preset.Outline,
		flag = "Outline",
		callback = function(C)
			Library:UpdateTheme("Outline", C)
		end
	})
	SSec:Label({
		name = "Text Color"
	})
		:Colorpicker({
		name = "Main",
		color = Themes.Preset.Text,
		flag = "TextMain",
		callback = function(C)
			Library:UpdateTheme("Text", C)
		end
	})
		:Colorpicker({
		name = "Outline",
		color = Themes.Preset.TextOutline,
		flag = "TextOutline",
		callback = function(C)
			Library:UpdateTheme("TextOutline", C)
		end
	})
	SSec:Label({
		name = "Glow"
	}):Colorpicker({
		name = "Glow",
		color = Themes.Preset.Glow,
		flag = "Glow",
		callback = function(C)
			Library:UpdateTheme("Glow", C)
		end
	})
	SSec:Slider({
		name = "Blur Size",
		flag = "BlurSize",
		min = 0,
		max = 56,
		default = 15,
		interval = 1,
		callback = function(I)
			if Window.Opened then
				Blur.Size = I
			end
		end
	})
	local OtherSec = SCol:Section({
		name = "Other"
	})
	OtherSec:Label({
		name = "UI Bind"
	}):Keybind({
		callback = Window.SetMenuVisibility,
		key = Enum.KeyCode.Insert
	})
	OtherSec:Toggle({
		name = "Keybind List",
		flag = "KeybindList",
		callback = function(B)
			Library.KeybindListFrame.Visible = B
		end
	})
	OtherSec:Toggle({
		name = "Watermark",
		flag = "ShowWatermark",
		callback = function(B)
			Watermark.SetVisible(B)
		end
	})
	OtherSec:ButtonHolder({})
	OtherSec:Button({
		name = "Copy JobId",
		callback = function()
			setclipboard(game.JobId)
		end
	})
	OtherSec:ButtonHolder({})
	OtherSec:Button({
		name = "Copy GameID",
		callback = function()
			setclipboard(game.GameId)
		end
	})
	OtherSec:ButtonHolder({})
	OtherSec:Button({
		name = "Copy Join Script",
		callback = function()
			setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ',"' .. game.JobId .. '",game.Players.LocalPlayer)')
		end
	})
	OtherSec:ButtonHolder({})
	OtherSec:Button({
		name = "Rejoin",
		callback = function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Lp)
		end
	})
	OtherSec:ButtonHolder({})
	OtherSec:Button({
		name = "Join New Server",
		callback = function()
			local ApiReq = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
			local Data = ApiReq.data[Random(1, #ApiReq.data)]
			if Data.playing <= Flags["MaxPlayers"] then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Data.id)
			end
		end
	})
	OtherSec:Slider({
		name = "Max Players",
		flag = "MaxPlayers",
		min = 0,
		max = 40,
		default = 15,
		interval = 1
	})
	local CfgPanel = Library:Panel({
		name = "Configurations",
		size = Dim2(0, 324, 0, 410),
		position = Dim2(0, SItems.MainHolder.AbsolutePosition.X + SItems.MainHolder.AbsoluteSize.X + 2, 0, SItems.MainHolder.AbsolutePosition.Y),
		image = "rbxassetid://105199726008012",
	})
	local CItems = CfgPanel.Items
	getgenv().LoadConfig = function(Name)
		Library:LoadConfig(readfile(Library.Directory .. "/configs/" .. Name .. ".cfg"))
	end
	local CCfg = setmetatable(CItems, Library):Column()
	local CSec = CCfg:Section({
		name = "Options"
	})
	ConfigHolder = CSec:List({
		flag = "ConfigNameList"
	})
	CSec:Textbox({
		flag = "ConfigNameTextBox"
	})
	CSec:ButtonHolder({})
	CSec:Button({
		name = "Create",
		callback = function()
			writefile(Library.Directory .. "/configs/" .. Flags["ConfigNameTextBox"] .. ".cfg", Library:GetConfig())
			Library:ConfigListUpdate()
		end
	})
	CSec:Button({
		name = "Delete",
		callback = function()
			delfile(Library.Directory .. "/configs/" .. Flags["ConfigNameList"] .. ".cfg")
			Library:ConfigListUpdate()
		end
	})
	CSec:ButtonHolder({})
	CSec:Button({
		name = "Load",
		callback = function()
			Library:LoadConfig(readfile(Library.Directory .. "/configs/" .. Flags["ConfigNameList"] .. ".cfg"))
			Library:Notification({
				text = "Loaded Config: " .. Flags["ConfigNameList"],
				time = 3
			})
		end
	})
	CSec:Button({
		name = "Save",
		callback = function()
			writefile(Library.Directory .. "/configs/" .. Flags["ConfigNameList"] .. ".cfg", Library:GetConfig())
			Library:ConfigListUpdate()
			Library:Notification({
				text = "Saved Config: " .. Flags["ConfigNameList"],
				time = 3
			})
		end
	})
	CSec:ButtonHolder({})
	CSec:Button({
		name = "Refresh Configs",
		callback = function()
			Library:ConfigListUpdate()
		end
	})
	CSec:ButtonHolder({})
	CSec:Button({
		name = "Unload Config",
		callback = function()
			Library:LoadConfig(Library.OldConfig)
		end
	})
	CSec:Button({
		name = "Unload Menu",
		callback = function()
			Library:LoadConfig(Library.OldConfig)
			for _, Gui in Library.Guis do
				Gui:Destroy()
			end
			for _, Conn in Library.Connections do
				Conn:Disconnect()
			end
			Blur:Destroy()
		end
	})
	local EspPanel = Library:Panel({
		name = "ESP Preview",
		anchor_point = Vec2(0, 0),
		size = Dim2(0, 300, 0, 325),
		position = Dim2(0, StylePanel.Items.MainHolder.AbsolutePosition.X, 0, StylePanel.Items.MainHolder.AbsolutePosition.Y + StylePanel.Items.MainHolder.AbsoluteSize.Y + 2),
		image = "rbxassetid://77684377836328",
	})
	local EItems = EspPanel.Items
	local ECol = setmetatable(EItems, Library):Column()
	Window.EspSection = ECol:Section({
		name = "Main"
	})
	local PLPanel = Library:Panel({
		name = "Playerlist",
		anchor_point = Vec2(0, 0),
		size = Dim2(0, 529, 0, 445),
		position = Dim2(0, MWItems.MainHolder.AbsolutePosition.X - 531, 0, MWItems.MainHolder.AbsolutePosition.Y),
		image = "rbxassetid://107070078834415",
	})
	local PLItems = PLPanel.Items
	local PLCol = setmetatable(PLItems, Library):Column()
	local PLSec = PLCol:Section({
		name = "Playerlist"
	})
	PLSec:Playerlist({})
	PLSec:Dropdown({
		name = "Priority",
		items = {
			"Enemy",
			"Priority",
			"Neutral",
			"Friendly"
		},
		default = "Neutral",
		flag = "PlayerlistDropdown",
		callback = function(Text)
			Library.Prioritize(Text)
		end
	})
	return setmetatable(Window, Library)
end

return Library, Themes
