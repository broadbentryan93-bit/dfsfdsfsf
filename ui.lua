-- HI Library v3.0 - Premium 4K UI
-- Modern Roblox UI Library with advanced customization
-- Based on IMG_2039.jpeg design

local HI = {}
HI.__index = HI

-- Icon Repository (using Roblox icons, can be replaced with image IDs)
HI.Icons = {
    Catching = "rbxassetid://10723359580", -- Gear icon
    Physics = "rbxassetid://10723359953", -- Physics icon
    Settings = "rbxassetid://10734928019", -- Settings icon
    Search = "rbxassetid://10734928367", -- Search icon
    Minimize = "rbxassetid://10734928599", -- Minimize icon
    Close = "rbxassetid://10734928842", -- Close icon
    Home = "rbxassetid://10734929074", -- Home icon
    Visual = "rbxassetid://10734929308", -- Eye icon
    Audio = "rbxassetid://10734929541", -- Audio icon
    Info = "rbxassetid://10734929775", -- Info icon
    Star = "rbxassetid://10734930007", -- Star icon
    Palette = "rbxassetid://10734930239" -- Color palette icon
}

-- Premium Color Themes
HI.Themes = {
    Default = {
        Main = Color3.fromRGB(25, 25, 30),
        Secondary = Color3.fromRGB(35, 35, 40),
        Tertiary = Color3.fromRGB(45, 45, 50),
        Accent = Color3.fromRGB(0, 150, 255),
        Text = Color3.fromRGB(245, 245, 245),
        SubText = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(60, 60, 65),
        Success = Color3.fromRGB(0, 220, 100),
        Warning = Color3.fromRGB(255, 170, 0),
        Danger = Color3.fromRGB(255, 70, 70),
        Dark = Color3.fromRGB(15, 15, 20),
        Light = Color3.fromRGB(240, 240, 245)
    },
    Dark = {
        Main = Color3.fromRGB(15, 15, 20),
        Secondary = Color3.fromRGB(25, 25, 30),
        Tertiary = Color3.fromRGB(35, 35, 40),
        Accent = Color3.fromRGB(0, 200, 255),
        Text = Color3.fromRGB(230, 230, 230),
        SubText = Color3.fromRGB(160, 160, 160),
        Border = Color3.fromRGB(50, 50, 55),
        Success = Color3.fromRGB(0, 230, 110),
        Warning = Color3.fromRGB(255, 190, 0),
        Danger = Color3.fromRGB(255, 90, 90),
        Dark = Color3.fromRGB(5, 5, 10),
        Light = Color3.fromRGB(220, 220, 225)
    },
    Blue = {
        Main = Color3.fromRGB(20, 25, 40),
        Secondary = Color3.fromRGB(30, 35, 50),
        Tertiary = Color3.fromRGB(40, 45, 60),
        Accent = Color3.fromRGB(0, 180, 255),
        Text = Color3.fromRGB(235, 240, 255),
        SubText = Color3.fromRGB(170, 180, 200),
        Border = Color3.fromRGB(50, 60, 80),
        Success = Color3.fromRGB(0, 210, 120),
        Warning = Color3.fromRGB(255, 180, 0),
        Danger = Color3.fromRGB(255, 80, 80),
        Dark = Color3.fromRGB(10, 15, 30),
        Light = Color3.fromRGB(225, 230, 245)
    },
    Purple = {
        Main = Color3.fromRGB(35, 25, 45),
        Secondary = Color3.fromRGB(45, 35, 55),
        Tertiary = Color3.fromRGB(55, 45, 65),
        Accent = Color3.fromRGB(180, 100, 255),
        Text = Color3.fromRGB(245, 235, 255),
        SubText = Color3.fromRGB(200, 180, 220),
        Border = Color3.fromRGB(65, 55, 75),
        Success = Color3.fromRGB(100, 220, 150),
        Warning = Color3.fromRGB(255, 190, 80),
        Danger = Color3.fromRGB(255, 90, 110),
        Dark = Color3.fromRGB(25, 15, 35),
        Light = Color3.fromRGB(245, 235, 255)
    }
}

-- Configuration
HI.Config = {
    Theme = "Default",
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TitleSize = 16,
    BorderSize = 1,
    AnimationSpeed = 0.2,
    WindowSize = UDim2.new(0, 900, 0, 600), -- 4K size
    UseIcons = true,
    BlurBackground = true,
    RoundedCorners = true
}

