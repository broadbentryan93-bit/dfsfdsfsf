-- HI Library v5.0 - Modern Professional UI Library
-- Premium Design with Smooth Animations

local HI = {}
HI.__index = HI

-- Modern Fonts
HI.Fonts = {
    Title = Enum.Font.GothamBold,
    Header = Enum.Font.GothamSemibold,
    Body = Enum.Font.Gotham,
    Monospace = Enum.Font.Code,
    Light = Enum.Font.SourceSansLight,
    Medium = Enum.Font.SourceSans
}

-- Modern Icon Set (Roblox Image IDs)
HI.Icons = {
    Home = "rbxassetid://6031280882", -- Home icon
    Settings = "rbxassetid://6031280885", -- Settings gear
    Search = "rbxassetid://6031280887", -- Search icon
    Minimize = "rbxassetid://6031280879", -- Minimize icon
    Close = "rbxassetid://6031280877", -- Close icon
    Expand = "rbxassetid://6031280881", -- Expand icon
    Game = "rbxassetid://6031280883", -- Game controller
    Visual = "rbxassetid://6031280889", -- Eye icon
    Player = "rbxassetid://6031280884", -- Player icon
    World = "rbxassetid://6031280890", -- Globe icon
    Script = "rbxassetid://6031280886", -- Code icon
    Star = "rbxassetid://6031280888", -- Star icon
    Palette = "rbxassetid://6031280880", -- Palette icon
    Info = "rbxassetid://6031280878", -- Info icon
    ChevronDown = "rbxassetid://6031091004", -- Chevron down
    ChevronRight = "rbxassetid://6031091003" -- Chevron right
}

-- Modern Color Themes
HI.Themes = {
    Midnight = {
        Main = Color3.fromRGB(18, 18, 24),
        Secondary = Color3.fromRGB(28, 28, 36),
        Tertiary = Color3.fromRGB(38, 38, 48),
        Accent = Color3.fromRGB(0, 162, 255),
        Text = Color3.fromRGB(245, 247, 250),
        SubText = Color3.fromRGB(170, 178, 190),
        Border = Color3.fromRGB(50, 56, 70),
        Success = Color3.fromRGB(52, 199, 89),
        Warning = Color3.fromRGB(255, 149, 0),
        Danger = Color3.fromRGB(255, 59, 48),
        Dark = Color3.fromRGB(10, 10, 15),
        Light = Color3.fromRGB(240, 242, 245),
        Glass = Color3.fromRGB(30, 30, 40),
        GlassBlur = 0.95
    },
    Ocean = {
        Main = Color3.fromRGB(15, 25, 40),
        Secondary = Color3.fromRGB(25, 35, 55),
        Tertiary = Color3.fromRGB(35, 45, 70),
        Accent = Color3.fromRGB(64, 156, 255),
        Text = Color3.fromRGB(230, 235, 245),
        SubText = Color3.fromRGB(150, 165, 190),
        Border = Color3.fromRGB(45, 60, 85),
        Success = Color3.fromRGB(48, 209, 88),
        Warning = Color3.fromRGB(255, 159, 10),
        Danger = Color3.fromRGB(255, 69, 58),
        Dark = Color3.fromRGB(5, 15, 30),
        Light = Color3.fromRGB(225, 230, 240),
        Glass = Color3.fromRGB(25, 35, 55),
        GlassBlur = 0.92
    },
    Eclipse = {
        Main = Color3.fromRGB(25, 20, 35),
        Secondary = Color3.fromRGB(35, 30, 45),
        Tertiary = Color3.fromRGB(45, 40, 60),
        Accent = Color3.fromRGB(175, 82, 222),
        Text = Color3.fromRGB(240, 235, 245),
        SubText = Color3.fromRGB(180, 170, 195),
        Border = Color3.fromRGB(55, 50, 75),
        Success = Color3.fromRGB(123, 222, 82),
        Warning = Color3.fromRGB(255, 184, 76),
        Danger = Color3.fromRGB(255, 82, 123),
        Dark = Color3.fromRGB(15, 10, 25),
        Light = Color3.fromRGB(235, 230, 240),
        Glass = Color3.fromRGB(35, 30, 50),
        GlassBlur = 0.94
    },
    Modern = {
        Main = Color3.fromRGB(28, 28, 30),
        Secondary = Color3.fromRGB(44, 44, 46),
        Tertiary = Color3.fromRGB(58, 58, 60),
        Accent = Color3.fromRGB(10, 132, 255),
        Text = Color3.fromRGB(242, 242, 247),
        SubText = Color3.fromRGB(142, 142, 147),
        Border = Color3.fromRGB(72, 72, 74),
        Success = Color3.fromRGB(48, 209, 88),
        Warning = Color3.fromRGB(255, 214, 10),
        Danger = Color3.fromRGB(255, 55, 95),
        Dark = Color3.fromRGB(18, 18, 20),
        Light = Color3.fromRGB(229, 229, 234),
        Glass = Color3.fromRGB(44, 44, 46),
        GlassBlur = 0.9
    }
}

-- Default Configuration
HI.DefaultConfig = {
    Theme = "Midnight",
    Font = HI.Fonts.Body,
    TitleFont = HI.Fonts.Title,
    HeaderFont = HI.Fonts.Header,
    TextSize = 14,
    TitleSize = 22,
    HeaderSize = 18,
    BorderSize = 0,
    AnimationSpeed = 0.15,
    WindowSize = UDim2.new(0, 920, 0, 680),
    UseIcons = true,
    BlurBackground = true,
    RoundedCorners = true,
    SearchEnabled = true,
    Draggable = true,
    Watermark = "HI Library v5.0",
    GlassEffect = true,
    ShadowEnabled = true,
    CornerRadius = 12,
    CompactMode = false,
    GradientAccents = true
}

-- Utility Functions
local function Tween(Object, Properties, Duration, EasingStyle)
    Duration = Duration or HI.DefaultConfig.AnimationSpeed
    EasingStyle = EasingStyle or Enum.EasingStyle.Quad
    local TweenService = game:GetService("TweenService")
    local TweenInfo = TweenInfo.new(Duration, EasingStyle, Enum.EasingDirection.Out)
    local Tween = TweenService:Create(Object, TweenInfo, Properties)
    Tween:Play()
    return Tween
end

local function Round(Number, DecimalPlaces)
    DecimalPlaces = DecimalPlaces or 0
    local Multiplier = 10 ^ DecimalPlaces
    return math.floor(Number * Multiplier + 0.5) / Multiplier
end

local function CreateRoundedFrame(Parent, Size, Position, CornerRadius)
    local Frame = Instance.new("Frame")
    Frame.Size = Size
    Frame.Position = Position
    Frame.BackgroundTransparency = 0
    Frame.ClipsDescendants = true
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, CornerRadius or HI.DefaultConfig.CornerRadius)
    UICorner.Parent = Frame
    
    Frame.Parent = Parent
    return Frame
end

