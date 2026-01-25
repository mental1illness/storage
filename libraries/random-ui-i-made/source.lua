-- @mental1illness

-- ok this will be coded in snake because [REDACTED] said it was better?
-- dont kill me over this code im really not confident in this at all lol
local http_service, players, client = game:GetService("HttpService"), game:GetService("Players"), game:GetService("Players").LocalPlayer

--! SIGNAL
local signal = {} do
    signal.__index = signal
    function signal.new()
        local self = setmetatable({}, signal)
        self.connections = {}
        return self
    end
    function signal:connect(func)
        if type(func) ~= "function" then error("u need a function", 2) end
        local key = {}
        self.connections[key] = func
        return {
            disconnect = function()
                self.connections[key] = nil
            end
        }
    end
    function signal:fire(...)
        for _, func in pairs(self.connections) do
            func(...)
        end
    end
    function signal:destroy()
        self.connections = {}
        setmetatable(self, nil)
    end
end

local fonts = {}; do
    function register_font(Name, Weight, Style, Asset)
        if not isfile(Asset.Id) then
            writefile(Asset.Id, Asset.Font)
        end

        if isfile(Name .. ".font") then
            delfile(Name .. ".font")
        end

        local Data = {
            ["name"] = Name,
            ["faces"] = {
                {
                    ["name"] = "Normal",
                    ["weight"] = Weight,
                    ["style"] = Style,
                    ["assetId"] = getcustomasset(Asset.Id),
                },
            },
        }
        writefile(Name .. ".font", http_service:JSONEncode(Data))

        return getcustomasset(Name .. ".font");
    end
    
    local tahoma = register_font("Taahouma", 100, "Normal", {
        Id = "TouhouMa.ttf";
        Font = game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf");
    })
    fonts = {
        ["tahoma"] = Font.new(tahoma, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    }
end

local ui = {
    theme = {

    }; -- yeah i dont wanna do this LMFAO
    tab_holder = nil;
    flags = {};
    font = fonts["tahoma"];
    event = signal.new(); -- for flags changes and stuff
    tabs = {};
    screen_gui = nil;
    items = {}
}
ui.__index = ui
--[[ 
    ui.event usage would be
    this would make out stuf more organized
    but if its a button then yeh it wouldn't do much 
    ui.event:connect(function(flag, value) 
        if flag == "misc_godmode" then

        end
    end)
]]

function ui:create(_classname, _properties, _parent)
	local object = Instance.new(_classname)
	if _classname == "Frame" then
		object.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		object.BorderSizePixel = 0
	end
	if _properties then
		for index, value in pairs(_properties) do
			object[index] = value
		end
	end
	if _parent then
		object.Parent = _parent
	end
	return object
end

function ui:add_stroke(_parent, _properties)
    if _parent ~= nil then
	_properties = _properties or {}
        local uistroke = ui:create("UIStroke", {
            LineJoinMode = Enum.LineJoinMode.Miter;
        }, _parent)
        for index, value in pairs(_properties) do
            uistroke[index] = value
        end
    end
end

do
    function ui:window(parameter)
        local cfg = {
            name = parameter.name or parameter.Name or "jewishware",
            size = parameter.size or parameter.Size or UDim2.new(0, 400, 0, 500),
            tabs = {},
            active_tab = nil
        }

        ui.screengui = ui:create("ScreenGui", {
            IgnoreGuiInset = true;
            DisplayOrder = 500;
        }, gethui() or game:GetService("CoreGui"))

        ui.items["main_holder"] = ui:create("Frame", {
            Size = cfg.size;
            BackgroundColor3 = Color3.fromRGB(16, 14, 15);
            ZIndex = 10;
            AnchorPoint = Vector2.new(0.5, 0.5);
            Position = UDim2.new(0.5, 0, 0.5, 0);
        }, ui.screengui)
        ui:add_stroke(ui.items["main_holder"], {Color = Color3.fromRGB(54, 56, 51)})

        ui.items["title_holder"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            Size = UDim2.new(1, 0, 0, 30);
            ZIndex = -434545343
        }, ui.items["main_holder"])

        ui.items["title_text"] = ui:create("TextLabel", {
            ZIndex = 20;
            TextSize = 12;
            TextWrapped = true;
            Size = UDim2.new(0.1468324512243271, 0, 0.699999988079071, 0);
            TextColor3 = Color3.fromRGB(255, 255, 255);
            RichText = true;
            Position = UDim2.new(0.012000045739114285, 0, 0, 0);
            AutomaticSize = Enum.AutomaticSize.XY;
            TextXAlignment = Enum.TextXAlignment.Left;
            Text = cfg.name;
            BackgroundTransparency = 1;
            FontFace = ui.font
        }, ui.items["title_holder"])
        ui:add_stroke(ui.items["title_text"])

        ui.tab_holder = ui:create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.05000000074505806);
            ZIndex = 20;
            BackgroundTransparency = 1;
            Size = UDim2.new(0.9850000143051147, 0, 0, 20);
            Position = UDim2.new(0.5, 0, 0.05000000074505806, 0)
        }, ui.items["main_holder"])

        ui:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            HorizontalFlex = Enum.UIFlexAlignment.Fill;
            Padding = UDim.new(0, -1);
            SortOrder = Enum.SortOrder.LayoutOrder
        }, ui.tab_holder)

        -- section holder
        ui.items["elements_holder"] = ui:create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.11800000071525574);
            Position = UDim2.new(0.5, 0, 0.1994199901819229, 0);
            Size = UDim2.new(0.9850000143051147, 0, 0.699999988079071, 100);
            ZIndex = 19;
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, ui.items["main_holder"])
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 15, 14))
            };
        }, ui.items["elements_holder"])
        ui:add_stroke(ui.items["elements_holder"], {
            BorderStrokePosition = Enum.BorderStrokePosition.Inner;
            Color = Color3.fromRGB(54, 56, 51)
        })
        -- section holder
        ui.items["section_holder"] = ui:create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5);
            BackgroundTransparency = 1;
            Position = UDim2.new(0.5, 0, 0.5, 0);
            Size = UDim2.new(1, -14, 1, -14);
            ZIndex = 19;
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, ui.items["elements_holder"])
        ui:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalFlex = Enum.UIFlexAlignment.Fill;
            Padding = UDim.new(0, 7);
            SortOrder = Enum.SortOrder.LayoutOrder
        }, ui.items["section_holder"])  
        
        ui.items["section_left"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            Size = UDim2.new(0, 0, 1, 0);
            Position = UDim2.new(0.5, 0, 0.5, 0);
            Size = UDim2.new(0, 0, 1, 0);
            ZIndex = 19;
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, ui.items["section_holder"])

        ui.items["section_right"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            Size = UDim2.new(0, 0, 1, 0);
            Position = UDim2.new(0.5, 0, 0.5, 0);
            Size = UDim2.new(0, 0, 1, 0);
            ZIndex = 19;
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, ui.items["section_holder"])

        ui:create("UIListLayout", {
            Padding = UDim.new(0, 4);
            SortOrder = Enum.SortOrder.LayoutOrder;
        }, ui.items["section_left"])
        ui:create("UIListLayout", {
            Padding = UDim.new(0, 4);
            SortOrder = Enum.SortOrder.LayoutOrder;
        }, ui.items["section_right"])

        return setmetatable(cfg, ui)
    end

    -- ok now  a create tab function
    function ui:createtab(parameter)
        local cfg = {
            name = parameter.name or parameter.Name or "Tab";
            items = {};
            sections = {}
        }

        cfg.items["tab"] = ui:create("Frame", {
            Size = UDim2.new(0, 0, 1, 0);
            BackgroundTransparency = 0;
            ZIndex = 19
        }, self.tab_holder)

        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 15, 14))
            };
        }, cfg.items["tab"])

        ui:add_stroke(cfg.items["tab"], {
            BorderStrokePosition = Enum.BorderStrokePosition.Inner;
            Color = Color3.fromRGB(54, 56, 51)
        })

        ui:create("TextLabel", {
            Text = cfg.name;
            TextColor3 = Color3.fromRGB(255, 255, 255);
            TextSize = 12;
            FontFace = ui.font;
            BackgroundTransparency = 1;
            Size = UDim2.new(1,0,1,0);
            ZIndex = 20
        }, cfg.items["tab"])

        cfg.items["accent"] = ui:create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5);
            Position = UDim2.new(0.5, 0, 0.5, -8);
            Visible = false;
            Size = UDim2.new(1, -2, 0, 2);
            ZIndex = 19
        }, cfg.items["tab"])
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 80, 158)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(156, 116, 230))
            };
        }, cfg.items["accent"])

        cfg.items["hitbox"] = ui:create("TextButton", {
            TextTransparency = 1;
            BackgroundTransparency = 1;
            Size = UDim2.new(1,0,1,0);
            ZIndex = 21
        }, cfg.items["tab"])

        cfg.items["section_holder"] = ui:create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5);
            BackgroundTransparency = 1;
            Position = UDim2.new(0.5, 0, 0.5, 0);
            Size = UDim2.new(1, -14, 1, -14);
            ZIndex = 19;
            Visible = false;
        }, ui.items["elements_holder"])

        ui:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalFlex = Enum.UIFlexAlignment.Fill;
            Padding = UDim.new(0, 7);
        }, cfg.items["section_holder"])

        cfg.items["section_left"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            Size = UDim2.new(0, 0, 1, 0);
        }, cfg.items["section_holder"])

        cfg.items["section_right"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            Size = UDim2.new(0, 0, 1, 0);
        }, cfg.items["section_holder"])

        ui:create("UIListLayout", {
            Padding = UDim.new(0, 4);
        }, cfg.items["section_left"])

        ui:create("UIListLayout", {
            Padding = UDim.new(0, 4);
        }, cfg.items["section_right"])


        cfg.opentab = function()
            if self.active_tab then
                local old = self.tabs[self.active_tab]
                old.items["accent"].Visible = false
                old.items["section_holder"].Visible = false
            end
            print("old", self.active_tab, "new", cfg.name)
            self.active_tab = cfg.name
            cfg.items["accent"].Visible = true
            cfg.items["section_holder"].Visible = true

            ui.event:fire("tab_switch", cfg.name)
        end

        cfg.items["hitbox"].MouseButton1Click:Connect(function()
            cfg.opentab()
        end)

        self.tabs[cfg.name] = cfg
        return setmetatable(cfg, ui)
    end
    function ui:createsection(parameter)
        local cfg = {
            name = parameter.name or parameter.Name or "section";
            side = parameter.side or parameter.Side or "left";
            size = parameter.size or parameter.Size or 1;
            items = {}
        }

        cfg.items["section"] = ui:create("Frame", {
            Size = UDim2.new(1, 0, cfg.size, 0);
            BackgroundTransparency = 0;
            ZIndex = 20;
        }, self.items["section_" .. cfg.side])
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 15, 14))
            };
        }, cfg.items["section"])
        ui:add_stroke(cfg.items["section"], {
            BorderStrokePosition = Enum.BorderStrokePosition.Inner;
            Color = Color3.fromRGB(54, 56, 51)
        })
        cfg.items["section_name"] = ui:create("TextLabel", {
            ZIndex = 20;
            Text = cfg.name;
            TextSize = 12;
            TextColor3 = Color3.fromRGB(255, 255, 255);
            TextXAlignment = Enum.TextXAlignment.Left;
            Size = UDim2.new(0.9099702835083008, 0, 0, 0);
            Position = UDim2.new(0.03999999910593033, 0, 0, 0);
            RichText = true;
            BackgroundTransparency = 1;
            FontFace = ui.font
        }, cfg.items["section"])
        ui:add_stroke(cfg.items["section_name"])

        -- elements holder (tabs and stuff)
        cfg.items["holder"] = ui:create("Frame", {
            BackgroundTransparency = 1;
            AnchorPoint = Vector2.new(0.5, 0.5);
            Position = UDim2.new(0.5, 0, 0.5137614607810974, 0);
            Size = UDim2.new(1, -1, 1.0183485746383667, -20);
            ZIndex = 20;
        }, cfg.items["section"])

        ui:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            Padding = UDim.new(0, 4);
            SortOrder = Enum.SortOrder.LayoutOrder
        }, cfg.items["holder"])

        self.sections[#self.sections + 1] = cfg
        return setmetatable(cfg, ui)
    end
    function ui:createtoggle(parameter)
        local cfg = {
            name = parameter.name or parameter.Name or "toggle";
            flag = parameter.flag or parameter.Flag or "jewbot.su";
            callback = parameter.callback or parameter.Callback or parameter.CallBack or function() end;
            state = parameter.default or parameter.Default or parameter.state or parameter.State or false;
            items = {};
            type = "toggle"
        }
        ui.flags[cfg.flag] = {
            value = cfg.state;
            callback = cfg.callback;
            type = cfg.type
        }

        cfg.items["hitbox"] = ui:create("TextButton", {
            ZIndex = 20;
            AnchorPoint = Vector2.new(0.5, 0.5);
            Position = UDim2.new(0.4931994378566742, 0, 0.06336040794849396, 0);
            Size = UDim2.new(0.9079999923706055, 5, 0, 11);
            TextTransparency = 1;
            BackgroundTransparency = 1;
        }, self.items["holder"])
        cfg.items["outline"] = ui:create("Frame", {
            Size = UDim2.new(0, 11, 0, 11);
            ZIndex = 20;
        }, cfg.items["hitbox"])
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 15, 14))
            };
        }, cfg.items["outline"])
        ui:add_stroke(cfg.items["outline"], {
            BorderStrokePosition = Enum.BorderStrokePosition.Inner;
            Color = Color3.fromRGB(54, 56, 51)
        })
        cfg.items["visualizer"] = ui:create("Frame", {
            Size = UDim2.new(1, -2, 1, -2);
            Position = UDim2.new(0.5, 0, 0.5, 0);
            AnchorPoint = Vector2.new(0.5, 0.5);
            ZIndex = 20;
        }, cfg.items["outline"])
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 80, 158)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(156, 116, 230))
            };
        }, cfg.items["visualizer"])
        cfg.items["toggle_name"] = ui:create("TextLabel", {
            Size = UDim2.new(1, -2, 1, -2);
            Position = UDim2.new(0, 15, 0, -2);
            ZIndex = 20;
            TextSize = 12;
            BackgroundTransparency = 1;
            Text = cfg.name;
            AutomaticSize = Enum.AutomaticSize.XY;
            TextColor3 = Color3.fromRGB(239, 239, 239);
            FontFace = ui.font
        }, cfg.items["outline"])
        -- extra elements
        cfg.items["extra_elements"] = ui:create("Frame", {
            ZIndex = 20;
            Position = UDim2.new(1, 0, 0, 0);
            BackgroundTransparency = 1;
            Size = UDim2.new(0, 0, 1, 0);
        }, cfg.items["hitbox"])
        ui:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalAlignment = Enum.HorizontalAlignment.Right;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Padding = UDim.new(0, 4)
        }, cfg.items["extra_elements"])

        cfg.setvalue = function(boolean)
            if boolean then
                cfg.items["visualizer"].Transparency = 0
                ui.flags[cfg.flag].value = true
                cfg.callback(true)
            else
                cfg.items["visualizer"].Transparency = 1
                ui.flags[cfg.flag].value = false
                cfg.callback(false)
            end
            ui.event:fire(cfg.flag, ui.flags[cfg.flag])
        end
        cfg.items.hitbox.MouseButton1Click:Connect(function()
            cfg.setvalue(not ui.flags[cfg.flag].value)
        end)
        cfg.callback(cfg.state)
        cfg.setvalue(cfg.state)

        return setmetatable(cfg, ui)
    end
    function ui:createbutton(parameter)
        local cfg = {
            name = parameter.name or parameter.Name or "toggle";
            flag = parameter.flag or parameter.Flag or "jewbot.su";
            callback = parameter.callback or parameter.Callback or parameter.CallBack or function() end;
            items = {};
            holder = nil;
            confirmation = parameter.confirmation or parameter.Confirmation or parameter.confirm or parameter.Confirm or false;
            type = "button"
        }
        ui.flags[cfg.flag] = {
            callback = cfg.callback;
            type = cfg.type
        }
        if not self.holder then
            cfg["holder"] = ui:create("Frame", {
                Size = UDim2.new(0.9079999923706055, 5, 0, 15);
                ZIndex = 20;
                AnchorPoint = Vector2.new(0.5, 0.5);
                Position = UDim2.new(0.4931994378566742, 0, 0.06336040794849396, 0);
                BackgroundTransparency = 1
            }, self.items["holder"])
            ui:create("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center;
                FillDirection = Enum.FillDirection.Horizontal;
                HorizontalAlignment = Enum.HorizontalAlignment.Center;
                HorizontalFlex = Enum.UIFlexAlignment.Fill;
                Padding = UDim.new(0, 4);
                SortOrder = Enum.SortOrder.LayoutOrder;
            }, cfg["holder"])
        else
            cfg["holder"] = self.holder
        end
        cfg.items["hitbox"] = ui:create("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0.5);
            BackgroundTransparency = 1;
            Position = UDim2.new(0.4931994378566742, 0, 0.06336040794849396, 0);
            Size = UDim2.new(1, 0, 1, 0);
            ZIndex = 20
        }, cfg["holder"])
        cfg.items["elements_holder"] = ui:create("Frame", {
            Size = UDim2.new(1, 0, 1, 0);
            ZIndex = 20;
            BackgroundTransparency = 1
        }, cfg.items["hitbox"])
        ui:add_stroke(cfg.items["elements_holder"], {
            BorderStrokePosition = Enum.BorderStrokePosition.Inner;
            Color = Color3.fromRGB(54, 56, 51)
        })
        ui:create("UIGradient", {
            Rotation = -90;
            Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 15, 14))
            };
        }, ui.items["elements_holder"])
        cfg.items["button_text"] = ui:create("TextLabel", {
            Text = cfg.name;
            TextSize = 12;
            FontFace = ui.font;
            TextColor3 = Color3.fromRGB(239, 239, 239);
            Position = UDim2.new(0.5, 0, 0.5, -1);
            AnchorPoint = Vector2.new(0.5, 0.5);
            Size = UDim2.new(1, 0, 1, 0);
            ZIndex = 20;
            BackgroundTransparency = 1
        }, cfg.items["elements_holder"])
        ui:add_stroke(cfg.items["button_text"], {})

        local is_confirm = false
        cfg.items["hitbox"].MouseButton1Click:Connect(function()
            if cfg.confirmation then
                if not is_confirm then
                    is_confirm = true
                    cfg.items["button_text"].Text = "do you wish to proceed?"
                    cfg.items["button_text"].TextColor3 = Color3.fromRGB(232, 191, 40)
                else
                    is_confirm = false
                    cfg.items["button_text"].Text = cfg.name
                    cfg.items["button_text"].TextColor3 = Color3.fromRGB(239, 239, 239);
                    cfg.callback()
                    ui.event:fire(cfg.flag, ui.flags[cfg.flag])
                end
            else
                cfg.callback()
                ui.event:fire(cfg.flag, ui.flags[cfg.flag])
            end
        end)

        return setmetatable(cfg, ui)
    end
end

local window = ui:window({name = "jewhaxx"})
local combat = window:createtab({ name = "combat" })
local visuals = window:createtab({ name = "visuals" })
local section = combat:createsection({name = "nigga"})
section:createtoggle({})
local button = section:createbutton({})
button:createbutton({})
section:createbutton({flag = "misc_godmode", name = "godmode", confirm = true})
visuals:createsection({name = "nigga", side  = "right"})