-- Utility Functions
local function Tween(Object, Properties, Duration)
    Duration = Duration or HI.Config.AnimationSpeed
    local TweenService = game:GetService("TweenService")
    local TweenInfo = TweenInfo.new(Duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

local function Round(Number, DecimalPlaces)
    DecimalPlaces = DecimalPlaces or 0
    local Multiplier = 10 ^ DecimalPlaces
    return math.floor(Number * Multiplier + 0.5) / Multiplier
end

local function CreateRoundedFrame(Parent, Size, Position)
    local Frame = Instance.new("Frame")
    Frame.Size = Size
    Frame.Position = Position
    Frame.BackgroundTransparency = 0
    Frame.ClipsDescendants = true
    
    if HI.Config.RoundedCorners then
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = Frame
    end
    
    Frame.Parent = Parent
    return Frame
end

-- Main Library Class
function HI.new(Title, IconId)
    local self = setmetatable({}, HI)
    
    -- Create ScreenGui
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "HILibrary"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.DisplayOrder = 1000
    self.ScreenGui.ResetOnSpawn = false
    
    -- Background Blur
    if HI.Config.BlurBackground then
        self.BackgroundBlur = Instance.new("BlurEffect")
        self.BackgroundBlur.Size = 8
        self.BackgroundBlur.Parent = game:GetService("Lighting")
    end
    
    -- Main Container
    self.MainContainer = Instance.new("Frame")
    self.MainContainer.Name = "MainContainer"
    self.MainContainer.Size = HI.Config.WindowSize
    self.MainContainer.Position = UDim2.new(0.5, -HI.Config.WindowSize.X.Offset/2, 0.5, -HI.Config.WindowSize.Y.Offset/2)
    self.MainContainer.BackgroundTransparency = 1
    self.MainContainer.Parent = self.ScreenGui
    
    -- Main Window
    self.MainWindow = CreateRoundedFrame(self.MainContainer, HI.Config.WindowSize, UDim2.new(0, 0, 0, 0))
    self.MainWindow.BackgroundColor3 = HI.Themes[HI.Config.Theme].Main
    self.MainWindow.BorderSizePixel = 0
    
    -- Make Window Draggable
    self:Draggify(self.MainWindow)
    
    -- TOP BAR
    self.TopBar = Instance.new("Frame")
    self.TopBar.Name = "TopBar"
    self.TopBar.Size = UDim2.new(1, 0, 0, 60)
    self.TopBar.BackgroundColor3 = HI.Themes[HI.Config.Theme].Secondary
    self.TopBar.BorderSizePixel = 0
    self.TopBar.Parent = self.MainWindow
    
    -- Top Left: Hub Title with Icon
    self.TitleContainer = Instance.new("Frame")
    self.TitleContainer.Name = "TitleContainer"
    self.TitleContainer.Size = UDim2.new(0, 250, 1, 0)
    self.TitleContainer.BackgroundTransparency = 1
    self.TitleContainer.Parent = self.TopBar
    
    if IconId then
        local Icon = Instance.new("ImageLabel")
        Icon.Name = "HubIcon"
        Icon.Size = UDim2.new(0, 36, 0, 36)
        Icon.Position = UDim2.new(0, 15, 0.5, -18)
        Icon.BackgroundTransparency = 1
        Icon.Image = IconId
        Icon.ImageColor3 = HI.Themes[HI.Config.Theme].Accent
        Icon.Parent = self.TitleContainer
    end
    
    local HubTitle = Instance.new("TextLabel")
    HubTitle.Name = "HubTitle"
    HubTitle.Size = UDim2.new(1, -60, 1, 0)
    HubTitle.Position = UDim2.new(0, IconId and 65 or 15, 0, 0)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = Title or "PREMIUM HUB"
    HubTitle.TextColor3 = HI.Themes[HI.Config.Theme].Text
    HubTitle.Font = Enum.Font.GothamBold
    HubTitle.TextSize = 20
    HubTitle.TextXAlignment = Enum.TextXAlignment.Left
    HubTitle.TextYAlignment = Enum.TextYAlignment.Center
    HubTitle.Parent = self.TitleContainer
    
    -- Top Middle: Search Bar
    self.SearchContainer = Instance.new("Frame")
    self.SearchContainer.Name = "SearchContainer"
    self.SearchContainer.Size = UDim2.new(0, 300, 0, 36)
    self.SearchContainer.Position = UDim2.new(0.5, -150, 0.5, -18)
    self.SearchContainer.BackgroundTransparency = 1
    self.SearchContainer.Parent = self.TopBar
    
    local SearchFrame = CreateRoundedFrame(self.SearchContainer, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0))
    SearchFrame.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    SearchFrame.BorderSizePixel = 0
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Name = "SearchIcon"
    SearchIcon.Size = UDim2.new(0, 20, 0, 20)
    SearchIcon.Position = UDim2.new(0, 10, 0.5, -10)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = HI.Icons.Search
    SearchIcon.ImageColor3 = HI.Themes[HI.Config.Theme].SubText
    SearchIcon.Parent = SearchFrame
    
    self.SearchBox = Instance.new("TextBox")
    self.SearchBox.Name = "SearchBox"
    self.SearchBox.Size = UDim2.new(1, -45, 1, 0)
    self.SearchBox.Position = UDim2.new(0, 40, 0, 0)
    self.SearchBox.BackgroundTransparency = 1
    self.SearchBox.Text = ""
    self.SearchBox.PlaceholderText = "Search settings..."
    self.SearchBox.PlaceholderColor3 = HI.Themes[HI.Config.Theme].SubText
    self.SearchBox.TextColor3 = HI.Themes[HI.Config.Theme].Text
    self.SearchBox.Font = HI.Config.Font
    self.SearchBox.TextSize = HI.Config.TextSize
    self.SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    self.SearchBox.ClearTextOnFocus = false
    self.SearchBox.Parent = SearchFrame
    
    -- Top Right: Control Buttons
    self.ControlContainer = Instance.new("Frame")
    self.ControlContainer.Name = "ControlContainer"
    self.ControlContainer.Size = UDim2.new(0, 100, 1, 0)
    self.ControlContainer.Position = UDim2.new(1, -100, 0, 0)
    self.ControlContainer.BackgroundTransparency = 1
    self.ControlContainer.Parent = self.TopBar
    
    -- Minimize Button
    self.MinimizeButton = Instance.new("ImageButton")
    self.MinimizeButton.Name = "MinimizeButton"
    self.MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    self.MinimizeButton.Position = UDim2.new(0, 10, 0.5, -15)
    self.MinimizeButton.BackgroundTransparency = 1
    self.MinimizeButton.Image = HI.Icons.Minimize
    self.MinimizeButton.ImageColor3 = HI.Themes[HI.Config.Theme].SubText
    self.MinimizeButton.Parent = self.ControlContainer
    
    -- Close Button
    self.CloseButton = Instance.new("ImageButton")
    self.CloseButton.Name = "CloseButton"
    self.CloseButton.Size = UDim2.new(0, 30, 0, 30)
    self.CloseButton.Position = UDim2.new(0, 50, 0.5, -15)
    self.CloseButton.BackgroundTransparency = 1
    self.CloseButton.Image = HI.Icons.Close
    self.CloseButton.ImageColor3 = HI.Themes[HI.Config.Theme].SubText
    self.CloseButton.Parent = self.ControlContainer
    
    -- MAIN CONTENT AREA
    self.ContentArea = Instance.new("Frame")
    self.ContentArea.Name = "ContentArea"
    self.ContentArea.Size = UDim2.new(1, 0, 1, -60)
    self.ContentArea.Position = UDim2.new(0, 0, 0, 60)
    self.ContentArea.BackgroundTransparency = 1
    self.ContentArea.Parent = self.MainWindow
    
    -- LEFT SIDE: Tab Navigation
    self.TabNavigation = CreateRoundedFrame(self.ContentArea, UDim2.new(0, 220, 1, -20), UDim2.new(0, 10, 0, 10))
    self.TabNavigation.BackgroundColor3 = HI.Themes[HI.Config.Theme].Secondary
    self.TabNavigation.BorderSizePixel = 0
    
    -- Tab List
    self.TabList = Instance.new("ScrollingFrame")
    self.TabList.Name = "TabList"
    self.TabList.Size = UDim2.new(1, -20, 1, -20)
    self.TabList.Position = UDim2.new(0, 10, 0, 10)
    self.TabList.BackgroundTransparency = 1
    self.TabList.BorderSizePixel = 0
    self.TabList.ScrollBarThickness = 4
    self.TabList.ScrollBarImageColor3 = HI.Themes[HI.Config.Theme].Border
    self.TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.TabList.Parent = self.TabNavigation
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Padding = UDim.new(0, 8)
    TabListLayout.Parent = self.TabList
    
    -- RIGHT SIDE: Content Display
    self.ContentDisplay = CreateRoundedFrame(self.ContentArea, UDim2.new(1, -250, 1, -20), UDim2.new(0, 240, 0, 10))
    self.ContentDisplay.BackgroundColor3 = HI.Themes[HI.Config.Theme].Secondary
    self.ContentDisplay.BorderSizePixel = 0
    
    -- Content Scroller
    self.ContentScroller = Instance.new("ScrollingFrame")
    self.ContentScroller.Name = "ContentScroller"
    self.ContentScroller.Size = UDim2.new(1, -20, 1, -20)
    self.ContentScroller.Position = UDim2.new(0, 10, 0, 10)
    self.ContentScroller.BackgroundTransparency = 1
    self.ContentScroller.BorderSizePixel = 0
    self.ContentScroller.ScrollBarThickness = 4
    self.ContentScroller.ScrollBarImageColor3 = HI.Themes[HI.Config.Theme].Border
    self.ContentScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.ContentScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.ContentScroller.Parent = self.ContentDisplay
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 20)
    ContentLayout.Parent = self.ContentScroller
    
    -- State Management
    self.Tabs = {}
    self.CurrentTab = nil
    self.IsMinimized = false
    self.OriginalSize = HI.Config.WindowSize
    self.MinimizedSize = UDim2.new(0, 300, 0, 60)
    
    -- Button Events
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    self.MinimizeButton.MouseEnter:Connect(function()
        Tween(self.MinimizeButton, {ImageColor3 = HI.Themes[HI.Config.Theme].Warning})
    end)
    
    self.MinimizeButton.MouseLeave:Connect(function()
        Tween(self.MinimizeButton, {ImageColor3 = HI.Themes[HI.Config.Theme].SubText})
    end)
    
    self.CloseButton.MouseEnter:Connect(function()
        Tween(self.CloseButton, {ImageColor3 = HI.Themes[HI.Config.Theme].Danger})
    end)
    
    self.CloseButton.MouseLeave:Connect(function()
        Tween(self.CloseButton, {ImageColor3 = HI.Themes[HI.Config.Theme].SubText})
    end)
    
    -- Search functionality
    self.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        self:SearchSettings(self.SearchBox.Text)
    end)
    
    return self