local function AddShadow(Frame)
    if not HI.DefaultConfig.ShadowEnabled then return end
    
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(1, 20, 1, 20)
    Shadow.Position = UDim2.new(0, -10, 0, -10)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://5554236805"
    Shadow.ImageColor3 = Color3.new(0, 0, 0)
    Shadow.ImageTransparency = 0.8
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.ZIndex = -1
    Shadow.Parent = Frame
    
    return Shadow
end

local function CreateGlassFrame(Parent, Size, Position, Transparency, CornerRadius)
    local Frame = CreateRoundedFrame(Parent, Size, Position, CornerRadius)
    Frame.BackgroundTransparency = Transparency or 0.1
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = HI.Themes[HI.DefaultConfig.Theme].Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.3
    UIStroke.Parent = Frame
    
    return Frame
end

-- Main Library Class
function HI.new(Title, Config, IconId)
    local self = setmetatable({}, HI)
    
    -- Merge config with defaults
    self.Config = {}
    for k, v in pairs(HI.DefaultConfig) do
        self.Config[k] = Config and Config[k] or v
    end
    if Config then
        for k, v in pairs(Config) do
            self.Config[k] = v
        end
    end
    
    -- State
    self.Tabs = {}
    self.Sections = {}
    self.CurrentTab = nil
    self.IsMinimized = false
    self.OriginalSize = self.Config.WindowSize
    self.MinimizedSize = UDim2.new(0, 320, 0, 70)
    
    -- Create UI
    self:CreateUI(Title, IconId)
    
    return self
end

-- Create UI Elements
function HI:CreateUI(Title, IconId)
    -- ScreenGui
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "HILibrary"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.DisplayOrder = 1000
    self.ScreenGui.ResetOnSpawn = false
    
    -- Background Blur
    if self.Config.BlurBackground then
        self.BackgroundBlur = Instance.new("BlurEffect")
        self.BackgroundBlur.Size = 10
        self.BackgroundBlur.Parent = game:GetService("Lighting")
    end
    
    -- Main Container with Shadow
    self.MainContainer = Instance.new("Frame")
    self.MainContainer.Name = "MainContainer"
    self.MainContainer.Size = self.Config.WindowSize
    self.MainContainer.Position = UDim2.new(0.5, -self.Config.WindowSize.X.Offset/2, 0.5, -self.Config.WindowSize.Y.Offset/2)
    self.MainContainer.BackgroundTransparency = 1
    self.MainContainer.Parent = self.ScreenGui
    
    AddShadow(self.MainContainer)
    
    -- Main Window with Glass Effect
    self.MainWindow = CreateGlassFrame(self.MainContainer, self.Config.WindowSize, UDim2.new(0, 0, 0, 0), 
        self.Config.GlassEffect and 0.05 or 0)
    self.MainWindow.BackgroundColor3 = HI.Themes[self.Config.Theme].Main
    
    -- Make Draggable
    if self.Config.Draggable then
        self:MakeDraggable(self.MainWindow)
        
    end
    
    -- TOP BAR with Gradient
    self.TopBar = CreateRoundedFrame(self.MainWindow, UDim2.new(1, 0, 0, 70), UDim2.new(0, 0, 0, 0), 
        self.Config.CornerRadius)
    self.TopBar.BackgroundColor3 = HI.Themes[self.Config.Theme].Secondary
    self.TopBar.ZIndex = 2
    
    -- Top Bar Gradient
    if self.Config.GradientAccents then
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, HI.Themes[self.Config.Theme].Secondary),
            ColorSequenceKeypoint.new(1, HI.Themes[self.Config.Theme].Secondary:Lerp(HI.Themes[self.Config.Theme].Dark, 0.3))
        }
        Gradient.Rotation = 90
        Gradient.Parent = self.TopBar
    end
    
    -- Title Container
    self.TitleContainer = Instance.new("Frame")
    self.TitleContainer.Name = "TitleContainer"
    self.TitleContainer.Size = UDim2.new(0, 280, 1, 0)
    self.TitleContainer.BackgroundTransparency = 1
    self.TitleContainer.Parent = self.TopBar
    
    if IconId then
        local Icon = Instance.new("ImageLabel")
        Icon.Name = "HubIcon"
        Icon.Size = UDim2.new(0, 36, 0, 36)
        Icon.Position = UDim2.new(0, 20, 0.5, -18)
        Icon.BackgroundTransparency = 1
        Icon.Image = IconId
        Icon.ImageColor3 = HI.Themes[self.Config.Theme].Accent
        Icon.ImageTransparency = 0
        Icon.Parent = self.TitleContainer
        
        -- Icon glow effect
        local IconGlow = Instance.new("ImageLabel")
        IconGlow.Name = "IconGlow"
        IconGlow.Size = UDim2.new(1, 10, 1, 10)
        IconGlow.Position = UDim2.new(0, -5, 0, -5)
        IconGlow.BackgroundTransparency = 1
        IconGlow.Image = "rbxassetid://4996891970"
        IconGlow.ImageColor3 = HI.Themes[self.Config.Theme].Accent
        IconGlow.ImageTransparency = 0.7
        IconGlow.ZIndex = -1
        IconGlow.Parent = Icon
    end
    
    local HubTitle = Instance.new("TextLabel")
    HubTitle.Name = "HubTitle"
    HubTitle.Size = UDim2.new(1, -80, 1, 0)
    HubTitle.Position = UDim2.new(0, IconId and 70 or 20, 0, 0)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = Title or "HI LIBRARY"
    HubTitle.TextColor3 = HI.Themes[self.Config.Theme].Text
    HubTitle.Font = self.Config.TitleFont
    HubTitle.TextSize = self.Config.TitleSize
    HubTitle.TextXAlignment = Enum.TextXAlignment.Left
    HubTitle.TextYAlignment = Enum.TextYAlignment.Center
    HubTitle.TextTransparency = 0
    HubTitle.Parent = self.TitleContainer
    
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Name = "SubTitle"
    SubTitle.Size = UDim2.new(1, -80, 0, 16)
    SubTitle.Position = UDim2.new(0, IconId and 70 or 20, 0, 38)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "Premium UI Library"
    SubTitle.TextColor3 = HI.Themes[self.Config.Theme].SubText
    SubTitle.Font = self.Config.Font
    SubTitle.TextSize = self.Config.TextSize - 2
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubTitle.TextTransparency = 0.3
    SubTitle.Parent = self.TitleContainer
    
    -- Search Bar
    if self.Config.SearchEnabled then
        self:CreateSearchBar()
    end
    
    -- Control Buttons
    self:CreateControlButtons()
    
    -- Content Area
    self:CreateContentArea()
    
    -- Watermark
    self.Watermark = Instance.new("TextLabel")
    self.Watermark.Name = "Watermark"
    self.Watermark.Size = UDim2.new(1, 0, 0, 20)
    self.Watermark.Position = UDim2.new(0, 0, 1, -25)
    self.Watermark.BackgroundTransparency = 1
    self.Watermark.Text = self.Config.Watermark
    self.Watermark.TextColor3 = HI.Themes[self.Config.Theme].SubText
    self.Watermark.Font = self.Config.Font
    self.Watermark.TextSize = 11
    self.Watermark.TextTransparency = 0.6
    self.Watermark.Parent = self.MainWindow
    
    -- Setup Events
    self:SetupEvents()
