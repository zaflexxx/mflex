










--// m1kecorp© paid hub source
--\\ Enjoy!
game.Players.LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new(0,0))
end)

local Library = {}

function Library:Window(winName,mainColor,hideBind)
    winName = winName or "brought to you by m1kecorp"
    mainColor = mainColor or Color3.fromRGB(104, 186, 227)
    hideBind = hideBind or Enum.KeyCode.RightAlt

    if _G.Library ~= nil then _G.Library:Destroy() end
    
    _G.UISettings = {
        UIBind = hideBind,
        UIConfig = {},
        ElementCache = {},
    }

    local function Tween(which,gui,UDimStuff,time)
        task.spawn(function()
            pcall(function()
                if which == "size" then
                    gui:TweenSize(UDimStuff,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,time)
                elseif which == "pos" then
                    gui:TweenPosition(UDimStuff,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,time)
                else
                    local TweenService = game:GetService("TweenService")
                    TweenService:Create(
                            gui,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        UDimStuff
                    ):Play()
                end
            end)
        end)
    end

    local function UpdateFrameSize(scrollframe,listlayout)
        local cS = listlayout.AbsoluteContentSize

        game.TweenService:Create(scrollframe, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
        }):Play()
    end

    local function hidebindConfig()
        local uis = game:GetService("UserInputService")
        uis.InputBegan:Connect(function(input,chat)
            if chat then return end

            if input.KeyCode == hideBind then
                Tabs.ToggleVisiblity()
            end	
        end)
    end

    local function dragify(Frame)
    dragToggle = nil
    dragSpeed = .25 -- You can edit this.
    dragInput = nil
    dragStart = nil
    dragPos = nil
    
    function updateInput(input)
    Delta = input.Position - dragStart
    Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
    game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
    end
    
    Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
    dragToggle = true
    dragStart = input.Position
    startPos = Frame.Position
    input.Changed:Connect(function()
    if (input.UserInputState == Enum.UserInputState.End) then
    dragToggle = false
    end
    end)
    end
    end)
    
    Frame.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
    dragInput = input
    end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
    if (input == dragInput and dragToggle) then
    updateInput(input)
    end
    end)
    end

    local function Ripple(obj)
        task.spawn(
            function()
                local Mouse = game.Players.LocalPlayer:GetMouse()
                local Circle = Instance.new("ImageLabel")
                Circle.Name = "Circle"
                Circle.Parent = obj
                Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Circle.BackgroundTransparency = 1.000
                Circle.ZIndex = 10
                Circle.Image = "rbxassetid://266543268"
                Circle.ImageColor3 = Color3.fromRGB(211, 211, 211)
                Circle.ImageTransparency = 0.6
                local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
                Circle.Position = UDim2.new(0, NewX, 0, NewY)
                local Size = 0
                if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
                    Size = obj.AbsoluteSize.X * 1
                elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
                    Size = obj.AbsoluteSize.Y * 1
                elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
                    Size = obj.AbsoluteSize.X * 1
                end
                Circle:TweenSizeAndPosition(
                    UDim2.new(0, Size, 0, Size),
                    UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
                    "Out",
                    "Quad",
                    0.2,
                    false
                )
                for i = 1, 15 do
                    Circle.ImageTransparency = Circle.ImageTransparency + 0.05
                    wait()
                end
                Circle:Destroy()
            end
        )
    end

    local FirstTab = false
    local UI = Instance.new("ScreenGui")
    local BG = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local elementFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local GlowFrame = Instance.new("ImageLabel")
    local GlowCorner = Instance.new("UICorner")
    local Color = Instance.new("UIStroke")
    local Color_3 = Instance.new("TextLabel")
    local stroke = Instance.new("Frame")
    local Color_4 = Instance.new("UIStroke")
    local GlowFrame_2 = Instance.new("ImageLabel")
    local GlowCorner_2 = Instance.new("UICorner")
    local tabH = Instance.new("ScrollingFrame")
    local UIListLayout_3 = Instance.new("UIListLayout")
    local seperator = Instance.new("Frame")

    function randomString()
        local length = math.random(10,20)
        local array = {}
        for i = 1, length do
            array[i] = string.char(math.random(32, 126))
        end
        return table.concat(array)
    end

    PARENT = nil
    if get_hidden_gui or gethui then
        local hiddenUI = get_hidden_gui or gethui
        local Main = Instance.new("ScreenGui")
        Main.Name = randomString()
        Main.Parent = hiddenUI()
        PARENT = Main
    elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
        local Main = Instance.new("ScreenGui")
        Main.Name = randomString()
        syn.protect_gui(Main)
        Main.Parent = COREGUI
        PARENT = Main
    elseif COREGUI:FindFirstChild('RobloxGui') then
        PARENT = COREGUI.RobloxGui
    else
        local Main = Instance.new("ScreenGui")
        Main.Name = randomString()
        Main.Parent = COREGUI
        PARENT = Main
    end

    UI.Name = "UI"
    UI.Parent = PARENT
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UI.ResetOnSpawn = false
    _G.Library = PARENT

    BG.Name = "BG"
    BG.Parent = UI
    BG.BackgroundColor3 = Color3.fromRGB(27,27,27)
    BG.ClipsDescendants = true
    BG.Position = UDim2.new(0.380143136, 0, 0.367031574, 0)
    BG.Size = UDim2.new(0, 656, 0, 387)

    UICorner.Parent = BG

    elementFrame.Name = "elementFrame"
    elementFrame.Parent = BG
    elementFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    elementFrame.Position = UDim2.new(0.298690677, 0, 0.148893297, 0)
    elementFrame.Size = UDim2.new(0, 446, 0, 309)

    UICorner_2.Parent = elementFrame

    GlowFrame.Name = "GlowTab"
    GlowFrame.Parent = elementFrame
    GlowFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GlowFrame.BackgroundTransparency = 1.000
    GlowFrame.BorderSizePixel = 0
    GlowFrame.Position = UDim2.new(0, -15, 0, -15)
    GlowFrame.Size = UDim2.new(1, 30, 1, 30)
    GlowFrame.ZIndex = 0
    GlowFrame.Image = "rbxassetid://4996891970"
    GlowFrame.ImageColor3 = mainColor
    GlowFrame.ScaleType = Enum.ScaleType.Slice
    GlowFrame.SliceCenter = Rect.new(20, 20, 280, 280)
    GlowFrame.ImageTransparency = 0

    GlowCorner.Parent = GlowFrame

    Color.Color = mainColor
    Color.Name = "Color"
    Color.Parent = elementFrame
    Color.Thickness = 2
    Color.Transparency = 0.699999988079071

    Color_3.Name = "Color"
    Color_3.Parent = BG
    Color_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Color_3.BackgroundTransparency = 1.000
    Color_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Color_3.Position = UDim2.new(0.0326434411, 0, 0.0310933907, 0)
    Color_3.Size = UDim2.new(0, 630, 0, 27)
    Color_3.Font = Enum.Font.Gotham
    Color_3.Text = winName
    Color_3.TextColor3 = mainColor
    Color_3.TextScaled = true
    Color_3.TextSize = 14.000
    Color_3.TextWrapped = true

    stroke.Name = "stroke"
    stroke.Parent = BG
    stroke.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    stroke.Position = UDim2.new(0.0478682891, 0, 0.122643776, 0)
    stroke.Size = UDim2.new(0, 611, 0, 0)

    Color_4.Color = mainColor
    Color_4.Name = "Color"
    Color_4.Parent = stroke
    Color_4.Thickness = 0.699999988079071

    tabH.Name = "tabH"
    tabH.Parent = BG
    tabH.Active = true
    tabH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabH.BackgroundTransparency = 1.000
    tabH.Position = UDim2.new(-0.000775280409, 0, 0.152454779, 0)
    tabH.Size = UDim2.new(0, 195, 0, 300)
    tabH.ScrollBarThickness = 2

    UIListLayout_3.Parent = tabH
    UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_3.Padding = UDim.new(0, 9)

    tabH.ChildAdded:Connect(function()
        UpdateFrameSize(tabH,UIListLayout_3)
    end)
    
    tabH.ChildRemoved:Connect(function()
        UpdateFrameSize(tabH,UIListLayout_3)
    end)

    seperator.Name = "seperator"
    seperator.Parent = tabH
    seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    seperator.BackgroundTransparency = 1.000
    seperator.Size = UDim2.new(0, 167, 0, 7)
    
    local Tabs = {}

    function Tabs.ToggleVisiblity()
        task.spawn(function()
            UI.Enabled = not UI.Enabled
        end)
    end

    function Tabs.Notify(config)
        local title = config.Title
        local text = config.Text

        task.spawn(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = title;
                Text = text
            })
        end)
    end

    function Tabs.PromptDiscord(discCode)
        task.spawn(function()
            local http
        
            pcall(function()
                http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            end)
        
            if http then
                local function join()
                    http(
                        {
                            Url = "http://127.0.0.1:6463/rpc?v=1",
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json",
                                ["origin"] = "https://discord.com",
                            },
                            Body = game:GetService("HttpService"):JSONEncode(
                            {
                                ["args"] = {
                                    ["code"] = discCode,
                                },
                                ["cmd"] = "INVITE_BROWSER",
                                ["nonce"] = "."
                            })
                        })
                end
                
                join() 
            end
        end)
    end

    function Tabs.Destroy()
        task.spawn(function()
            UI:Destroy()
        end)
    end

    function Tabs:Tab(tabName)
        local tabButton = Instance.new("Frame")
        local GlowTab = Instance.new("ImageLabel")
        local button = Instance.new("TextButton")
        local UICorner_22 = Instance.new("UICorner")
        local Color_5 = Instance.new("UIStroke")
        local UICorner_23 = Instance.new("UICorner")
        local TabFrame = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")

        tabButton.Name = "tabButton"
        tabButton.Parent = tabH
        tabButton.BackgroundColor3 = mainColor
        tabButton.BackgroundTransparency = 1.000
        tabButton.Position = UDim2.new(0, 0, -0.0152113764, 0)
        tabButton.Size = UDim2.new(0, 167, 0, 24)

        GlowTab.Name = "GlowTab"
        GlowTab.Parent = tabButton
        GlowTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        GlowTab.BackgroundTransparency = 1.000
        GlowTab.BorderSizePixel = 0
        GlowTab.Position = UDim2.new(0, -15, 0, -15)
        GlowTab.Size = UDim2.new(1, 30, 1, 30)
        GlowTab.ZIndex = 0
        GlowTab.Image = "rbxassetid://4996891970"
        GlowTab.ImageColor3 = mainColor
        GlowTab.ScaleType = Enum.ScaleType.Slice
        GlowTab.SliceCenter = Rect.new(20, 20, 280, 280)
        GlowTab.ImageTransparency = 1

        button.Name = "button"
        button.Parent = tabButton
        button.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
        button.BackgroundTransparency = 1.000
        button.Position = UDim2.new(0, 0, -0.0138549805, 0)
        button.Size = UDim2.new(0, 167, 0, 24)
        button.Font = Enum.Font.Gotham
        button.Text = tabName
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = false
        button.TextSize = 14.000
        button.TextWrapped = true

        UICorner_22.Parent = button

        Color_5.Color = mainColor
        Color_5.Name = "Color"
        Color_5.Parent = tabButton
        Color_5.Thickness = 2
        Color_5.Transparency = 1

        UICorner_23.Parent = tabButton

        TabFrame.Name = "TabFrame"
        TabFrame.Parent = elementFrame
        TabFrame.Active = true
        TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabFrame.BackgroundTransparency = 1.000
        TabFrame.Position = UDim2.new(0.0134529145, 0, 0.0377753302, 0)
        TabFrame.Size = UDim2.new(0, 440, 0, 289)
        TabFrame.ScrollBarThickness = 5
        TabFrame.Visible = false

    
        UIListLayout.Parent = TabFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        if not FirstTab then
            FirstTab = true
            Color_5.Transparency = 0.2
            TabFrame.Visible = true
            GlowTab.ImageTransparency = 0
            tabButton.BackgroundTransparency = 0
        end

        UpdateFrameSize(TabFrame,UIListLayout)

        TabFrame.ChildAdded:Connect(function()
            UpdateFrameSize(TabFrame,UIListLayout)
        end)

        TabFrame.ChildRemoved:Connect(function()
            UpdateFrameSize(TabFrame,UIListLayout)
        end)

        button.MouseButton1Click:Connect(function()
            if TabFrame.Visible == true then return end

            for _,v in pairs(tabH:GetChildren()) do
                if v:IsA("Frame") and v.Name ~= "seperator" then
                    pcall(function()
                        local stroke = v:FindFirstChildOfClass("UIStroke")
                        task.spawn(function()
                            Tween("Transparency",stroke,{Transparency = 1},.3)
                            Tween("ImageTransparency",v.GlowTab,{ImageTransparency = 1},.3)
                            Tween("BackgroundTransparency",v,{BackgroundTransparency = 1},.3)
                        end)
                    end)
                end
            end

            for _,v in pairs(elementFrame:GetChildren()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end

            Tween("Transparency",Color_5,{Transparency = 0.2},.3)
            Tween("ImageTransparency",GlowTab,{ImageTransparency = 0},.3)
            Tween("BackgroundTransparency",tabButton,{BackgroundTransparency = 0},.3)
            TabFrame.Visible = true
        end)

        local Elements = {}

        function Elements:Button(buttonName,callback)
            buttonName = buttonName or "Button"
            callback = callback or function () end

            local Button = Instance.new("TextButton")
            local UICorner_3 = Instance.new("UICorner")

            Button.Name = "Button"
            Button.Parent = TabFrame
            Button.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Button.ClipsDescendants = true
            Button.Size = UDim2.new(0, 424, 0, 24)
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextScaled = false
            Button.TextSize = 14.000
            Button.TextWrapped = true
            Button.Text = buttonName
        
            UICorner_3.Parent = Button

            Button.MouseButton1Click:Connect(function()
                Ripple(Button)
                pcall(callback)
            end)

            UpdateFrameSize(TabFrame,UIListLayout)
        end

        function Elements:Toggle(toggleName,currentState,callback)
            toggleName = toggleName or "Toggle"
            currentState = currentState or false
            callback = callback or function () end

            local Toggle = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local name = Instance.new("TextLabel")
            local ToggleBG = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Ball = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local hitbox = Instance.new("TextButton")
            local UICorner_7 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = TabFrame
            Toggle.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Toggle.ClipsDescendants = true
            Toggle.Size = UDim2.new(0, 424, 0, 24)

            UICorner_4.Parent = Toggle

            name.Name = "name"
            name.Parent = Toggle
            name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            name.BackgroundTransparency = 1.000
            name.Position = UDim2.new(0.0154420389, 0, 0, 0)
            name.Size = UDim2.new(0, 246, 0, 24)
            name.Font = Enum.Font.Gotham
            name.Text = toggleName..":"
            name.TextColor3 = Color3.fromRGB(255, 255, 255)
            name.TextScaled = false
            name.TextSize = 14.000
            name.TextWrapped = true
            name.TextXAlignment = Enum.TextXAlignment.Left

            ToggleBG.Name = "ToggleBG"
            ToggleBG.Parent = Toggle
            ToggleBG.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            ToggleBG.Position = UDim2.new(0.883972287, 0, 0.125, 0)
            ToggleBG.Size = UDim2.new(0, 41, 0, 18)

            UICorner_5.Parent = ToggleBG

            Ball.Name = "Ball"
            Ball.Parent = ToggleBG
            Ball.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
            Ball.Position = UDim2.new(-0.00882184505, 0, 0, 0)
            Ball.Size = UDim2.new(0, 18, 0, 18)

            UICorner_6.CornerRadius = UDim.new(16, 16)
            UICorner_6.Parent = Ball

            hitbox.Name = "hitbox"
            hitbox.Parent = Toggle
            hitbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            hitbox.BackgroundTransparency = 0.990
            hitbox.Size = UDim2.new(0, 424, 0, 24)
            hitbox.Font = Enum.Font.Gotham
            hitbox.Text = ""
            hitbox.TextColor3 = Color3.fromRGB(0, 0, 0)
            hitbox.TextSize = 14.000

            UICorner_7.Parent = hitbox

            local state = currentState
            local toggleDebounce = false

            if state then
                task.spawn(function()
                    toggleDebounce = true
                    Tween("pos",Ball,UDim2.new(0.552, 0,0, 0),.3)
                    Tween("BackgroundColor",Ball,{BackgroundColor3 = mainColor},.3)
                    task.wait(.3)
                    toggleDebounce = false
                end)
            end

            pcall(callback,state)

            local function ToggleOn()
                Ripple(Toggle)
                state = true
                task.spawn(function()
                    toggleDebounce = true
                    Tween("pos",Ball,UDim2.new(0.552, 0,0, 0),.3)
                    task.delay(0.01,function()
                        repeat task.wait() until Ball.BackgroundColor3 ~= nil
                        Tween("BackgroundColor",Ball,{BackgroundColor3 = mainColor},.3)
                    end)
                    task.wait(.3)
                    toggleDebounce = false
                end)

                pcall(callback,state)
            end

            local function ToggleOff()
                Ripple(Toggle)
                state = false

                task.spawn(function()
                    toggleDebounce = true
                    Tween("pos",Ball,UDim2.new(-0.00882184505, 0, 0, 0),.3)
                    Tween("BackgroundColor",Ball,{BackgroundColor3 = Color3.fromRGB(67, 67, 67)},.3)
                    task.wait(.3)
                    toggleDebounce = false
                end)

                pcall(callback,state)
            end

            hitbox.MouseButton1Click:Connect(function()
                if toggleDebounce then return end
                if state then
                    ToggleOff()
                    return
                end

                ToggleOn()
            end)

            local toggleFunc = {}

            function toggleFunc:GetState()
                return state
            end

            function toggleFunc:SetState(desiredState)
                if desiredState then
                    ToggleOn()
                else
                    ToggleOff()
                end
            end
            
            function toggleFunc:LoadConfig(data)
                if data.Name == toggleName and data.Type == "Toggle" then
                    toggleFunc:SetState(data.Value)
                end
            end
            
            local info = {Name = toggleName,Type ="Toggle",Value = state,Element = toggleFunc}
            
            function toggleFunc:SaveConfig()
                for i,v in pairs(_G.UISettings.ElementCache) do
                    if v.Name == info.Name and v.Type == info.Type then
			v["Value"] = state
                    end
                end
            end
            
            table.insert(_G.UISettings.ElementCache,info)
            
            UpdateFrameSize(TabFrame,UIListLayout)

            return toggleFunc
        end

        function Elements:Slider(sliderName,config,callback)
            sliderName = sliderName or "Slider"
            local def = tonumber(config.def) or 50
            local min = tonumber(config.min) or 0
            local max = tonumber(config.max) or 100
            callback = callback or function() end

            local Slider = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local name_2 = Instance.new("TextLabel")
            local SliderBG = Instance.new("Frame")
            local SliderBGButton = Instance.new("TextButton")
            local UICorner_9 = Instance.new("UICorner")
            local Color_2 = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local amount = Instance.new("TextLabel")

            Slider.Name = "Slider"
            Slider.Parent = TabFrame
            Slider.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Slider.ClipsDescendants = true
            Slider.Size = UDim2.new(0, 424, 0, 24)

            UICorner_8.Parent = Slider

            name_2.Name = "name"
            name_2.Parent = Slider
            name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            name_2.BackgroundTransparency = 1.000
            name_2.Position = UDim2.new(0.0154420389, 0, 0, 0)
            name_2.Size = UDim2.new(0, 150, 0, 24)
            name_2.Font = Enum.Font.Gotham
            name_2.Text = sliderName..":"
            name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            name_2.TextScaled = false
            name_2.TextSize = 14.000
            name_2.TextWrapped = true
            name_2.TextXAlignment = Enum.TextXAlignment.Left

            SliderBG.Name = "SliderBG"
            SliderBG.Parent = Slider
            SliderBG.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            SliderBG.Position = UDim2.new(0.537450969, 0, 0.25, 0)
            SliderBG.Size = UDim2.new(0, 187, 0, 14)
            SliderBG.ClipsDescendants = true

            SliderBGButton.Name = "SliderBG"
            SliderBGButton.Parent = Slider
            SliderBGButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            SliderBGButton.Position = UDim2.new(0.537450969, 0, 0.25, 0)
            SliderBGButton.Size = UDim2.new(0, 187, 0, 14)
            SliderBGButton.BackgroundTransparency = 0.99
            SliderBGButton.Text = ""

            UICorner_9.Parent = SliderBG

            Color_2.Name = "Color"
            Color_2.Parent = SliderBG
            Color_2.BackgroundColor3 = mainColor
            Color_2.Size = UDim2.new(0, 187, 0, 18)

            UICorner_10.CornerRadius = UDim.new(16, 16)
            UICorner_10.Parent = Color_2

            amount.Name = "amount"
            amount.Parent = Slider
            amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            amount.BackgroundTransparency = 1.000
            amount.Position = UDim2.new(0.370521128, 0, 0.125, 0)
            amount.Size = UDim2.new(0, 68, 0, 21)
            amount.Font = Enum.Font.Gotham
            amount.Text = "56"
            amount.TextColor3 = Color3.fromRGB(255, 255, 255)
            amount.TextScaled = false
            amount.TextSize = 14.000
            amount.TextWrapped = true

            if def > max then 
                def = max
            elseif min < 0 then
                min = 0
            end

            local SliderDef = math.clamp(def, min, max)
            local DefaultScale =  (SliderDef - min) / (max - min)
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local SValue;
            local SB = SliderBGButton
            local SV = amount
            local SF = Color_2
            local NormalSizeX = 187
            local NormalSizeY = 14

            SF.Size = UDim2.fromScale(DefaultScale,1)
            SV.Text = tostring(def)
            Value = def
            pcall(callback,Value)

            SB.MouseButton1Down:Connect(function()
                SValue = math.floor((((tonumber(max) - tonumber(min)) / NormalSizeX) * SF.AbsoluteSize.X) + tonumber(min)) or 0
            
            
                SF.Size = UDim2.new(0, math.clamp(mouse.X - SF.AbsolutePosition.X, 0, NormalSizeX), 0, NormalSizeY)
                moveconnection = mouse.Move:Connect(function()
                    SValue = math.floor((((tonumber(max) - tonumber(min)) / NormalSizeX) * SF.AbsoluteSize.X) + tonumber(min))
                    SV.Text = SValue
            
                    pcall(callback,SValue)
            
                    SF.Size = UDim2.new(0, math.clamp(mouse.X - SF.AbsolutePosition.X, 0, NormalSizeX), 0,NormalSizeY)
                end)
            
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        SValue = math.floor((((tonumber(max) - tonumber(min)) / NormalSizeX) * SF.AbsoluteSize.X) + tonumber(min))
            
                        pcall(callback,SValue)
            
                        SF.Size = UDim2.new(0, math.clamp(mouse.X - SF.AbsolutePosition.X, 0, NormalSizeX), 0, NormalSizeY)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)

            local sliderFunc = {}

            function sliderFunc:GetValue()
                return Value
            end

            function sliderFunc:SetValue(desiredValue)
                if tonumber(desiredValue) and desiredValue <= max and desiredValue >= min then
                    local SliderDef = math.clamp(tonumber(desiredValue), min, max)
                    local DefaultScale =  (SliderDef - min) / (max - min)
                    Tween("size",SF,UDim2.fromScale(DefaultScale,1),.3)
                    SV.Text = tostring(desiredValue)
                    Value = desiredValue
                    pcall(callback,Value)
                end
            end

            function sliderFunc:LoadConfig(data)
                if data.Name == sliderName and data.Type == "Slider" then
                    sliderFunc:SetValue(data.Value)
                end
            end
            
            local info = {Name = sliderName,Type ="Slider",Value = SValue,Element = sliderFunc}
            
            function sliderFunc:SaveConfig()
                for i,v in pairs(_G.UISettings.ElementCache) do
                    if v.Name == info.Name and v.Type == info.Type then
                        v["Value"] = SValue or def
                    end
                end
            end
            
            table.insert(_G.UISettings.ElementCache,info)
            
            UpdateFrameSize(TabFrame,UIListLayout)
            
            return sliderFunc
        end

        function Elements:Label(text)
            text = text or ""

            local Label = Instance.new("TextLabel")
            local UICorner_11 = Instance.new("UICorner")

            Label.Name = "Label"
            Label.Parent = TabFrame
            Label.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Label.Size = UDim2.new(0, 424, 0, 24)
            Label.Font = Enum.Font.Gotham
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextScaled = false
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.Text = text

            UICorner_11.Parent = Label

            local labelFunc = {}

            function labelFunc:SetText(txt)
                if typeof(txt) == "string" then
                    Label.Text = txt
                end
            end

            function labelFunc:GetText()
                return Label.Text
            end

            UpdateFrameSize(TabFrame,UIListLayout)

            return labelFunc
        end

        function Elements:Textbox(textboxName,callback)
            local Textbox = Instance.new("Frame")
            local UICorner_12 = Instance.new("UICorner")
            local name_3 = Instance.new("TextLabel")
            local box = Instance.new("Frame")
            local UICorner_13 = Instance.new("UICorner")
            local input = Instance.new("TextBox")

            Textbox.Name = "Textbox"
            Textbox.Parent = TabFrame
            Textbox.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Textbox.ClipsDescendants = true
            Textbox.Size = UDim2.new(0, 424, 0, 24)

            UICorner_12.Parent = Textbox

            name_3.Name = "name"
            name_3.Parent = Textbox
            name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            name_3.BackgroundTransparency = 1.000
            name_3.Position = UDim2.new(0.0154420389, 0, 0, 0)
            name_3.Size = UDim2.new(0, 194, 0, 24)
            name_3.Font = Enum.Font.Gotham
            name_3.Text = textboxName..":"
            name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            name_3.TextScaled = false
            name_3.TextSize = 14.000
            name_3.TextWrapped = true
            name_3.TextXAlignment = Enum.TextXAlignment.Left

            box.Name = "box"
            box.Parent = Textbox
            box.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            box.BorderColor3 = Color3.fromRGB(27, 42, 53)
            box.Position = UDim2.new(0.537450969, 0, 0.125, 0)
            box.Size = UDim2.new(0, 187, 0, 18)

            UICorner_13.Parent = box

            input.Name = "input"
            input.Parent = box
            input.BackgroundColor3 = Color3.fromRGB(37,37,37)
            input.BackgroundTransparency = 1.000
            input.BorderSizePixel = 0
            input.Size = UDim2.new(0, 187, 0, 18)
            input.Font = Enum.Font.Gotham
            input.Text = ""
            input.TextColor3 = Color3.fromRGB(255, 255, 255)
            input.TextScaled = false
            input.TextSize = 14.000
            input.TextWrapped = true

            input.FocusLost:Connect(function()
                local myText = input.Text
                pcall(callback,myText)
            end)

            local textboxFunc = {}

            function textboxFunc:GetText()
                local myText = input.Text
                return myText
            end

            function textboxFunc:SetText(txt)
                if typeof(txt) == "string" then
                    input.Text = txt
                    local myText = input.Text
                    pcall(callback,myText)
                end
            end
            
            function textboxFunc:LoadConfig(data)
                if data.Name == textboxName and data.Type == "Textbox" then
                    textboxFunc:SetText(data.Value)
                end
            end

            local info = {Name = textboxName,Type ="Textbox",Value = input.Text,Element = textboxFunc}
            
            function textboxFunc:SaveConfig()
                for i,v in pairs(_G.UISettings.ElementCache) do
                    if v.Name == info.Name and v.Type == info.Type then
                        v["Value"] = input.Text
                    end
                end
            end
            
            table.insert(_G.UISettings.ElementCache,info)
            
            UpdateFrameSize(TabFrame,UIListLayout)

            return textboxFunc
        end

        function Elements:Bind(bindName,keycode,callback)
            bindName = bindName or "Bind"
            keycode = keycode or Enum.KeyCode.E
            callback = callback or function () end

            local keyName = tostring(keycode):split(".")[3]

            local Keybind = Instance.new("Frame")
            local UICorner_15 = Instance.new("UICorner")
            local name_4 = Instance.new("TextLabel")
            local ToggleBG_2 = Instance.new("Frame")
            local UICorner_16 = Instance.new("UICorner")
            local key = Instance.new("TextLabel")
            local hitbox_3 = Instance.new("TextButton")
            local UICorner_17 = Instance.new("UICorner")

            Keybind.Name = "Keybind"
            Keybind.Parent = TabFrame
            Keybind.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Keybind.ClipsDescendants = true
            Keybind.Size = UDim2.new(0, 424, 0, 24)

            UICorner_15.Parent = Keybind

            name_4.Name = "name"
            name_4.Parent = Keybind
            name_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            name_4.BackgroundTransparency = 1.000
            name_4.Position = UDim2.new(0.0154420389, 0, 0, 0)
            name_4.Size = UDim2.new(0, 246, 0, 24)
            name_4.Font = Enum.Font.Gotham
            name_4.Text = bindName..":"
            name_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            name_4.TextScaled = false
            name_4.TextSize = 14.000
            name_4.TextWrapped = true
            name_4.TextXAlignment = Enum.TextXAlignment.Left

            ToggleBG_2.Name = "ToggleBG"
            ToggleBG_2.Parent = Keybind
            ToggleBG_2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            ToggleBG_2.Position = UDim2.new(0.728031218, 0, 0.125, 0)
            ToggleBG_2.Size = UDim2.new(0, 106, 0, 18)

            UICorner_16.Parent = ToggleBG_2

            key.Name = "key"
            key.Parent = ToggleBG_2
            key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            key.BackgroundTransparency = 1.000
            key.Position = UDim2.new(-0.00994582381, 0, 0, 0)
            key.Size = UDim2.new(0, 106, 0, 18)
            key.Font = Enum.Font.Gotham
            key.Text = keyName
            key.TextColor3 = Color3.fromRGB(255, 255, 255)
            key.TextScaled = false
            key.TextSize = 14.000
            key.TextWrapped = true

            hitbox_3.Name = "hitbox"
            hitbox_3.Parent = Keybind
            hitbox_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            hitbox_3.BackgroundTransparency = 0.990
            hitbox_3.Size = UDim2.new(0, 424, 0, 24)
            hitbox_3.Font = Enum.Font.Gotham
            hitbox_3.Text = ""
            hitbox_3.TextColor3 = Color3.fromRGB(0, 0, 0)
            hitbox_3.TextSize = 14.000

            UICorner_17.Parent = hitbox_3

            local WhitelistedType = {
                [Enum.UserInputType.MouseButton1] = "Mouse1";
                [Enum.UserInputType.MouseButton2] = "Mouse2";
                [Enum.UserInputType.MouseButton3] = "Mouse3";
            };
            local UIS = game:GetService("UserInputService")
            local Binding = false

            hitbox_3.MouseButton1Click:Connect(function()
                local Connection;
                Binding = true
            
                key.Text = ". . .";
            
                Connection = UIS.InputBegan:Connect(function(i,chat)
                    if chat then return end
                    
                    if UI == nil or UI.Parent == nil then
                        Connection:Disconnect()
                        return
                    end

                    if WhitelistedType[i.UserInputType] then
                        key.Text = WhitelistedType[i.UserInputType];
                        keycode = i.UserInputType
                    elseif i.KeyCode ~= Enum.KeyCode.Unknown then
                        keycode = i.KeyCode
                        keyName = tostring(keycode):split(".")[3]
                        key.Text = keyName;
                    else
                        warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
                    end;
            

                    Connection:Disconnect();
                end)
            end)

            local Connection2;

            Connection2 = UIS.InputBegan:Connect(function(i,chat)
                if chat then return end
                
                if UI == nil or UI.Parent == nil then
                    Connection2:Disconnect()
                    return
                end
                
                if Binding then
                    Binding = false
                    return;
                end
            
                if (keycode == i.UserInputType or keycode == i.KeyCode) then
                    pcall(callback,keycode)
                end;
            end);

            local bindFunc = {}

            function bindFunc:GetBind()
                return keycode
            end

            function bindFunc:SetBind(EnumK)
                if tostring(EnumK):find("Enum.KeyCode.") then
                    keycode = EnumK
                    keyName = tostring(keycode):split(".")[3]
                    key.Text = keyName
                end
            end
            
            function bindFunc:LoadConfig(data)
                if data.Name == bindName and data.Type == "Bind" then
                    bindFunc:SetBind(data.Value)
                end
            end

            local info = {Name = bindName,Type ="Bind",Value = keycode,Element = bindFunc}
            
            function bindFunc:SaveConfig(data)
                for i,v in pairs(_G.UISettings.ElementCache) do
                    if v.Name == info.Name and v.Type == info.Type then
                        v["Value"] = keycode
                    end
                end
            end

            table.insert(_G.UISettings.ElementCache,info)
            
            UpdateFrameSize(TabFrame,UIListLayout)

            return bindFunc
        end

        function Elements:Dropdown(dropName,list,callback)
            dropName = dropName or "Dropdown"
            list = list or {}
            callback = callback or function () end

            local Dropdown = Instance.new("Frame")
            local UICorner_18 = Instance.new("UICorner")
            local name_5 = Instance.new("TextLabel")
            local hitbox_4 = Instance.new("TextButton")
            local UICorner_19 = Instance.new("UICorner")
            local DropdownList = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UICorner_20 = Instance.new("UICorner")
            local ImageLabel = Instance.new("ImageLabel")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = TabFrame
            Dropdown.BackgroundColor3 = Color3.fromRGB(37,37,37)
            Dropdown.Size = UDim2.new(0, 424, 0, 24)
            Dropdown.ClipsDescendants = true

            UICorner_18.Parent = Dropdown

            name_5.Name = "name"
            name_5.Parent = Dropdown
            name_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            name_5.BackgroundTransparency = 1.000
            name_5.Position = UDim2.new(0.0154420389, 0, 0, 0)
            name_5.Size = UDim2.new(0, 246, 0, 24)
            name_5.Font = Enum.Font.Gotham
            name_5.Text = dropName..":"
            name_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            name_5.TextScaled = false
            name_5.TextSize = 14.000
            name_5.TextWrapped = true
            name_5.TextXAlignment = Enum.TextXAlignment.Left

            hitbox_4.Name = "hitbox"
            hitbox_4.Parent = Dropdown
            hitbox_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            hitbox_4.BackgroundTransparency = 0.990
            hitbox_4.Size = UDim2.new(0, 424, 0, 24)
            hitbox_4.Font = Enum.Font.Gotham
            hitbox_4.Text = ""
            hitbox_4.TextColor3 = Color3.fromRGB(0, 0, 0)
            hitbox_4.TextSize = 14.000

            UICorner_19.Parent = hitbox_4

            DropdownList.Name = "DropdownList"
            DropdownList.Parent = TabFrame
            DropdownList.Active = true
            DropdownList.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
            DropdownList.Position = UDim2.new(0, 0, 0.975056946, 0)
            DropdownList.Size = UDim2.new(0, 424, 0, 0)
            DropdownList.ScrollBarImageTransparency = 1
            DropdownList.BorderSizePixel = 0
            DropdownList.Visible = false
            DropdownList.ZIndex = true

            UIListLayout_2.Parent = DropdownList
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

            UpdateFrameSize(DropdownList,UIListLayout_2)

            DropdownList.ChildAdded:Connect(function()
                UpdateFrameSize(DropdownList,UIListLayout_2)
            end)

            DropdownList.ChildRemoved:Connect(function()
                UpdateFrameSize(DropdownList,UIListLayout_2)
            end)

            DropdownList:GetPropertyChangedSignal("Size"):Connect(function()
                UpdateFrameSize(TabFrame,UIListLayout)
            end)
            
            UICorner_20.CornerRadius = UDim.new(0, 16)
            UICorner_20.Parent = DropdownList

            ImageLabel.Parent = Dropdown
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.Position = UDim2.new(0.9, 0, 0, 0)
            ImageLabel.Size = UDim2.new(0, 25, 0, 25)
            ImageLabel.Image = "rbxassetid://3926305904"
            ImageLabel.ImageRectOffset = Vector2.new(44, 404)
            ImageLabel.ImageRectSize = Vector2.new(36, 36)
            ImageLabel.ZIndex = 2

            local opened = false
            local dropDebounce = false

            local function ToggleDropdown()
                if dropDebounce then return end

                Ripple(Dropdown)

                if not opened then
                    task.spawn(function()
                        dropDebounce = true
                        DropdownList.Visible = true
                        Tween("size",DropdownList,UDim2.new(0, 424,0, 98),.15)
                        Tween("rotation",ImageLabel,{Rotation = 180},.3)
                        task.wait(.3)
                        DropdownList.ScrollBarImageTransparency = 0
                        opened = true
                        dropDebounce = false
                        UpdateFrameSize(TabFrame,UIListLayout)
                    end)
                elseif opened then
                    task.spawn(function()
                        dropDebounce = true
                        DropdownList.ScrollBarImageTransparency = 1
                        DropdownList.CanvasPosition = Vector2.new(0,0)
                        Tween("size",DropdownList,UDim2.new(0, 424, 0, 0),.15)
                        Tween("rotation",ImageLabel,{Rotation = 0},.3)
                        task.wait(.3)
                        DropdownList.Visible = false
                        opened = false
                        dropDebounce = false
                        UpdateFrameSize(TabFrame,UIListLayout)
                    end)
                end
            end

            local function CreateItem(newItem,index)
                if typeof(newItem) == "Instance" then
                    newItem = newItem.Name
                end

                local item = Instance.new("TextButton")
                local UICorner_21 = Instance.new("UICorner")

                item.Name = "item"
                item.Parent = DropdownList
                item.BackgroundColor3 = Color3.fromRGB(37,37,37)
                item.ClipsDescendants = true
                item.Size = UDim2.new(0, 410, 0, 24)
                item.Font = Enum.Font.Gotham
                item.TextColor3 = Color3.fromRGB(255, 255, 255)
                item.TextScaled = false
                item.TextSize = 14.000
                item.TextWrapped = true
                item.Text = tostring(newItem)

                UICorner_21.Parent = item

                item.MouseButton1Click:Connect(function()
                    name_5.Text = dropName..": "..item.Text
                    pcall(callback,item.Text,index)
                    ToggleDropdown()
                end)
            end


            local function AddItems(listTB)
                local InstanceTable = {}
                local CurrentList = listTB

                for i,v in pairs(listTB) do
                    CreateItem(v,i)
                    if typeof(v) == "Instance" then
                        table.insert(InstanceTable,i,v)
                    end
                end

                if #InstanceTable > 0 then
                    return CurrentList,InstanceTable
                end

                return CurrentList
            end

            local function RemoveAllItems()
                for i,v in pairs(DropdownList:GetChildren()) do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end

            local CurrentList,InstanceTable = AddItems(list)

            hitbox_4.MouseButton1Click:Connect(function()
                ToggleDropdown()
            end)

            local dropdownFunc = {}

            function dropdownFunc:SetOptions(newList)
                RemoveAllItems()
                CurrentList,InstanceTable = AddItems(newList)
            end

            function dropdownFunc:SetChoice(ch)
                if table.find(CurrentList,ch) then
            local index = table.find(CurrentList,ch)
                    name_5.Text = dropName..": "..ch
                    pcall(callback,ch,index)
                end
            end

        function dropdownFunc:GetChoice()
        local DDChoice = name_5.Text:split(": ")[2]

        if DDChoice ~= nil then
            return DDChoice
        else
            return ""
        end
            end

            function dropdownFunc:GetOptions()
                return CurrentList,InstanceTable
            end

        function dropdownFunc:LoadConfig(data)
                if data.Name == dropName and data.Type == "Dropdown" then
                    dropdownFunc:SetChoice(data.Value)
                end
            end

            local info = {Name = dropName,Type ="Dropdown",Value = dropdownFunc:GetChoice(),Element = dropdownFunc}
            
            function dropdownFunc:SaveConfig(data)
                for i,v in pairs(_G.UISettings.ElementCache) do
                    if v.Name == info.Name and v.Type == info.Type then
                        v["Value"] = dropdownFunc:GetChoice()
                    end
                end
            end

            table.insert(_G.UISettings.ElementCache,info)
            
            UpdateFrameSize(TabFrame,UIListLayout)

            return dropdownFunc
        end

        return Elements
    end

    dragify(BG)
    
    return Tabs
end 

local library = Library
local plr = game.Players.LocalPlayer
local char = plr.Character
local hum = char.Humanoid
local http
pcall(function()
http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
end)

getgenv().speed = 100

local function SimulateClick(button,cmd)
    pcall(function()
        local string = {
            ha = "MouseButton1Click",
            ez = "MouseButton1Down",
            la = "Activated",
        }
        for i,v in pairs(string) do
            for i,v in pairs(getconnections(button[v])) do
                v[cmd]()
            end
        end
    end)
end

local function Tween(target)
    local speed = getgenv().speed
    local info = TweenInfo.new((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
    local Tween
    local _,err = pcall(function()
        Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = target}):Play()
    end);
    
    if Tween ~= nil then repeat task.wait() until (target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= .1 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 end
end;













local function MO(name)
	local LibraryColor = Color3.fromRGB(73, 135, 74)
	local win = library:Window(name .. " (touch grass)", LibraryColor)
	win.PromptDiscord("y7H2qGmNKd")

	local main = win:Tab("Training")
	local notify = win:Tab("Notify")
	local autocook = win:Tab("Auto Cook")
	local misc = win:Tab("Misc")
	local risky = win:Tab("Risky")
	risky:Label("-- ANYTHING IN THIS TAB WAS SUGGESTED BY SOMEONE --")
	risky:Label("-- AND IS CONSIDERED RISKY USE AT YOUR OWN RISK --")

	local panicdelay = 0.5
	local panicdashdelay = 3
	local CurrentRegening = false
	local panicangle = math.random(35, 90)
	local VIM = game:GetService("VirtualInputManager")
	local panicdashdebounce = false
	local ministam = 20
	local regenstamina
	local regentoamt = 100
	local autopanic
	local UIS = game:GetService("UserInputService")
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local holdclick
	local CurrentGanker = nil
	local currentlyviewing = nil
	local macroruin
	local OPsData = nil
	pcall(function()
		OPsData = readfile("/m1keincorporated/MOoppositions.json")
	end)
	local OPSNotifier = false
	local SleepNotifier
	local alreadynotifieduser = nil
	local macroruindebounce = false
	local NoFoodNotify
	local LogOnNoFood
	local webhookUrl
	local camera = workspace.CurrentCamera
	local rs = game:GetService("RunService")
	local ESP
	local wanted = { "Owner", "Associates.", "Mod", "Trial Mod", "sircroc!" }
	local WhitelistedStats = {
		"Durability",
		"UpperBodyMuscle",
		"RunningSpeed",
		"Fat",
		"StrikingPower",
		"StrikingSpeed",
		"LowerBodyMuscle",
		"Height",
		"Stamina",
	}
	local oldVolume = nil
	local CurrentlyPlaying = {}
	local copnotifier
	local staffnotifier
	local disableOnStaff
	local flownotifier = false
	local flowconnection = nil
	local sfnotifier = false
	local sfconnection = nil
	local acknowledged = false
	local acook = false
	local SelectedFood = ""
	local abn
	local TotalServings = 1
	local absbox
	local autotrain
	local traintype
	local trainspeed
	local isrunning = false
	local startPunching = false
	local currentcombo
	local m2already = false
	local strikepower
	local autoWalkToFoodSpots = false
	local durability
	local DuraTool = ""
	local AutoWalkAfterPushedBack
	local ft
	local st
	local taketurns = false
	local durainprogress = false
	local stopAtHP = 20
	local SkillXP = false
	local AutoStop = false
	local LogOnNotEnoughMoney = false
	local WalkBackWhenFar = false
	local FatigueToStop = 65
	local LogOnFatigued = false
	local autosleepLog, autosleepRes, autosleepwalk = false, false, false
	local AutoSleepPaths = {
		["Noi"] = {
			["IsInsideDist"] = 90,

			["Sequence"] = {
				CFrame.new(
					-563.773621,
					47.9251785,
					-239.531036,
					-0.023773279,
					2.32641151e-09,
					-0.999717355,
					-4.37537873e-09,
					1,
					2.43111575e-09,
					0.999717355,
					4.43193793e-09,
					-0.023773279
				), -- NOI INSIDE
				CFrame.new(
					-491.393372,
					47.1251755,
					-334.181793,
					0.707333982,
					5.5018571e-08,
					0.706879497,
					2.09656843e-08,
					1,
					-9.8812194e-08,
					-0.706879497,
					8.47134345e-08,
					0.707333982
				), --midpoint1
				CFrame.new(
					-637.209961,
					47.125164,
					-446.7258,
					0.0272168536,
					7.69836674e-08,
					0.999629557,
					6.81569645e-09,
					1,
					-7.71977682e-08,
					-0.999629557,
					8.91425156e-09,
					0.0272168536
				), --HospitalLoaded
			},
		},

		["Karate"] = {
			["IsInsideDist"] = 90,

			["Sequence"] = {
				CFrame.new(
					-664.119202,
					47.6938782,
					-611.250977,
					-0.00150513474,
					-8.3909228e-08,
					0.999998868,
					1.02445374e-09,
					1,
					8.39108623e-08,
					-0.999998868,
					1.15074972e-09,
					-0.00150513474
				), -- karate inside
				CFrame.new(
					-725.983948,
					47.7645721,
					-574.489563,
					-0.999990106,
					-5.69174006e-08,
					0.00445292145,
					-5.67966332e-08,
					1,
					2.7247351e-08,
					-0.00445292145,
					2.69941687e-08,
					-0.999990106
				), --midpoint1
				CFrame.new(
					-726.560303,
					46.7939758,
					-458.533325,
					-0.896284282,
					-4.07478096e-09,
					0.443480015,
					-3.75909188e-08,
					1,
					-6.6783997e-08,
					-0.443480015,
					-7.65282664e-08,
					-0.896284282
				), --HospitalLoaded
			},
		},
	}
	local trainingsTodo = {}
	local sleepanims = {
		"rbxassetid://5110906576",
		"rbxassetid://4959794246",
		"rbxassetid://5110983609",
		"rbxassetid://4959795216",
		"rbxassetid://4959793113",
		"rbxassetid://5110953707",
		"rbxassetid://5110982040",
		"rbxassetid://5110919996",
	}
	local trainingtoggles = {}
	local disabledFeaturesRunning = false
	local ESPDistance = 10000
	local strikespeed = false
	local rhythmcheckdebounce = false
	local autoeat = false
	local stopAEinCombat = false
	local FillUp
	local EatAt
	local autosupplement = false
	local selectedsupplement = nil
	local machines = false
	local treadselect = nil
	local machinetype = nil
	local CurrentRegening = false
	local ping = "@everyone"
	local statcheck = false
	local RhythmToggle = false
	local RunToPercent = 50
	local PunchStartPercent = 55
	local PunchEndPercent = 20
	local Roadwork = false
	local RWCanSprint = false
	local CPRangeTilNext = 7
	local PointRangeTilNext = 6
	local LastMachine = nil
	local spuseM2 = false
	local ssuseM2 = false
	local autostarve = false
	local staminabelowpercent = 20
	local ASisrunning = false
	local PFS = game:GetService("PathfindingService")
	local HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local pathStatus = Enum.PathStatus
	local player = game.Players.LocalPlayer
	local autobuyitem = false
	local itemselected = nil
	local StopInCombat = false
	local StopKnocked = false
	local autosprintcombat = false
	local holdingW = false
	local began, ended = nil, nil
	shared.currentPoint = nil
	local MOfoods = {
		"Donut",
		"Coffee",
		"Bagel",
		"EZ Taco",
		"Omelette",
		"Hotdog",
		"Pancakes",
		"Tofu Beef Soup",
		"Pie",
		"Tokito Sake",
		"Hamburger",
		"Chicken Fries",
		"Ramen",
	}
	local recipes = {
		["Steak"] = {
			["Seasoning"] = 1,
			["Raw Beef"] = 1,
		},
		["Chicken"] = {
			["Seasoning"] = 1,
			["Raw Chicken"] = 1,
		},
		["Sunny Side up Egg"] = {
			["Egg"] = 1,
		},
		["Onigri"] = {
			["Rice"] = 2,
			["Seasoning"] = 1,
			["Seaweed"] = 1,
			["Soy Sauce"] = 1,
		},
		["Omelette"] = {
			["Egg"] = 2,
			["Seasoning"] = 1,
		},
		["Braised Potato"] = {
			["Potato"] = 2,
			["Soy Sauce"] = 1,
			["Onion"] = 1,
			["Seasoning"] = 1,
		},
		["Steak Fried Rice"] = {
			["Rice"] = 1,
			["Egg"] = 2,
			["Onion"] = 1,
			["Carrot"] = 1,
			["Raw Beef"] = 1,
			["Tomato"] = 1,
			["Seasoning"] = 1,
			["Spice"] = 1,
		},
		["Curry"] = {
			["Spice"] = 1,
			["Potato"] = 1,
			["Carrot"] = 1,
			["Raw Beef"] = 1,
			["Rice"] = 2,
			["Onion"] = 1,
		},
		["Marinade Lobster"] = {
			["Seasoning"] = 1,
			["Raw Lobster"] = 1,
			["Spice"] = 1,
		},
	}

	local function CheckForFood()
		if SelectedFood == nil then
			return false
		end
		for i, v in pairs(recipes[SelectedFood]) do
			if game.Players.LocalPlayer.Backpack:FindFirstChild(i) == nil then
				return false
			end
			if game.Players.LocalPlayer.Backpack:FindFirstChild(i).Quantity.Value < v then
				return false
			end
		end
		return true
	end

	local function GetItemTable()
		local tbl = {}

		for i, v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild("Shopnoid") then
				local foodname = v.Name:split(":")[1]
				if table.find(MOfoods, foodname) then
					table.insert(tbl, v)
				end
			end
		end

		return tbl
	end

	local ItemTable = GetItemTable()

	local function round(n)
		return math.floor(n) * 1
	end

	local function GetPan()
		local bestdistance, pan = nil, nil
		local paninstances = {
			workspace,
			game:GetService("Workspace").Apartment2,
			game:GetService("Workspace").HOMRA,
			game:GetService("Workspace").Apartment4,
			game:GetService("Workspace").Apartment1,
			game:GetService("Workspace")["Street House"],
			game:GetService("Workspace")["Organisation Building"],
		}

		for _, instance in pairs(paninstances) do
			for i, v in pairs(instance:GetChildren()) do
				if v.Name == "Stove" or v:FindFirstChild("Stove") then
					if v:FindFirstChild("Stove") then
						v = v:FindFirstChild("Stove")
					end

					local distance = (
						v.PanModel.FoodP.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					).Magnitude

					if bestdistance == nil and distance <= 5 then
						bestdistance = distance
						pan = v.PanModel
					elseif bestdistance ~= nil and distance <= 5 then
						if bestdistance > distance and distance <= 5 then
							bestdistance = distance
							pan = v.PanModel
						end
					end
				end
			end
		end
		return pan
	end

	local function playsound(id)
		local sound = Instance.new("Sound", game.CoreGui)
		sound.SoundId = "rbxassetid://" .. id
		sound.Volume = 10
		sound.Looped = true
		sound:Play()
		return sound
	end

	local function createPath(point)
		local currentPath = PFS:FindPathAsync(HRP.Position, point)
		local pathExists = false

		if currentPath.Status == pathStatus.Success then
			pathExists = true

			spawn(function()
				while pathExists and task.wait() and Roadwork and shared.currentPoint ~= nil do
					player.Character.Humanoid.WalkToPoint = shared.currentPoint
				end
			end)

			for i, v in pairs(currentPath:GetWaypoints()) do
				if Roadwork == false then
					shared.currentPoint = nil
					break
				end
				repeat
					task.wait()
					shared.currentPoint = v.Position
					print((HRP.Position - v.Position).Magnitude)
				until (HRP.Position - v.Position).Magnitude < CPRangeTilNext or Roadwork == false
			end
		elseif currentPath.Status ~= pathStatus.Success or shared.currentPoint == nil then
			pathExists = false
		end
	end

	local function WalkTo(point)
		pcall(function()
			local currentPath = PFS:FindPathAsync(HRP.Position, point)
			local pathExists = false

			if currentPath.Status == pathStatus.Success then
				pathExists = true

				spawn(function()
					while pathExists and task.wait() and shared.currentPoint ~= nil do
						player.Character.Humanoid.WalkToPoint = shared.currentPoint
					end
				end)

				for i, v in pairs(currentPath:GetWaypoints()) do
					repeat
						task.wait()
						shared.currentPoint = v.Position
					until (HRP.Position - v.Position).Magnitude < 5
				end
			elseif currentPath.Status ~= pathStatus.Success or shared.currentPoint == nil then
				pathExists = false
			end
		end)
	end

	local function Callback(answer)
		acknowledged = true
		UserSettings():GetService("UserGameSettings").MasterVolume = oldVolume
		oldVolume = nil
		for i, v in pairs(CurrentlyPlaying) do
			v:Stop()
			game.Debris:AddItem(v, 0.01)
		end
		CurrentlyPlaying = {}
		task.delay(1, function()
			acknowledged = false
		end)

		if answer == "OMG FLOW" and game:GetService("Workspace"):FindFirstChild("XinFolder") then
			local QuestMarker = Instance.new("BillboardGui")
			local ImageLabel = Instance.new("ImageLabel")

			QuestMarker.Name = "ESP"
			QuestMarker.Parent = game:GetService("Workspace").XinFolder:FindFirstChildOfClass("Model").HumanoidRootPart
			QuestMarker.AlwaysOnTop = true
			QuestMarker.Size = UDim2.new(0, 50, 0, 50)

			ImageLabel.Parent = QuestMarker
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.Image = "rbxassetid://2334137638"
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 85, 0)
		elseif answer == "LIGHTWORK" and game:GetService("Workspace"):FindFirstChild("AokiFolder") then
			local QuestMarker = Instance.new("BillboardGui")
			local ImageLabel = Instance.new("ImageLabel")

			QuestMarker.Name = "ESP"
			QuestMarker.Parent = game:GetService("Workspace").AokiFolder:FindFirstChildOfClass("Model").HumanoidRootPart
			QuestMarker.AlwaysOnTop = true
			QuestMarker.Size = UDim2.new(0, 50, 0, 50)

			ImageLabel.Parent = QuestMarker
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.Image = "rbxassetid://2334137638"
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
	local Bindable = Instance.new("BindableFunction")
	Bindable.OnInvoke = Callback

	local function GetSkill()
		local lol = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGUI.Frame

		for i, v in pairs(lol:GetChildren()) do
			if v.ClassName == "ImageLabel" then
				print("ing")
				if tostring(v.ImageColor3) == "0.419608, 0.32549, 0.137255" then
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
						if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Skill") then
							return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"), v
						end
					end
				elseif tostring(v.ImageColor3) == "0.211765, 0.211765, 0.211765" then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v.ToolName.Text) then
						if
							game.Players.LocalPlayer.Backpack:FindFirstChild(v.ToolName.Text):FindFirstChild("Skill")
						then
							return game.Players.LocalPlayer.Backpack:FindFirstChild(v.ToolName.Text), v
						end
					end
				end
			end
		end

		return nil, nil
	end

	local function disableAllTraining()
		for i, v in pairs(trainingtoggles) do
			if v:GetState() == true then
				table.insert(trainingsTodo, v)
				v:SetState(false)
			end
		end
	end

	local function Notifier(v)
		if v ~= nil then
			if v:IsInGroup(15987464) and copnotifier or v:IsInGroup(7677568) and copnotifier then
				if oldVolume == nil then
					oldVolume = UserSettings():GetService("UserGameSettings").MasterVolume
				end
				local level = 10 / 10
				UserSettings():GetService("UserGameSettings").MasterVolume = level
				CurrentlyPlaying[#CurrentlyPlaying + 1] = playsound(9117261160)

				game.StarterGui:SetCore("SendNotification", {
					Title = "WEEE WOOO (Cop)",
					Text = v.Name,
					Duration = math.huge,
					Button1 = "STOPP",
					Callback = Bindable,
				})
			end

			if table.find(wanted, v:GetRoleInGroup(4800422)) and staffnotifier then
				if disableOnStaff then
					disableAllTraining()
				end

				if oldVolume == nil then
					oldVolume = UserSettings():GetService("UserGameSettings").MasterVolume
				end
				local level = 10 / 10
				UserSettings():GetService("UserGameSettings").MasterVolume = level
				CurrentlyPlaying[#CurrentlyPlaying + 1] = playsound(9114284125)

				game.StarterGui:SetCore("SendNotification", {
					Title = "THE OPS! (STAFF)",
					Text = v.Name,
					Duration = math.huge,
					Button1 = "smhh",
					Callback = Bindable,
				})
				if oldVolume == nil then
					oldVolume = UserSettings():GetService("UserGameSettings").MasterVolume
				end
				local level = 10 / 10
				UserSettings():GetService("UserGameSettings").MasterVolume = level
				CurrentlyPlaying[#CurrentlyPlaying + 1] = playsound(9114284125)

				game.StarterGui:SetCore("SendNotification", {
					Title = "THE OPS! (STAFF)",
					Text = v.Name,
					Duration = math.huge,
					Button1 = "smhh",
					Callback = Bindable,
				})
			end
		else
			if game:GetService("Workspace"):FindFirstChild("XinFolder") and flownotifier then
				if oldVolume == nil then
					oldVolume = UserSettings():GetService("UserGameSettings").MasterVolume
				end
				local level = 10 / 10
				UserSettings():GetService("UserGameSettings").MasterVolume = level
				CurrentlyPlaying[#CurrentlyPlaying + 1] = playsound(9125673453)

				game.StarterGui:SetCore("SendNotification", {
					Title = "Flow NPC SPAWNED",
					Text = "LUKE XIN",
					Duration = math.huge,
					Button1 = "OMG FLOW",
					Callback = Bindable,
				})
			end

			if game:GetService("Workspace"):FindFirstChild("AokiFolder") and sfnotifier then
				if oldVolume == nil then
					oldVolume = UserSettings():GetService("UserGameSettings").MasterVolume
				end
				local level = 10 / 10
				UserSettings():GetService("UserGameSettings").MasterVolume = level
				CurrentlyPlaying[#CurrentlyPlaying + 1] = playsound(9125673453)

				game.StarterGui:SetCore("SendNotification", {
					Title = "SF NPC SPAWNED",
					Text = "STREET FIGHTER",
					Duration = math.huge,
					Button1 = "LIGHTWORK",
					Callback = Bindable,
				})
			end
		end
	end

	game:GetService("Workspace").Live.DescendantAdded:Connect(function(child)
		if child.Name == "Attacking" and child.Parent ~= game.Players.LocalPlayer.Character and macroruin then
			if
				(child.Parent.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
				<= 5
			then
				CurrentGanker = plrList:FindFirstChild(child.Parent.Name).User.Txt.Text
					.. " ["
					.. child.Parent.Name
					.. "]"
			end
		end
	end)

	if getgenv().spectateList == nil then
		getgenv().spectateList = true

		task.spawn(function()
			local gankedLists = {}
                        local plrList = game:GetService("Players").LocalPlayer.PlayerGui.PlayerList.Main.SF.Holder

			while spectateList and task.wait() do
				pcall(function()
					if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerList") ~= nil then
						plrList = game:GetService("Players").LocalPlayer.PlayerGui.PlayerList.Main.SF.Holder

						if gankedLists[plrList] ~= true then
							gankedLists[plrList] = true
							repeat
								task.wait()
							until game:IsLoaded() and game.Players.LocalPlayer.Character ~= nil
							repeat
								task.wait()
							until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

							for i, v in pairs(plrList:GetChildren()) do
								if v:IsA("ImageButton") and v.Name ~= game.Players.LocalPlayer.Name then
									v.User.Activated:Connect(function()
										if currentlyviewing ~= nil then
											if currentlyviewing:FindFirstChild("Player") ~= nil then
												if currentlyviewing == v then
													currentlyviewing.Player.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
													workspace.CurrentCamera.CameraSubject =
														game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
													currentlyviewing = nil
													return
												end
												currentlyviewing.Player.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
											elseif currentlyviewing:FindFirstChild("Player") == nil then
												workspace.CurrentCamera.CameraSubject =
													game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
												currentlyviewing = nil
											end
										end

										local viewplr = workspace.Live:FindFirstChild(v.Name)
										if viewplr == nil then
											return
										end
										if viewplr:FindFirstChild("Humanoid") ~= nil then
											workspace.CurrentCamera.CameraSubject = viewplr:WaitForChild("Humanoid")
											v.Player.Title.TextColor3 = LibraryColor
											currentlyviewing = v
											task.spawn(function()
												while (currentlyviewing == v) and task.wait(0.5) do
													local viewplr = workspace.Live:FindFirstChild(v.Name)
													if viewplr == nil then
														workspace.CurrentCamera.CameraSubject =
															game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
														currentlyviewing = nil
														break
													end
												end
											end)
										end
									end)
								end
							end

							plrList.ChildAdded:Connect(function(v)
								if v:IsA("ImageButton") then
									v.User.Activated:Connect(function()
										if currentlyviewing ~= nil then
											if currentlyviewing:FindFirstChild("Player") ~= nil then
												if currentlyviewing == v then
													currentlyviewing.Player.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
													workspace.CurrentCamera.CameraSubject =
														game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
													currentlyviewing = nil
													return
												end
												currentlyviewing.Player.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
											elseif currentlyviewing:FindFirstChild("Player") == nil then
												workspace.CurrentCamera.CameraSubject =
													game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
												currentlyviewing = nil
											end
										end

										local viewplr = workspace.Live:FindFirstChild(v.Name)
										if viewplr == nil then
											return
										end
										if viewplr:FindFirstChild("Humanoid") ~= nil then
											workspace.CurrentCamera.CameraSubject = viewplr:WaitForChild("Humanoid")
											v.Player.Title.TextColor3 = LibraryColor
											currentlyviewing = v
											task.spawn(function()
												while (currentlyviewing == v) and task.wait(0.5) do
													local viewplr = workspace.Live:FindFirstChild(v.Name)
													if viewplr == nil then
														workspace.CurrentCamera.CameraSubject =
															game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
														currentlyviewing = nil
														break
													end
												end
											end)
										end
									end)
								end
							end)
						end
					end
				end)
			end
		end)
	end

	function round(p8, p9)
		if not p9 then
			return math.floor(p8 + 0.5)
		end
		local v15 = math.floor(p8 * 10 ^ p9 + 0.5) / 10 ^ p9
		local v16 = string.len(v15)
		local v17 = string.sub(v15, v16, v16)
		local v18 = v16 - 1
		if string.sub(v15, v18, v18) == "." then
			v15 = v15 .. "0"
		end
		return v15
	end

    if typeof(getgc) ~= "nil" then
        local StatViewerLabels = nil
        local SC = win:Tab("Stat Check")

        shared.StatUpdate = function(v)
            if statcheck ~= true then
                return
            end
            local StatTable = v

            if StatViewerLabels == nil then
                StatViewerLabels = {}

                for i, v in pairs(StatTable) do
                    if table.find(WhitelistedStats, i) ~= nil then
                        if typeof(v) == "table" then
                            StatViewerLabels[i] = SC:Label(i .. " - " .. round(v[1], 3))
                        else
                            StatViewerLabels[i] = SC:Label(i .. " - " .. round(v, 3))
                        end
                    end
                end
            else
                for i, v in pairs(StatTable) do
                    if table.find(WhitelistedStats, i) ~= nil then
                        if typeof(v) == "table" then
                            StatViewerLabels[i]:SetText(i .. " - " .. round(v[1], 3))
                        else
                            StatViewerLabels[i]:SetText(i .. " - " .. round(v, 3))
                        end
                    end
                end
            end
        end

        local function StatTable()
            local ls = getsenv(game.Players.LocalPlayer.Backpack.LocalS)

            for i, v in pairs(ls) do
                if typeof(v) == "function" then
                    for i, v in pairs(debug.getupvalues(v)) do
                        if typeof(v) == "table" then
                            if v["Height"] ~= nil then
                                return v
                            end
                        end
                    end
                end
            end
        end

        SC:Toggle("Auto Stat Check", false, function(Value)
            statcheck = Value

            if statcheck then
                shared.StatUpdate(StatTable())
            end
        end)
        local RefreshConstant

        SC:Toggle("Refresh Constantly", false, function(Value)
            RefreshConstant = Value

            while RefreshConstant and task.wait(0.05) do
                shared.StatUpdate(StatTable())
            end
        end)

        if shared.StatConfigured == nil then
            task.spawn(function()
                shared.StatConfigured = true

                local updateDebounce = false
                game:GetService("ReplicatedStorage").Events.UpdateStats.OnClientEvent:Connect(function(x)
                    if updateDebounce or statcheck ~= true then
                        return
                    end

                    if table.find(WhitelistedStats, x) then
                        updateDebounce = true
                        pcall(function()
                            shared.StatUpdate(StatTable())
                        end)
                        task.wait(0.1)
                        updateDebounce = false
                    end
                end)
            end)
        end
    end

	local function GetBed()
		local bestdistance, bed = nil, nil
		local apartmentBed = false

		for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if apartmentBed then
				break
			end
			if v.Name:find("Bed") then
				if not v:FindFirstChild("OccupiedBy") then
					local distance = (v.Matress.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

					if bestdistance == nil then
						bestdistance = distance
						bed = v
					elseif bestdistance ~= nil then
						if bestdistance > distance then
							bestdistance = distance
							bed = v
						end
					end
				end
			elseif v.Name:find("Apartment") then
				for _, v in pairs(v:GetChildren()) do
					if v.Name == "Bed" then
						local distance = (
							v.Matress.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						).Magnitude
						local Owner = v.Owner.Value

						if
							Owner == tostring(game.Players.LocalPlayer.UserId)
							and distance <= v.ClickDetector.MaxActivationDistance
						then
							bed = v
							apartmentBed = true
							break
						end
					end
				end
			end
		end

		return bed
	end

	local function GetMachineType(v)
		if v:FindFirstChild("Screen") then
			return "Treadmill"
		elseif v:FindFirstChildOfClass("MeshPart") and v:FindFirstChild("Barbell") then
			return "Bench"
		elseif not v:FindFirstChildOfClass("MeshPart") and v:FindFirstChild("Barbell") then
			return "Squat"
		else
			return "nil"
		end
	end

	local function ClosestMachine()
		local bestdistance, machine = nil, nil
		local machineinstances =
			{ workspace.Naniwa, workspace["Organisation Building"], workspace, workspace:GetChildren()[1436] }

		for _, instance in pairs(machineinstances) do
			for i, v in pairs(instance:GetChildren()) do
				if GetMachineType(v) == machinetype and v.Name == "Machine" then
					if v:FindFirstChild("Machine") then
						v = v:FindFirstChild("Machine")
					end
					local distance = (v.Base.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					local MaxActivationDist = v.ClickDetector.MaxActivationDistance

					if distance <= MaxActivationDist then
						if bestdistance == nil and machine == nil then
							bestdistance = distance
							machine = v
						elseif bestdistance > distance then
							bestdistance = distance
							machine = v
						end
					end
				end
			end
		end

		return machine
	end

	local lastBestTarget = nil

	local function GetSSBuy()
		local bestdistance, ss = nil, nil
		local ssinstances = {
			workspace.Map,
			workspace.kUREtRAINER,
		}

		for _, instance in pairs(ssinstances) do
			for i, v in pairs(instance:GetChildren()) do
				if v.Name:find("Strike Speed Training") or v:FindFirstChild("Strike Speed Training: $180") then
					if v:FindFirstChild("Strike Speed Training: $180") then
						v = v:FindFirstChild("Strike Speed Training: $180")
					end
					local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).Magnitude
					local MaxActivationDist = v.ClickDetector.MaxActivationDistance

					if distance <= MaxActivationDist then
						if bestdistance == nil and ss == nil then
							bestdistance = distance
							ss = v
						elseif bestdistance > distance then
							bestdistance = distance
							ss = v
						end
					end
				end
			end
		end

		return ss
	end
	local function ChargeRhythm(combatTool)
		if not RhythmToggle then
			return
		end

		if
			game.Players.LocalPlayer.Character.HumanoidRootPart.RhythmUI.Enabled == false
			and combatTool.Parent == game.Players.LocalPlayer.Character
		then
			VIM:SendKeyEvent(true, "R", false, game)
			task.wait(0.1)
		elseif
			game.Players.LocalPlayer.Character.HumanoidRootPart.RhythmUI.Enabled == true
			and combatTool.Parent == game.Players.LocalPlayer.Character
			and game.Players.LocalPlayer.Character.Rhythm.Value ~= 100
			and not rhythmcheckdebounce
		then
			rhythmcheckdebounce = true
			task.spawn(function()
				local oldRhythm = game.Players.LocalPlayer.Character.Rhythm.Value
				task.wait(0.1)
				if game.Players.LocalPlayer.Character.Rhythm.Value < oldRhythm then
					VIM:SendKeyEvent(true, "R", false, game)
					task.wait(0.1)
					oldRhythm = game.Players.LocalPlayer.Character.Rhythm.Value
					repeat
						task.wait()
					until game.Players.LocalPlayer.Character.Rhythm.Value == 100
						or game.Players.LocalPlayer.Character.Rhythm.Value < oldRhythm
						or combatTool.Parent ~= game.Players.LocalPlayer.Character
				else
					repeat
						task.wait()
					until game.Players.LocalPlayer.Character.Rhythm.Value == 100
						or game.Players.LocalPlayer.Character.Rhythm.Value < oldRhythm
						or combatTool.Parent ~= game.Players.LocalPlayer.Character
				end
				rhythmcheckdebounce = false
			end)
		end
	end

	local function IsSleeping()
		for i, v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
			if table.find(sleepanims, v.Animation.AnimationId) then
				return true
			end
		end
		return false
	end

	local function WalkTo(point)
		local currentPath = PFS:FindPathAsync(HRP.Position, point)
		local pathExists = false

		if currentPath.Status == pathStatus.Success then
			pathExists = true

			spawn(function()
				while pathExists and task.wait() and shared.currentPoint ~= nil do
					player.Character.Humanoid.WalkToPoint = shared.currentPoint
				end
			end)

			for i, v in pairs(currentPath:GetWaypoints()) do
				repeat
					task.wait()
					shared.currentPoint = v.Position
					if broomjobpart ~= nil then
						if broomjobpart.Transparency == 1 then
							shared.currentPoint = nil
							break
						end
					end
				until (HRP.Position - v.Position).Magnitude < 5
			end
		elseif currentPath.Status ~= pathStatus.Success or shared.currentPoint == nil then
			pathExists = false
		end

		shared.currentPoint = nil
	end

	local function BestBroomSpot()
		local bestspot, bestdistance = nil, nil

		for i, v in pairs(game:GetService("Workspace").Jobs.BroomClean[JobBoard]:GetChildren()) do
			if v.Name:find("Part") and v.Transparency ~= 1 and v.Name ~= "Part9" then
				local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude

				if bestspot == nil and bestdistance == nil then
					bestspot = v
					bestdistance = distance
				else
					if bestdistance > distance then
						bestspot = v
						bestdistance = distance
					end
				end
			end
		end

		return bestspot
	end

	local function webhook(title, desc, important)
		pcall(function()
			local url = webhookUrl --webhook
			print("webhook?")
			if url == "" then
				return
			end

			local data

			data = {
				["content"] = ping .. " My Brother In islam!",
				["username"] = "Flex",
				["avatar_url"] = "https://cdn.discordapp.com/avatars/1049015626401853470/a005397b0d5b99c735729b43aa0fa09f.webp?size=80",
				["embeds"] = {
					{
						["author"] = {
							["name"] = "Mighty Omega | " .. title,
							["icon_url"] = "https://cdn.discordapp.com/emojis/1011105474327887954.webp?size=96&quality=lossless",
						},
						["description"] = desc,
						["color"] = 110335,
					},
				},
			}

			local porn = game:GetService("HttpService"):JSONEncode(data)

			local headers = { ["content-type"] = "application/json" }
			request = http_request or request or HttpPost or syn.request or http.request
			local sex = { Url = url, Body = porn, Method = "POST", Headers = headers }
			warn("Sending webhook notification...")
			request(sex)
		end)
	end

	local function sleepWalk(point)
		task.spawn(function()
			shared.AllowSprinting = false

			while task.wait(0.1) and autosleepwalk do
				pcall(function()
					local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
					local StamPercent = (
						game.Players.LocalPlayer.Character.CurrentStamina.Value
						/ game.Players.LocalPlayer.Character.MaxStamina.Value
					) * 100
					local LowStam = ministam

					if isrunning == false and StamPercent >= 100 and shared.AllowSprinting then
						actionscript.runPrompt()
						isrunning = true
						task.wait(1)
					elseif isrunning == true and shared.AllowSprinting then
						repeat
							StamPercent = (
								game.Players.LocalPlayer.Character.CurrentStamina.Value
								/ game.Players.LocalPlayer.Character.MaxStamina.Value
							) * 100
							task.wait()
						until StamPercent <= LowStam
							or StamPercent == 100
							or autosleepwalk == false
							or shared.AllowSprinting == false

						actionscript.stopSprint()
						isrunning = false
					elseif isrunning == true and shared.AllowSprinting == false then
						actionscript.stopSprint()
						isrunning = false
					end
				end)
			end

			shared.AllowSprinting = false
		end)

		local plr = game.Players.LocalPlayer
		local char = plr.Character
		local hum = char.Humanoid
		local PFS = game:GetService("PathfindingService")
		local HRP = char.HumanoidRootPart
		local pathStatus = Enum.PathStatus

		local currentPath
		local ran = pcall(function()
			currentPath = PFS:FindPathAsync(HRP.Position, point)
		end)

		if not ran then
			currentPath = PFS:FindPathAsync(HRP.Position, point.Position)
		end
		local pathExists = false

		if currentPath.Status == pathStatus.Success then
			pathExists = true
			_G.OngoingPath = true

			task.spawn(function()
				while pathExists and task.wait() and _G.currentPoint ~= nil and _G.OngoingPath and autosleepwalk do
					local x, y = pcall(function()
						if (HRP.Position - _G.currentPoint).Magnitude > 5 then
							hum.WalkToPoint = _G.currentPoint
						end
					end)
					if not x then
						warn(y)
					end
				end
			end)

			local lastbroken, LBinit, NotMoving = false, false, false
			local oldhumanpos, lastupdate = nil, nil
			local jumpDebounce = false
			local useOldMethod, TimesBroken, verifiedMoving = false, 0, false

			for i, v in pairs(currentPath:GetWaypoints()) do
				if _G.OngoingPath ~= true then
					return
				end

				if v.Action == Enum.PathWaypointAction.Jump and not jumpDebounce then
					jumpDebounce = true
					task.spawn(function()
						hum:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.7)
						jumpDebounce = false
					end)
				end

				local part = Instance.new("Part")
				part.Shape = "Ball"
				part.Material = "Neon"
				part.Size = Vector3.new(0.6, 0.6, 0.6)
				part.Position = v.Position + Vector3.new(0, 6, 0)
				part.Anchored = true
				part.CanCollide = false
				part.Parent = game.Workspace

				local oldpos = HRP.Position
				local updatedelay = false

				if lastupdate == nil then
					lastupdate = tick()
				else
					if (tick() - lastupdate) >= 2 then
						lastupdate = tick()
						oldhumanpos = HRP.Position
					end
				end

				if NotMoving and lastbroken and TimesBroken >= 3 then
					useOldMethod = true
				end

				if useOldMethod then
					if autosleepwalk == false then
						game.Debris:AddItem(part, 0.01)
						return
					end
					shared.AllowSprinting = true
					useOldMethod = true
					hum:MoveTo(v.Position)
					hum.MoveToFinished:Wait()
					game.Debris:AddItem(part, 0.01)
				else
					repeat
						task.wait()
						if autosleepwalk == false then
							game.Debris:AddItem(part, 0.01)
							return
						end
						_G.currentPoint = v.Position
						if verifiedMoving then
							shared.AllowSprinting = true
						end

						if
							(HRP.Position - v.Position).Magnitude > 5
							and (HRP.Position - part.Position).Magnitude > 4
						then
							if oldpos ~= HRP.Position and not lastbroken and not updatedelay then
								task.spawn(function()
									updatedelay = true
									oldpos = HRP.Position
									task.delay(1, function()
										updatedelay = false
									end)
								end)
							elseif oldpos == HRP.Position and not lastbroken then
								oldpos = HRP.Position
								lastbroken = true
								print("not moving last broke on")
								verifiedMoving = false
								NotMoving = true
								break
							elseif oldpos == HRP.Position and lastbroken and not LBinit then
								LBinit = true
								task.spawn(function()
									shared.AllowSprinting = false
									task.wait(1)
									if oldpos == HRP.Position and not jumpDebounce then
										print("same spot")
										if TimesBroken <= 0 then
											jumpDebounce = true
											task.spawn(function()
												hum:ChangeState(Enum.HumanoidStateType.Jumping)
												task.wait(0.7)
												jumpDebounce = false
											end)
										else
											print("still happening after jump")
										end
									end

									oldpos = HRP.Position
									lastbroken = false
									LBinit = false
									TimesBroken = TimesBroken + 1
								end)
							end
						elseif oldhumanpos ~= nil then
							if (HRP.Position - oldhumanpos).Magnitude <= 0.05 and not jumpDebounce then
								jumpDebounce = true
								task.spawn(function()
									hum:ChangeState(Enum.HumanoidStateType.Jumping)
									task.wait(0.7)
									jumpDebounce = false
								end)
								oldhumanpos = nil
								print("NOT MOVING")
								NotMoving = true
								break
							end
						end
						if (HRP.Position - oldpos).Magnitude > 1 then
							verifiedMoving = true
						end
					until (HRP.Position - v.Position).Magnitude < PointRangeTilNext
						or (HRP.Position - part.Position).Magnitude < 5
						or _G.OngoingPath ~= true
						or autosleepwalk == false
					game.Debris:AddItem(part, 0.01)
				end
			end

			_G.OngoingPath = false
			return true
		elseif currentPath.Status ~= pathStatus.Success or _G.currentPoint == nil then
			pathExists = false

			if currentPath.Status ~= pathStatus.Success then
				return nil
			else
				return true
			end
		end
	end

	local function ASworkaround()
		local newSequence

		for i, v in pairs(AutoSleepPaths) do
			local InsidePos = v["Sequence"][1]
			local MinimumDist = v["IsInsideDist"]
			local IsCorrectPlace = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - InsidePos.Position).Magnitude
				<= MinimumDist

			if IsCorrectPlace then
				newSequence = v["Sequence"]
			end
		end

		if not newSequence then
			return false
		end

		autosleepwalk = true

		for i, v in pairs(newSequence) do
			local result = sleepWalk(v.Position)
			if result ~= true then
				autosleepwalk = false
				return false
			else
				print("Completed Step ", i)
			end
		end

		return true
	end

	local function maintenancechecks()
		if AutoStop then
			local Fatigue = tonumber(
				game.Players.LocalPlayer.PlayerGui.MainGui.Utility.BodyFatigue.Text:split(" ")[3]:split("%")[1]
			)
			if Fatigue >= FatigueToStop then
				if #trainingsTodo > 0 then
					trainingsTodo = {}
				end
				disableAllTraining()
				if macroruin then
					webhook("Macro Notifier", "Max Fatigue Reached!")
				end

				if LogOnFatigued then
					if macroruin then
						webhook("Macro Notifier", "Logging. Fatigue full")
						task.wait(3)
					end

					repeat
						task.wait()
					until game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible == false
					game:shutdown()
					return
				elseif autosleepRes or autosleepLog then
					autosleepwalk = true
					local GUI = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TreadmillMachineGUI")
						or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BarbellMachineGUI")
						or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SquatMachineGUI")

					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					end

					if GUI then
						task.spawn(function()
							SimulateClick(GUI.Frame.Close, "Function")
						end)
						task.wait(1)
					end

					local sleepWalkBack = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

					if macroruin then
						webhook("Auto Sleep", "Starting Pathfinding to a bed")
						task.wait()
					end

					_G.currentPoint = nil
					_G.OngoingPath = false

					local UnoccupiedBed = GetBed()
					local IsCloseEnough = (
						UnoccupiedBed.Matress.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					).Magnitude <= UnoccupiedBed.ClickDetector.MaxActivationDistance

					if not IsCloseEnough then
						local sleepResult, err = sleepWalk(UnoccupiedBed:FindFirstChild("Matress").CFrame)

						if sleepResult ~= true then
							local workaroundResult = ASworkaround()
							if workaroundResult ~= true then
								return webhook(
									"Auto Sleep",
									"Sleep walk was unsuccessful(most likely unsupported place)"
								)
							else
								UnoccupiedBed = GetBed()
								sleepResult = sleepWalk(UnoccupiedBed:FindFirstChild("Matress").CFrame)
								if sleepResult ~= true then
									return webhook("Auto Sleep", "Sleep walk workaround was unsuccessful")
								end
							end
						end
					end

					autosleepwalk = false

					repeat
						task.wait()
						if UnoccupiedBed:FindFirstChild("OccupiedBy") == nil then
							fireclickdetector(UnoccupiedBed.ClickDetector)
							task.wait(1)
							if UnoccupiedBed:FindFirstChild("OccupiedBy") then
								if
									UnoccupiedBed:FindFirstChild("OccupiedBy").Value
									== game.Players.LocalPlayer.Character
								then
									break
								end
							end
						else
							if UnoccupiedBed.OccupiedBy.Value ~= game.Players.LocalPlayer.Character then
								UnoccupiedBed = GetBed()
							else
								break
							end

							local sleepResult, err = sleepWalk(UnoccupiedBed:FindFirstChild("Blanket").CFrame)

							if sleepResult ~= true then
								return webhook("Auto Sleep", "Sleep walk was unsuccessful: " .. err)
							end
						end
					until IsSleeping()

					if macroruin then
						webhook("Auto Sleep", "Successfully reached bed, sleeping fatigue off")
						task.wait()
					end

					repeat
						local Fatigue = tonumber(
							game.Players.LocalPlayer.PlayerGui.MainGui.Utility.BodyFatigue.Text
								:split(" ")[3]
								:split("%")[1]
						)
						task.wait()
					until Fatigue <= 0

					if autosleepLog then
						if macroruin then
							webhook("Auto Sleep", "Logging. Fatigue 0%")
							task.wait(3)
						end

						repeat
							task.wait()
						until game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible == false
						game:shutdown()
						return
					elseif autosleepRes then
						fireclickdetector(UnoccupiedBed.ClickDetector)
						task.wait(1)

						autosleepwalk = true

						if macroruin then
							webhook("Auto Sleep", "0% Fatigue! heading towards last spot")
						end

						if not UnoccupiedBed.Parent.Name:find("Apartment") then
							local trainWalk, err = sleepWalk(sleepWalkBack)

							if trainWalk ~= true then
								autosleepwalk = false
								return webhook("Auto Sleep", "Pathfinding after sleeping was unsuccessful: " .. err)
							end

							local distancefromSpot = (
								sleepWalkBack.Position
								- game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
							).Magnitude

							if distancefromSpot <= 1 then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
									CFrame.new(sleepWalkBack.Position)
								task.wait(0.3)
								game:GetService("TweenService")
									:Create(
										game.Players.LocalPlayer.Character.HumanoidRootPart,
										TweenInfo.new(0.3),
										{ ["CFrame"] = sleepWalkBack }
									)
									:Play()
								task.wait(0.3)
							elseif distancefromSpot <= 10 and distancefromSpot > 1 then
								game.Players.LocalPlayer.Character.Humanoid:MoveTo(sleepWalkBack.Position)
								game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
									CFrame.new(sleepWalkBack.Position)
								task.wait(0.3)
								game:GetService("TweenService")
									:Create(
										game.Players.LocalPlayer.Character.HumanoidRootPart,
										TweenInfo.new(0.3),
										{ ["CFrame"] = sleepWalkBack }
									)
									:Play()
								task.wait(0.3)
							end
						end

						autosleepwalk = false

						for i, v in pairs(trainingsTodo) do
							v:SetState(true)
						end

						trainingsTodo = {}
						if macroruin then
							webhook("Macro Notifier", "Successfully resumed training after sleeping")
						end
					end
				end
			end
		end

		if LogOnNotEnoughMoney and machines then
			local Money =
				tonumber(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.Money.Text:split("$")[2])

			if Money ~= nil then
				if Money < 65 then
					if macroruin then
						webhook("Macro Notifier", "Not Enough Money to Continue Machines")
						task.wait(3)
					end

					repeat
						task.wait()
					until game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible == false
					game:shutdown()
				end
			end
		end

		if autoeat then
			local hungerpercent = (
				game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X
				/ game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.AbsoluteSize.X
			) * 100
			local foodfound

			if hungerpercent <= EatAt then
				foodfound = false
				for i, v in pairs(MOfoods) do
					if foodfound == false then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(v) then
							foodfound = true
						end
					end

					if game.Players.LocalPlayer.Backpack:FindFirstChild(v) and autoeat and hungerpercent < FillUp then
						local function AutoEat()
							if stopAEinCombat then
								if game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible == true then
									return
								end
							end
							repeat
								hungerpercent = (
									game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X
									/ game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.AbsoluteSize.X
								) * 100
								if
									game.Players.LocalPlayer.Backpack:FindFirstChild(v) == nil
									and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil
								then
									break
								end

								if hungerpercent < FillUp or autoeat ~= false then
									local food = game.Players.LocalPlayer.Backpack:FindFirstChild(v)
										or game.Players.LocalPlayer.Character:FindFirstChild(v)
									if food.Parent ~= game.Players.LocalPlayer.Character then
										game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
										task.wait(0.1)
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(food)
										task.wait(0.1)
									end
									food:Activate()
									task.wait(3)
									hungerpercent = (
										game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X
										/ game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.AbsoluteSize.X
									) * 100
								end
								hungerpercent = (
									game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X
									/ game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.AbsoluteSize.X
								) * 100
							until hungerpercent >= FillUp or autoeat == false
							game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						end

						hungerpercent = (
							game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.Bar.AbsoluteSize.X
							/ game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.StomachBar.BarF.AbsoluteSize.X
						) * 100
						if hungerpercent < FillUp and autoeat then
							AutoEat()
						end
					end
				end

				if foodfound ~= nil then
					if foodfound == false then
						if NoFoodNotify then
							webhook("Macro Notifier", "You ran out of food.")
							disableAllTraining()
						end

						if LogOnNoFood then
							if NoFoodNotify then
								webhook("No Food Notifier", "You ran out of food. Logging.")
								task.wait(3)
							end

							repeat
								task.wait()
							until game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible == false
							game:shutdown()
						end
					end
				end
			end
		end

		if autosupplement then
			if selectedsupplement ~= nil then
				if
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Utility.VisualFrame
							:FindFirstChild(selectedsupplement)
						== nil
					and game.Players.LocalPlayer.Backpack:FindFirstChild(selectedsupplement)
				then
					local oldQuantity = nil
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					task.wait(0.1)
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(
						game.Players.LocalPlayer.Backpack:FindFirstChild(selectedsupplement)
					)
					task.wait(0.1)
					oldQuantity = game.Players.LocalPlayer.Character:FindFirstChild(selectedsupplement).Quantity.Value
					game.Players.LocalPlayer.Character:FindFirstChild(selectedsupplement):Activate()
					task.wait(0.1)
					repeat
						local took = false

						if game.Players.LocalPlayer.Character:FindFirstChild(selectedsupplement) == nil then
							took = true
						else
							if
								game.Players.LocalPlayer.Character:FindFirstChild(selectedsupplement).Quantity.Value
								~= oldQuantity
							then
								took = true
							end
						end
						task.wait()
					until took == true
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					task.wait(0.1)
				end
			end
		end
	end

	local function automacrosprint()
		if CurrentRegening then
			shared.AllowSprinting = false
			VIM:SendKeyEvent(true, "W", false, game)
			task.wait(0.5)
		else
			shared.AllowSprinting = true
			VIM:SendKeyEvent(true, "W", false, game)
			task.wait(0.5)
		end
	end

	local function panicdash()
		if not panicdashdebounce then
			panicdashdebounce = true
			local haha = { "W", "A", "S", "D" }
			local randomdirection = haha[math.random(1, #haha)]

			VIM:SendKeyEvent(false, "W", false, game)
			task.wait()
			VIM:SendKeyEvent(true, randomdirection, false, game)
			task.wait(0.02)
			VIM:SendKeyEvent(true, "Q", false, game)
			task.wait()
			VIM:SendKeyEvent(false, "Q", false, game)
			task.wait(0.02)
			VIM:SendKeyEvent(false, randomdirection, false, game)
			task.wait()
			VIM:SendKeyEvent(true, "W", false, game)
			task.wait()
			task.delay(panicdashdelay, function()
				panicdashdebounce = false
			end)
			if CurrentRegening == false then
				automacrosprint()
			end
		end
	end

	local function StaminaCheck(lowstam, stamto)
		if lowstam == nil then
			lowstam = ministam
		end
		local function GetStamina()
			return (
				game.Players.LocalPlayer.Character.CurrentStamina.Value
				/ game.Players.LocalPlayer.Character.MaxStamina.Value
			) * 100
		end

		local function LowStamina()
			if stamto == nil then
				if regenstamina then
					stamto = regentoamt
				else
					stamto = ministam
				end
			end

			if CurrentRegening == false then
				task.spawn(function()
					repeat
						task.wait()
						CurrentRegening = true
					until GetStamina() >= stamto
					CurrentRegening = false
				end)
			end
		end

		if GetStamina() <= lowstam and CurrentRegening == false then
			LowStamina()
		end
	end

	local function panicstamcheck()
		local function GetStamina()
			return (
				game.Players.LocalPlayer.Character.CurrentStamina.Value
				/ game.Players.LocalPlayer.Character.MaxStamina.Value
			) * 100
		end

		local function LowStamina()
			if CurrentRegening == false then
				task.spawn(function()
					repeat
						task.wait()
						shared.AllowSprinting = false
						CurrentRegening = true
					until GetStamina() >= regentoamt
					CurrentRegening = false
				end)
			end
		end

		if GetStamina() <= ministam then
			LowStamina()
		end
	end

	local function esp(plrobj)
		if plrobj == game.Players.LocalPlayer or ESP == false then
			return
		end

		local NameLabel = Drawing.new("Text")
		NameLabel.Visible = false
		NameLabel.Center = true
		NameLabel.Outline = true
		NameLabel.Font = 2
		NameLabel.Color = Color3.fromRGB(66, 135, 245)
		NameLabel.Size = 13

		local HPLabel = Drawing.new("Text")
		HPLabel.Visible = false
		HPLabel.Center = true
		HPLabel.Outline = true
		HPLabel.Font = 2
		HPLabel.Color = Color3.fromRGB(255, 255, 255)
		HPLabel.Size = 13

		local StyleLabel = Drawing.new("Text")
		StyleLabel.Visible = false
		StyleLabel.Center = true
		StyleLabel.Outline = true
		StyleLabel.Font = 2
		StyleLabel.Color = Color3.fromRGB(255, 255, 255)
		StyleLabel.Size = 13

		local style

		local function FindStyle()
			pcall(function()
				local tool = plrobj.Character:FindFirstChildOfClass("Tool")
				if tool ~= nil then
					if tool:FindFirstChild("Style") then
						style = tool.Name
						return
					end
				end

				for i, v in pairs(plrobj.Backpack:GetChildren()) do
					if v:FindFirstChild("Style") then
						style = v.Name
						return
					end
				end

				style = "None"
				return
			end)
		end

		FindStyle()

		local renderstepped
		renderstepped = rs.RenderStepped:Connect(function()
			pcall(function()
				local distance = (
					plrobj.Character.HumanoidRootPart.Position
					- game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				).Magnitude

				if plrobj.Character ~= nil and plrobj.Character:FindFirstChild("Head") and distance <= ESPDistance then
					local plr_pos, plr_onscreen = camera:WorldToViewportPoint(plrobj.Character.Head.Position)

					if game.Players:FindFirstChild(plrobj.Name) == nil or ESP == false then
						NameLabel:Remove()
						StyleLabel:Remove()
						HPLabel:Remove()
						renderstepped:Disconnect()
					end

					if plr_onscreen then
						local ToolEquipped = plrobj.Character:FindFirstChildOfClass("Tool") or { Name = "nil" }
						NameLabel.Position = Vector2.new(plr_pos.X, plr_pos.Y - 50)
						NameLabel.Text = "["
							.. plrobj.Name
							.. "]["
							.. round(
								(
									plrobj.Character.HumanoidRootPart.Position
									- game.Players.LocalPlayer.Character.HumanoidRootPart.Position
								).Magnitude
							)
							.. "]"
						NameLabel.Visible = true

						HPLabel.Position = Vector2.new(plr_pos.X, plr_pos.Y - 35)
						HPLabel.Text = "["
							.. round(((plrobj.Character.Humanoid.Health / plrobj.Character.Humanoid.MaxHealth) * 100))
							.. "% HP]"
							.. "["
							.. round((plrobj.Character.CurrentStamina.Value / plrobj.Character.MaxStamina.Value) * 100)
							.. "% Stam]"
						HPLabel.Visible = true

						StyleLabel.Position = Vector2.new(plr_pos.X, plr_pos.Y - 20)
						StyleLabel.Text = "[" .. style .. "][" .. ToolEquipped.Name .. "]"
						StyleLabel.Visible = true
					else
						NameLabel.Visible = false
						HPLabel.Visible = false
						StyleLabel.Visible = false
					end
				else
					NameLabel.Visible = false
					HPLabel.Visible = false
					StyleLabel.Visible = false
				end
			end)
		end)
	end

	local function GetPunchingBag()
		local bestdistance, bag = nil, nil
		local baginstances = {
			workspace:FindFirstChild("Bag Wrestling"),
			workspace,
			workspace:FindFirstChild("Kung Fu Dojo") and workspace["Kung Fu Dojo"]:FindFirstChild("Bag"),
			workspace:FindFirstChild("Model"),
			workspace:FindFirstChild("Organisation Building"),
			workspace:FindFirstChild("Judo Dojo") and workspace["Judo Dojo"]:FindFirstChild("bags"),
			workspace:FindFirstChild("Map"),  -- Added Map to the list
		}
	
		-- Function to get a valid part for distance calculation
		local function getValidPart(model)
			return model:FindFirstChildWhichIsA("BasePart")
		end
	
		-- Check specific known locations
		for _, instance in pairs(baginstances) do
			if instance then
				for i, v in pairs(instance:GetChildren()) do
					if v.Name == "PunchingBag" or v:FindFirstChild("PunchingBag") then
						local punchingBagPart = getValidPart(v)
						if punchingBagPart then
							local distance = (punchingBagPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	
							if bestdistance == nil or distance < bestdistance then
								bestdistance = distance
								bag = v
							end
						end
					end
				end
			end
		end
	
		-- Check all descendants in the workspace
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") and (v.Name == "PunchingBag" or v:FindFirstChild("PunchingBag")) then
				local punchingBagPart = getValidPart(v)
				if punchingBagPart then
					local distance = (punchingBagPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	
					if bestdistance == nil or distance < bestdistance then
						bestdistance = distance
						bag = v
					end
				end
			end
		end
	
		return bag
	end
	local function GetStyle()
		local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
		if tool ~= nil then
			if tool:FindFirstChild("Style") then
				return tool
			end
		end

		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:FindFirstChild("Style") then
				return v
			end
		end

		return nil
	end

	local function GetClosestRoadwork()
		local rw, bestdistance = nil, nil

		for i, v in pairs(workspace:GetChildren()) do
			if v.Name:find("Roadwork") then
				local Closest = 100
				local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).Magnitude

				if distance <= Closest then
					if rw and bestdistance then
						if distance < bestdistance then
							rw = v
							bestdistance = distance
						end
					else
						rw = v
						bestdistance = distance
					end
				end
			end
		end

		return rw
	end

	local function GetDuraBuy()
		local bestdistance, durabuy = nil, nil
		local durainstances = {
			workspace,
			workspace.kUREtRAINER,
		}

		for _, instance in pairs(durainstances) do
			for i, v in pairs(instance:GetChildren()) do
				if v.Name:find("Durability Training") or v:FindFirstChild("Durability Training: $140") then
					if v:FindFirstChild("Durability Training: $140") then
						v = v:FindFirstChild("Durability Training: $140")
					end

					local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).Magnitude
					local MaxActivationDist = v.ClickDetector.MaxActivationDistance

					if distance <= MaxActivationDist then
						if bestdistance == nil and durabuy == nil then
							bestdistance = distance
							durabuy = v
						elseif bestdistance > distance then
							bestdistance = distance
							durabuy = v
						end
					end
				end
			end
		end

		return durabuy
	end

	local function duraturn(main, support)
		if durability == false then
			return
		end
		if main.Character.Humanoid.Health < main.Character.Humanoid.MaxHealth then
			repeat
				task.wait()
			until main.Character.Humanoid.Health >= main.Character.Humanoid.MaxHealth
			task.wait(0.5)
		end
		local distancebetweenplrs = (
			main.Character.HumanoidRootPart.Position - support.Character.HumanoidRootPart.Position
		).Magnitude
		if GetDuraBuy() == nil and SkillXP == false then
			return
		end
		if distancebetweenplrs > 17 and distancebetweenplrs <= 200 then
			repeat
				local newdistancebetweenplayers = (
					main.Character.HumanoidRootPart.Position - support.Character.HumanoidRootPart.Position
				).Magnitude
				task.wait()
			until newdistancebetweenplayers <= 17
			task.wait(0.5)
		end
		local mychar = game.Players.LocalPlayer.Character

		if support.Character.Name == mychar.Name and durability then
			if not SkillXP then
				repeat
					task.wait()
				until main.Character:FindFirstChild("DuraTrain") or durability == false

				local combatTool = GetStyle()
				local IsCombatEquipped = true
				pcall(function()
					local DaCustomTool = game.Players.LocalPlayer.Backpack:FindFirstChild(DuraTool)
						or game.Players.LocalPlayer.Character:FindFirstChild(DuraTool)
						or "None"

					if DaCustomTool == nil or DaCustomTool == "None" then
						print("USING Default")
						IsCombatEquipped = false
					else
						print("USING ", DaCustomTool)
						combatTool = DaCustomTool
					end
				end)

				if combatTool.Parent == game.Players.LocalPlayer.Backpack and durability then
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					task.wait(0.1)
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(combatTool)
					task.wait(0.1)
				end

				repeat
					local healthpercent = (main.Character.Humanoid.Health / main.Character.Humanoid.MaxHealth) * 100

					if healthpercent > stopAtHP and durability and main.Character:FindFirstChild("DuraTrain") then
						if durability and RhythmToggle and IsCombatEquipped then
							ChargeRhythm(combatTool)
						end

						if
							combatTool.Parent == game.Players.LocalPlayer.Character
							and main.Character:FindFirstChild("DuraTrain")
						then
							combatTool:Activate()
							task.wait(0.05)
						end
					elseif
						combatTool.Parent == game.Players.LocalPlayer.Backpack
						and durability
						and main.Character:FindFirstChild("DuraTrain")
					then
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(combatTool)
						task.wait(0.1)
					end

					task.wait()
				until healthpercent <= stopAtHP and main.Character:FindFirstChild("DuraTrain") == nil
					or durability == false
				task.wait(0.1)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
				task.wait(0.9)
			else
				repeat
					local SkillTool, SkillHotbar = GetSkill()
					local healthpercent = (main.Character.Humanoid.Health / main.Character.Humanoid.MaxHealth) * 100

					if healthpercent > stopAtHP and SkillTool ~= nil and SkillHotbar ~= nil then
						if SkillTool.Parent == game.Players.LocalPlayer.Character and not SkillHotbar.CD.Visible then
							SkillTool:Activate()
							task.wait(1)
							repeat
								task.wait()
							until SkillHotbar.CD.Visible
						elseif SkillTool.Parent == game.Players.LocalPlayer.Backpack and not SkillHotbar.CD.Visible then
							game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
							task.wait(0.5)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(SkillTool)
							task.wait(0.5)
							SkillTool:Activate()
							task.wait(1)
							repeat
								task.wait()
							until SkillHotbar.CD.Visible
						end
					end
					task.wait()
				until healthpercent <= stopAtHP or durability == false or SkillXP == false
				task.wait(0.1)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
				task.wait(0.9)
			end
		elseif main.Character.Name == mychar.Name and durability then
			if not SkillXP then
				local Dura = GetDuraBuy()
				local BeforeDuraDonePos

				if main.Character.Humanoid.Health < main.Character.Humanoid.MaxHealth then
					repeat
						task.wait()
					until main.Character.Humanoid.Health >= main.Character.Humanoid.MaxHealth
					task.wait(0.5)
				end

				if game.Players.LocalPlayer.Character:FindFirstChild("DuraTrain") == nil and durability then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Durability Training") and durability then
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(
							game.Players.LocalPlayer.Backpack:FindFirstChild("Durability Training")
						)
						task.wait(0.1)
						game.Players.LocalPlayer.Character:FindFirstChild("Durability Training"):Activate()
						task.wait(0.1)
					elseif game.Players.LocalPlayer.Character:FindFirstChild("Durability Training") and durability then
						game.Players.LocalPlayer.Character:FindFirstChild("Durability Training"):Activate()
						task.wait(0.1)
					elseif durability then
						repeat
							fireclickdetector(Dura.ClickDetector)
							task.wait(1)
						until game.Players.LocalPlayer.Backpack:FindFirstChild("Durability Training")

						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(
							game.Players.LocalPlayer.Backpack:FindFirstChild("Durability Training")
						)
						task.wait(0.1)
						game.Players.LocalPlayer.Character:FindFirstChild("Durability Training"):Activate()
						task.wait(0.1)
					end
				end

				BeforeDuraDonePos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

				repeat
					local healthpercent = (
						game.Players.LocalPlayer.Character.Humanoid.Health
						/ game.Players.LocalPlayer.Character.Humanoid.MaxHealth
					) * 100
					task.wait()

					if healthpercent <= stopAtHP then
						repeat
							game.Players.LocalPlayer.Character:FindFirstChild("Durability Training"):Activate()
							task.wait(1)
						until game.Players.LocalPlayer.Character:FindFirstChild("Durability Training") == nil
							or game.Players.LocalPlayer.Character:FindFirstChild("DuraTrain") == nil
					end

				until healthpercent <= stopAtHP
						and game.Players.LocalPlayer.Character:FindFirstChild("DuraTrain") == nil
					or durability == false

				task.wait(1)

				if AutoWalkAfterPushedBack then
					local distance = (BeforeDuraDonePos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

					if distance > 2 then
						game.Players.LocalPlayer.Character.Humanoid:MoveTo(BeforeDuraDonePos)
						game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
					end
				end
			else
				repeat
					local healthpercent = (
						game.Players.LocalPlayer.Character.Humanoid.Health
						/ game.Players.LocalPlayer.Character.Humanoid.MaxHealth
					) * 100
					task.wait()
				until healthpercent <= stopAtHP or durability == false or SkillXP == false
			end
		end
	end

	local function debuffCheck()
		if game.Players.LocalPlayer.Character.Ragdolled.Value == true then
			return false
		end

		return true
	end

	main:Label("Pushup/Squat auto train lowest mini stam is 15")
	trainingtoggles[#trainingtoggles + 1] = main:Toggle("Auto Train", false, function(Value)
		autotrain = Value

		while autotrain and task.wait() do
			StaminaCheck()
			maintenancechecks()
			pcall(function()
				if traintype ~= nil and trainspeed ~= nil then
					if traintype ~= "Stamina" then
						if game.Players.LocalPlayer.Character:FindFirstChild(traintype) then
							if trainspeed == "Slow" and CurrentRegening == false and debuffCheck() then
								local oldFatigue = tonumber(
									game.Players.LocalPlayer.PlayerGui.MainGui.Utility.BodyFatigue.Text
										:split(" ")[3]
										:split("%")[1]
								)
								game.Players.LocalPlayer.Character[traintype]:Activate()
								local curtime = tick()
								repeat
									task.wait()
								until tonumber(
											game.Players.LocalPlayer.PlayerGui.MainGui.Utility.BodyFatigue.Text
												:split(" ")[3]
												:split("%")[1]
										)
										~= oldFatigue
									or (tick() - curtime) >= 5
									or game.Players.LocalPlayer.Character:FindFirstChild(traintype) == nil
							elseif trainspeed == "Fast" and CurrentRegening == false and debuffCheck() then
								game.Players.LocalPlayer.Character[traintype]:Activate()
							end
						elseif
							game.Players.LocalPlayer.Backpack:FindFirstChild(traintype) and CurrentRegening == false
						then
							game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
							task.wait(0.1)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(
								game.Players.LocalPlayer.Backpack:FindFirstChild(traintype)
							)
							task.wait(0.1)
						end
					elseif traintype == "Stamina" then
						while task.wait(0.1) and autotrain and traintype == "Stamina" do
							pcall(function()
								local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
								local StamPercent = (
									game.Players.LocalPlayer.Character.CurrentStamina.Value
									/ game.Players.LocalPlayer.Character.MaxStamina.Value
								) * 100
								local LowStam = ministam

								if isrunning == false and StamPercent >= 100 and autotrain then
									actionscript.runPrompt()
									isrunning = true
									task.wait(1)
								elseif isrunning == true and autotrain then
									repeat
										StamPercent = (
											game.Players.LocalPlayer.Character.CurrentStamina.Value
											/ game.Players.LocalPlayer.Character.MaxStamina.Value
										) * 100
										task.wait()
									until StamPercent <= LowStam or StamPercent == 100 or autotrain == false

									if StamPercent < 100 or autotrain == false then
										actionscript.stopSprint()
										maintenancechecks()
									end
									isrunning = false
								end
							end)
						end
					end
				end
			end)
		end
	end)

	main:Slider("Minimum Stamina %", { min = 0, max = 100, def = ministam }, function(Value)
		ministam = Value
	end)

	main:Toggle("Regen Stamina", false, function(Value)
		regenstamina = Value
	end)

	main:Slider("Regen Stamina To %", { min = 0, max = 100, def = regentoamt }, function(Value)
		regentoamt = Value
	end)

	main:Dropdown("Train Type", { "Push up", "Squat", "Stamina" }, function(Value)
		traintype = Value
	end)

	main:Dropdown("Train Speed", { "Fast", "Slow" }, function(Value)
		trainspeed = Value
	end)

 trainingtoggles[#trainingtoggles + 1] = main:Toggle("Strike Speed", false, function(Value)
     strikespeed = Value

     local comboconnection
     comboconnection = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
         if not strikespeed then
             comboconnection:Disconnect()
             return
         end
         if v.Name == "Attacking" and strikespeed then
             currentcombo = v.Value
         end
     end)

	 while task.wait() and strikespeed do
		pcall(function()
			local bag = GetPunchingBag()
			local ssbuy = GetSSBuy()
			local combatTool = GetStyle()

			if bag ~= nil and ssbuy ~= nil and strikespeed then
				if
					game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining") == nil
					and strikespeed
				then
					if
						game.Players.LocalPlayer.Backpack:FindFirstChild("Strike Speed Training") == nil
						and game.Players.LocalPlayer.Character:FindFirstChild("Strike Speed Training") == nil
						and strikespeed
					then
						maintenancechecks()
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						fireclickdetector(ssbuy.ClickDetector)
						task.wait(0.5)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(
							game.Players.LocalPlayer.Backpack:FindFirstChild("Strike Speed Training")
						)
						task.wait(0.2)
						repeat
							task.wait(0.2)
							if
								game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining")
								== nil
							then
								game.Players.LocalPlayer.Character
									:FindFirstChild("Strike Speed Training")
									:Activate()
							end
						until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining")
					elseif
						game.Players.LocalPlayer.Character:FindFirstChild("Strike Speed Training") and strikespeed
					then
						repeat
							task.wait(0.2)
							if
								game:GetService("Players").LocalPlayr.PlayerGui:FindFirstChild("SpeedTraining")
								== nil
							then
								game.Players.LocalPlayer.Character
									:FindFirstChild("Strike Speed Training")
									:Activate()
							end
						until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining")
					elseif
						game.Players.LocalPlayer.Backpack:FindFirstChild("Strike Speed Training") and strikespeed
					then
						maintenancechecks()
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(
							game.Players.LocalPlayer.Backpack:FindFirstChild("Strike Speed Training")
						)
						task.wait(0.2)
						repeat
							task.wait(0.2)
							if
								game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining")
								== nil
							then
								game.Players.LocalPlayer.Character
									:FindFirstChild("Strike Speed Training")
									:Activate()
							end
						until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining")
					end
				else
					pcall(function()
						if combatTool.Parent ~= game.Players.LocalPlayer.Character and strikespeed then
							game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
							task.wait(0.3)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(combatTool)
							task.wait(0.1)
						end

						local m2nextturn = false
						repeat
							if strikespeed and RhythmToggle then
								ChargeRhythm(combatTool)
							end

							 -- ... existing code
                             if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining") and strikespeed then
                                 if game.Players.LocalPlayer.PlayerGui.SpeedTraining.CanHit.Value and
                                    combatTool.Parent == game.Players.LocalPlayer.Character and strikespeed then
                                     if combatTool.Parent == game.Players.LocalPlayer.Character then
                                         if not m2nextturn then
                                             repeat
                                                 combatTool:Activate()
                                                 task.wait()
                                             until game.Players.LocalPlayer.PlayerGui.SpeedTraining.CanHit.Value or
                                                   not strikespeed or
                                                   combatTool.Parent == game.Players.LocalPlayer.Backpack
                                         else
                                             if ssuseM2 then
                                                 repeat
                                                     local successm2 = false

                                                     if currentcombo == 5 then
                                                         successm2 = true
                                                         break
                                                     end
                                                     local VIM = game:GetService("VirtualInputManager")
                                                     VIM:SendMouseButtonEvent(0, 500, 1, true, game, 1)
                                                     task.wait(0.1)
                                                     VIM:SendMouseButtonEvent(0, 500, 1, false, game, 1)
                                                     task.wait(0.5)
                                                 until successm2 or not strikespeed or
                                                       combatTool.Parent == game.Players.LocalPlayer.Backpack or
                                                       not ssuseM2
                                             end
                                             m2nextturn = false
                                         end
                                         local Jaja = tick()
                                         repeat
                                             task.wait()
                                             if currentcombo == 4 and ssuseM2 then
                                                 m2nextturn = true
                                             end
                                         until not game.Players.LocalPlayer.PlayerGui.SpeedTraining.CanHit.Value or
                                               (tick() - Jaja) >= 0.5
                                         if currentcombo == 4 and not m2nextturn and ssuseM2 then
                                             m2nextturn = true
                                         end
                                     end
                                     task.wait()
                                 end
                             end
                             task.wait()
                         until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpeedTraining") or not strikespeed
                     end)
                 end
             end
         end)
     end
 end)

	main:Toggle("SS Use M2", false, function(Value)
		ssuseM2 = Value
	end)

	trainingtoggles[#trainingtoggles + 1] = main:Toggle("Strike Power", false, function(Value)
		strikepower = Value

		local comboconnection
		comboconnection = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
			if strikepower == false then
				comboconnection:Disconnect()
				return
			end
			if v.Name == "Attacking" and strikepower then
				currentcombo = v.Value
			end
		end)

		startPunching = false
		local reequipdebounce = false

		while task.wait() and strikepower do
			local bag = GetPunchingBag()
			local combatTool = GetStyle()

			if bag ~= nil and strikepower then
				local StamPercent = (
					game.Players.LocalPlayer.Character.CurrentStamina.Value
					/ game.Players.LocalPlayer.Character.MaxStamina.Value
				) * 100
				maintenancechecks()

				if startPunching == false then
					if StamPercent < RunToPercent then
						repeat
							StamPercent = (
								game.Players.LocalPlayer.Character.CurrentStamina.Value
								/ game.Players.LocalPlayer.Character.MaxStamina.Value
							) * 100
							task.wait()
						until StamPercent >= RunToPercent or strikepower == false

						startPunching = true
					elseif StamPercent > RunToPercent then
						while task.wait(0.1) and strikepower and startPunching == false do
							if strikepower == false then
								return
							end
							pcall(function()
								local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
								local StamPercent = (
									game.Players.LocalPlayer.Character.CurrentStamina.Value
									/ game.Players.LocalPlayer.Character.MaxStamina.Value
								) * 100

								if isrunning == false and StamPercent > RunToPercent and strikepower then
									actionscript.runPrompt()
									isrunning = true
									task.wait(1)
								elseif isrunning == true and strikepower then
									repeat
										StamPercent = (
											game.Players.LocalPlayer.Character.CurrentStamina.Value
											/ game.Players.LocalPlayer.Character.MaxStamina.Value
										) * 100
										task.wait()
									until StamPercent <= RunToPercent or StamPercent == 100 or strikepower == false

									if StamPercent <= RunToPercent and strikepower then
										actionscript.stopSprint()
										startPunching = true
									end
									isrunning = false
								end
							end)
						end
					end
				elseif
					startPunching
					and StamPercent > RunToPercent
					and StamPercent > PunchStartPercent
					and StamPercent > PunchEndPercent
				then
					startPunching = false
				elseif startPunching and strikepower and combatTool then
					repeat
						StamPercent = (
							game.Players.LocalPlayer.Character.CurrentStamina.Value
							/ game.Players.LocalPlayer.Character.MaxStamina.Value
						) * 100
						task.wait()
					until StamPercent >= PunchStartPercent or strikepower == false or PunchStartPercent < RunToPercent

					maintenancechecks()
					if
						combatTool.Parent == game.Players.LocalPlayer.Backpack
						and strikepower
						and not reequipdebounce
					then
						reequipdebounce = true
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(combatTool)
						task.wait(0.1)
						reequipdebounce = false
					end

					repeat
						maintenancechecks()
						task.wait()
						if strikepower == false then
							return
						end
						task.wait()
						local StamPercent = (
							game.Players.LocalPlayer.Character.CurrentStamina.Value
							/ game.Players.LocalPlayer.Character.MaxStamina.Value
						) * 100
						pcall(function()
							if strikepower and RhythmToggle then
								ChargeRhythm(combatTool)
							end

							if combatTool.Parent == game.Players.LocalPlayer.Character and CurrentRegening == false then
								repeat
									StamPercent = (
										game.Players.LocalPlayer.Character.CurrentStamina.Value
										/ game.Players.LocalPlayer.Character.MaxStamina.Value
									) * 100
									if combatTool.Parent == game.Players.LocalPlayer.Character then
										combatTool:Activate()
									end
									task.wait()
								until currentcombo ~= nil and currentcombo == 4
									or combatTool.Parent == game.Players.LocalPlayer.Backpack
									or StamPercent <= PunchEndPercent
									or startPunching == false
									or StamPercent >= 90

								if currentcombo ~= nil then
									if
										currentcombo == 4
										and m2already == false
										and StamPercent >= PunchEndPercent
										and spuseM2
									then
										repeat
											local successm2 = false

											if
												game.Players.LocalPlayer.Character:FindFirstChild("Attacking")
												and game.Players.LocalPlayer.Character:FindFirstChild("Attacking").Value
													== 5
											then
												successm2 = true
											end
											StamPercent = (
												game.Players.LocalPlayer.Character.CurrentStamina.Value
												/ game.Players.LocalPlayer.Character.MaxStamina.Value
											) * 100
											local VIM = game:GetService("VirtualInputManager")
											VIM:SendMouseButtonEvent(0, 500, 1, true, game, 1)
											task.wait()
											VIM:SendMouseButtonEvent(0, 500, 1, false, game, 1)
											task.wait()
										until successm2 == true
											or strikepower == false
											or StamPercent >= 90
											or combatTool.Parent == game.Players.LocalPlayer.Backpack
										task.wait(0.1)
										m2already = true
									elseif
										currentcombo == 4
										and m2already
										and StamPercent >= PunchEndPercent
										and spuseM2
									then
										currentcombo = nil
										m2already = false
									end
								end
								task.wait()
							end
						end)
					until strikepower == false or StamPercent <= PunchEndPercent or StamPercent >= 90
					startPunching = false
				end
			end
		end
	end)

	main:Toggle("SP Use M2", false, function(Value)
		spuseM2 = Value
	end)

	main:Slider("SP Run to %", { def = RunToPercent, max = 100, min = 0 }, function(Value)
		RunToPercent = Value
	end)

	main:Slider("SP Punch Start %", { def = PunchStartPercent, max = 100, min = 0 }, function(Value)
		PunchStartPercent = Value
	end)

	main:Slider("SP Punch End %", { def = PunchEndPercent, max = 100, min = 0 }, function(Value)
		PunchEndPercent = Value
	end)

	main:Toggle("Use Rhythm on Trainings", false, function(Value)
		RhythmToggle = Value
	end)

	trainingtoggles[#trainingtoggles + 1] = main:Toggle("Machines", false, function(Value)
		machines = Value

		while task.wait() and machines do
			pcall(function()
				if
					game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TreadmillMachineGUI")
					and machines
					and machinetype ~= nil
					and treadselect ~= nil
				then
					local GUI = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TreadmillMachineGUI")

					if GUI and machines then
						if not GUI.Frame3.Visible then
							StaminaCheck(99, 100)
						end

						if GUI.Frame.Visible and machines and CurrentRegening == false then
							SimulateClick(GUI.Frame.StatPickF[treadselect], "Function")
							task.wait(0.1)
						elseif GUI.Frame2.Visible and machines and CurrentRegening == false then
							local i = 5

							repeat
								if not GUI.Frame2.Visible then
									break
								end
								SimulateClick(GUI.Frame2.ListF[tostring(i)], "Function")
								task.wait(0.1)
								i = i - 1
							until i <= 0
						elseif GUI.Frame3.Visible and machines and CurrentRegening == false then
							if GUI.Frame3.Start.Visible and machines and CurrentRegening == false then
								task.spawn(function()
									SimulateClick(GUI.Frame3.Start, "Function")
								end)
								task.wait(0.1)
							elseif not GUI.Frame3.Start.Visible and machines and CurrentRegening == false then
								StaminaCheck()
								if GUI.Frame3.TrainingF.ButtonTemplate.Visible and machines then
									if
										tostring(GUI.Frame3.TrainingF.ButtonTemplate.Input.TextColor3) == "1, 1, 1"
										and CurrentRegening == false
									then
										task.wait(0.07)
										VIM:SendKeyEvent(
											true,
											GUI.Frame3.TrainingF.ButtonTemplate.Input.Text,
											false,
											game
										)
										task.wait()
										VIM:SendKeyEvent(
											false,
											GUI.Frame3.TrainingF.ButtonTemplate.Input.Text,
											false,
											game
										)
										task.wait()
									end
								end
							end
						end
					end
				elseif
					game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BarbellMachineGUI")
					or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SquatMachineGUI")
						and machinetype ~= nil
				then
					local GUI = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BarbellMachineGUI")
						or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SquatMachineGUI")

					if GUI and machines then
						if GUI.Frame.Visible then
							StaminaCheck(99, 100)
							task.wait()
						end

						if GUI.Frame.Visible and machines and CurrentRegening == false then
							local i = 6

							repeat
								if not GUI.Frame.Visible then
									break
								end
								SimulateClick(GUI.Frame.ListF["Barbell " .. tostring(i) .. " Weight"], "Function")
								task.wait(0.1)
								i = i - 1
							until i <= 0
						elseif GUI.Frame2.Visible and machines and CurrentRegening == false then
							if GUI.Frame2.Start.Visible and machines and CurrentRegening == false then
								task.spawn(function()
									SimulateClick(GUI.Frame2.Start, "Function")
								end)
								task.wait(0.1)
							elseif not GUI.Frame2.Start.Visible and machines and CurrentRegening == false then
								StaminaCheck()
								local Icon = GUI.Frame2.LiftingF:FindFirstChild("LiftIcon")

								if GUI.Frame2.LiftingF.Visible and machines then
									if Icon and CurrentRegening == false then
										task.wait(0.07)
										SimulateClick(Icon, "Function")
									end
								end
							end
						end
					end
				else
					maintenancechecks()

					if LastMachine ~= nil then
						if
							(
									LastMachine.Base.Position
									- game.Players.LocalPlayer.Character.HumanoidRootPart.Position
								).Magnitude
								<= LastMachine.ClickDetector.MaxActivationDistance
							and GetMachineType(LastMachine) == machinetype
						then
							fireclickdetector(LastMachine.ClickDetector)
							task.wait(0.5)
						elseif GetMachineType(LastMachine) ~= machinetype then
							LastMachine = nil
						end
					end

					local MachineQuery = ClosestMachine()
					if MachineQuery ~= nil and debuffCheck() and machinetype ~= nil then
						LastMachine = MachineQuery
						fireclickdetector(LastMachine.ClickDetector)
						task.wait(0.5)
					elseif
						MachineQuery == nil
						and debuffCheck()
						and machinetype ~= nil
						and WalkBackWhenFar
						and LastMachine ~= nil
					then
						game.Players.LocalPlayer.Character.Humanoid:MoveTo(LastMachine.Base)
						task.wait(2)
					end
				end
			end)
		end
		if machines == false and LastMachine ~= nil then
			LastMachine = nil
		end
	end)

	main:Dropdown("Machine", { "Bench", "Squat", "Treadmill" }, function(Value)
		machinetype = Value
	end)

	main:Dropdown("Treadmill Option", { "Stamina", "RunningSpeed" }, function(Value)
		treadselect = Value
	end)

	main:Toggle("Walk Back When Far", false, function(Value)
		WalkBackWhenFar = Value
	end)

	main:Toggle("Log When Money Out", false, function(Value)
		LogOnNotEnoughMoney = Value
	end)

	main:Label("-- make sure both accs have same settings --")
	main:Label("you need 2 accounts that are using the script")

	trainingtoggles[#trainingtoggles + 1] = main:Toggle("Durability", false, function(Value)
		durability = Value

		while task.wait() and durability do
			if ft ~= nil and st ~= nil and durability then
				if game.Players.LocalPlayer.Name == ft or game.Players.LocalPlayer.Name == st and durability then
					local ftplr = game.Players:FindFirstChild(ft)
					local stplr = game.Players:FindFirstChild(st)

					if ftplr.Character ~= nil and stplr.Character ~= nil and not durainprogress and durability then
						local distancebetweenplrs = (
							ftplr.Character.HumanoidRootPart.Position - stplr.Character.HumanoidRootPart.Position
						).Magnitude

						if
							distancebetweenplrs <= 10 and GetDuraBuy() ~= nil
							or SkillXP and distancebetweenplrs <= 10
						then
							maintenancechecks()
							durainprogress = true
							if taketurns then
								repeat
									task.wait()
								until ftplr.Character.Humanoid.Health >= ftplr.Character.Humanoid.MaxHealth
									or durability == false
								duraturn(ftplr, stplr)
								task.wait()
								repeat
									task.wait()
								until stplr.Character.Humanoid.Health >= stplr.Character.Humanoid.MaxHealth
									or durability == false
								duraturn(stplr, ftplr)
							else
								repeat
									task.wait()
								until ftplr.Character.Humanoid.Health >= ftplr.Character.Humanoid.MaxHealth
									or durability == false

								duraturn(ftplr, stplr)
							end
							durainprogress = false
						end
					end
				end
			end
		end
	end)

	main:Textbox("First Turn", function(txt)
		ft = txt
	end)

	main:Textbox("Second Turn", function(txt)
		st = txt
	end)

	main:Toggle("Take Turns", false, function(Value)
		taketurns = Value
	end)

	main:Dropdown("DuraTool", { "Metal Bat", "Revolver", "Default" }, function(Value)
		DuraTool = Value
	end)

	main:Label("-- AutoWalkAfterPushedBack only for dura receiver --")

	main:Toggle("Auto Walk After Pushed Back", false, function(Value)
		AutoWalkAfterPushedBack = Value
	end)

	main:Slider("Health % to Stop", { min = 0, max = 100, def = stopAtHP }, function(Value)
		stopAtHP = Value
	end)

	main:Label("makes dura farm a skill xp farm in sparring arenas")
	main:Label("have the skills on your hotbar for the farm")

	main:Toggle("Skill XP mode", false, function(Value)
		SkillXP = Value
	end)

	notify:Toggle("Staff Notifier", false, function(Value)
		staffnotifier = Value

		if staffnotifier then
			for i, v in pairs(game.Players:GetPlayers()) do
				if staffnotifier then
					Notifier(v)
				end
			end
		end
	end)

	notify:Toggle("Disable All When Staff Joins", false, function(Value)
		disableOnStaff = Value
	end)

	notify:Toggle("Cop Notifier", false, function(Value)
		copnotifier = Value

		if copnotifier then
			for i, v in pairs(game.Players:GetPlayers()) do
				if copnotifier then
					Notifier(v)
				end
			end
		end
	end)

	notify:Toggle("Flow NPC Notifier", false, function(Value)
		flownotifier = Value

		if flownotifier then
			if game:GetService("Workspace"):FindFirstChild("XinFolder") then
				Notifier()
			end

			flowconnection = workspace.Live.ChildAdded:Connect(function()
				if flownotifier then
					if workspace.Live:FindFirstChild("Luke Xin") then
						Notifier()
					end
				end
			end)
		else
			if flowconnection then
				flowconnection:Disconnect()
			end
		end
	end)

	notify:Toggle("Street Fighter Notifier", false, function(Value)
		sfnotifier = Value

		if sfnotifier then
			if game:GetService("Workspace"):FindFirstChild("AokiFolder") then
				Notifier()
			end

			sfconnection = workspace.ChildAdded:Connect(function(child)
				if sfnotifier then
					if child.ClassName == "Folder" and child.Name == "AokiFolder" then
						Notifier()
					end
				end
			end)
		else
			if sfconnection then
				sfconnection:Disconnect()
			end
		end
	end)

	notify:Toggle("Macro Notifier", false, function(Value)
		macroruin = Value

		if macroruin then
			local connection
			connection = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
				if macroruin ~= true then
					connection:Disconnect()
				end
				if
					child.Name == "ErrorPrompt"
					and child:FindFirstChild("MessageArea")
					and child.MessageArea:FindFirstChild("ErrorFrame")
				then
					task.wait(0.5)
					webhook(
						"Macro Ruin Notifier",
						"You were disconnected Reason:\n"
							.. game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text
					)
				end
			end)
		end

		while task.wait() and macroruin do
			if
				game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible
				and not macroruindebounce
				and alreadynotifieduser ~= CurrentGanker
				and CurrentGanker ~= nil
			then
				macroruindebounce = true
				local daganker = CurrentGanker
				alreadynotifieduser = daganker

				webhook(
					"Macro Ruin Notifier",
					"You getting macro ganked! you better get yo get back!\n" .. CurrentGanker
				)
				macroruindebounce = false
			end
		end
	end)

	pcall(function()
		if writefile then
			if OPsData == nil then
				local ex = { "PlayerUserIdHere", "AnotherPlayerUserIdHere", "BeSureToAddCommaAfter" }
				writefile("/m1keincorporated/MOoppositions.json", game:GetService("HttpService"):JSONEncode(ex))
			end

			pcall(function()
				OPsData = game:GetService("HttpService"):JSONDecode(readfile("/m1keincorporated/MOoppositions.json"))
			end)

			notify:Label("go to your executors folder to add ops")
			notify:Label("Executor/workspace/m1keincorporated/MOoppositions.json")

			notify:Toggle("Notify when OPs join", false, function(Value)
				OPSNotifier = Value

				OPsData = game:GetService("HttpService"):JSONDecode(readfile("/m1keincorporated/MOoppositions.json"))

				for i, v in pairs(game.Players:GetPlayers()) do
					if table.find(OPsData, tostring(v.UserId)) then
						webhook(
							"Opposition Detected",
							"DisplayName: "
								.. v.DisplayName
								.. "\nUsername: "
								.. v.Name
								.. "\nUserId: "
								.. tostring(v.UserId)
						)
					end
				end

				while OPSNotifier and task.wait() do
					OPsData = game:GetService("HttpService")
						:JSONDecode(readfile("/m1keincorporated/MOoppositions.json"))
				end
			end)
		end
	end)

	notify:Toggle("Notify When Done Sleeping(0%)", false, function(Value)
		SleepNotifier = Value

		while task.wait() and SleepNotifier do
			if IsSleeping() then
				local Fatigue = tonumber(
					game.Players.LocalPlayer.PlayerGui.MainGui.Utility.BodyFatigue.Text:split(" ")[3]:split("%")[1]
				)

				if Fatigue <= 0 then
					webhook("Sleep Notifier", "You're done sleeping! GET YO ASS UP!!!")
					task.wait(60)
				end
			end
		end
	end)

	notify:Toggle("Notify & Stop when No Food", false, function(Value)
		NoFoodNotify = Value
	end)

	notify:Toggle("Log when No Food", false, function(Value)
		LogOnNoFood = Value
	end)

	local dataTable = {
		discId = "",
		webhookUrl = "",
	}

	pcall(function()
		if isfile("/m1keincorporated/Mighty_Omega.json") then
			local data = game:GetService("HttpService"):JSONDecode(readfile("/m1keincorporated/Mighty_Omega.json"))

			dataTable["discId"] = data["discId"]
			dataTable["webhookUrl"] = data["webhookUrl"]
		else
			local data = game:GetService("HttpService"):JSONEncode(dataTable)
			writefile("/m1keincorporated/Mighty_Omega.json", data)
		end
	end)

	local test = notify:Textbox("Webhook Url", function(txt)
		webhookUrl = txt
		dataTable["webhookUrl"] = webhookUrl
		local data = game:GetService("HttpService"):JSONEncode(dataTable)
		if writefile then
			writefile("/m1keincorporated/Mighty_Omega.json", data)
		end
	end)
	if dataTable["webhookUrl"] ~= "" then
		webhookUrl = dataTable["webhookUrl"]
		test:SetText(dataTable["webhookUrl"])
	end

	local test2 = notify:Textbox("Discord User Id", function(txt)
		if tonumber(txt) == nil then
			ping = "@everyone"
		else
			ping = "<@" .. txt .. ">"
			dataTable["discId"] = txt
			local data = game:GetService("HttpService"):JSONEncode(dataTable)
			if writefile then
				writefile("/m1keincorporated/Mighty_Omega.json", data)
			end
		end
	end)
	if dataTable["discId"] ~= "" then
		ping = "<@" .. dataTable["discId"] .. ">"
		test2:SetText(dataTable["discId"])
	end

	notify:Button("Test Webhook", function()
		webhook("Webhook Test", "<3")
	end)

	pcall(function()
		autocook:Toggle("Auto Cook", false, function(Value)
			acook = Value

			while task.wait() and acook do
				if CheckForFood() and acook then
					local Pan

					repeat
						task.wait()
					until GetPan() ~= nil or acook == false
					if acook == false then
						return
					end
					Pan = GetPan()

					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					task.wait()
					for i, v in pairs(recipes[SelectedFood]) do
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(i)
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						task.wait()
						if acook == false then
							return
						end
						local potdebounce = false
						repeat
							if Pan.Ingredients:FindFirstChild(i) ~= nil then
								if Pan.Ingredients:FindFirstChild(i).Value ~= v and not potdebounce then
									potdebounce = true
									VIM:SendKeyEvent(true, "E", false, game)
									task.wait(0.1)
									VIM:SendKeyEvent(false, "E", false, game)
									task.wait(0.1)
									potdebounce = false
								end
							elseif Pan.Ingredients:FindFirstChild(i) == nil and not potdebounce then
								potdebounce = true
								VIM:SendKeyEvent(true, "E", false, game)
								task.wait(0.1)
								VIM:SendKeyEvent(false, "E", false, game)
								task.wait(0.1)
								potdebounce = false
							end
						until Pan.Ingredients:FindFirstChild(i) ~= nil
								and Pan.Ingredients:FindFirstChild(i).Value == v
							or acook == false
						if acook == false then
							return
						end
						task.wait()
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						task.wait(0.1)
					end
					task.wait()
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					task.wait()
					if Pan ~= nil and acook then
						if acook == false then
							return
						end
						fireclickdetector(Pan.ClickDetector)
						task.wait()
						repeat
							task.wait()
						until Pan.FoodP.TimeG.TextLabel.Text == "!!" or acook == false
						if acook == false then
							return
						end
						fireclickdetector(Pan.ClickDetector)
						task.wait()
					end
				end
			end
		end)

		local foodlist = {}

		for i, v in pairs(recipes) do
			foodlist[#foodlist + 1] = i
		end

		autocook:Dropdown("Food to Auto Cook", foodlist, function(Value)
			SelectedFood = Value
		end)

		autocook:Label("(auto buy ingred until you get enough for 1 serving)")

		abn = autocook:Label("Auto Buying RN: None")

		absbox = autocook:Textbox("Servings (Integer)", function(txt)
			if tonumber(txt) ~= nil then
				if tonumber(txt) > 8 then
					absbox:SetText("8")
					TotalServings = 8
				elseif tonumber(txt) < 1 then
					absbox:SetText("1")
					TotalServings = 1
				else
					TotalServings = tonumber(txt)
				end
			else
				absbox:SetText("1")
			end
		end)
		absbox:SetText("1")

		autocook:Button("Auto Buy Ingredients to Serving Size", function()
			if SelectedFood ~= nil then
				for i, v in pairs(recipes[SelectedFood]) do
					local finished = false
					local start = tick()
					local timesbought = 0
					local required = v

					if TotalServings > 1 then
						required = v * TotalServings
						if required > 15 then
							required = 15
						end
					end
					abn:SetText("Auto Buying RN: " .. i .. "(" .. timesbought .. "/" .. required .. ")")

					local function GetPossibleBuyingRN()
						local ingreds = {}

						for _, child in pairs(workspace:GetChildren()) do
							if child.Name:find(i) then
								table.insert(ingreds, child)
							end
						end

						return ingreds
					end

					local ingredLocations = GetPossibleBuyingRN()

					repeat
						for _, child in pairs(ingredLocations) do
							local distance = (
								child.Head.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position
							).Magnitude

							if distance <= 5 then
								repeat
									fireclickdetector(child.ClickDetector)
									task.wait(0.1)
								until child.Name ~= "Purchased!"
								timesbought = timesbought + 1
								abn:SetText("Auto Buying RN: " .. i .. "(" .. timesbought .. "/" .. required .. ")")
								task.wait(0.5)
							end
							task.wait()
						end

						if game.Players.LocalPlayer.Backpack:FindFirstChild(i) then
							if
								timesbought >= required
								or game.Players.LocalPlayer.Backpack:FindFirstChild(i).Quantity.Value >= 15
							then
								finished = true
								break
							end
						elseif (tick() - start) >= 1200 then
							abn:SetText("Auto Buy Timed out!")
							return
						end
						task.wait()
					until finished == true
				end
				abn:SetText("Finished Buying Ingredients for " .. TotalServings .. " Serving(s)")
			end
		end)
	end)

	misc:Toggle("Auto Eat", false, function(Value)
		autoeat = Value
	end)

	misc:Slider("Eat at Hunger %", { min = 0, max = 100, def = 30 }, function(Value)
		EatAt = Value
	end)

	misc:Slider("Fill up to Hunger %", { min = 0, max = 100, def = 80 }, function(Value)
		FillUp = Value
	end)

	misc:Toggle("Dont Eat When In Combat", false, function(Value)
		stopAEinCombat = Value
	end)

	misc:Toggle("Auto Supplement", false, function(Value)
		autosupplement = Value
	end)

	misc:Dropdown("Supplement", { "BCAA", "Protein Shake", "Fat Burner", "Scalar" }, function(Value)
		selectedsupplement = Value
	end)

	misc:Toggle("Hold Click (Tools)", false, function(Value)
		holdclick = Value

		while task.wait() and holdclick do
			if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				while UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and task.wait() do
					pcall(function()
						if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
							game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
						end
					end)
				end
			end
		end
	end)

	misc:Toggle("Auto Sprint (Combat)", false, function(Value)
		autosprintcombat = Value

		local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)

		if autosprintcombat then
			began = game:GetService("UserInputService").InputBegan:Connect(function(input, chat)
				if chat then
					return
				end

				if input.KeyCode == Enum.KeyCode.W and holdingW == false and autosprintcombat then
					actionscript.runPrompt()
					holdingW = true
				end
			end)

			ended = game:GetService("UserInputService").InputEnded:Connect(function(input, chat)
				if chat then
					return
				end

				if input.KeyCode == Enum.KeyCode.W and holdingW == true and autosprintcombat then
					holdingW = false
				end
			end)
		else
			if began ~= nil and ended ~= nil then
				began:Disconnect()
				ended:Disconnect()
			end
		end
	end)

	misc:Toggle("Disable Trainings When InCombat", false, function(Value)
		StopInCombat = Value

		while task.wait() and StopInCombat do
			if game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible then
				disableAllTraining()
				task.wait(2)
			end
		end
	end)

	misc:Toggle("Disable Trainings When Knocked", false, function(Value)
		StopKnocked = Value

		while task.wait() and StopKnocked do
			if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == true then
				disableAllTraining()
				task.wait(2)
			end
		end
	end)

	misc:Button("Serverhop to Lowest Server", function(Value)
		local Http = game:GetService("HttpService")
		local TPS = game:GetService("TeleportService")
		local Api = "https://games.roblox.com/v1/games/"

		local _place = game.PlaceId
		local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
		function ListServers(cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
			return Http:JSONDecode(Raw)
		end

		local Server, Next
		repeat
			local Servers = ListServers(Next)
			Server = Servers.data[1]
			Next = Servers.nextPageCursor
		until Server

		TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
	end)

	misc:Toggle("Auto Buy Foods Nearby", false, function(Value)
		autobuyitem = Value

		if autobuyitem then
			local function GetClosestItem()
				local foodsnear = {}

				for i, v in pairs(ItemTable) do
					if
						(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).Magnitude
						<= v.ClickDetector.MaxActivationDistance
					then
						table.insert(foodsnear, v)
					end
				end

				return foodsnear
			end

			while autobuyitem and task.wait() do
				local foodstobuy = GetClosestItem()

				if autobuyitem and #GetClosestItem() > 0 then
					for i, v in pairs(foodstobuy) do
						if autobuyitem == false then
							return
						end
						fireclickdetector(v.ClickDetector)
						task.wait(0.15)
					end
				end
			end
		end
	end)

	misc:Toggle("Auto Panic", false, function(Value)
		autopanic = Value

		local function IsInCombat()
			local status

			local suc = pcall(function()
				if game.Players.LocalPlayer:FindFirstChild("PlayerGui") then
					if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainGui") then
						status = game.Players.LocalPlayer.PlayerGui.MainGui.Utility.CombatTag.Visible
					end
				end
			end)

			if not suc then
				status = nil
			end

			return status
		end

		while task.wait() and autopanic do
			if IsInCombat() == true and autopanic then
				disableAllTraining()
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

				if macroruin then
					webhook("Auto Panic", CurrentGanker .. " activated Combat Sequence!")
				end

				task.wait(1)

				task.spawn(function()
					while task.wait(panicdelay) and autopanic do
						pcall(function()
							local chance = math.random(1, 4)
							if chance >= 2 then
								panicangle = panicangle * -1
							end

							game.Workspace.CurrentCamera.CFrame = game:GetService("Workspace").CurrentCamera.CFrame
								* CFrame.Angles(0, math.rad(panicangle), 0)
							panicangle = math.random(35, 90)
						end)
					end
				end)

				task.spawn(function()
					shared.AllowSprinting = false
					local function IsDraining()
						local lastStamVal = game.Players.LocalPlayer.Character.CurrentStamina.Value

						task.wait(0.5)
						if lastStamVal > game.Players.LocalPlayer.Character.CurrentStamina.Value then
							return true
						end
						return false
					end

					while task.wait(0.1) and autopanic do
						pcall(function()
							local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
							local StamPercent = (
								game.Players.LocalPlayer.Character.CurrentStamina.Value
								/ game.Players.LocalPlayer.Character.MaxStamina.Value
							) * 100
							local LowStam = ministam

							if isrunning == false and CurrentRegening == false and shared.AllowSprinting then
								actionscript.runPrompt()
								isrunning = true
								task.wait(1)
							elseif isrunning == true and shared.AllowSprinting then
								repeat
									StamPercent = (
										game.Players.LocalPlayer.Character.CurrentStamina.Value
										/ game.Players.LocalPlayer.Character.MaxStamina.Value
									) * 100
									task.wait()
								until CurrentRegening == true
									or StamPercent == 100
									or autopanic == false
									or shared.AllowSprinting == false
									or IsDraining() == false

								if
									StamPercent <= ministam
									or shared.AllowSprinting == false
									or autopanic == false
									or CurrentRegening == true
								then
									actionscript.stopSprint()
								end
								isrunning = false
							elseif isrunning == true and shared.AllowSprinting == false then
								actionscript.stopSprint()
								isrunning = false
							end
						end)
					end

					shared.AllowSprinting = false
				end)

				repeat
					task.wait()
					pcall(function()
						panicstamcheck()

						if game.Players.LocalPlayer.Character.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
							automacrosprint()
						else
							panicdash()
						end
					end)
				until IsInCombat() == false or autopanic == false
				shared.AllowSprinting = false
				if autopanic then
					if macroruin then
						webhook("Auto Panic", "Logged Safely!")
						task.wait()
					end

					game:shutdown()
					return
				end
			end
		end
	end)

	misc:Toggle("Player ESP", false, function(Value)
		ESP = Value

		if ESP then
			for i, v in pairs(game.Players:GetPlayers()) do
				esp(v)
			end

			local plrconnection
			plrconnection = game.Players.PlayerAdded:Connect(function(plr)
				if ESP == false then
					plrconnection:Disconnect()
					return
				end
				esp(plr)
			end)
		end
	end)

	misc:Slider("ESP Distance", { min = 0, def = 10000, max = 10000 }, function(Value)
		ESPDistance = Value
	end)

	misc:Toggle("Auto Starve", false, function(Value)
		autostarve = Value

		while task.wait() and autostarve do
			local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
			local StamPercent = (
				game.Players.LocalPlayer.Character.CurrentStamina.Value
				/ game.Players.LocalPlayer.Character.MaxStamina.Value
			) * 100

			if
				StamPercent >= staminabelowpercent
				and ASisrunning == false
				and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false
			then
				actionscript.runPrompt()
				ASisrunning = true
			elseif StamPercent <= staminabelowpercent and ASisrunning then
				task.wait(0.1)
				ASisrunning = false
			elseif StamPercent == 100 then
				task.wait(0.5)
				if StamPercent == 100 then
					ASisrunning = false
				end
			end
		end
	end)

	misc:Slider("Keep Stamina Below %", { min = 0, def = 20, max = 100 }, function(Value)
		staminabelowpercent = Value
	end)

	misc:Toggle("Auto Disable Macros", false, function(Value)
		AutoStop = Value
	end)

	misc:Slider("Fatigue % to Stop", { min = 0, max = 100, def = FatigueToStop }, function(Value)
		FatigueToStop = Value
	end)

	misc:Label("Note: consider auto sleep as risky |g Do Nothing is default")

	misc:Dropdown(
		"When Macro Stopped",
		{ "Do Nothing", "Log/Leave game", "Auto Sleep & Log", "Auto Sleep & Continue" },
		function(Value)
			if Value == "Do Nothing" then
				LogOnFatigued = false
				autosleepRes = false
				autosleepLog = false
			elseif Value == "Log/Leave game" then
				LogOnFatigued = true
				autosleepRes = false
				autosleepLog = false
			elseif Value == "Auto Sleep & Log" then
				LogOnFatigued = false
				autosleepRes = false
				autosleepLog = true
			elseif Value == "Auto Sleep & Continue" then
				LogOnFatigued = false
				autosleepRes = true
				autosleepLog = false
			else
				LogOnFatigued = false
				autosleepRes = false
				autosleepLog = false
			end
		end
	)

    if hookmetamethod then
        Backup = hookmetamethod(
            Mouse,
            "__index",
            newcclosure(function(self, idx)
                if idx == "Target" and broomjobactive and broomjobpart ~= nil and autojobs then
                    return broomjobpart
                end

                return Backup(self, idx)
            end)
        )
    end

	trainingtoggles[#trainingtoggles + 1] = risky:Toggle("Auto Jobs", false, function(Value)
		autojobs = Value

		if autojobs == false then
			_G.OngoingPath = false
		end

		local og = Vector3.new(2.6999998092651367, 45.04999923706055, 222.13999938964844)
		local new = Vector3.new(2.7, 45.05, 73.14)
		local AUTOJOBBARRIERS = {}
		AUTOJOBBARRIERS[1] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[1].Position = Vector3.new(-252.3034210205078, 54.62002182006836, -584.091064453125)
		AUTOJOBBARRIERS[1].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[1].Size = Vector3.new(28.020000457763672, 21.84000015258789, 3.559999942779541)
		AUTOJOBBARRIERS[1].Anchored = true
		AUTOJOBBARRIERS[1].CanCollide = true
		AUTOJOBBARRIERS[1].Transparency = 1
		AUTOJOBBARRIERS[2] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[2].Position = Vector3.new(287.8071594238281, 47.193782806396484, -902.21875)
		AUTOJOBBARRIERS[2].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[2].Size = Vector3.new(2.6999998092651367, 45.04999923706055, 222.13999938964844)
		AUTOJOBBARRIERS[2].Anchored = true
		AUTOJOBBARRIERS[2].CanCollide = true
		AUTOJOBBARRIERS[2].Transparency = 1
		AUTOJOBBARRIERS[4] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[4].Position = Vector3.new(-285.6453552246094, 48.400028228759766, -564.8450927734375)
		AUTOJOBBARRIERS[4].Orientation = Vector3.new(0, -30, 0)
		AUTOJOBBARRIERS[4].Size = Vector3.new(6.940000534057617, 10.199999809265137, 7.690000057220459)
		AUTOJOBBARRIERS[4].Anchored = true
		AUTOJOBBARRIERS[4].CanCollide = true
		AUTOJOBBARRIERS[4].Transparency = 1
		AUTOJOBBARRIERS[5] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[5].Position = Vector3.new(-306.9322204589844, 51.81392288208008, -615.2486572265625)
		AUTOJOBBARRIERS[5].Orientation = Vector3.new(0, 90, 0)
		AUTOJOBBARRIERS[5].Size = Vector3.new(34.63999938964844, 15.630000114440918, 5.739999294281006)
		AUTOJOBBARRIERS[5].Anchored = true
		AUTOJOBBARRIERS[5].CanCollide = true
		AUTOJOBBARRIERS[5].Transparency = 1
		AUTOJOBBARRIERS[6] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[6].Position = Vector3.new(-276.83843994140625, 51.203548431396484, -580.1591796875)
		AUTOJOBBARRIERS[6].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[6].Size = Vector3.new(2.9099998474121094, 14.970000267028809, 2.179999828338623)
		AUTOJOBBARRIERS[6].Anchored = true
		AUTOJOBBARRIERS[6].CanCollide = true
		AUTOJOBBARRIERS[6].Transparency = 1
		AUTOJOBBARRIERS[8] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[8].Position = Vector3.new(314.088134765625, 47.193782806396484, -790.2724609375)
		AUTOJOBBARRIERS[8].Orientation = Vector3.new(0, -89, 0)
		AUTOJOBBARRIERS[8].Size = Vector3.new(2.6999998092651367, 45.04999923706055, 55.47999954223633)
		AUTOJOBBARRIERS[8].Anchored = true
		AUTOJOBBARRIERS[8].CanCollide = true
		AUTOJOBBARRIERS[8].Transparency = 1
		AUTOJOBBARRIERS[9] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[9].Position = Vector3.new(287.8071594238281, 47.193782806396484, -671.853759765625)
		AUTOJOBBARRIERS[9].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[9].Size = Vector3.new(2.6999998092651367, 45.04999923706055, 218.58999633789062)
		AUTOJOBBARRIERS[9].Anchored = true
		AUTOJOBBARRIERS[9].CanCollide = true
		AUTOJOBBARRIERS[9].Transparency = 1
		AUTOJOBBARRIERS[10] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[10].Position = Vector3.new(314.088134765625, 47.193782806396484, -779.8624877929688)
		AUTOJOBBARRIERS[10].Orientation = Vector3.new(0, -89, 0)
		AUTOJOBBARRIERS[10].Size = Vector3.new(2.6999998092651367, 45.04999923706055, 55.47999954223633)
		AUTOJOBBARRIERS[10].Anchored = true
		AUTOJOBBARRIERS[10].CanCollide = true
		AUTOJOBBARRIERS[10].Transparency = 1
		AUTOJOBBARRIERS[11] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[11].Position = Vector3.new(-278.10223388671875, 51.81392288208008, -600.8236694335938)
		AUTOJOBBARRIERS[11].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[11].Size = Vector3.new(63.4900016784668, 15.630000114440918, 5.739999294281006)
		AUTOJOBBARRIERS[11].Anchored = true
		AUTOJOBBARRIERS[11].CanCollide = true
		AUTOJOBBARRIERS[11].Transparency = 1
		AUTOJOBBARRIERS[98] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[98].Position = Vector3.new(-1041.891, 59.14, -327.758)
		AUTOJOBBARRIERS[98].Orientation = Vector3.new(0, 0, 0)
		AUTOJOBBARRIERS[98].Size = Vector3.new(59, 32, 186)
		AUTOJOBBARRIERS[98].Anchored = true
		AUTOJOBBARRIERS[98].CanCollide = true
		AUTOJOBBARRIERS[98].Transparency = 1
		AUTOJOBBARRIERS[99] = Instance.new("Part", workspace)
		AUTOJOBBARRIERS[99].Position = Vector3.new(346.556, 25.2, -784.352)
		AUTOJOBBARRIERS[99].Orientation = Vector3.new(0, 90, 0)
		AUTOJOBBARRIERS[99].Size = Vector3.new(7, 1, 4)
		AUTOJOBBARRIERS[99].Anchored = true
		AUTOJOBBARRIERS[99].CanCollide = true
		AUTOJOBBARRIERS[99].Transparency = 1

		if autojobs then
			task.spawn(function()
				shared.AllowSprinting = false

				while task.wait(0.1) and autojobs do
					pcall(function()
						local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
						local StamPercent = (
							game.Players.LocalPlayer.Character.CurrentStamina.Value
							/ game.Players.LocalPlayer.Character.MaxStamina.Value
						) * 100
						local LowStam = ministam

						if isrunning == false and StamPercent >= 100 and shared.AllowSprinting then
							actionscript.runPrompt()
							isrunning = true
							task.wait(1)
						elseif isrunning == true and shared.AllowSprinting then
							repeat
								StamPercent = (
									game.Players.LocalPlayer.Character.CurrentStamina.Value
									/ game.Players.LocalPlayer.Character.MaxStamina.Value
								) * 100
								task.wait()
							until StamPercent <= LowStam
								or StamPercent == 100
								or autojobs == false
								or shared.AllowSprinting == false

							if StamPercent <= ministam or shared.AllowSprinting == false or autojobs == false then
								actionscript.stopSprint()
							end
							isrunning = false
						elseif isrunning == true and shared.AllowSprinting == false then
							actionscript.stopSprint()
							isrunning = false
						end
					end)
				end

				shared.AllowSprinting = false
			end)

			local hum = char.Humanoid
			local PFS = game:GetService("PathfindingService")
			local HRP = char.HumanoidRootPart
			local pathStatus = Enum.PathStatus

			_G.currentPoint = nil
			_G.OngoingPath = false

			local function createPath(point)
				local currentPath = PFS:FindPathAsync(HRP.Position, point)
				local pathExists = false

				if currentPath.Status == pathStatus.Success then
					pathExists = true
					_G.OngoingPath = true

					spawn(function()
						while pathExists and task.wait() and _G.currentPoint ~= nil and _G.OngoingPath and autojobs do
							local x, y = pcall(function()
								if (HRP.Position - _G.currentPoint).Magnitude > 5 then
									hum.WalkToPoint = _G.currentPoint
								end
							end)
							if not x then
								warn(y)
							end
						end
					end)

					local lastbroken = false
					local antisusdebounce = false
					local alreadychanced = false
					local oldhumanpos, lastupdate = nil, nil

					for i, v in pairs(currentPath:GetWaypoints()) do
						if _G.OngoingPath ~= true then
							return
						end

						if v.Action == Enum.PathWaypointAction.Jump then
							hum:ChangeState(Enum.HumanoidStateType.Jumping)
						end

						local part = Instance.new("Part")
						part.Shape = "Ball"
						part.Material = "Neon"
						part.Size = Vector3.new(0.6, 0.6, 0.6)
						part.Position = v.Position + Vector3.new(0, 6, 0)
						part.Anchored = true
						part.CanCollide = false
						part.Parent = game.Workspace

						local oldpos = HRP.Position
						local updatedelay = false

						local function percentchance(x)
							if 100 * math.random() < x then
								return true
							else
								return false
							end
						end

						if lastupdate == nil then
							lastupdate = tick()
						else
							if (tick() - lastupdate) >= 2 then
								lastupdate = tick()
								oldhumawnpos = HRP.Position
							end
						end

						repeat
							task.wait()
							if autojobs == false then
								game.Debris:AddItem(part, 0.01)
								return
							end
							_G.currentPoint = v.Position

							if percentchance(3) and not antisusdebounce and alreadychanced == false then
								task.spawn(function()
									antisusdebounce = true
									shared.AllowSprinting = false
									task.wait(math.random(1, 3))
									if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") then
										shared.AllowSprinting = true
									end
									antisusdebounce = false
								end)
							end
							alreadychanced = true

							if
								(HRP.Position - v.Position).Magnitude > 5
								and (HRP.Position - part.Position).Magnitude > 4
							then
								if oldpos ~= HRP.Position and not lastbroken and not updatedelay then
									task.spawn(function()
										updatedelay = true
										oldpos = HRP.Position
										task.delay(1, function()
											updatedelay = false
										end)
									end)
								elseif oldpos == HRP.Position and not lastbroken then
									oldpos = HRP.Position
									lastbroken = true
									break
								elseif oldpos == HRP.Position and lastbroken then
									task.spawn(function()
										task.wait(1)
										if oldpos == HRP.Position then
											hum:ChangeState(Enum.HumanoidStateType.Jumping)
											task.wait(1)
										end

										oldpos = HRP.Position
										lastbroken = false
									end)
								end
							elseif oldhumanpos ~= nil then
								if (HRP.Position - oldhumanpos).Magnitude <= 0.05 then
									hum:ChangeState(Enum.HumanoidStateType.Jumping)
									task.wait(1)
								end
							end
						until (HRP.Position - v.Position).Magnitude < PointRangeTilNext
							or (HRP.Position - part.Position).Magnitude < 5
							or _G.OngoingPath ~= true
							or autojobs == false
						game.Debris:AddItem(part, 0.01)
					end

					_G.OngoingPath = false
				elseif currentPath.Status ~= pathStatus.Success or _G.currentPoint == nil then
					pathExists = false
				end
			end

			local JobStuff = {
				["Convenience"] = {
					JB = workspace.JobBoardModel,
					JBget = Vector3.new(-315.9144592285156, 47.29416275024414, -589.2377319335938),
				},
				["Japanese1"] = {
					JB = workspace.JobBoardModel1,
					JBget = Vector3.new(-1167, 47, -223),
				},
			}

			while task.wait() and autojobs do
				if SelectedJob == nil or JobBoard == nil then
					repeat
						task.wait()
					until SelectedJob ~= nil and JobBoard ~= nil or autojobs == false
				end
				if game.Players.LocalPlayer.Character.Ragdolled.Value then
					disableAllTraining()
					if macroruin then
						webhook("Macro Notifier", "Knocked/Ragdolled while doing Auto Job. Auto Job turned off")
					end
					return
				end
				shared.AllowSprinting = false
				local JB = JobStuff[JobBoard].JB
				local JBget = JobStuff[JobBoard].JBget
				local jbdistance = (HRP.Position - JB.Board.Position).Magnitude
				local jobui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI")
				local cleared = false

				if jobui == nil then
					if jbdistance <= 9 then
						maintenancechecks()
						repeat
							fireclickdetector(JB.ClickDetector)
							task.wait()
						until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI")
					end
				elseif jobui then
					if
						jobui.Frame.Title.Text:find("Restock") and SelectedJob == "Restock"
						or SelectedJob == "All" and jobui.Frame.Title.Text:find("Restock")
					then
						cleared = true
						AUTOJOBBARRIERS[2].Size = og
					elseif
						jobui.Frame.Title.Text:find("Cleaning") and SelectedJob == "Cleaning"
						or SelectedJob == "All" and jobui.Frame.Title.Text:find("Cleaning")
					then
						if JobBoard == "Convenience" then
							WalkTo(Vector3.new(-370, 47, -582))
						end

						broomjobactive = true

						repeat
							task.wait()

							local annoyingpart = game:GetService("Workspace").Jobs.BroomClean[JobBoard].Part9
							if annoyingpart.Transparency ~= 1 then
								broomjobpart = annoyingpart
								if JobBoard == "Convenience" then
									WalkTo(Vector3.new(-347, 47, -577))
								else
									WalkTo(annoyingpart.Position)
								end
								task.wait(0.1)
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Broom") then
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(
										game.Players.LocalPlayer.Backpack:FindFirstChild("Broom")
									)
									task.wait(0.1)
								end

								VIM:SendMouseButtonEvent(0, 500, 0, true, game, 1)
								task.wait(0.1)
								repeat
									task.wait()
								until annoyingpart.Transparency == 1
							end

							local v = BestBroomSpot()

							if v ~= nil then
								broomjobpart = v
								shared.currentPoint = nil
								WalkTo(v.Position)
								task.wait(0.1)
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Broom") then
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(
										game.Players.LocalPlayer.Backpack:FindFirstChild("Broom")
									)
									task.wait(0.1)
								end

								VIM:SendMouseButtonEvent(0, 500, 0, true, game, 1)
								task.wait(0.1)
								repeat
									task.wait()
								until v.Transparency == 1
							end

						until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("JobGUI") == nil
							or autojobs == false

						broomjobactive = false

						if JobBoard == "Convenience" then
							game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-370, 47, -582))
							game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
						end
						task.spawn(function()
							createPath(JBget)
						end)
					else
						SimulateClick(jobui.Frame.Quit, "Function")
					end
				end

				if cleared then
					local progress = tonumber(jobui.Frame.Progress.Text:split("/")[1]:split(":")[2])

					if progress == 0 then
						AUTOJOBBARRIERS[2].Size = og
						task.delay(math.random(1, 3), function()
							shared.AllowSprinting = true
						end)
						createPath(workspace.Jobs.SupplyDelivery[JobBoard].Part1.Position)
						shared.AllowSprinting = false
					elseif progress == 1 then
						AUTOJOBBARRIERS[2].Size = new
						task.delay(math.random(1, 3), function()
							shared.AllowSprinting = true
						end)
						createPath(workspace.Jobs.SupplyDelivery[JobBoard].Part2.Position)
						shared.AllowSprinting = false

						task.delay(math.random(1, 3), function()
							shared.AllowSprinting = true
						end)
						createPath(JBget)
						shared.AllowSprinting = false
					end
				end
			end
		end

		if autojobs == false then
			for i, v in pairs(AUTOJOBBARRIERS) do
				game.Debris:AddItem(v, 0.01)
			end
		end
	end)

	risky:Dropdown("Job Selector", { "Cleaning", "Restock", "All" }, function(Value)
		SelectedJob = Value
	end)

	risky:Dropdown("Job Board", { "Convenience", "Japanese1" }, function(Value)
		JobBoard = Value
	end)
	risky:Toggle("Auto Buy Foods Nearby", false, function(Value)
		autobuyitem = Value

		if autobuyitem then
			local function GetClosestItem()
				local foodsnear = {}

				for i, v in pairs(ItemTable) do
					if
						(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).Magnitude
						<= v.ClickDetector.MaxActivationDistance
					then
						table.insert(foodsnear, v)
					end
				end

				return foodsnear
			end

			while autobuyitem and task.wait() do
				local foodstobuy = GetClosestItem()

				if autobuyitem and #GetClosestItem() > 0 then
					for i, v in pairs(foodstobuy) do
						if autobuyitem == false then
							return
						end
						fireclickdetector(v.ClickDetector)
						task.wait(0.15)
					end
				end
			end
		end
	end)

	local autoWalkToFoodSpots = false

	risky:Toggle("Auto Walk to Food Spots", false, function(Value)
		autoWalkToFoodSpots = Value
		if autoWalkToFoodSpots then
			coroutine.wrap(function()
				local PathfindingService = game:GetService("PathfindingService")
				local Players = game:GetService("Players")
				local player = Players.LocalPlayer
				local HRP = player.Character:WaitForChild("HumanoidRootPart")
	
				local MOfoods = {
					"Donut", "Coffee", "Bagel", "EZ Taco", "Omelette", "Hotdog", "Pancakes", "Tofu Beef Soup", 
					"Pie", "Tokito Sake", "Hamburger", "Chicken Fries", "Ramen"
				}
				local targetQuantity = 8
				local foodDistances = {}
				local macroSpot = HRP.Position
	
				local function PathfindTo(position)
					local path = PathfindingService:CreatePath({
						AgentRadius = 2,
						AgentHeight = 5,
						AgentCanJump = true,
						AgentJumpHeight = 7,
						AgentMaxSlope = 45,
					})
					path:ComputeAsync(HRP.Position, position)
					for _, waypoint in ipairs(path:GetWaypoints()) do
						player.Character.Humanoid:MoveTo(waypoint.Position)
						player.Character.Humanoid.MoveToFinished:Wait()
					end
					local threshold = 0.1
					while (HRP.Position - position).Magnitude > threshold do
						player.Character.Humanoid:MoveTo(position)
						task.wait()
					end
				end
	
				local function UpdateFoodDistances()
					foodDistances = {}
					for _, foodName in ipairs(MOfoods) do
						for _, obj in pairs(workspace:GetDescendants()) do
							if obj.Name:split(":")[1] == foodName and obj:FindFirstChild("ClickDetector") then
								local targetPart = obj:FindFirstChild("Head") or obj:FindFirstChild("PrimaryPart") or obj:FindFirstChildWhichIsA("BasePart")
								if targetPart then
									local distance = (targetPart.Position - HRP.Position).Magnitude
									table.insert(foodDistances, {name = foodName, object = obj, distance = distance})
								end
							end
						end
					end
					table.sort(foodDistances, function(a, b)
						return a.distance < b.distance
					end)
				end
	
				local function CheckFoodQuantity(foodName)
					local quantity = 0
					for _, item in pairs(player.Backpack:GetChildren()) do
						if item.Name == foodName and item:FindFirstChild("Quantity") then
							quantity = item.Quantity.Value
							break
						end
					end
					return quantity
				end
	
				local function OnlyOneFoodLeft()
					local foodCount = 0
					for _, foodName in ipairs(MOfoods) do
						if CheckFoodQuantity(foodName) > 0 then
							foodCount = foodCount + 1
						end
					end
					return foodCount == 1
				end
	
				local function AllFoodsAtTarget()
					for _, foodName in ipairs(MOfoods) do
						if CheckFoodQuantity(foodName) < targetQuantity then
							return false
						end
					end
					return true
				end
	
				while autoWalkToFoodSpots do
					if OnlyOneFoodLeft() then
						webhook("AutoWalk Notifier", "Only one food type left. Walking to all food spots...")
						UpdateFoodDistances()
						for _, foodData in ipairs(foodDistances) do
							local targetPart = foodData.object:FindFirstChild("Head") or foodData.object:FindFirstChild("PrimaryPart") or foodData.object:FindFirstChildWhichIsA("BasePart")
							if targetPart then
								PathfindTo(targetPart.Position)
								webhook("AutoWalk Notifier", "Reached " .. foodData.name .. " spot exactly. Please buy manually if needed.")
								repeat
									task.wait(1)
									local quantity = CheckFoodQuantity(foodData.name)
									webhook("AutoWalk Notifier", foodData.name .. " quantity: " .. quantity)
								until quantity >= targetQuantity or AllFoodsAtTarget()
							end
						end
						PathfindTo(macroSpot)
						webhook("AutoWalk Notifier", "Returned to macro spot.")
					else
						webhook("AutoWalk Notifier", "More than one food type available. Waiting...")
						task.wait(30)
					end
				end
			end)()
		end
	end)

	risky:Label("-- if supply job stop randomly use Point mag below -- ")

	risky:Slider("Point Magnitude Til Next", { def = PointRangeTilNext, max = 30, min = 0 }, function(Value)
		PointRangeTilNext = Value
	end)

	trainingtoggles[#trainingtoggles + 1] = risky:Toggle("Auto Roadwork", false, function(Value)
		Roadwork = Value

		if Roadwork then
			task.spawn(function()
				while task.wait(0.1) and Roadwork do
					local actionscript = getsenv(game:GetService("Players").LocalPlayer.Backpack.LocalS)
					local StamPercent = (
						game.Players.LocalPlayer.Character.CurrentStamina.Value
						/ game.Players.LocalPlayer.Character.MaxStamina.Value
					) * 100
					local LowStam = ministam

					if RWCanSprint and Roadwork then
						if isrunning == false and StamPercent >= 100 and RWCanSprint then
							actionscript.runPrompt()
							isrunning = true
							task.wait(1)
						elseif isrunning == true then
							repeat
								StamPercent = (
									game.Players.LocalPlayer.Character.CurrentStamina.Value
									/ game.Players.LocalPlayer.Character.MaxStamina.Value
								) * 100
								task.wait()
							until StamPercent <= LowStam
								or StamPercent == 100
								or Roadwork == false
								or RWCanSprint == false

							if StamPercent < 100 or autotrain == false or RWCanSprint == false then
								actionscript.stopSprint()
								maintenancechecks()
							end
							isrunning = false
						end
					end
				end
			end)

			while task.wait() and Roadwork do
				pcall(function()
					local MyStorage = workspace:FindFirstChild(game.Players.LocalPlayer.Name .. " Storage")
					local RWBuy = GetClosestRoadwork()

					if
						game.Players.LocalPlayer.Backpack:FindFirstChild("Roadwork") == nil
						and game.Players.LocalPlayer.Character:FindFirstChild("Roadwork") == nil
					then
						if RWBuy ~= nil then
							RWCanSprint = true
							createPath(RWBuy.Head.Position)
							RWCanSprint = false
							task.wait(0.1)
							fireclickdetector(RWBuy.ClickDetector)
							task.wait(0.1)
						end
					else
						if #MyStorage:GetChildren() < 1 then
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Roadwork") then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(
									game.Players.LocalPlayer.Backpack:FindFirstChild("Roadwork")
								)
								task.wait(0.1)
							end
							game.Players.LocalPlayer.Character:FindFirstChild("Roadwork"):Activate()
						else
							print("WALK TO", MyStorage:GetChildren()[1])
							RWCanSprint = true
							createPath(MyStorage:GetChildren()[1].Position)
						end
					end
				end)
			end
		end
	end)

	risky:Label("-- if roadwork stop randomly use cp mag below -- ")

	risky:Slider("CP Magnitude Til Next", { def = CPRangeTilNext, max = 30, min = 0 }, function(Value)
		CPanRangeTilNext = Value
	end)

	local function ScanTable(table, string)
		for i, v in pairs(table) do
			if v == string then
				return i
			end
		end

		return nil
	end

	local function AztupElements()
		local LivingThings
		LivingThings = workspace:FindFirstChild("Live") or Instance.new("Model")
		local Events = game.ReplicatedStorage.Events
		getgenv().runningSpeed = 500
		local ATBdistance = 5 --1-10
		local ATBrange = 100 -- 0-100
		local ATBloop = nil
		local angleOffSet = CFrame.Angles(math.rad(-90), 0, 0)

		local function UtilityFind(t, c)
			for i, v in next, t do
				if c(v, i) then
					return v, i
				end
			end

			return nil
		end

		local function parseKey(str)
			return UtilityFind({ str:byte(1, 9999) }, function(v)
				return v > 128
			end)
		end

		local function getKey(script)
			if not script:IsA("LocalScript") then
				error("Expected a localscript got " .. script.ClassName)
			end
			local key

			local ran, env = pcall(getsenv, script)
			if not ran then
				return
			end

			for _, v in next, env do
				if typeof(v) == "function" then
					for _, k in next, getupvalues(v) do
						if typeof(k) == "string" and parseKey(k) then
							key = k
							break
						end
					end
				end
			end

			if key then
				return key
			end

			for _, v in next, script.Parent:GetDescendants() do
				local con = string.match(v.ClassName, "Button") and getconnections(v.MouseButton1Click)[1]
					or getconnections(v.Changed)[1]
				if con and con.Function then
					for _, k in next, getupvalues(v) do
						if typeof(k) == "string" and parseKey(k) then
							key = k
							break
						end
					end

					if key then
						break
					end
				end
			end
			return key
		end

		getgenv().getKey = getKey

		local function getMobInRange(range)
			local plr = game.Players.LocalPlayer
			local char = plr.Character
			local inRange
			local closest = range
			for i, v in next, LivingThings:GetChildren() do
				if v ~= char then
					if not game.Players:FindFirstChild(v.Name) then
						if (v:FindFirstChild("HumanoidRootPart")) and char:FindFirstChild("HumanoidRootPart") then
							if (v.HumanoidRootPart.Position - char.HumanoidRootPart.Position).magnitude <= closest then
								inRange = v
								closest = (v.HumanoidRootPart.Position - char.HumanoidRootPart.Position).magnitude
								break
							end
						end
					end
				end
			end

			return inRange
		end

		local plr = game.Players.LocalPlayer
		local char = plr.Character
		local getupvalue = debug.getupvalue
		local getupvalues = debug.getupvalues
		local getconstant = debug.getconstant
		local getconstants = debug.getconstants

		local parryAnims = {
			["rbxassetid://7009320896"] = { ["Guardbreak"] = false },
			["rbxassetid://5087462384"] = { ["Guardbreak"] = false },
			["rbxassetid://6501739912"] = { ["Guardbreak"] = false },
			["rbxassetid://6704457409"] = { ["Guardbreak"] = false },
			["rbxassetid://6718814119"] = { ["Guardbreak"] = false },
			["rbxassetid://5029356929"] = { ["Guardbreak"] = false },
			["rbxassetid://6930761828"] = { ["Guardbreak"] = false },
			["rbxassetid://5087464114"] = { ["Guardbreak"] = false },
			["rbxassetid://5029359784"] = { ["Guardbreak"] = false },
			["rbxassetid://7876039532"] = { ["Guardbreak"] = false },
			["rbxassetid://5810497127"] = { ["Guardbreak"] = false },
			["rbxassetid://7891093418"] = { ["Guardbreak"] = false },
			["rbxassetid://6930758587"] = { ["Guardbreak"] = false },
			["rbxassetid://5110868660"] = { ["Guardbreak"] = false },
			["rbxassetid://7877241063"] = { ["Guardbreak"] = false },
			["rbxassetid://6550835152"] = { ["Guardbreak"] = false },
			["rbxassetid://6604546413"] = { ["Guardbreak"] = false },
			["rbxassetid://6875783564"] = { ["Guardbreak"] = false },
			["rbxassetid://5052660577"] = { ["Guardbreak"] = false },
			["rbxassetid://7877246443"] = { ["Guardbreak"] = false },
			["rbxassetid://8594975706"] = { ["Guardbreak"] = false },
			["rbxassetid://5865529031"] = { ["Guardbreak"] = false },
			["rbxassetid://5116608619"] = { ["Guardbreak"] = false },
			["rbxassetid://5110454001"] = { ["Guardbreak"] = false },
			["rbxassetid://5092035643"] = { ["Guardbreak"] = false },
			["rbxassetid://5869781872"] = { ["Guardbreak"] = false },
			["rbxassetid://5110500012"] = { ["Guardbreak"] = false },
			["rbxassetid://5645707634"] = { ["Guardbreak"] = false },
			["rbxassetid://6718812539"] = { ["Guardbreak"] = false },
			["rbxassetid://6194195462"] = { ["Guardbreak"] = false },
			["rbxassetid://5110724393"] = { ["Guardbreak"] = false },
			["rbxassetid://6930759930"] = { ["Guardbreak"] = false },
			["rbxassetid://5883810295"] = { ["Guardbreak"] = false },
			["rbxassetid://4918348016"] = { ["Guardbreak"] = false },
			["rbxassetid://5092037778"] = { ["Guardbreak"] = false },
			["rbxassetid://5052449595"] = { ["Guardbreak"] = false },
			["rbxassetid://5087459369"] = { ["Guardbreak"] = false },
			["rbxassetid://5873100725"] = { ["Guardbreak"] = false },
			["rbxassetid://6573164932"] = { ["Guardbreak"] = false },
			["rbxassetid://6566644368"] = { ["Guardbreak"] = false },
			["rbxassetid://7791575394"] = { ["Guardbreak"] = false },
			["rbxassetid://6360102363"] = { ["Guardbreak"] = false },
			["rbxassetid://6719137742"] = { ["Guardbreak"] = false },
			["rbxassetid://5052435233"] = { ["Guardbreak"] = false },
			["rbxassetid://7876328758"] = { ["Guardbreak"] = false },
			["rbxassetid://6875731587"] = { ["Guardbreak"] = false },
			["rbxassetid://5126044328"] = { ["Guardbreak"] = false },
			["rbxassetid://7887536058"] = { ["Guardbreak"] = false },
			["rbxassetid://6674659296"] = { ["Guardbreak"] = false },
			["rbxassetid://7130763680"] = { ["Guardbreak"] = false },
			["rbxassetid://5092042225"] = { ["Guardbreak"] = false },
			["rbxassetid://5110453274"] = { ["Guardbreak"] = false },
			["rbxassetid://6360098898"] = { ["Guardbreak"] = false },
			["rbxassetid://6704318501"] = { ["Guardbreak"] = false },
			["rbxassetid://5870608112"] = { ["Guardbreak"] = false },
			["rbxassetid://5126071335"] = { ["Guardbreak"] = false },
			["rbxassetid://6257267175"] = { ["Guardbreak"] = false },
			["rbxassetid://10234589242"] = { ["Guardbreak"] = false }, --Tiger Hunt
			["rbxassetid://10234603041"] = { ["Guardbreak"] = true }, --Snake Bite
			["rbxassetid://10261951458"] = { ["Guardbreak"] = false }, --Dragon Claw
			["rbxassetid://5594891491"] = { ["Guardbreak"] = false }, --Bear Hug
			["rbxassetid://7819569583"] = { ["Guardbreak"] = false }, --BlastCore
			["rbxassetid://4901795168"] = { ["Guardbreak"] = true }, --brawl GB
			["rbxassetid://4973374984"] = { ["Guardbreak"] = true }, --Thai GB
			["rbxassetid://5016575571"] = { ["Guardbreak"] = true }, --Karate gb
			["rbxassetid://6169229434"] = { ["Guardbreak"] = true }, --Wrestling GB
			["rbxassetid://5016611308"] = { ["Guardbreak"] = true }, --Sumo GB
			["rbxassetid://6538829055"] = { ["Guardbreak"] = true }, --Taek GB
			["rbxassetid://6585959296"] = { ["Guardbreak"] = true }, --Raishin GB
			["rbxassetid://6194191510"] = { ["Guardbreak"] = true }, --Kure GB
			["rbxassetid://4918356164"] = { ["Guardbreak"] = true }, --Boxing GB
			["rbxassetid://6169361647"] = { ["Guardbreak"] = true }, --Karate GB
		}

		local guardBreakTable = {
			["Corkscrew"] = true,
			["Blast Core"] = true,
			["Flying Knee"] = true,
			["Axe Kick"] = true,
			["Tiger Bite"] = true,
			["Reverse Heel"] = true,
			["Solid Strike"] = true,
			["Jolt Hook"] = true,
			["Flying Side Kick"] = true,
			["Sumo Throw"] = true,
			["Bear Hug"] = true,
			["Shoulder Bash"] = true,
			["Forearm Smash"] = true,
			["Suplex"] = true,
			["Elbow Drop"] = 0.1,
			["Body Slam"] = true,
			["Eye Slice"] = true,
		}

		local function getStyle()
			if plr:FindFirstChild("Backpack") then
				return
			end
			if plr.Backpack:FindFirstChild("Style") then
				return plr.Backpack:FindFirstChild("Style").Parent
			elseif char:FindFirstChild("Style") then
				return char:FindFirstChild("Style").Parent
			end
			return nil
		end

		local function blockAttack()
			local key = getKey(plr.Backpack.LocalS)
			if not key then
				return
			end

			plr.Backpack.Action:FireServer(key, "Block", { true })
		end

		local function unblockAttack()
			local key = getKey(plr.Backpack.LocalS)
			if not key then
				return
			end

			plr.Backpack.Action:FireServer(key, "Block", { false })
		end

		local function guardBreak()
			local key = getKey(plr.Backpack.LocalS)
			if not key then
				return
			end

			plr.Backpack.Action:FireServer(key, "GuardBreak", { true })
		end

		getgenv().autoBlockconnections = {}

		local function autoParry(v)
			local plr = game.Players.LocalPlayer
			local char = plr.Character
			if v == char then
				return
			end

			local hrp = v:WaitForChild("HumanoidRootPart", 10)
			local animator = v:WaitForChild("Humanoid", 10) and v.Humanoid:WaitForChild("Animator", 10)
			if not hrp or not animator then
				return
			end

			getgenv().autoBlockconnections[#getgenv().autoBlockconnections + 1] = animator.AnimationPlayed:Connect(
				function(animationTrack)
					local combat = getStyle()
					local animation = animationTrack.Animation
					local id = animation.AnimationId
					local tool = v:FindFirstChildWhichIsA("Tool")
					local willGuardbreak = tool and guardBreakTable[tool.Name]

					local distance = hrp.Parent and char and (hrp.Position - char.HumanoidRootPart.Position).magnitude
					if
						not distance
						or distance > getgenv().ParryRange
						or not parryAnims[id]
						or not (math.random(1, 100) <= getgenv().ParryChance)
					then
						return
					end

					if willGuardbreak or parryAnims[id]["Guardbreak"] then
						if char:FindFirstChild("Blocking") then
							return combat:Activate()
						end --If we already blocking then just parry?

						if parryAnims[id]["Guardbreak"] then --Calculate speed
							task.wait(animationTrack.Speed / 10)
						end

						blockAttack()

						if getgenv().AutoCounter then
							guardBreak()
						end --This allows us to counter while blocking

						combat:Activate()
						task.wait(0.4)
						unblockAttack()
						return --We dont want to do anything else if they guardbreak
					end

					blockAttack()

					if getgenv().AutoCounter then
						guardBreak()
					end --This allows us to counter while blocking

					task.wait(0.4)
					unblockAttack()
				end
			)
		end

		risky:Label("-THESE ALL FROM AZTUP HUB NOT MINE-")
		risky:Label("(aztup hub source is public to anyone)")

		risky:Toggle("Auto Parry", false, function(Value)
			getgenv().AutoParry = Value

			if not getgenv().AutoParry then
				for i, v in pairs(getgenv().autoBlockconnections) do
					v:Disconnect()
				end

				return
			end

			for _, v in next, LivingThings:GetChildren() do
				task.spawn(autoParry, v)
			end

			LivingThings.ChildAdded:Connect(autoParry)
		end)

		risky:Slider("AP Range", { min = 1, max = 30, def = 18 }, function(Value)
			getgenv().ParryRange = Value
		end)

		risky:Slider("AP Chance", { min = 1, max = 100, def = 100 }, function(Value)
			getgenv().ParryChance = Value
		end)

		risky:Toggle("Auto Counter", false, function(Value)
			getgenv().AutoCounter = Value
		end)

		risky:Toggle("Attach to Back (Mobs)", false, function(Value)
			getgenv().attachtoback = Value

			if not getgenv().attachtoback then
				if ATBloop ~= nil then
					ATBloop:Disconnect()
					ATBloop = nil
				end
				return
			end

			local lastcheck = tick()
			local target = getMobInRange(ATBrange)
			print(target)
			local plr = game.Players.LocalPlayer
			local char = plr.Character

			ATBloop = game.RunService.Heartbeat:Connect(function()
				print("loop")
				if tick() - lastcheck >= 0.1 and target then
					lastcheck = tick()

					if target:FindFirstChild("KO") then
						return
					end
				end

				print(target)
				if not target or not target.Parent then
					target = getMobInRange(ATBrange)
				end
				print("1")
				if not target or not target:FindFirstChild("HumanoidRootPart") then
					return
				end
				print("2")

				char.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
					* (CFrame.new(0, ATBdistance, 1) * angleOffSet)
				char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				char.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			end)
		end)

		risky:Slider("ATB Distance", { min = 1, max = 10, def = 5 }, function(Value)
			ATBdistance = Value
		end)

		risky:Slider("ATB Range", { min = 0, max = 100, def = 100 }, function(Value)
			ATBrange = Value
		end)

		local oldSpeed

		risky:Toggle("RunSpeed Changer", false, function(Value)
			getgenv().RunSpeedChanger = Value

			local func
			for i, v in next, getconnections(Events.UpdateStats.OnClientEvent) do
				if v.Function and not is_executor_closure(v.Function) then
					func = v.Function
				end
			end

			local tab = getupvalue(func, 1)
			oldSpeed = rawget(tab, "RunningSpeed") or oldSpeed
			if not getgenv().RunSpeedChanger then
				setmetatable(tab, nil)
				rawset(tab, "RunningSpeed", oldSpeed)
				return
			end

			setmetatable(tab, {
				__newindex = function(t, k, v)
					if k == "RunningSpeed" then
						return
					end
					return rawset(t, k, v)
				end,
				__index = function(t, k)
					if k == "RunningSpeed" then
						return getgenv().runningSpeed
					end
				end,
			})
			rawset(tab, "RunningSpeed", nil)
		end)

		risky:Slider("RunSpeed", { min = 0, max = 2300, def = 500 }, function(Value)
			getgenv().runningSpeed = Value
		end)

		local RhythmLooping = false

		risky:Toggle("Inf Rhythm", false, function(Value)
			getgenv().InfRhythm = Value
			if not RhythmLooping and getgenv().InfRhythm then
				local key = getKey(game.Players.LocalPlayer.Backpack.LocalS)
				if not key then
					return print("KEY NOT FOUND")
				end
				local action = game.Players.LocalPlayer.Backpack.Action
				action:FireServer(key, "RhythmStance", true)
				RhythmLooping = true
				repeat
					task.wait(0.1)
				until not getgenv().InfRhythm
				RhythmLooping = false
				action:FireServer(key, "RhythmStance", false)
			end
		end)

		risky:Toggle("Inf Dash", false, function(Value)
			getgenv().InfDash = Value

			if getgenv().InfDash then
				local env = getsenv(game.Players.LocalPlayer.Backpack.LocalS)
				repeat
					task.wait(0.1)
					setupvalue(env.Dash, 2, 3)
					setupvalue(env.Dash, 3, "")
				until not getgenv().InfDash
			end
		end)

		risky:Toggle("No Stam Dash", false, function(Value)
			getgenv().NoStamDash = Value
			local env = getsenv(game.Players.LocalPlayer.Backpack.LocalS)
			local constantNum = ScanTable(getconstants(env.Dash), "FireServer")
			if not getgenv().NoStamDash then
				setconstant(getsenv(plr.Backpack.LocalS).Dash, constantNum, "FireServer")
				return
			end
			setconstant(getsenv(plr.Backpack.LocalS).Dash, constantNum, "GetChildren")
		end)

		local InfTreadLoop = false

		risky:Toggle("Inf Treadmill Stamina", false, function(Value)
			getgenv().infTreadmillStamina = Value
		end)

		risky:Bind("Inf Tread Bind", Enum.KeyCode.Nine, function()
			if getgenv().infTreadmillStamina and not InfTreadLoop then
				getgenv().infTreadmillStaminaEnabled = true
				InfTreadLoop = true

				win.Notify({
					Title = "Inf Treadmill Stamina",
					Text = tostring(getgenv().infTreadmillStaminaEnabled),
				})

				local key = getKey(plr.Backpack.LocalS)

				if key then
					local action = plr.Backpack.Action
					repeat
						action:FireServer(key, "RunToggle", { [1] = true, [2] = false })
						task.wait()
						action:FireServer(key, "RunToggle", { false })
						task.wait(0.3)
					until not getgenv().infTreadmillStaminaEnabled or not getgenv().infTreadmillStamina
				end
				InfTreadLoop = false
				getgenv().infTreadmillStaminaEnabled = false
			elseif getgenv().infTreadmillStamina and InfTreadLoop then
				getgenv().infTreadmillStaminaEnabled = false
				win.Notify({
					Title = "Inf Treadmill Stamina",
					Text = tostring(getgenv().infTreadmillStaminaEnabled),
				})
			end
		end)
	end

	local aztupInit = false

    if typeof(getgc) ~= "nil" then
        risky:Button("-- Aztup MO Features --", function()
            if not getgenv().ACBYPASS then
                local banRemote
                local remoteKey

                local plr = game.Players.LocalPlayer
                local getupvalues = debug.getupvalues
                local getconstant = debug.getconstant
                local getconstants = debug.getconstants

                local ran, err = pcall(function()
                    local function initGC()
                        for _, v in next, getgc() do
                            local constants

                            local valid = pcall(function()
                                if typeof(v) == "function" and islclosure(v) and not is_executor_closure(v) then
                                    constants = getconstants(v)
                                end
                            end)

                            if constants ~= nil and valid then
                                if ScanTable(constants, "F1ySuspicion") then
                                    banRemote = getconstant(v, ScanTable(getconstants(v), "F1ySuspicion") - 1)
                                    local remoteFolder = 24

                                    for _, uv in next, getupvalues(v) do
                                        if typeof(uv) == "string" then
                                            remoteKey = uv
                                        end
                                    end

                                    if getupvalue(v, remoteFolder + 1) ~= remoteKey then
                                        plr:Kick("Kicked you to protect your account something, in the game has changed.")
                                        return
                                    end

                                    if
                                        getupvalue(v, remoteFolder)
                                        and getupvalue(v, remoteFolder):FindFirstChild(banRemote)
                                    then
                                        banRemote = getupvalue(v, remoteFolder):FindFirstChild(banRemote)
                                        return true
                                    else
                                        return plr:Kick("Failed to grab ban remote")
                                    end
                                end
                            end
                        end
                    end

                    print("waiting for gc scan.")
                    repeat
                        task.wait()
                    until initGC()

                    if not banRemote or not remoteKey then
                        plr:Kick("Kicked you to protect your account something, in the game has changed.")
                        return
                    end

                    if banRemote.Name ~= "Detector" then
                        plr:Kick("Kicked you to protect your account something, in the game has changed.")
                        return
                    end

                    local oldNamecall
                    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                        local ncMethod = getnamecallmethod()
                        if
                            self == banRemote and ncMethod == "FireServer"
                            or self == banRemote and ncMethod == "fireServer"
                        then
                            return
                        end

                        return oldNamecall(self, ...)
                    end)

                    local oldFireServer
                    oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
                        if self == banRemote then
                            return
                        end

                        return oldFireServer(self, ...)
                    end)

                    getgenv().ACBYPASS = true
                end)

                if not ran then
                    warn(err)
                end
            end

            if getgenv().ACBYPASS and not aztupInit then
                aztupInit = true
                AztupElements()
            end
        end)
    else
        risky:Label("-- Unavaliable on your Executor --")
    end

	game.Players.PlayerAdded:Connect(function(v)
		if staffnotifier or copnotifier then
			Notifier(v)
		end

		if OPSNotifier and OPsData ~= nil then
			OPsData = game:GetService("HttpService"):JSONDecode(readfile("/m1keincorporated/MOoppositions.json"))

			if table.find(OPsData, tostring(v.UserId)) then
				webhook(
					"Opposition Detected",
					"DisplayName: " .. v.DisplayName .. "\nUsername: " .. v.Name .. "\nUserId: " .. tostring(v.UserId)
				)
			end
		end
	end)

	return win
end





local GameList = {
    ["Greenville"] = {
        PlaceIds = {891852901},
        UIConfig = GV,
    },
    ["EGOIST"] = {
        PlaceIds = {12014336378,10742364019,12159833555,13015785300},
        UIConfig = EGO,
    },
    ["Pixel Piece"] = {
        PlaceIds = {9380307595},
        UIConfig = PIXELPENIS,
    },
    ["Volleyball 4.2"] = {
        PlaceIds = {3840352284,5696406278,9195046885},
        UIConfig = Volleyball4dot2,
    },
    ["Fakewoken 3"] = {
        PlaceIds = {8350658333},
        UIConfig = Fakewoken,
    },
    ["Neo Soccer League [DEMO]"] = {
        PlaceIds = {7732789524,9254845212,12767114985},
        UIConfig = Neo,
    },
    ["[BETA] Goal!"] = {
        PlaceIds = {9822821238,8397893574,9407843692},
        UIConfig = Goal,
    },
    ["Combat Warriors"] = {
        PlaceIds = {4282985734,11979315221,9532476417},
        UIConfig = Combat_Warriors
    },
    ["ZO"] = {
      PlaceIds = {6678877691},
      UIConfig = ZO,
    },
    ["Beyond Volleyball League"] = {
        PlaceIds = {6734275465},
        UIConfig = BeyondVolleyBall,
    },
    ["Deepwoken Dev"] = {
        PlaceIds = {10138901829,10495850838,10371908957},
        UIConfig = Deepwoken_Dev,
    },
    ["Arsenal"] = {
        PlaceIds = {286090429},
        UIConfig = Arsenal,
    },
    ["Ken Omega"] = {
        PlaceIds = {2898237081},
        UIConfig = Ken_Omega,
    },
    ["Revengers 2"] = {
        PlaceIds = {11987476545},
        UIConfig = RevengersDos,
    },
    ["Mighty Omega"] = {
        PlaceIds = {4878988249,16225367431,6320657368},
        UIConfig = MO,
    },
    ["Tatakai: Remastered"] = {
        PlaceIds = {12071150417,13435512099,13435510614},
        UIConfig = Tatakai,
    }
}

local function GetGame()
    local placeID = game.PlaceId
    local UIConfigFunc = nil
    local UIName = nil
    
    for GN,v in next, GameList do
        for _,id in next, v.PlaceIds do
           if tostring(placeID) == tostring(id) then
                UIConfigFunc = v.UIConfig
                UIName = GN
                break
           end
        end
    end
    
    return {UIName,UIConfigFunc} 
end

local GameInfo = GetGame()

if GameInfo[1] == nil and GameInfo[2] == nil then
    game.StarterGui:SetCore("SendNotification", {
        Title = "m1kecorp";
        Text = "Unsupported game!"
    })
    return 
end

local win = GameInfo[2](GameInfo[1])

pcall(function()
local settings = win:Tab("UI Settings")

local folderName = "m1keincorporated"
local fileName = "None"
local dataTable = _G.UISettings

function ReadConfig()
    local fileData = readfile("/"..folderName.."/"..fileName)
    local data = game:GetService("HttpService"):JSONDecode(fileData)
    
    return data
end

function AppendConfig()
    pcall(function()
        local data = game:GetService("HttpService"):JSONEncode(dataTable)
        writefile("/"..folderName.."/"..fileName,data)
    end)
end

function Save()
    for index,element in pairs(_G.UISettings.ElementCache) do
       local newtable = element
       
       element.Element:SaveConfig()
       task.wait()
    end    
            
    pcall(function()
        writefile("/"..folderName.."/"..fileName,game:GetService("HttpService"):JSONEncode(_G.UISettings))
    end)
end

function Load()
    local fileData = ReadConfig()
            
    for index,element in pairs(fileData.ElementCache) do
        for index2,element2 in pairs(_G.UISettings.ElementCache) do
            if element2.Name == element.Name and element2.Type == element.Type then
                   local newtable = element

                   if element.Value ~= nil then
                       newtable.Value = element.Value
                       task.wait()
                   else
                       newtable.Value = element2.Value
                       task.wait()
                   end
                   
                   element2.Element:LoadConfig(newtable)
            end
        end
    end
    
    local dataTable = _G.UISettings.UIConfig
    
    for i,v in pairs(fileData.UIConfig) do
        if typeof(v) ~= "table" then
            dataTable[i] = v
        else
            for i2,v2 in pairs(data[i]) do
                if tonumber(i2) then
                  dataTable[i] = v
                else
                     dataTable[i][i2] = v2
                end
            end
        end
    end
end

local folder

pcall(function()
    folder = isfolder("/"..folderName)
end)

if not folder then
    pcall(function()
        makefolder("/"..folderName) 
    end)
end

local hideuibind
hideuibind = settings:Bind("Hide GUI",Enum.KeyCode.RightAlt,function()
    win.ToggleVisiblity()
end)

local fileLabel = settings:Label("File: None")

settings:Textbox("Config File Name",function(txt)
    fileName = txt.."_"..game.PlaceId..".json"
    fileLabel:SetText("Current File Selected: "..fileName:gsub("_"..game.PlaceId,"").." | Exists?:"..tostring(isfile("/"..folderName.."/"..fileName)))
end)

settings:Button("Load Config",function()
    if fileName == "" then return end
    Load()
    fileLabel:SetText("File "..fileName:gsub("_"..game.PlaceId,"").." Loaded!")
    task.wait(1)
    fileLabel:SetText("Current File Selected: "..fileName:gsub("_"..game.PlaceId,"").." | Exists?:"..tostring(isfile("/"..folderName.."/"..fileName)))
end)

settings:Button("Save Config",function()
    if fileName == "" then return end
    Save()
    fileLabel:SetText("File "..fileName:gsub("_"..game.PlaceId,"").." Saved!")
    task.wait(1)
    fileLabel:SetText("Current File Selected: "..fileName:gsub("_"..game.PlaceId,"").." | Exists?:"..tostring(isfile("/"..folderName.."/"..fileName)))
end)
end)