end

-- Make Window Draggable
function HI:Draggify(Frame)
    local Dragging, DragInput, DragStart, StartPos
    
    local function Update(Input)
        local Delta = Input.Position - DragStart
        Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
    
    Frame.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = Input.Position
            StartPos = Frame.Position
            
            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    Frame.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = Input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            Update(Input)
        end
    end)
end

-- Toggle Minimize/Maximize
function HI:ToggleMinimize()
    self.IsMinimized = not self.IsMinimized
    
    if self.IsMinimized then
        -- Hide content, show only top bar
        Tween(self.MainWindow, {Size = self.MinimizedSize})
        self.ContentArea.Visible = false
        self.MinimizeButton.Image = "rbxassetid://10734928599" -- Restore icon
    else
        -- Show full window
        Tween(self.MainWindow, {Size = self.OriginalSize})
        self.ContentArea.Visible = true
        self.MinimizeButton.Image = HI.Icons.Minimize
    end
end

-- Toggle UI Visibility
function HI:Toggle()
    self.ScreenGui.Enabled = not self.ScreenGui.Enabled
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = self.ScreenGui.Enabled
    end
end

-- Update Theme
function HI:UpdateTheme()
    local Theme = HI.Themes[HI.Config.Theme]
    
    -- Update main window
    Tween(self.MainWindow, {BackgroundColor3 = Theme.Main})
    Tween(self.TopBar, {BackgroundColor3 = Theme.Secondary})
    Tween(self.TabNavigation, {BackgroundColor3 = Theme.Secondary})
    Tween(self.ContentDisplay, {BackgroundColor3 = Theme.Secondary})
    
    -- Update text colors
    local function UpdateTextColor(Parent)
        for _, Child in pairs(Parent:GetDescendants()) do
            if Child:IsA("TextLabel") or Child:IsA("TextBox") then
                if Child.Name == "HubTitle" then
                    Tween(Child, {TextColor3 = Theme.Text})
                elseif Child.Name == "SearchBox" then
                    Tween(Child, {TextColor3 = Theme.Text, PlaceholderColor3 = Theme.SubText})
                else
                    Tween(Child, {TextColor3 = Theme.Text})
                end
            elseif Child:IsA("ImageLabel") or Child:IsA("ImageButton") then
                if Child.Name == "HubIcon" then
                    Tween(Child, {ImageColor3 = Theme.Accent})
                elseif Child.Name == "SearchIcon" then
                    Tween(Child, {ImageColor3 = Theme.SubText})
                elseif Child.Name == "MinimizeButton" or Child.Name == "CloseButton" then
                    Tween(Child, {ImageColor3 = Theme.SubText})
                elseif Child.Name:find("TabIcon") then
                    Tween(Child, {ImageColor3 = Theme.SubText})
                end
            end
        end
    end
    
    UpdateTextColor(self.MainWindow)