end

function HI:CreateSearchBar()
    self.SearchContainer = Instance.new("Frame")
    self.SearchContainer.Name = "SearchContainer"
    self.SearchContainer.Size = UDim2.new(0, 320, 0, 40)
    self.SearchContainer.Position = UDim2.new(0.5, -160, 0.5, -20)
    self.SearchContainer.BackgroundTransparency = 1
    self.SearchContainer.Parent = self.TopBar
    
    local SearchFrame = CreateGlassFrame(self.SearchContainer, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), 0.1)
    SearchFrame.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Name = "SearchIcon"
    SearchIcon.Size = UDim2.new(0, 20, 0, 20)
    SearchIcon.Position = UDim2.new(0, 12, 0.5, -10)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = HI.Icons.Search
    SearchIcon.ImageColor3 = HI.Themes[self.Config.Theme].SubText
    SearchIcon.Parent = SearchFrame
    
    self.SearchBox = Instance.new("TextBox")
    self.SearchBox.Name = "SearchBox"
    self.SearchBox.Size = UDim2.new(1, -50, 1, 0)
    self.SearchBox.Position = UDim2.new(0, 42, 0, 0)
    self.SearchBox.BackgroundTransparency = 1
    self.SearchBox.Text = ""
    self.SearchBox.PlaceholderText = "Search settings..."
    self.SearchBox.PlaceholderColor3 = HI.Themes[self.Config.Theme].SubText
    self.SearchBox.TextColor3 = HI.Themes[self.Config.Theme].Text
    self.SearchBox.Font = self.Config.Font
    self.SearchBox.TextSize = self.Config.TextSize
    self.SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    self.SearchBox.ClearTextOnFocus = false
    self.SearchBox.Parent = SearchFrame
    
    -- Search box focus effect
    self.SearchBox.Focused:Connect(function()
        Tween(SearchFrame, {BackgroundTransparency = 0.05})
        Tween(SearchIcon, {ImageColor3 = HI.Themes[self.Config.Theme].Accent})
    end)
    
    self.SearchBox.FocusLost:Connect(function()
        Tween(SearchFrame, {BackgroundTransparency = 0.1})
        Tween(SearchIcon, {ImageColor3 = HI.Themes[self.Config.Theme].SubText})
    end)
end

function HI:CreateControlButtons()
    self.ControlContainer = Instance.new("Frame")
    self.ControlContainer.Name = "ControlContainer"
    self.ControlContainer.Size = UDim2.new(0, 120, 1, 0)
    self.ControlContainer.Position = UDim2.new(1, -130, 0, 0)
    self.ControlContainer.BackgroundTransparency = 1
    self.ControlContainer.Parent = self.TopBar
    
    -- Minimize Button
    self.MinimizeButton = Instance.new("ImageButton")
    self.MinimizeButton.Name = "MinimizeButton"
    self.MinimizeButton.Size = UDim2.new(0, 36, 0, 36)
    self.MinimizeButton.Position = UDim2.new(0, 10, 0.5, -18)
    self.MinimizeButton.BackgroundTransparency = 1
    self.MinimizeButton.Image = HI.Icons.Minimize
    self.MinimizeButton.ImageColor3 = HI.Themes[self.Config.Theme].SubText
    self.MinimizeButton.Parent = self.ControlContainer
    
    -- Close Button
    self.CloseButton = Instance.new("ImageButton")
    self.CloseButton.Name = "CloseButton"
    self.CloseButton.Size = UDim2.new(0, 36, 0, 36)
    self.CloseButton.Position = UDim2.new(0, 56, 0.5, -18)
    self.CloseButton.BackgroundTransparency = 1
    self.CloseButton.Image = HI.Icons.Close
    self.CloseButton.ImageColor3 = HI.Themes[self.Config.Theme].SubText
    self.CloseButton.Parent = self.ControlContainer
end

function HI:CreateContentArea()
    self.ContentArea = Instance.new("Frame")
    self.ContentArea.Name = "ContentArea"
    self.ContentArea.Size = UDim2.new(1, 0, 1, -70)
    self.ContentArea.Position = UDim2.new(0, 0, 0, 70)
    self.ContentArea.BackgroundTransparency = 1
    self.ContentArea.Parent = self.MainWindow
    
    -- Side Navigation (Left)
    self.SideNav = CreateGlassFrame(self.ContentArea, UDim2.new(0, 240, 1, -20), UDim2.new(0, 10, 0, 10), 0.05)
    self.SideNav.BackgroundColor3 = HI.Themes[self.Config.Theme].Secondary
    
    local SideNavHeader = Instance.new("TextLabel")
    SideNavHeader.Name = "SideNavHeader"
    SideNavHeader.Size = UDim2.new(1, -20, 0, 40)
    SideNavHeader.Position = UDim2.new(0, 10, 0, 10)
    SideNavHeader.BackgroundTransparency = 1
    SideNavHeader.Text = "Navigation"
    SideNavHeader.TextColor3 = HI.Themes[self.Config.Theme].SubText
    SideNavHeader.Font = self.Config.HeaderFont
    SideNavHeader.TextSize = self.Config.HeaderSize - 2
    SideNavHeader.TextXAlignment = Enum.TextXAlignment.Left
    SideNavHeader.Parent = self.SideNav
    
    -- Tab List
    self.TabList = Instance.new("ScrollingFrame")
    self.TabList.Name = "TabList"
    self.TabList.Size = UDim2.new(1, -20, 1, -70)
    self.TabList.Position = UDim2.new(0, 10, 0, 60)
    self.TabList.BackgroundTransparency = 1
    self.TabList.BorderSizePixel = 0
    self.TabList.ScrollBarThickness = 3
    self.TabList.ScrollBarImageColor3 = HI.Themes[self.Config.Theme].Border
    self.TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.TabList.ScrollingDirection = Enum.ScrollingDirection.Y
    self.TabList.Parent = self.SideNav
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Padding = UDim.new(0, 8)
    TabListLayout.Parent = self.TabList
    
    -- Main Content (Right)
    self.MainContent = CreateGlassFrame(self.ContentArea, UDim2.new(1, -270, 1, -20), UDim2.new(0, 260, 0, 10), 0.05)
    self.MainContent.BackgroundColor3 = HI.Themes[self.Config.Theme].Secondary
    
    -- Content Scroller
    self.ContentScroller = Instance.new("ScrollingFrame")
    self.ContentScroller.Name = "ContentScroller"
    self.ContentScroller.Size = UDim2.new(1, -20, 1, -20)
    self.ContentScroller.Position = UDim2.new(0, 10, 0, 10)
    self.ContentScroller.BackgroundTransparency = 1
    self.ContentScroller.BorderSizePixel = 0
    self.ContentScroller.ScrollBarThickness = 4
    self.ContentScroller.ScrollBarImageColor3 = HI.Themes[self.Config.Theme].Border
    self.ContentScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.ContentScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.ContentScroller.ScrollingDirection = Enum.ScrollingDirection.Y
    self.ContentScroller.Parent = self.MainContent
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 24)
    ContentLayout.Parent = self.ContentScroller