end

-- Search Settings
function HI:SearchSettings(Query)
    Query = string.lower(Query)
    
    for TabName, Tab in pairs(self.Tabs) do
        local TabVisible = false
        
        -- Check if tab name matches
        if string.find(string.lower(TabName), Query, 1, true) then
            TabVisible = true
        else
            -- Check sections in tab
            for SectionName, Section in pairs(Tab.Sections or {}) do
                if string.find(string.lower(SectionName), Query, 1, true) then
                    TabVisible = true
                    break
                end
            end
        end
        
        Tab.Button.Visible = TabVisible or Query == ""
    end
end

-- Create Tab (with optional icon)
function HI:NewTab(TabName, IconId)
    local Tab = {}
    Tab.Name = TabName
    Tab.Sections = {}
    
    -- Tab Button
    Tab.Button = Instance.new("TextButton")
    Tab.Button.Name = TabName .. "Tab"
    Tab.Button.Size = UDim2.new(1, 0, 0, 50)
    Tab.Button.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    Tab.Button.BorderSizePixel = 0
    Tab.Button.Text = ""
    Tab.Button.AutoButtonColor = false
    Tab.Button.Parent = self.TabList
    
    if HI.Config.RoundedCorners then
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = Tab.Button
    end
    
    -- Tab Icon
    if HI.Config.UseIcons and IconId then
        Tab.Icon = Instance.new("ImageLabel")
        Tab.Icon.Name = "TabIcon"
        Tab.Icon.Size = UDim2.new(0, 24, 0, 24)
        Tab.Icon.Position = UDim2.new(0, 15, 0.5, -12)
        Tab.Icon.BackgroundTransparency = 1
        Tab.Icon.Image = IconId
        Tab.Icon.ImageColor3 = HI.Themes[HI.Config.Theme].SubText
        Tab.Icon.Parent = Tab.Button
    end
    
    -- Tab Label
    Tab.Label = Instance.new("TextLabel")
    Tab.Label.Name = "TabLabel"
    Tab.Label.Size = UDim2.new(1, HI.Config.UseIcons and IconId and -55 or -30, 1, 0)
    Tab.Label.Position = UDim2.new(0, HI.Config.UseIcons and IconId and 55 : 15, 0, 0)
    Tab.Label.BackgroundTransparency = 1
    Tab.Label.Text = TabName
    Tab.Label.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Tab.Label.Font = HI.Config.Font
    Tab.Label.TextSize = HI.Config.TextSize
    Tab.Label.TextXAlignment = Enum.TextXAlignment.Left
    Tab.Label.TextYAlignment = Enum.TextYAlignment.Center
    Tab.Label.Parent = Tab.Button
    
    -- Tab Content
    Tab.Content = Instance.new("Frame")
    Tab.Content.Name = TabName .. "Content"
    Tab.Content.Size = UDim2.new(1, 0, 1, 0)
    Tab.Content.BackgroundTransparency = 1
    Tab.Content.Visible = false
    Tab.Content.Parent = self.ContentScroller
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 20)
    ContentLayout.Parent = Tab.Content
    
    -- Tab Button Events
    Tab.Button.MouseButton1Click:Connect(function()
        self:SwitchTab(Tab)
    end)
    
    Tab.Button.MouseEnter:Connect(function()
        if Tab ~= self.CurrentTab then
            Tween(Tab.Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Border})
            if Tab.Icon then
                Tween(Tab.Icon, {ImageColor3 = HI.Themes[HI.Config.Theme].Text})
            end
        end
    end)
    
    Tab.Button.MouseLeave:Connect(function()
        if Tab ~= self.CurrentTab then
            Tween(Tab.Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary})
            if Tab.Icon then
                Tween(Tab.Icon, {ImageColor3 = HI.Themes[HI.Config.Theme].SubText})
            end
        end
    end)
    
    self.Tabs[TabName] = Tab
    
    -- Set as current if first tab
    if not self.CurrentTab then
        self:SwitchTab(Tab)
    end
    
    return Tab
end

-- Switch Tab
function HI:SwitchTab(Tab)
    -- Deactivate all tabs
    for Name, T in pairs(self.Tabs) do
        T.Content.Visible = false
        Tween(T.Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary})
        if T.Icon then
            Tween(T.Icon, {ImageColor3 = HI.Themes[HI.Config.Theme].SubText})
        end
        Tween(T.Label, {TextColor3 = HI.Themes[HI.Config.Theme].Text})
    end
    
    -- Activate selected tab
    Tab.Content.Visible = true
    Tween(Tab.Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Accent})
    if Tab.Icon then
        Tween(Tab.Icon, {ImageColor3 = HI.Themes[HI.Config.Theme].Text})
    end
    Tween(Tab.Label, {TextColor3 = HI.Themes[HI.Config.Theme].Text})
    
    self.CurrentTab = Tab
end

-- Create Section
function HI:NewSection(Tab, SectionName)
    local Section = {}
    
    Section.Frame = Instance.new("Frame")
    Section.Frame.Name = SectionName .. "Section"
    Section.Frame.Size = UDim2.new(1, 0, 0, 60)
    Section.Frame.BackgroundTransparency = 1
    Section.Frame.Parent = Tab.Content
    
    -- Section Title
    Section.Title = Instance.new("TextLabel")
    Section.Title.Name = "Title"
    Section.Title.Size = UDim2.new(1, 0, 0, 30)
    Section.Title.BackgroundTransparency = 1
    Section.Title.Text = SectionName
    Section.Title.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Section.Title.Font = Enum.Font.GothamSemibold
    Section.Title.TextSize = HI.Config.TitleSize
    Section.Title.TextXAlignment = Enum.TextXAlignment.Left
    Section.Title.Parent = Section.Frame
    
    -- Section Content
    Section.Content = Instance.new("Frame")
    Section.Content.Name = "Content"
    Section.Content.Size = UDim2.new(1, 0, 0, 0)
    Section.Content.Position = UDim2.new(0, 0, 0, 35)
    Section.Content.BackgroundTransparency = 1
    Section.Content.Parent = Section.Frame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 12)
    ContentLayout.Parent = Section.Content
    
    -- Auto-size section
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Section.Content.Size = UDim2.new(1, 0, 0, ContentLayout.AbsoluteContentSize.Y)
        Section.Frame.Size = UDim2.new(1, 0, 0, 35 + ContentLayout.AbsoluteContentSize.Y)
    end)
    
    Tab.Sections[SectionName] = Section
    return Section
end

-- Enhanced Slider with 4K styling
function HI:NewSlider(Section, Name, Min, Max, Default, Decimals, Callback)
    local Slider = {}
    Slider.Value = Default or Min
    Decimals = Decimals or 1
    
    local Container = Instance.new("Frame")
    Container.Name = Name .. "Slider"
    Container.Size = UDim2.new(1, 0, 0, 70)
    Container.BackgroundTransparency = 1
    Container.Parent = Section.Content
    
    -- Label
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, 0, 0, 25)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Label.Font = HI.Config.Font
    Label.TextSize = HI.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    -- Value Display (like "10.6/20")
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Name = "ValueLabel"
    ValueLabel.Size = UDim2.new(0, 100, 0, 25)
    ValueLabel.Position = UDim2.new(1, -100, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = Round(Slider.Value, Decimals) .. "/" .. Max
    ValueLabel.TextColor3 = HI.Themes[HI.Config.Theme].SubText
    ValueLabel.Font = Enum.Font.GothamMono
    ValueLabel.TextSize = HI.Config.TextSize
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Container
    
    -- Slider Container
    local SliderContainer = CreateRoundedFrame(Container, UDim2.new(1, 0, 0, 8), UDim2.new(0, 0, 0, 35))
    SliderContainer.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    SliderContainer.BorderSizePixel = 0
    
    -- Slider Fill
    local SliderFill = CreateRoundedFrame(SliderContainer, UDim2.new((Slider.Value - Min) / (Max - Min), 0, 1, 0), UDim2.new(0, 0, 0, 0))
    SliderFill.BackgroundColor3 = HI.Themes[HI.Config.Theme].Accent
    SliderFill.BorderSizePixel = 0
    
    -- Slider Button
    local SliderButton = CreateRoundedFrame(SliderContainer, UDim2.new(0, 20, 0, 20), UDim2.new((Slider.Value - Min) / (Max - Min), -10, 0.5, -10))
    SliderButton.BackgroundColor3 = HI.Themes[HI.Config.Theme].Text
    SliderButton.BorderSizePixel = 0
    SliderButton.ZIndex = 2
    
    local function UpdateSlider(Value)
        Value = math.clamp(Value, Min, Max)
        Slider.Value = Value
        local Ratio = (Value - Min) / (Max - Min)
        
        ValueLabel.Text = Round(Value, Decimals) .. "/" .. Max
        Tween(SliderFill, {Size = UDim2.new(Ratio, 0, 1, 0)})
        Tween(SliderButton, {Position = UDim2.new(Ratio, -10, 0.5, -10)})
        
        if Callback then
            Callback(Value)
        end
    end
    
    local Dragging = false
    
    local function StartDrag()
        Dragging = true
        
        local MoveConnection = game:GetService("UserInputService").InputChanged:Connect(function(Input)
            if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                local XPos = math.clamp(Input.Position.X - SliderContainer.AbsolutePosition.X, 0, SliderContainer.AbsoluteSize.X)
                local Ratio = XPos / SliderContainer.AbsoluteSize.X
                local Value = Min + (Max - Min) * Ratio
                UpdateSlider(Value)
            end
        end)
        
        local EndedConnection
        EndedConnection = game:GetService("UserInputService").InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = false
                MoveConnection:Disconnect()
                EndedConnection:Disconnect()
            end
        end)
    end
    
    SliderButton.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            StartDrag()
        end
    end)
    
    SliderContainer.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            local XPos = math.clamp(Input.Position.X - SliderContainer.AbsolutePosition.X, 0, SliderContainer.AbsoluteSize.X)
            local Ratio = XPos / SliderContainer.AbsoluteSize.X
            local Value = Min + (Max - Min) * Ratio
            UpdateSlider(Value)
            StartDrag()
        end
    end)
    
    UpdateSlider(Slider.Value)
    return Slider