end

function HI:SetupEvents()
    -- Minimize Button
    self.MinimizeButton.MouseButton1Click:Connect(function()
        self:ToggleMinimize()
    end)
    
    self.MinimizeButton.MouseEnter:Connect(function()
        Tween(self.MinimizeButton, {ImageColor3 = HI.Themes[self.Config.Theme].Warning, Size = UDim2.new(0, 38, 0, 38)}, 0.1)
    end)
    
    self.MinimizeButton.MouseLeave:Connect(function()
        Tween(self.MinimizeButton, {ImageColor3 = HI.Themes[self.Config.Theme].SubText, Size = UDim2.new(0, 36, 0, 36)}, 0.1)
    end)
    
    -- Close Button
    self.CloseButton.MouseButton1Click:Connect(function()
        self:Toggle()
    end)
    
    self.CloseButton.MouseEnter:Connect(function()
        Tween(self.CloseButton, {ImageColor3 = HI.Themes[self.Config.Theme].Danger, Size = UDim2.new(0, 38, 0, 38)}, 0.1)
    end)
    
    self.CloseButton.MouseLeave:Connect(function()
        Tween(self.CloseButton, {ImageColor3 = HI.Themes[self.Config.Theme].SubText, Size = UDim2.new(0, 36, 0, 36)}, 0.1)
    end)
    
    -- Search Functionality
    if self.Config.SearchEnabled and self.SearchBox then
        self.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            self:SearchContent(self.SearchBox.Text)
        end)
    end
end

function HI:MakeDraggable(Frame)
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
    
    -- Add this helper function to stop propagation on interactive elements
    self.StopPropagation = function(Element)
        Element.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Input:StopPropagation()
            end
        end)
    end
end

-- PUBLIC API METHODS

-- Window Management
function HI:Toggle()
    self.ScreenGui.Enabled = not self.ScreenGui.Enabled
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = self.ScreenGui.Enabled
    end
    return self
end

function HI:ToggleMinimize()
    self.IsMinimized = not self.IsMinimized
    
    if self.IsMinimized then
        Tween(self.MainWindow, {Size = self.MinimizedSize}, 0.2, Enum.EasingStyle.Back)
        self.ContentArea.Visible = false
        self.MinimizeButton.Image = HI.Icons.Expand
    else
        Tween(self.MainWindow, {Size = self.OriginalSize}, 0.2, Enum.EasingStyle.Back)
        self.ContentArea.Visible = true
        self.MinimizeButton.Image = HI.Icons.Minimize
    end
    return self
end

function HI:Show()
    self.ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = true
    end
    return self
end

function HI:Hide()
    self.ScreenGui.Enabled = false
    if self.BackgroundBlur then
        self.BackgroundBlur.Enabled = false
    end
    return self
end

function HI:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    if self.BackgroundBlur then
        self.BackgroundBlur:Destroy()
    end
    return nil
end

-- Theme Management
function HI:SetTheme(ThemeName)
    if HI.Themes[ThemeName] then
        self.Config.Theme = ThemeName
        self:UpdateTheme()
    end
    return self
end

function HI:UpdateTheme()
    local Theme = HI.Themes[self.Config.Theme]
    
    Tween(self.MainWindow, {BackgroundColor3 = Theme.Main})
    Tween(self.TopBar, {BackgroundColor3 = Theme.Secondary})
    Tween(self.SideNav, {BackgroundColor3 = Theme.Secondary})
    Tween(self.MainContent, {BackgroundColor3 = Theme.Secondary})
    
    -- Update text and icons
    local function UpdateColors(Parent)
        for _, Child in pairs(Parent:GetDescendants()) do
            if Child:IsA("TextLabel") or Child:IsA("TextBox") then
                if Child.Name == "HubTitle" then
                    Tween(Child, {TextColor3 = Theme.Text})
                elseif Child.Name == "SearchBox" then
                    Tween(Child, {TextColor3 = Theme.Text, PlaceholderColor3 = Theme.SubText})
                elseif Child.Name == "Watermark" then
                    Tween(Child, {TextColor3 = Theme.SubText})
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
    
    UpdateColors(self.MainWindow)
    return self
end

function HI:GetAvailableThemes()
    local themes = {}
    for name, _ in pairs(HI.Themes) do
        table.insert(themes, name)
    end
    return themes
end

-- Tab Management
function HI:CreateTab(TabName, IconId)
    local Tab = {}
    Tab.Name = TabName
    Tab.Sections = {}
    Tab.Elements = {}
    
    -- Tab Button Container
    local TabContainer = CreateRoundedFrame(self.TabList, UDim2.new(1, 0, 0, 52), UDim2.new(0, 0, 0, 0), 8)
    TabContainer.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    TabContainer.BackgroundTransparency = 0.1
    
    Tab.Button = TabContainer
    
    -- Tab Icon
    if self.Config.UseIcons and IconId then
        Tab.Icon = Instance.new("ImageLabel")
        Tab.Icon.Name = "TabIcon"
        Tab.Icon.Size = UDim2.new(0, 24, 0, 24)
        Tab.Icon.Position = UDim2.new(0, 14, 0.5, -12)
        Tab.Icon.BackgroundTransparency = 1
        Tab.Icon.Image = IconId
        Tab.Icon.ImageColor3 = HI.Themes[self.Config.Theme].SubText
        Tab.Icon.Parent = TabContainer
    end
    
    -- Tab Label
    Tab.Label = Instance.new("TextLabel")
    Tab.Label.Name = "TabLabel"
    Tab.Label.Size = UDim2.new(1, self.Config.UseIcons and IconId and -50 or -28, 1, 0)
    Tab.Label.Position = UDim2.new(0, self.Config.UseIcons and IconId and 50 or 14, 0, 0)
    Tab.Label.BackgroundTransparency = 1
    Tab.Label.Text = TabName
    Tab.Label.TextColor3 = HI.Themes[self.Config.Theme].Text
    Tab.Label.Font = self.Config.HeaderFont
    Tab.Label.TextSize = self.Config.TextSize
    Tab.Label.TextXAlignment = Enum.TextXAlignment.Left
    Tab.Label.TextYAlignment = Enum.TextYAlignment.Center
    Tab.Label.Parent = TabContainer
    
    -- Tab Content
    Tab.Content = Instance.new("Frame")
    Tab.Content.Name = TabName .. "Content"
    Tab.Content.Size = UDim2.new(1, 0, 1, 0)
    Tab.Content.BackgroundTransparency = 1
    Tab.Content.Visible = false
    Tab.Content.Parent = self.ContentScroller
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 24)
    ContentLayout.Parent = Tab.Content
    
    -- Tab Indicator
    Tab.Indicator = Instance.new("Frame")
    Tab.Indicator.Name = "Indicator"
    Tab.Indicator.Size = UDim2.new(0, 3, 0.6, 0)
    Tab.Indicator.Position = UDim2.new(0, -6, 0.2, 0)
    Tab.Indicator.BackgroundColor3 = HI.Themes[self.Config.Theme].Accent
    Tab.Indicator.BackgroundTransparency = 1
    Tab.Indicator.BorderSizePixel = 0
    Tab.Indicator.Parent = TabContainer
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Tab.Indicator
    
    -- Events with smooth animations
    TabContainer.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            self:SwitchTab(Tab)
        end
    end)
    
    TabContainer.MouseEnter:Connect(function()
        if Tab ~= self.CurrentTab then
            Tween(TabContainer, {BackgroundTransparency = 0, Size = UDim2.new(1, 0, 0, 54)}, 0.1)
            if Tab.Icon then
                Tween(Tab.Icon, {ImageColor3 = HI.Themes[self.Config.Theme].Text, Size = UDim2.new(0, 26, 0, 26)}, 0.1)
            end
            Tween(Tab.Label, {TextColor3 = HI.Themes[self.Config.Theme].Text})
        end
    end)
    
    TabContainer.MouseLeave:Connect(function()
        if Tab ~= self.CurrentTab then
            Tween(TabContainer, {BackgroundTransparency = 0.1, Size = UDim2.new(1, 0, 0, 52)}, 0.1)
            if Tab.Icon then
                Tween(Tab.Icon, {ImageColor3 = HI.Themes[self.Config.Theme].SubText, Size = UDim2.new(0, 24, 0, 24)}, 0.1)
            end
            Tween(Tab.Label, {TextColor3 = HI.Themes[self.Config.Theme].Text})
        end
    end)
    
    self.Tabs[TabName] = Tab
    
    -- Set as current if first tab
    if not self.CurrentTab then
        self:SwitchTab(Tab)
    end
    
    return Tab