end

-- Premium Toggle Switch
function HI:NewToggle(Section, Name, Default, Callback)
    local Toggle = {}
    Toggle.Value = Default or false
    
    local Container = Instance.new("Frame")
    Container.Name = Name .. "Toggle"
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundTransparency = 1
    Container.Parent = Section.Content
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Label.Font = HI.Config.Font
    Label.TextSize = HI.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    -- Toggle Container
    local ToggleContainer = CreateRoundedFrame(Container, UDim2.new(0, 50, 0, 25), UDim2.new(1, -55, 0.5, -12.5))
    ToggleContainer.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    ToggleContainer.BorderSizePixel = 0
    
    -- Toggle Circle
    local ToggleCircle = CreateRoundedFrame(ToggleContainer, UDim2.new(0, 20, 0, 20), Toggle.Value and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10))
    ToggleCircle.BackgroundColor3 = HI.Themes[HI.Config.Theme].Text
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.ZIndex = 2
    
    local function UpdateToggle()
        if Toggle.Value then
            Tween(ToggleContainer, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Success})
            Tween(ToggleCircle, {Position = UDim2.new(1, -22, 0.5, -10)})
        else
            Tween(ToggleContainer, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary})
            Tween(ToggleCircle, {Position = UDim2.new(0, 2, 0.5, -10)})
        end
    end
    
    UpdateToggle()
    
    Container.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Toggle.Value = not Toggle.Value
            UpdateToggle()
            
            if Callback then
                Callback(Toggle.Value)
            end
        end
    end)
    
    return Toggle
end