end

function HI:SwitchTab(Tab)
    for Name, T in pairs(self.Tabs) do
        T.Content.Visible = false
        Tween(T.Button, {BackgroundTransparency = 0.1, Size = UDim2.new(1, 0, 0, 52)})
        Tween(T.Indicator, {BackgroundTransparency = 1})
        if T.Icon then
            Tween(T.Icon, {ImageColor3 = HI.Themes[self.Config.Theme].SubText, Size = UDim2.new(0, 24, 0, 24)})
        end
       Tab.Label.Font = self.Config.TitleFont  -- Set font directly
Tween(Tab.Label, {TextColor3 = HI.Themes[self.Config.Theme].Text})  -- Only tween color
    end
    
    Tab.Content.Visible = true
    Tween(Tab.Button, {BackgroundTransparency = 0, Size = UDim2.new(1, 0, 0, 56)}, 0.15, Enum.EasingStyle.Back)
    Tween(Tab.Indicator, {BackgroundTransparency = 0})
    if Tab.Icon then
        Tween(Tab.Icon, {ImageColor3 = HI.Themes[self.Config.Theme].Accent, Size = UDim2.new(0, 28, 0, 28)}, 0.15)
    end
    Tab.Label.Font = self.Config.TitleFont  -- Set font directly
Tween(Tab.Label, {TextColor3 = HI.Themes[self.Config.Theme].Text})  -- Only tween color
    
    self.CurrentTab = Tab
    return self
end

-- Section Management
function HI:CreateSection(Tab, SectionName)
    local Section = {}
    
    Section.Frame = CreateGlassFrame(Tab.Content, UDim2.new(1, 0, 0, 80), UDim2.new(0, 0, 0, 0), 0.05, 10)
    Section.Frame.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    
    -- Section Header with Icon
    local HeaderContainer = Instance.new("Frame")
    HeaderContainer.Name = "HeaderContainer"
    HeaderContainer.Size = UDim2.new(1, -20, 0, 40)
    HeaderContainer.Position = UDim2.new(0, 10, 0, 10)
    HeaderContainer.BackgroundTransparency = 1
    HeaderContainer.Parent = Section.Frame
    
    local SectionIcon = Instance.new("ImageLabel")
    SectionIcon.Name = "SectionIcon"
    SectionIcon.Size = UDim2.new(0, 20, 0, 20)
    SectionIcon.Position = UDim2.new(0, 0, 0.5, -10)
    SectionIcon.BackgroundTransparency = 1
    SectionIcon.Image = HI.Icons.ChevronRight
    SectionIcon.ImageColor3 = HI.Themes[self.Config.Theme].Accent
    SectionIcon.Parent = HeaderContainer
    
    Section.Title = Instance.new("TextLabel")
    Section.Title.Name = "Title"
    Section.Title.Size = UDim2.new(1, -30, 1, 0)
    Section.Title.Position = UDim2.new(0, 30, 0, 0)
    Section.Title.BackgroundTransparency = 1
    Section.Title.Text = SectionName
    Section.Title.TextColor3 = HI.Themes[self.Config.Theme].Text
    Section.Title.Font = self.Config.HeaderFont
    Section.Title.TextSize = self.Config.HeaderSize
    Section.Title.TextXAlignment = Enum.TextXAlignment.Left
    Section.Title.Parent = HeaderContainer
    
    -- Divider
    local Divider = Instance.new("Frame")
    Divider.Name = "Divider"
    Divider.Size = UDim2.new(1, 0, 0, 1)
    Divider.Position = UDim2.new(0, 0, 0, 45)
    Divider.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    Divider.BackgroundTransparency = 0.7
    Divider.BorderSizePixel = 0
    Divider.Parent = Section.Frame
    
    Section.Content = Instance.new("Frame")
Section.Content.Name = "Content"
Section.Content.Size = UDim2.new(1, -40, 0, 0) -- Changed from -20 to -40 for more padding
Section.Content.Position = UDim2.new(0, 20, 0, 55) -- Changed from 10 to 20
Section.Content.BackgroundTransparency = 1
Section.Content.Parent = Section.Frame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 14)
    ContentLayout.Parent = Section.Content
    
    -- Auto-size with animation
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local newHeight = 55 + ContentLayout.AbsoluteContentSize.Y
        Tween(Section.Frame, {Size = UDim2.new(1, 0, 0, newHeight + 10)})
        Section.Content.Size = UDim2.new(1, -20, 0, ContentLayout.AbsoluteContentSize.Y)
    end)
    
    Tab.Sections[SectionName] = Section
    return Section
end

-- UI Components with Modern Design
function HI:AddLabel(Section, Text, Color)
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, 0, 0, 24)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Color or HI.Themes[self.Config.Theme].SubText
    Label.Font = self.Config.Font
    Label.TextSize = self.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextWrapped = true
    Label.Parent = Section.Content
    
    return Label
end