-- Premium Dropdown
function HI:NewDropdown(Section, Name, Options, Default, Callback)
    local Dropdown = {}
    Dropdown.Value = Default or Options[1]
    Dropdown.Open = false
    
    local Container = Instance.new("Frame")
    Container.Name = Name .. "Dropdown"
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true
    Container.Parent = Section.Content
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Label.Font = HI.Config.Font
    Label.TextSize = HI.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    -- Dropdown Button
    local DropdownButton = CreateRoundedFrame(Container, UDim2.new(0.45, 0, 1, 0), UDim2.new(0.5, 0, 0, 0))
    DropdownButton.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    DropdownButton.BorderSizePixel = 0
    
    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Name = "ButtonLabel"
    ButtonLabel.Size = UDim2.new(1, -30, 1, 0)
    ButtonLabel.Position = UDim2.new(0, 10, 0, 0)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Text = Dropdown.Value
    ButtonLabel.TextColor3 = HI.Themes[HI.Config.Theme].SubText
    ButtonLabel.Font = HI.Config.Font
    ButtonLabel.TextSize = HI.Config.TextSize
    ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
    ButtonLabel.Parent = DropdownButton
    
    local DropdownArrow = Instance.new("ImageLabel")
    DropdownArrow.Name = "Arrow"
    DropdownArrow.Size = UDim2.new(0, 15, 0, 15)
    DropdownArrow.Position = UDim2.new(1, -20, 0.5, -7.5)
    DropdownArrow.BackgroundTransparency = 1
    DropdownArrow.Image = "rbxassetid://10723359580" -- Down arrow icon
    DropdownArrow.ImageColor3 = HI.Themes[HI.Config.Theme].SubText
    DropdownArrow.Rotation = 0
    DropdownArrow.Parent = DropdownButton
    
    -- Options Frame
    local OptionsFrame = CreateRoundedFrame(Container, UDim2.new(0.45, 0, 0, 0), UDim2.new(0.5, 0, 1, 5))
    OptionsFrame.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
    OptionsFrame.BorderSizePixel = 0
    OptionsFrame.Visible = false
    OptionsFrame.ZIndex = 10
    
    local OptionsLayout = Instance.new("UIListLayout")
    OptionsLayout.Padding = UDim.new(0, 2)
    OptionsLayout.Parent = OptionsFrame
    
    -- Create Options
    for _, Option in ipairs(Options) do
        local OptionButton = CreateRoundedFrame(OptionsFrame, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0))
        OptionButton.BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary
        OptionButton.BorderSizePixel = 0
        OptionButton.ZIndex = 11
        
        local OptionLabel = Instance.new("TextLabel")
        OptionLabel.Name = "Label"
        OptionLabel.Size = UDim2.new(1, -20, 1, 0)
        OptionLabel.Position = UDim2.new(0, 10, 0, 0)
        OptionLabel.BackgroundTransparency = 1
        OptionLabel.Text = Option
        OptionLabel.TextColor3 = HI.Themes[HI.Config.Theme].SubText
        OptionLabel.Font = HI.Config.Font
        OptionLabel.TextSize = HI.Config.TextSize - 1
        OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        OptionLabel.ZIndex = 12
        OptionLabel.Parent = OptionButton
        
        OptionButton.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dropdown.Value = Option
                ButtonLabel.Text = Option
                Container.Size = UDim2.new(1, 0, 0, 40)
                Tween(OptionsFrame, {Size = UDim2.new(0.45, 0, 0, 0)})
                Tween(DropdownArrow, {Rotation = 0})
                Dropdown.Open = false
                
                if Callback then
                    Callback(Option)
                end
            end
        end)
        
        OptionButton.MouseEnter:Connect(function()
            Tween(OptionButton, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Border})
            Tween(OptionLabel, {TextColor3 = HI.Themes[HI.Config.Theme].Text})
        end)
        
        OptionButton.MouseLeave:Connect(function()
            Tween(OptionButton, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Tertiary})
            Tween(OptionLabel, {TextColor3 = HI.Themes[HI.Config.Theme].SubText})
        end)
    end
    
    -- Toggle Dropdown
    DropdownButton.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dropdown.Open = not Dropdown.Open
            
            if Dropdown.Open then
                Container.Size = UDim2.new(1, 0, 0, 45 + #Options * 32)
                OptionsFrame.Visible = true
                OptionsFrame.Size = UDim2.new(0.45, 0, 0, #Options * 32)
                Tween(DropdownArrow, {Rotation = 180})
            else
                Container.Size = UDim2.new(1, 0, 0, 40)
                Tween(OptionsFrame, {Size = UDim2.new(0.45, 0, 0, 0)})
                Tween(DropdownArrow, {Rotation = 0})
            end
        end
    end)
    
    return Dropdown
end

-- Premium Button
function HI:NewButton(Section, Name, Callback)
    local Button = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0))
    Button.BackgroundColor3 = HI.Themes[HI.Config.Theme].Accent
    Button.BorderSizePixel = 0
    
    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Name = "Label"
    ButtonLabel.Size = UDim2.new(1, 0, 1, 0)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Text = Name
    ButtonLabel.TextColor3 = HI.Themes[HI.Config.Theme].Text
    ButtonLabel.Font = Enum.Font.GothamSemibold
    ButtonLabel.TextSize = HI.Config.TextSize
    ButtonLabel.TextYAlignment = Enum.TextYAlignment.Center
    ButtonLabel.Parent = Button
    
    Button.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            if Callback then
                Callback()
            end
        end
    end)
    
    Button.MouseEnter:Connect(function()
        Tween(Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Accent:Lerp(Color3.new(1, 1, 1), 0.15)})
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {BackgroundColor3 = HI.Themes[HI.Config.Theme].Accent})
    end)
    
    return Button
end

-- Color Picker (for theme customization)
function HI:NewColorPicker(Section, Name, DefaultColor, Callback)
    local ColorPicker = {}
    ColorPicker.Value = DefaultColor or HI.Themes[HI.Config.Theme].Accent
    
    local Container = Instance.new("Frame")
    Container.Name = Name .. "ColorPicker"
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundTransparency = 1
    Container.Parent = Section.Content
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[HI.Config.Theme].Text
    Label.Font = HI.Config.Font
    Label.TextSize = HI.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    -- Color Preview
    local ColorPreview = CreateRoundedFrame(Container, UDim2.new(0, 60, 0, 30), UDim2.new(1, -65, 0.5, -15))
    ColorPreview.BackgroundColor3 = ColorPicker.Value
    ColorPreview.BorderSizePixel = 0
    
    -- Open Color Picker
    ColorPreview.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            -- Create color picker UI
            self:CreateColorPickerUI(ColorPicker.Value, function(NewColor)
                ColorPicker.Value = NewColor
                Tween(ColorPreview, {BackgroundColor3 = NewColor})
                if Callback then
                    Callback(NewColor)
                end
            end)
        end
    end)
    
    return ColorPicker
end

-- Create Color Picker UI
function HI:CreateColorPickerUI(DefaultColor, Callback)
    -- Create color picker overlay
    local ColorPickerOverlay = Instance.new("Frame")
    ColorPickerOverlay.Name = "ColorPickerOverlay"
    ColorPickerOverlay.Size = UDim2.new(1, 0, 1, 0)
    ColorPickerOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
    ColorPickerOverlay.BackgroundTransparency = 0.3
    ColorPickerOverlay.ZIndex = 1000
    ColorPickerOverlay.Parent = self.MainContainer
    
    local ColorPickerWindow = CreateRoundedFrame(ColorPickerOverlay, UDim2.new(0, 400, 0, 400), UDim2.new(0.5, -200, 0.5, -200))
    ColorPickerWindow.BackgroundColor3 = HI.Themes[HI.Config.Theme].Main
    ColorPickerWindow.ZIndex = 1001
    
    -- Close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Text = "×"
    CloseButton.TextColor3 = HI.Themes[HI.Config.Theme].Text
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 20
    CloseButton.ZIndex = 1002
    CloseButton.Parent = ColorPickerWindow
    
    CloseButton.MouseButton1Click:Connect(function()
        ColorPickerOverlay:Destroy()
    end)
end

-- Create Theme Settings Tab
function HI:CreateThemeSettings()
    local SettingsTab = self:NewTab("Settings", HI.Icons.Settings)
    
    -- Theme Selection
    local ThemeSection = self:NewSection(SettingsTab, "Theme Selection")
    
    for ThemeName, ThemeColors in pairs(HI.Themes) do
        local ThemeButton = self:NewButton(ThemeSection, ThemeName, function()
            HI.Config.Theme = ThemeName
            self:UpdateTheme()
        end)
    end
    
    -- Custom Colors
    local CustomSection = self:NewSection(SettingsTab, "Custom Colors")
    
    self:NewColorPicker(CustomSection, "Accent Color", HI.Themes[HI.Config.Theme].Accent, function(Color)
        HI.Themes[HI.Config.Theme].Accent = Color
        self:UpdateTheme()
    end)
    
    self:NewColorPicker(CustomSection, "Main Color", HI.Themes[HI.Config.Theme].Main, function(Color)
        HI.Themes[HI.Config.Theme].Main = Color
        self:UpdateTheme()
    end)
    
    self:NewColorPicker(CustomSection, "Text Color", HI.Themes[HI.Config.Theme].Text, function(Color)
        HI.Themes[HI.Config.Theme].Text = Color
        self:UpdateTheme()
    end)
    
    -- UI Settings
    local UISection = self:NewSection(SettingsTab, "UI Settings")
    
    self:NewToggle(UISection, "Use Icons", HI.Config.UseIcons, function(Value)
        HI.Config.UseIcons = Value
    end)
    
    self:NewToggle(UISection, "Rounded Corners", HI.Config.RoundedCorners, function(Value)
        HI.Config.RoundedCorners = Value
    end)
    
    self:NewToggle(UISection, "Blur Background", HI.Config.BlurBackground, function(Value)
        HI.Config.BlurBackground = Value
        if self.BackgroundBlur then
            self.BackgroundBlur.Enabled = Value
        end
    end)
end

-- Create Football Example UI (matching your image)
function HI:CreateFootballUI()
    -- Create tabs with icons
    local CatchingTab = self:NewTab("Catching", HI.Icons.Catching)
    local PhysicsTab = self:NewTab("Physics", HI.Icons.Physics)
    local UISettingsTab = self:NewTab("UI Settings", HI.Icons.Visual)
    
    -- Catching Tab
    local MagsSection = self:NewSection(CatchingTab, "Mags")
    self:NewSlider(MagsSection, "Range", 0, 20, 10.6, 1, function(Value)
        print("Range:", Value)
    end)
    
    local SpeedSection = self:NewSection(CatchingTab, "Speed")
    self:NewSlider(SpeedSection, "Speed Value", 0, 1.2, 1.2, 1, function(Value)
        print("Speed Value:", Value)
    end)
    
    self:NewLabel(SpeedSection, "CFrame Speed")
    
    local MagTypeSection = self:NewSection(CatchingTab, "Mag Type")
    self:NewDropdown(MagTypeSection, "Type", {"Normal", "Blatant", "FTI"}, "Blatant", function(Option)
        print("Mag Type:", Option)
    end)
    
    -- Physics Tab
    local PullSection = self:NewSection(PhysicsTab, "Pull")
    self:NewSlider(PullSection, "Pull Vector", 0, 3, 1.5, 1, function(Value)
        print("Pull Vector:", Value)
    end)
    
    self:NewSlider(PullSection, "Pull Vector Radius", 0, 25, 14.9, 1, function(Value)
        print("Pull Vector Radius:", Value)
    end)
    
    -- UI Settings Tab
    local AutoCatchSection = self:NewSection(UISettingsTab, "Auto Catch")
    self:NewSlider(AutoCatchSection, "Auto Catch Radius", 0, 25, 21.3, 1, function(Value)
        print("Auto Catch Radius:", Value)
    end)
    
    local FootballSection = self:NewSection(UISettingsTab, "Football")
    self:NewLabel(FootballSection, "Ball Path")
    
    -- Add theme settings
    self:CreateThemeSettings()
    
    return self
end

-- Show UI
function HI:Show()
    self.ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = true
    end
    return self
end

-- Hide UI
function HI:Hide()
    self.ScreenGui.Enabled = false
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = false
    end
    return self
end

-- Bind to key
function HI:BindToKey(KeyCode)
    game:GetService("UserInputService").InputBegan:Connect(function(Input, Processed)
        if not Processed and Input.KeyCode == KeyCode then
            self:Toggle()
        end
    end)
end

return HI