function HI:AddButton(Section, Name, Callback, Color)
    local Button = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 42), UDim2.new(0, 0, 0, 0), 8)
    Button.BackgroundColor3 = Color or HI.Themes[self.Config.Theme].Accent
    Button.BackgroundTransparency = 0
    
    if self.Config.GradientAccents then
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, (Color or HI.Themes[self.Config.Theme].Accent)),
            ColorSequenceKeypoint.new(1, (Color or HI.Themes[self.Config.Theme].Accent):Lerp(HI.Themes[self.Config.Theme].Dark, 0.3))
        }
        Gradient.Rotation = 90
        Gradient.Parent = Button
    end
    
    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Name = "Label"
    ButtonLabel.Size = UDim2.new(1, 0, 1, 0)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Text = Name
    ButtonLabel.TextColor3 = HI.Themes[self.Config.Theme].Text
    ButtonLabel.Font = self.Config.HeaderFont
    ButtonLabel.TextSize = self.Config.TextSize
    ButtonLabel.TextYAlignment = Enum.TextYAlignment.Center
    ButtonLabel.Parent = Button
    
    -- Hover effect
    local HoverFrame = Instance.new("Frame")
    HoverFrame.Name = "HoverFrame"
    HoverFrame.Size = UDim2.new(1, 0, 1, 0)
    HoverFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HoverFrame.BackgroundTransparency = 0.9
    HoverFrame.BorderSizePixel = 0
    HoverFrame.Visible = false
    HoverFrame.Parent = Button
    
    local HoverCorner = Instance.new("UICorner")
    HoverCorner.CornerRadius = UDim.new(0, 8)
    HoverCorner.Parent = HoverFrame
    
    Button.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Tween(Button, {Size = UDim2.new(1, 0, 0, 40)}, 0.1)
            Tween(ButtonLabel, {TextSize = self.Config.TextSize - 1}, 0.1)
        end
    end)
    
    Button.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Tween(Button, {Size = UDim2.new(1, 0, 0, 42)}, 0.1)
            Tween(ButtonLabel, {TextSize = self.Config.TextSize}, 0.1)
            if Callback then
                Callback()
            end
        end
    end)
    
    Button.MouseEnter:Connect(function()
        HoverFrame.Visible = true
        Tween(Button, {Size = UDim2.new(1, 0, 0, 44)}, 0.1)
    end)
    
    Button.MouseLeave:Connect(function()
        HoverFrame.Visible = false
        Tween(Button, {Size = UDim2.new(1, 0, 0, 42)}, 0.1)
    end)
    
    return Button
end

function HI:AddToggle(Section, Name, Default, Callback)
    local Toggle = {}
    Toggle.Value = Default or false
    
    local Container = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 42), UDim2.new(0, 0, 0, 0), 8)
    Container.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    Container.BackgroundTransparency = 0.1
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[self.Config.Theme].Text
    Label.Font = self.Config.Font
    Label.TextSize = self.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Parent = Container
    
    -- Modern toggle switch
    local ToggleContainer = CreateRoundedFrame(Container, UDim2.new(0, 56, 0, 30), UDim2.new(1, -64, 0.5, -15), 15)
    ToggleContainer.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    ToggleContainer.BackgroundTransparency = 0.5
    
    local ToggleCircle = CreateRoundedFrame(ToggleContainer, UDim2.new(0, 24, 0, 24), Toggle.Value and UDim2.new(1, -26, 0.5, -12) or UDim2.new(0, 2, 0.5, -12), 12)
    ToggleCircle.BackgroundColor3 = HI.Themes[self.Config.Theme].Text
    ToggleCircle.ZIndex = 2
    
    -- Toggle glow effect
   
    
    local function UpdateToggle()
        if Toggle.Value then
            Tween(ToggleContainer, {BackgroundColor3 = HI.Themes[self.Config.Theme].Success}, 0.2, Enum.EasingStyle.Quad)
            Tween(ToggleCircle, {Position = UDim2.new(1, -26, 0.5, -12), BackgroundColor3 = Color3.new(1, 1, 1)}, 0.2, Enum.EasingStyle.Back)
            ToggleGlow.Visible = true
            Tween(ToggleGlow, {BackgroundTransparency = 0.7, Size = UDim2.new(1, 10, 1, 10)}, 0.3)
        else
            Tween(ToggleContainer, {BackgroundColor3 = HI.Themes[self.Config.Theme].Border}, 0.2)
            Tween(ToggleCircle, {Position = UDim2.new(0, 2, 0.5, -12), BackgroundColor3 = HI.Themes[self.Config.Theme].Text}, 0.2, Enum.EasingStyle.Back)
            ToggleGlow.Visible = false
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
    
    -- Hover effect
    Container.MouseEnter:Connect(function()
        Tween(Container, {BackgroundTransparency = 0}, 0.1)
    end)
    
    Container.MouseLeave:Connect(function()
        Tween(Container, {BackgroundTransparency = 0.1}, 0.1)
    end)
    
    return Toggle
end

function HI:AddSlider(Section, Name, Min, Max, Default, Decimals, Callback)
    local Slider = {}
    Slider.Value = Default or Min
    Decimals = Decimals or 1
    
    local Container = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 74), UDim2.new(0, 0, 0, 0), 8)
    Container.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    Container.BackgroundTransparency = 0.1
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, 0, 0, 28)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[self.Config.Theme].Text
    Label.Font = self.Config.Font
    Label.TextSize = self.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Parent = Container
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Name = "ValueLabel"
    ValueLabel.Size = UDim2.new(0, 80, 0, 28)
    ValueLabel.Position = UDim2.new(1, -92, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = Round(Slider.Value, Decimals)
    ValueLabel.TextColor3 = HI.Themes[self.Config.Theme].Accent
    ValueLabel.Font = HI.Fonts.Monospace
    ValueLabel.TextSize = self.Config.TextSize
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Container
    
    -- Slider Track with gradient
    local SliderTrack = CreateRoundedFrame(Container, UDim2.new(1, -24, 0, 6), UDim2.new(0, 12, 0, 40), 3)
    SliderTrack.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    SliderTrack.BackgroundTransparency = 0.5
    
    local SliderFill = CreateRoundedFrame(SliderTrack, UDim2.new((Slider.Value - Min) / (Max - Min), 0, 1, 0), UDim2.new(0, 0, 0, 0), 3)
    SliderFill.BackgroundColor3 = HI.Themes[self.Config.Theme].Accent
    
    if self.Config.GradientAccents then
        local FillGradient = Instance.new("UIGradient")
        FillGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, HI.Themes[self.Config.Theme].Accent),
            ColorSequenceKeypoint.new(1, HI.Themes[self.Config.Theme].Accent:Lerp(HI.Themes[self.Config.Theme].Light, 0.3))
        }
        FillGradient.Rotation = 0
        FillGradient.Parent = SliderFill
    end
    
    -- Slider Thumb (Handle)
   -- Change slider position to be more centered
local SliderContainer = CreateRoundedFrame(Container, UDim2.new(1, -40, 0, 6), UDim2.new(0, 20, 0, 40), 3) -- Added left margin

-- Make slider thumb larger and more visible
local SliderThumb = CreateRoundedFrame(Container, UDim2.new(0, 28, 0, 28), 
    UDim2.new((Slider.Value - Min) / (Max - Min), -14, 0, 34), 14) -- Bigger thumb

-- Ensure thumb stays within bounds
local function UpdateSlider(Value)
    Value = math.clamp(Value, Min, Max)
    Slider.Value = Value
    local Ratio = math.clamp((Value - Min) / (Max - Min), 0, 1) -- Clamp ratio
    
    Tween(SliderThumb, {Position = UDim2.new(Ratio, -14, 0, 34)})
end
    
    -- Thumb glow
    local ThumbGlow = Instance.new("Frame")
    ThumbGlow.Name = "ThumbGlow"
    ThumbGlow.Size = UDim2.new(1, 8, 1, 8)
    ThumbGlow.Position = UDim2.new(0, -4, 0, -4)
    ThumbGlow.BackgroundColor3 = HI.Themes[self.Config.Theme].Accent
    ThumbGlow.BackgroundTransparency = 0.8
    ThumbGlow.BorderSizePixel = 0
    local ThumbGlowCorner = Instance.new("UICorner")
    ThumbGlowCorner.CornerRadius = UDim.new(1, 0)
    ThumbGlowCorner.Parent = ThumbGlow
    ThumbGlow.Parent = SliderThumb
    
    local function UpdateSlider(Value)
        Value = math.clamp(Value, Min, Max)
        Slider.Value = Value
        local Ratio = (Value - Min) / (Max - Min)
        
        ValueLabel.Text = Round(Value, Decimals)
        Tween(SliderFill, {Size = UDim2.new(Ratio, 0, 1, 0)})
        Tween(SliderThumb, {Position = UDim2.new(Ratio, -12, 0, 34)})
        
        if Callback then
            Callback(Value)
        end
    end
    
    local Dragging = false
    local DragStartX = 0
    local DragStartValue = 0
    
    local function StartDrag()
        Dragging = true
        Tween(SliderThumb, {Size = UDim2.new(0, 28, 0, 28)}, 0.1)
        Tween(ThumbGlow, {BackgroundTransparency = 0.6, Size = UDim2.new(1, 12, 1, 12)}, 0.2)
        
        local MoveConnection = game:GetService("UserInputService").InputChanged:Connect(function(Input)
            if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                local MousePos = game:GetService("Players").LocalPlayer:GetMouse()
                local XPos = math.clamp(MousePos.X - SliderTrack.AbsolutePosition.X, 0, SliderTrack.AbsoluteSize.X)
                local Ratio = XPos / SliderTrack.AbsoluteSize.X
                local Value = Min + (Max - Min) * Ratio
                UpdateSlider(Value)
            end
        end)
        
        local EndedConnection
        EndedConnection = game:GetService("UserInputService").InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = false
                Tween(SliderThumb, {Size = UDim2.new(0, 24, 0, 24)}, 0.1)
                Tween(ThumbGlow, {BackgroundTransparency = 0.8, Size = UDim2.new(1, 8, 1, 8)}, 0.2)
                MoveConnection:Disconnect()
                EndedConnection:Disconnect()
            end
        end)
    end
    
    SliderThumb.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Input:StopPropagation()
            StartDrag()
        end
    end)
    
    SliderTrack.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            local MousePos = game:GetService("Players").LocalPlayer:GetMouse()
            local XPos = math.clamp(MousePos.X - SliderTrack.AbsolutePosition.X, 0, SliderTrack.AbsoluteSize.X)
            local Ratio = XPos / SliderTrack.AbsoluteSize.X
            local Value = Min + (Max - Min) * Ratio
            UpdateSlider(Value)
            StartDrag()
        end
    end)
    
    -- Hover effects
    SliderTrack.MouseEnter:Connect(function()
        Tween(SliderTrack, {BackgroundTransparency = 0.3}, 0.1)
    end)
    
    SliderTrack.MouseLeave:Connect(function()
        if not Dragging then
            Tween(SliderTrack, {BackgroundTransparency = 0.5}, 0.1)
        end
    end)
    
    UpdateSlider(Slider.Value)
    return Slider
end

function HI:AddDropdown(Section, Name, Options, Default, Callback)
    local Dropdown = {}
    Dropdown.Value = Default or Options[1]
    Dropdown.Open = false
    
    local Container = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 42), UDim2.new(0, 0, 0, 0), 8)
    Container.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    Container.BackgroundTransparency = 0.1
    Container.ClipsDescendants = true
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(0.5, -10, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[self.Config.Theme].Text
    Label.Font = self.Config.Font
    Label.TextSize = self.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Parent = Container
    
    -- Dropdown Button
    local DropdownButton = CreateRoundedFrame(Container, UDim2.new(0.45, -10, 0, 34), UDim2.new(0.55, 0, 0.5, -17), 6)
    DropdownButton.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    DropdownButton.BackgroundTransparency = 0.3
    
    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Name = "ButtonLabel"
    ButtonLabel.Size = UDim2.new(1, -30, 1, 0)
    ButtonLabel.Position = UDim2.new(0, 10, 0, 0)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Text = Dropdown.Value
    ButtonLabel.TextColor3 = HI.Themes[self.Config.Theme].Text
    ButtonLabel.Font = self.Config.Font
    ButtonLabel.TextSize = self.Config.TextSize - 1
    ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
    ButtonLabel.TextYAlignment = Enum.TextYAlignment.Center
    ButtonLabel.Parent = DropdownButton
    
    local DropdownIcon = Instance.new("ImageLabel")
    DropdownIcon.Name = "Icon"
    DropdownIcon.Size = UDim2.new(0, 16, 0, 16)
    DropdownIcon.Position = UDim2.new(1, -20, 0.5, -8)
    DropdownIcon.BackgroundTransparency = 1
    DropdownIcon.Image = HI.Icons.ChevronDown
    DropdownIcon.ImageColor3 = HI.Themes[self.Config.Theme].SubText
    DropdownIcon.Rotation = 0
    DropdownIcon.Parent = DropdownButton
    
    -- Options Frame
    local OptionsFrame = CreateRoundedFrame(Container, UDim2.new(0.45, -10, 0, 0), UDim2.new(0.55, 0, 1, 6), 6)
    OptionsFrame.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    OptionsFrame.BackgroundTransparency = 0.2
    OptionsFrame.Visible = false
    OptionsFrame.ZIndex = 10
    
    local OptionsLayout = Instance.new("UIListLayout")
    OptionsLayout.Padding = UDim.new(0, 1)
    OptionsLayout.Parent = OptionsFrame
    
    for _, Option in ipairs(Options) do
        local OptionButton = CreateRoundedFrame(OptionsFrame, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), 4)
        OptionButton.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
        OptionButton.BackgroundTransparency = 0.1
        OptionButton.ZIndex = 11
        
        local OptionLabel = Instance.new("TextLabel")
        OptionLabel.Name = "Label"
        OptionLabel.Size = UDim2.new(1, -20, 1, 0)
        OptionLabel.Position = UDim2.new(0, 10, 0, 0)
        OptionLabel.BackgroundTransparency = 1
        OptionLabel.Text = Option
        OptionLabel.TextColor3 = HI.Themes[self.Config.Theme].Text
        OptionLabel.Font = self.Config.Font
        OptionLabel.TextSize = self.Config.TextSize - 1
        OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        OptionLabel.TextYAlignment = Enum.TextYAlignment.Center
        OptionLabel.ZIndex = 12
        OptionLabel.Parent = OptionButton
        
        OptionButton.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dropdown.Value = Option
                ButtonLabel.Text = Option
                Container.Size = UDim2.new(1, 0, 0, 42)
                Tween(OptionsFrame, {Size = UDim2.new(0.45, -10, 0, 0)}, 0.2)
                Tween(DropdownIcon, {Rotation = 0}, 0.2)
                Dropdown.Open = false
                
                if Callback then
                    Callback(Option)
                end
            end
        end)
        
        OptionButton.MouseEnter:Connect(function()
            Tween(OptionButton, {BackgroundTransparency = 0}, 0.1)
        end)
        
        OptionButton.MouseLeave:Connect(function()
            Tween(OptionButton, {BackgroundTransparency = 0.1}, 0.1)
        end)
    end
    
    -- Close dropdown when clicking outside
    local function CloseDropdown()
        if Dropdown.Open then
            Container.Size = UDim2.new(1, 0, 0, 42)
            Tween(OptionsFrame, {Size = UDim2.new(0.45, -10, 0, 0)}, 0.2)
            Tween(DropdownIcon, {Rotation = 0}, 0.2)
            Dropdown.Open = false
        end
    end
    
    -- Toggle Dropdown
    DropdownButton.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dropdown.Open = not Dropdown.Open
            
            if Dropdown.Open then
                Container.Size = UDim2.new(1, 0, 0, 48 + #Options * 31)
                OptionsFrame.Visible = true
                OptionsFrame.Size = UDim2.new(0.45, -10, 0, #Options * 31)
                Tween(DropdownIcon, {Rotation = 180}, 0.2)
                
                -- Close on click outside
                task.wait(0.1)
                local ClickConnection
                ClickConnection = game:GetService("UserInputService").InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
                        if not Container.AbsoluteRect:PointInside(Mouse) then
                            CloseDropdown()
                            ClickConnection:Disconnect()
                        end
                    end
                end)
            else
                CloseDropdown()
            end
        end
    end)
    
    -- Hover effects
    DropdownButton.MouseEnter:Connect(function()
        Tween(DropdownButton, {BackgroundTransparency = 0.1}, 0.1)
    end)
    
    DropdownButton.MouseLeave:Connect(function()
        Tween(DropdownButton, {BackgroundTransparency = 0.3}, 0.1)
    end)
    
    return Dropdown
end

function HI:AddTextBox(Section, Name, Placeholder, Callback)
    local Container = CreateRoundedFrame(Section.Content, UDim2.new(1, 0, 0, 64), UDim2.new(0, 0, 0, 0), 8)
    Container.BackgroundColor3 = HI.Themes[self.Config.Theme].Tertiary
    Container.BackgroundTransparency = 0.1
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Size = UDim2.new(1, -24, 0, 28)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = HI.Themes[self.Config.Theme].Text
    Label.Font = self.Config.Font
    Label.TextSize = self.Config.TextSize
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.Parent = Container
    
    local TextBoxFrame = CreateRoundedFrame(Container, UDim2.new(1, -24, 0, 32), UDim2.new(0, 12, 0, 32), 6)
    TextBoxFrame.BackgroundColor3 = HI.Themes[self.Config.Theme].Border
    TextBoxFrame.BackgroundTransparency = 0.2
    
    local TextBox = Instance.new("TextBox")
    TextBox.Name = "TextBox"
    TextBox.Size = UDim2.new(1, -24, 1, 0)
    TextBox.Position = UDim2.new(0, 12, 0, 0)
    TextBox.BackgroundTransparency = 1
    TextBox.Text = ""
    TextBox.PlaceholderText = Placeholder or "Enter text..."
    TextBox.PlaceholderColor3 = HI.Themes[self.Config.Theme].SubText
    TextBox.TextColor3 = HI.Themes[self.Config.Theme].Text
    TextBox.Font = self.Config.Font
    TextBox.TextSize = self.Config.TextSize
    TextBox.ClearTextOnFocus = false
    TextBox.Parent = TextBoxFrame
    
    TextBox.Focused:Connect(function()
        Tween(TextBoxFrame, {BackgroundTransparency = 0, BackgroundColor3 = HI.Themes[self.Config.Theme].Accent:Lerp(HI.Themes[self.Config.Theme].Tertiary, 0.5)}, 0.2)
    end)
    
    TextBox.FocusLost:Connect(function(enterPressed)
        Tween(TextBoxFrame, {BackgroundTransparency = 0.2, BackgroundColor3 = HI.Themes[self.Config.Theme].Border}, 0.2)
        if Callback then
            Callback(TextBox.Text, enterPressed)
        end
    end)
    
    -- Hover effect
    Container.MouseEnter:Connect(function()
        Tween(Container, {BackgroundTransparency = 0}, 0.1)
    end)
    
    Container.MouseLeave:Connect(function()
        Tween(Container, {BackgroundTransparency = 0.1}, 0.1)
    end)
    
    return TextBox
end

-- Search Functionality
function HI:SearchContent(Query)
    if not self.Config.SearchEnabled then return end
    
    Query = string.lower(Query)
    
    for TabName, Tab in pairs(self.Tabs) do
        local TabVisible = false
        
        if string.find(string.lower(TabName), Query, 1, true) then
            TabVisible = true
        else
            for SectionName, Section in pairs(Tab.Sections or {}) do
                if string.find(string.lower(SectionName), Query, 1, true) then
                    TabVisible = true
                    break
                end
            end
        end
        
        if Tab.Button then
            Tab.Button.Visible = TabVisible or Query == ""
        end
    end
end

-- Keybind System
function HI:BindToggleKey(KeyCode)
    game:GetService("UserInputService").InputBegan:Connect(function(Input, Processed)
        if not Processed and Input.KeyCode == KeyCode then
            self:Toggle()
        end
    end)
    return self
end

-- Customization Methods
function HI:SetWindowSize(Size)
    self.Config.WindowSize = Size
    self.OriginalSize = Size
    Tween(self.MainWindow, {Size = Size})
    Tween(self.MainContainer, {Size = Size})
    return self
end

function HI:SetTitle(NewTitle)
    if self.TitleContainer then
        local TitleLabel = self.TitleContainer:FindFirstChild("HubTitle")
        if TitleLabel then
            TitleLabel.Text = NewTitle
        end
    end
    return self
end

function HI:SetWatermark(Text)
    self.Config.Watermark = Text
    if self.Watermark then
        self.Watermark.Text = Text
    end
    return self
end

function HI:EnableSearch(Enabled)
    self.Config.SearchEnabled = Enabled
    if self.SearchContainer then
        self.SearchContainer.Visible = Enabled
    end
    return self
end

function HI:SetIcon(IconId)
    if self.TitleContainer then
        local Icon = self.TitleContainer:FindFirstChild("HubIcon")
        if Icon then
            Icon.Image = IconId
        end
    end
    return self
end

-- Export the library
return HI
