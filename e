do
    local ui = game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("UILibrary")
    if ui then ui:Destroy() end
end

do
    local ui = game:GetService("Lighting"):FindFirstChild("Blur")
    if ui then ui:Destroy() end
end


if not game:IsLoaded() then
    local Loaded = Instance.new("Message", workspace)
    Loaded.Text = 'Wait Game Loading'
    game.Loaded:Wait()
    Loaded:Destroy()
    task.wait(10)
end


repeat wait() until game.Players.LocalPlayer

if not game:IsLoaded() then
	local GameLoadGui = Instance.new("Message",workspace);
	GameLoadGui.Text = 'Wait Game Loading';
	game.Loaded:Wait();
	GameLoadGui:Destroy();
	task.wait(10);
end;
do  local ui =  game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("UILibrary")  if ui then ui:Destroy() end end  

do  local ui =  game:GetService("Lighting"):FindFirstChild("Blur")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")

local function tablefound(ta, object)
	for i,v in pairs(ta) do
		if v == object then
			return true
		end
	end
	return false
end

local ActualTypes = {
	RoundFrame = "ImageLabel",
	Shadow = "ImageLabel",
	Circle = "ImageLabel",
	CircleButton = "ImageButton",
	Frame = "Frame",
	Label = "TextLabel",
	Button = "TextButton",
	SmoothButton = "ImageButton",
	Box = "TextBox",
	ScrollingFrame = "ScrollingFrame",
	Menu = "ImageButton",
	NavBar = "ImageButton"
}

local Properties = {
	RoundFrame = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3,3,297,297)
	},
	SmoothButton = {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3,3,297,297)
	},
	Shadow = {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554236805",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(23,23,277,277),
		Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
		Position = UDim2.fromOffset(-15,-15)
	},
	Circle = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670"
	},
	CircleButton = {
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Image = "http://www.roblox.com/asset/?id=5554831670"
	},
	Frame = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1,1)
	},
	Label = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5,0),
		Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	},
	Button = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5,0),
		Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	},
	Box = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5,0),
		Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	},
	ScrollingFrame = {
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		CanvasSize = UDim2.fromScale(0,0),
		Size = UDim2.fromScale(1,1)
	},
	Menu = {
		Name = "More",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5555108481",
		Size = UDim2.fromOffset(20,20),
		Position = UDim2.fromScale(1,0.5) - UDim2.fromOffset(25,10)
	},
	NavBar = {
		Name = "SheetToggle",
		Image = "http://www.roblox.com/asset/?id=5576439039",
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(20,20),
		Position = UDim2.fromOffset(5,5),
		AutoButtonColor = false
	}
}

local Types = {
	"RoundFrame",
	"Shadow",
	"Circle",
	"CircleButton",
	"Frame",
	"Label",
	"Button",
	"SmoothButton",
	"Box",
	"ScrollingFrame",
	"Menu",
	"NavBar"
}

function FindType(String)
	for _, Type in next, Types do
		if Type:sub(1, #String):lower() == String:lower() then
			return Type
		end
	end
	return false
end

local Objects = {}

function Objects.new(Type)
	local TargetType = FindType(Type)
	if TargetType then
		local NewImage = Instance.new(ActualTypes[TargetType])
		if Properties[TargetType] then
			for Property, Value in next, Properties[TargetType] do
				NewImage[Property] = Value
			end
		end
		return NewImage
	else
		return Instance.new(Type)
	end
end

local function GetXY(GuiObject)
	local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
	return Px/Max, Py/May
end

local function CircleAnim(GuiObject, EndColour, StartColour)
	local PX, PY = GetXY(GuiObject)
	local Circle = Objects.new("Shadow")
	Circle.Size = UDim2.fromScale(0,0)
	Circle.Position = UDim2.fromScale(PX,PY)
	Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
	Circle.ZIndex = 200
	Circle.Parent = GuiObject
	local Size = GuiObject.AbsoluteSize.X
	TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
	spawn(function()
		wait(0.5)
		Circle:Destroy()
	end)
end

local UILibrary = Instance.new("ScreenGui")
local Load = Instance.new("Frame")
local UICornerLoad = Instance.new("UICorner")
local LoadButton = Instance.new("ImageButton")

UILibrary.Name = "UILibrary"
UILibrary.Parent = game:GetService("CoreGui").RobloxGui.Modules.Profile
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Load.Name = "Load"
Load.Parent = UILibrary
Load.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Load.BackgroundTransparency = 1
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0,100, 0,85)
Load.Size = UDim2.new(0, 0, 0, 0) --(0, 100, 0, 100)
Load.BackgroundTransparency = 1

local uitoggled = false
UserInputService.InputBegan:Connect(
	function(io, p)
		if io.KeyCode == Enum.KeyCode.RightControl then
			if uitoggled == false then
				uitoggled = true
				UILibrary.Enabled = false
			else
				UILibrary.Enabled = true
				uitoggled = false
			end
		end
	end
)

UICornerLoad.CornerRadius = UDim.new(0, 30)
UICornerLoad.Name = "UICornerLoad"
UICornerLoad.Parent = Load

LoadButton.Name = "LoadButton"
LoadButton.Parent = Load
LoadButton.AnchorPoint = Vector2.new(0.5, 0.5)
LoadButton.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.BackgroundTransparency = 1.000
LoadButton.Size = UDim2.new(0, 50, 0, 50)
LoadButton.Image = "http://www.roblox.com/asset/?id=14645512457" --ใส๋โลโก้
LoadButton.ImageTransparency = 1

local ClickFrame = Instance.new("Frame")

ClickFrame.Name = "ClickFrame"
ClickFrame.Parent = Load
ClickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickFrame.BackgroundTransparency = 1.000
ClickFrame.Position = UDim2.new(0, 0, 7.62939436e-08, 0)
ClickFrame.Size = UDim2.new(0, 0, 0, 0)

local SoundClick = Instance.new("Sound")

SoundClick.Name = "Sound Effect"
SoundClick.Parent = Load
SoundClick.SoundId = "rbxassetid://8055713313" 
SoundClick.Volume = 1

local SoundClick2 = Instance.new("Sound")

SoundClick2.Name = "Sound Effect"
SoundClick2.Parent = Load
SoundClick2.SoundId = "rbxassetid://3398620867" --
SoundClick2.Volume = 1


local Blur = Instance.new("BlurEffect")

Blur.Size = 0
Blur.Parent = game.Lighting

if game.Workspace.Camera.FieldOfView == 0 then
	return game.Workspace.Camera.FieldOfView == 0
end

local LoadText = Instance.new("Frame")
local UIListLayoutLoadText = Instance.new("UIListLayout")
local TitleLoad = Instance.new("TextLabel")

LoadText.Name = "LoadText"
LoadText.Parent = Load
LoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadText.BackgroundTransparency = 1.000
LoadText.Size = UDim2.new(0, 500, 0, 50)
LoadText.ClipsDescendants = true

UIListLayoutLoadText.Name = "UIListLayoutLoadText"
UIListLayoutLoadText.Parent = LoadText
UIListLayoutLoadText.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutLoadText.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutLoadText.SortOrder = Enum.SortOrder.LayoutOrder

TitleLoad.Name = "TitleLoad"
TitleLoad.Parent = LoadText
TitleLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.BackgroundTransparency = 1.000
TitleLoad.Size = UDim2.new(0, 200, 0, 50)
TitleLoad.Font = Enum.Font.Gotham
TitleLoad.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.TextSize = 14.000
TitleLoad.TextTransparency = 1

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local Scrollbar = Instance.new("Frame")
local LoadScrollbar = Instance.new("ImageButton")

Scrollbar.Name = "Scrollbar"
Scrollbar.Parent = Load
Scrollbar.Active = true
Scrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scrollbar.BackgroundTransparency = 1.000
Scrollbar.ClipsDescendants = true
Scrollbar.Position = UDim2.new(0.899999976, 0, -0.0199999232, 0)
Scrollbar.Size = UDim2.new(0, 50, 0, 51)

LoadScrollbar.Name = "LoadScrollbar"
LoadScrollbar.Parent = Scrollbar
LoadScrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadScrollbar.AnchorPoint = Vector2.new(0.5,0.5)
LoadScrollbar.BackgroundTransparency = 1.000
LoadScrollbar.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadScrollbar.Size = UDim2.new(0, 30, 0, 30)
LoadScrollbar.Image = "http://www.roblox.com/asset/?id=6031097225"
LoadScrollbar.ImageTransparency = 1
LoadScrollbar.Visible = false

local osday = Instance.new("TextLabel")

osday.Name = "osday"
osday.Parent = ClickFrame
osday.Active = true
osday.AnchorPoint = Vector2.new(0.5, 0.5)
osday.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
osday.BackgroundTransparency = 1.000
osday.Position = UDim2.new(0.5, 0, 0.699999988, 0)
osday.Size = UDim2.new(0, 384, 0, 30)
osday.Font = Enum.Font.GothamBold
osday.TextTransparency = 1
osday.TextColor3 = Color3.fromRGB(255, 255, 255)
osday.TextSize = 14.000

task.spawn(function()
	while task.wait() do
		pcall(function()
			osday.Text = os.date("%I:%M:%S".." | ".."%B %d, %Y")
		end)
	end
end)

local Title = Instance.new("TextLabel")

Title.Name = "Title"
Title.Parent = ClickFrame
Title.Active = true
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.5, 0, 0.280000001, 0)
Title.Size = UDim2.new(0, 384, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "BLOX FRUIT PREMIUM EDITION"
Title.TextTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 0, 127)
Title.TextSize = 14.000


function LoadFunction()

	TweenService:Create(
		game.Workspace.Camera,
		TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
		{FieldOfView = 70}
	):Play()

	TweenService:Create(
		Blur,
		TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
		{Size = 0}
	):Play()

	--TweenService:Create(
	--	Load,
	--	TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
	--	{Position = UDim2.new(0.5, 0, 0.5, 0)}
	--):Play()
	TweenService:Create(
		Load,
		TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
		{BackgroundTransparency = 0}
	):Play()
	wait(.5)
	TweenService:Create(
		LoadButton,
		TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
		{ImageTransparency = 0}
	):Play()

	LoadButton.MouseEnter:Connect(function()
		TweenService:Create(
			LoadButton,
			TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
			{Size = UDim2.new(0, 80, 0, 80)}
		):Play()
	end)

	LoadButton.MouseLeave:Connect(function()
		TweenService:Create(
			LoadButton,
			TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
			{Size = UDim2.new(0, 50, 0, 50)}
		):Play()
	end)

	local LoadFocus = false

	LoadButton.MouseButton1Down:Connect(function()
		if LoadFocus == false then 
			LoadFocus = false
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Rotation = 180}
			):Play()
			SoundClick2:Play()
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
				{ImageTransparency = 0}
			):Play()
			wait(.5)
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Rotation = 0}
			):Play()
			--SoundClick:Play()
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
				{ImageTransparency = 0}
			):Play()
			wait(.5)	
			
		end
	end)
end
LoadFunction()

-- เมื่อคลิกปุ่มใน ImageButton
LoadButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.F1,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,Enum.KeyCode.F1,false,game)
end)
--uiเปิดปิด


local PlaceName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

    if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
    
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)

do local GUI = game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("VectorHub");if GUI then GUI:Destroy();end;
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(object, TweenInfo.new(0.15), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local VectorHub = {}

function VectorHub:ToggleUi()
if game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("VectorHub").Enabled == true then -- oh am dumb
	game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("VectorHub").Enabled = false
else
	game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("VectorHub").Enabled = true
end
end

function VectorHub:Window(text,gamenme,logo,keybind)
    local hubname = text
    local gamename = gamenme
	local uihide = false
	local abc = false
	local logo = logo or 0
	local currentpage = ""
	local keybind = keybind or Enum.KeyCode.RightControl
	local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
	if gamename == "" then 
	    gamename = ""..PlaceName.Name
    end
	
	local VectorHub = Instance.new("ScreenGui") -- guess i am using hubname wrong
	VectorHub.Name = "VectorHub" -- wait 
	VectorHub.Parent = game:GetService("CoreGui").RobloxGui.Modules.Profile
	VectorHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Parent = VectorHub
	Main.ClipsDescendants = true
	Main.AnchorPoint = Vector2.new(0.5,0.5)
	Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 0, 0, 0)
	
	Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)

	local MCNR = Instance.new("UICorner")
	MCNR.Name = "MCNR"
	MCNR.Parent = Main

	local Top = Instance.new("Frame")
	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Top.Size = UDim2.new(0, 656, 0, 27)

	local TCNR = Instance.new("UICorner")
	TCNR.Name = "TCNR"
	TCNR.Parent = Top

	local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Top
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 10, 0, 1)
	Logo.Size = UDim2.new(0, 25, 0, 25)
	Logo.Image = ""

	local Name = Instance.new("TextLabel")
	Name.Name = "Name"
	Name.Parent = Top
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0.0609756112, 0, 0, 0)
	Name.Size = UDim2.new(0, 61, 0, 27)
	Name.Font = Enum.Font.GothamSemibold
	Name.Text = hubname
	Name.TextColor3 = Color3.fromRGB(0, 108, 219)
	Name.TextSize = 17.000

	local Hub = Instance.new("TextLabel")
	Hub.Name = "Hub"
	Hub.Parent = Top
	Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hub.BackgroundTransparency = 1.000
	Hub.Position = UDim2.new(0, 110, 0, 0)
	Hub.Size = UDim2.new(0, 81, 0, 27)
	Hub.Font = Enum.Font.GothamSemibold
	Hub.Text = "  | "..gamename
	Hub.TextColor3 = Color3.fromRGB(0, 108, 219)
	Hub.TextSize = 17.000
	Hub.TextXAlignment = Enum.TextXAlignment.Left

	local BindButton = Instance.new("TextButton")
	BindButton.Name = "BindButton"
	BindButton.Parent = Top
	BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BindButton.BackgroundTransparency = 1.000
	BindButton.Position = UDim2.new(0.847561002, 0, 0, 0)
	BindButton.Size = UDim2.new(0, 100, 0, 27)
	BindButton.Font = Enum.Font.GothamSemibold
	BindButton.Text = "[F1]"
	BindButton.TextColor3 = Color3.fromRGB(0, 108, 219)
	BindButton.TextSize = 13.000

	local Tab = Instance.new("Frame")
	Tab.Name = "Tab"
	Tab.Parent = Main
	Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Tab.Position = UDim2.new(0, 5, 0, 30)
	Tab.Size = UDim2.new(0, 150, 0, 365)

	local TCNR = Instance.new("UICorner")
	TCNR.Name = "TCNR"
	TCNR.Parent = Tab

	local ScrollTab = Instance.new("ScrollingFrame")
	ScrollTab.Name = "ScrollTab"
	ScrollTab.Parent = Tab
	ScrollTab.Active = true
	ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollTab.BackgroundTransparency = 1.000
	ScrollTab.Size = UDim2.new(0, 150, 0, 365)
	ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollTab.ScrollBarThickness = 0

	local PLL = Instance.new("UIListLayout")
	PLL.Name = "PLL"
	PLL.Parent = ScrollTab
	PLL.SortOrder = Enum.SortOrder.LayoutOrder
	PLL.Padding = UDim.new(0, 15)

	local PPD = Instance.new("UIPadding")
	PPD.Name = "PPD"
	PPD.Parent = ScrollTab
	PPD.PaddingLeft = UDim.new(0, 10)
	PPD.PaddingTop = UDim.new(0, 10)

	local Page = Instance.new("Frame")
	Page.Name = "Page"
	Page.Parent = Main
	Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Page.Position = UDim2.new(0.245426834, 0, 0.075000003, 0)
	Page.Size = UDim2.new(0, 490, 0, 365)

	local PCNR = Instance.new("UICorner")
	PCNR.Name = "PCNR"
	PCNR.Parent = Page

	local MainPage = Instance.new("Frame")
	MainPage.Name = "MainPage"
	MainPage.Parent = Page
	MainPage.ClipsDescendants = true
	MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainPage.BackgroundTransparency = 1.000
	MainPage.Size = UDim2.new(0, 490, 0, 365)

	local PageList = Instance.new("Folder")
	PageList.Name = "PageList"
	PageList.Parent = MainPage

	local UIPageLayout = Instance.new("UIPageLayout")

	UIPageLayout.Parent = PageList
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
	UIPageLayout.FillDirection = Enum.FillDirection.Vertical
	UIPageLayout.Padding = UDim.new(0, 15)
	UIPageLayout.TweenTime = 0.400
	UIPageLayout.GamepadInputEnabled = false
	UIPageLayout.ScrollWheelInputEnabled = false
	UIPageLayout.TouchInputEnabled = false
	
	MakeDraggable(Top,Main)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[yoo] then
			if uihide == false then
				uihide = true
				Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
			else
				uihide = false
				Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
			end
		end
	end)
	
	local uitab = {}
	
	function uitab:Tab(text)
		local TabButton = Instance.new("TextButton")
		TabButton.Parent = ScrollTab
		TabButton.Name = text.."Server"
		TabButton.Text = text
		TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	    TabButton.BorderColor3 = Color3.fromRGB(0, 108, 219)
        TabButton.BorderSizePixel = 2
		TabButton.Size = UDim2.new(0, 130, 0, 23)
		TabButton.Font = Enum.Font.GothamSemibold
		TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
		TabButton.TextSize = 15.000
		TabButton.TextTransparency = 0.500

		local MainFramePage = Instance.new("ScrollingFrame")
		MainFramePage.Name = text.."_Page"
		MainFramePage.Parent = PageList
		MainFramePage.Active = true
		MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainFramePage.BackgroundTransparency = 1.000
		MainFramePage.BorderSizePixel = 0
		MainFramePage.Size = UDim2.new(0, 490, 0, 365)
		MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
		MainFramePage.ScrollBarThickness = 0
		
		local UIPadding = Instance.new("UIPadding")
		local UIListLayout = Instance.new("UIListLayout")
		
		UIPadding.Parent = MainFramePage
		UIPadding.PaddingLeft = UDim.new(0, 10)
		UIPadding.PaddingTop = UDim.new(0, 10)

		UIListLayout.Padding = UDim.new(0,15)
		UIListLayout.Parent = MainFramePage
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		
		TabButton.MouseButton1Click:Connect(function()
			for i,v in next, ScrollTab:GetChildren() do
				if v:IsA("TextButton") then
					TweenService:Create(
						v,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end
				TweenService:Create(
					TabButton,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end
			for i,v in next, PageList:GetChildren() do
				currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
				if v.Name == currentpage then
					UIPageLayout:JumpTo(v)
				end
			end
		end)

		if abc == false then
			for i,v in next, ScrollTab:GetChildren() do
				if v:IsA("TextButton") then
					TweenService:Create(
						v,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end
				TweenService:Create(
					TabButton,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end
			UIPageLayout:JumpToIndex(1)
			abc = true
		end
		
		game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
				ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
			end)
		end)
		
		local main = {}
		function main:Button(text,callback)
			local Button = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local TextBtn = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local Black = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			
			Button.Name = "Button"
			Button.Parent = MainFramePage
			Button.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Button.Size = UDim2.new(0, 470, 0, 31)
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Button
			
			TextBtn.Name = "TextBtn"
			TextBtn.Parent = Button
			TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45) 
			TextBtn.Position = UDim2.new(0, 1, 0, 1)
			TextBtn.Size = UDim2.new(0, 468, 0, 29)
			TextBtn.AutoButtonColor = false
			TextBtn.Font = Enum.Font.GothamSemibold
			TextBtn.Text = text
			TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextBtn.TextSize = 15.000
			
			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBtn
			
			Black.Name = "Black"
			Black.Parent = Button
			Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Black.BackgroundTransparency = 1.000
			Black.BorderSizePixel = 0
			Black.Position = UDim2.new(0, 1, 0, 1)
			Black.Size = UDim2.new(0, 468, 0, 29)
			
			UICorner_3.CornerRadius = UDim.new(0, 5)
			UICorner_3.Parent = Black

			TextBtn.MouseEnter:Connect(function()
				TweenService:Create(
					Black,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{BackgroundTransparency = 0.7}
				):Play()
			end)
			TextBtn.MouseLeave:Connect(function()
				TweenService:Create(
					Black,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{BackgroundTransparency = 1}
				):Play()
			end)
			TextBtn.MouseButton1Click:Connect(function()
				TextBtn.TextSize = 0
				TweenService:Create(
					TextBtn,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextSize = 15}
				):Play()
				callback()
			end)
		end
		function main:Toggle(text,config,callback)
			config = config or false
			local toggled = config
			local Toggle = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Button = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local Label = Instance.new("TextLabel")
			local ToggleImage = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local Circle = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")

			Toggle.Name = "Toggle"
			Toggle.Parent = MainFramePage
			Toggle.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Toggle.Size = UDim2.new(0, 470, 0, 31)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Toggle

			Button.Name = "Button"
			Button.Parent = Toggle
			Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Button.Position = UDim2.new(0, 1, 0, 1)
			Button.Size = UDim2.new(0, 468, 0, 29)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 11.000

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Button

			Label.Name = "Label"
			Label.Parent = Toggle
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Position = UDim2.new(0, 1, 0, 1)
			Label.Size = UDim2.new(0, 468, 0, 29)
			Label.Font = Enum.Font.GothamSemibold
			Label.Text = text
			Label.TextColor3 = Color3.fromRGB(225, 225, 225)
			Label.TextSize = 15.000

			ToggleImage.Name = "ToggleImage"
			ToggleImage.Parent = Toggle
			ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			ToggleImage.Position = UDim2.new(0, 415, 0, 5)
			ToggleImage.Size = UDim2.new(0, 45, 0, 20)

			UICorner_3.CornerRadius = UDim.new(0, 10)
			UICorner_3.Parent = ToggleImage

			Circle.Name = "Circle"
			Circle.Parent = ToggleImage
			Circle.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
			Circle.Position = UDim2.new(0, 2, 0, 2)
			Circle.Size = UDim2.new(0, 16, 0, 16)

			UICorner_4.CornerRadius = UDim.new(0, 10)
			UICorner_4.Parent = Circle

			Button.MouseButton1Click:Connect(function()
				if toggled == false then
					toggled = true
					Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.2,true)
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(0, 108, 219)}
					):Play()
				else
					toggled = false
					Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2,true)
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(227, 60, 110)}
					):Play()
				end
				pcall(callback,toggled)
			end)

			if config == true then
				toggled = true
				Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.4,true)
				TweenService:Create(
					Circle,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(0, 108, 219)}
				):Play()
				pcall(callback,toggled)
			end
		end
		function main:Dropdown(text,option,callback)
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 470, 0, 31)
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown
			
			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 470, 0, 31)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000
			
			DropScroll.Name = "DropScroll"
			DropScroll.Parent = DropTitle
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 470, 0, 100)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropScroll.ScrollBarThickness = 3
			
			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)
			
			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 445, 0, 6)
			DropImage.Rotation = 180.000
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://6031090990"
			
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 470, 0, 31)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 460, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0,470,0,131),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 470, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end
			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end

		function main:Slider(text,min,max,set,callback)
			local Slider = Instance.new("Frame")
			local slidercorner = Instance.new("UICorner")
			local sliderr = Instance.new("Frame")
			local sliderrcorner = Instance.new("UICorner")
			local SliderLabel = Instance.new("TextLabel")
			local HAHA = Instance.new("Frame")
			local AHEHE = Instance.new("TextButton")
			local bar = Instance.new("Frame")
			local bar1 = Instance.new("Frame")
			local bar1corner = Instance.new("UICorner")
			local barcorner = Instance.new("UICorner")
			local circlebar = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local slidervalue = Instance.new("Frame")
			local valuecorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = MainFramePage
			Slider.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Slider.BackgroundTransparency = 0
			Slider.Size = UDim2.new(0, 470, 0, 51)

			slidercorner.CornerRadius = UDim.new(0, 5)
			slidercorner.Name = "slidercorner"
			slidercorner.Parent = Slider

			sliderr.Name = "sliderr"
			sliderr.Parent = Slider
			sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			sliderr.Position = UDim2.new(0, 1, 0, 1)
			sliderr.Size = UDim2.new(0, 468, 0, 49)

			sliderrcorner.CornerRadius = UDim.new(0, 5)
			sliderrcorner.Name = "sliderrcorner"
			sliderrcorner.Parent = sliderr

			SliderLabel.Name = "SliderLabel"
			SliderLabel.Parent = sliderr
			SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderLabel.BackgroundTransparency = 1.000
			SliderLabel.Position = UDim2.new(0, 15, 0, 0)
			SliderLabel.Size = UDim2.new(0, 180, 0, 26)
			SliderLabel.Font = Enum.Font.GothamSemibold
			SliderLabel.Text = text
			SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			SliderLabel.TextSize = 16.000
			SliderLabel.TextTransparency = 0
			SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

			HAHA.Name = "HAHA"
			HAHA.Parent = sliderr
			HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HAHA.BackgroundTransparency = 1.000
			HAHA.Size = UDim2.new(0, 468, 0, 29)

			AHEHE.Name = "AHEHE"
			AHEHE.Parent = sliderr
			AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AHEHE.BackgroundTransparency = 1.000
			AHEHE.Position = UDim2.new(0, 10, 0, 35)
			AHEHE.Size = UDim2.new(0, 448, 0, 5)
			AHEHE.Font = Enum.Font.SourceSans
			AHEHE.Text = ""
			AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
			AHEHE.TextSize = 14.000

			bar.Name = "bar"
			bar.Parent = AHEHE
			bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			bar.Size = UDim2.new(0, 448, 0, 5)

			bar1.Name = "bar1"
			bar1.Parent = bar
			bar1.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			bar1.BackgroundTransparency = 0
			bar1.Size = UDim2.new(set/max, 0, 0, 5)

			bar1corner.CornerRadius = UDim.new(0, 5)
			bar1corner.Name = "bar1corner"
			bar1corner.Parent = bar1

			barcorner.CornerRadius = UDim.new(0, 5)
			barcorner.Name = "barcorner"
			barcorner.Parent = bar

			circlebar.Name = "circlebar"
			circlebar.Parent = bar1
			circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			circlebar.Position = UDim2.new(1, -2, 0, -3)
			circlebar.Size = UDim2.new(0, 10, 0, 10)

			UICorner.CornerRadius = UDim.new(0, 100)
			UICorner.Parent = circlebar

			slidervalue.Name = "slidervalue"
			slidervalue.Parent = sliderr
			slidervalue.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			slidervalue.BackgroundTransparency = 0
			slidervalue.Position = UDim2.new(0, 395, 0, 5)
			slidervalue.Size = UDim2.new(0, 65, 0, 18)

			valuecorner.CornerRadius = UDim.new(0, 5)
			valuecorner.Name = "valuecorner"
			valuecorner.Parent = slidervalue

			TextBox.Parent = slidervalue
			TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextBox.Position = UDim2.new(0, 1, 0, 1)
			TextBox.Size = UDim2.new(0, 63, 0, 16)
			TextBox.Font = Enum.Font.GothamSemibold
			TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextBox.TextSize = 9.000
			TextBox.Text = set
			TextBox.TextTransparency = 0

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBox

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			if Value == nil then
				Value = set
				pcall(function()
					callback(Value)
				end)
			end
			
			AHEHE.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
				circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
				moveconnection = mouse.Move:Connect(function()
					TextBox.Text = Value
					Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
					pcall(function()
						callback(Value)
					end)
					bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
					circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
						circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch  then
					Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
					TextBox.Text = Value
				end
			end)

			TextBox.FocusLost:Connect(function()
				if tonumber(TextBox.Text) > max then
					TextBox.Text  = max
				end
				bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
				pcall(callback, TextBox.Text)
			end)
		end

		function main:Textbox(text,disappear,callback)
			local Textbox = Instance.new("Frame")
			local TextboxCorner = Instance.new("UICorner")
			local Textboxx = Instance.new("Frame")
			local TextboxxCorner = Instance.new("UICorner")
			local TextboxLabel = Instance.new("TextLabel")
			local txtbtn = Instance.new("TextButton")
			local RealTextbox = Instance.new("TextBox")
			local UICorner = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = MainFramePage
			Textbox.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Textbox.BackgroundTransparency = 0
			Textbox.Size = UDim2.new(0, 470, 0, 31)

			TextboxCorner.CornerRadius = UDim.new(0, 5)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			Textboxx.Name = "Textboxx"
			Textboxx.Parent = Textbox
			Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Textboxx.Position = UDim2.new(0, 1, 0, 1)
			Textboxx.Size = UDim2.new(0, 468, 0, 29)

			TextboxxCorner.CornerRadius = UDim.new(0, 5)
			TextboxxCorner.Name = "TextboxxCorner"
			TextboxxCorner.Parent = Textboxx

			TextboxLabel.Name = "TextboxLabel"
			TextboxLabel.Parent = Textbox
			TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxLabel.BackgroundTransparency = 1.000
			TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
			TextboxLabel.Text = text
			TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
			TextboxLabel.Font = Enum.Font.GothamSemibold
			TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextboxLabel.TextSize = 16.000
			TextboxLabel.TextTransparency = 0
			TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

			txtbtn.Name = "txtbtn"
			txtbtn.Parent = Textbox
			txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			txtbtn.BackgroundTransparency = 1.000
			txtbtn.Position = UDim2.new(0, 1, 0, 1)
			txtbtn.Size = UDim2.new(0, 468, 0, 29)
			txtbtn.Font = Enum.Font.SourceSans
			txtbtn.Text = ""
			txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			txtbtn.TextSize = 14.000

			RealTextbox.Name = "RealTextbox"
			RealTextbox.Parent = Textbox
			RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			RealTextbox.BackgroundTransparency = 0
			RealTextbox.Position = UDim2.new(0, 360, 0, 4)
			RealTextbox.Size = UDim2.new(0, 100, 0, 24)
			RealTextbox.Font = Enum.Font.GothamSemibold
			RealTextbox.Text = ""
			RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
			RealTextbox.TextSize = 11.000
			RealTextbox.TextTransparency = 0

			RealTextbox.FocusLost:Connect(function()
				callback(RealTextbox.Text)
				if disappear then
					RealTextbox.Text = ""
				end
			end)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = RealTextbox
		end
		function main:Label(text)
			local Label = Instance.new("TextLabel")
			local PaddingLabel = Instance.new("UIPadding")
			local labelfunc = {}
	
			Label.Name = "Label"
			Label.Parent = MainFramePage
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 470, 0, 20)
			Label.Font = Enum.Font.GothamSemibold
			Label.TextColor3 = Color3.fromRGB(225, 225, 225)
			Label.TextSize = 16.000
			Label.Text = text
			Label.TextXAlignment = Enum.TextXAlignment.Left

			PaddingLabel.PaddingLeft = UDim.new(0,15)
			PaddingLabel.Parent = Label
			PaddingLabel.Name = "PaddingLabel"
	
			function labelfunc:Set(newtext)
				Label.Text = newtext
			end
			return labelfunc
		end

		function main:Seperator(text)
			local Seperator = Instance.new("Frame")
			local Sep1 = Instance.new("Frame")
			local Sep2 = Instance.new("TextLabel")
			local Sep3 = Instance.new("Frame")
			
			Seperator.Name = "Seperator"
			Seperator.Parent = MainFramePage
			Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.BackgroundTransparency = 1.000
			Seperator.Size = UDim2.new(0, 470, 0, 20)
			
			Sep1.Name = "Sep1"
			Sep1.Parent = Seperator
			Sep1.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Sep1.BorderSizePixel = 0
			Sep1.Position = UDim2.new(0, 0, 0, 10)
			Sep1.Size = UDim2.new(0, 80, 0, 1)
			
			Sep2.Name = "Sep2"
			Sep2.Parent = Seperator
			Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.BackgroundTransparency = 1.000
			Sep2.Position = UDim2.new(0, 185, 0, 0)
			Sep2.Size = UDim2.new(0, 100, 0, 20)
			Sep2.Font = Enum.Font.GothamSemibold
			Sep2.Text = text
			Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.TextSize = 14.000
			
			Sep3.Name = "Sep3"
			Sep3.Parent = Seperator
			Sep3.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Sep3.BorderSizePixel = 0
			Sep3.Position = UDim2.new(0, 390, 0, 10)
			Sep3.Size = UDim2.new(0, 80, 0, 1)
		end

		function main:Line()
			local Linee = Instance.new("Frame")
			local Line = Instance.new("Frame")
			
			Linee.Name = "Linee"
			Linee.Parent = MainFramePage
			Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Linee.BackgroundTransparency = 1.000
			Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
			Linee.Size = UDim2.new(0, 470, 0, 20)
			
			Line.Name = "Line"
			Line.Parent = Linee
			Line.BackgroundColor3 = Color3.fromRGB(0, 108, 219)
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 0, 0, 10)
			Line.Size = UDim2.new(0, 470, 0, 1)
		end
		return main
	end
	return uitab
end


local id = game.PlaceId
if id == 6918802270 then
    World1 = true;
elseif id == 14979402479 then
    World2 = true;
else
    game:Shutdown()
end; 


local Library = VectorHub:Window("Ganteng Hub [Haze Piece]","","",Enum.KeyCode.F1);

if _G.Mode == "English" then
page1 = Library:Tab("Main")
else
end
if _G.Mode == "English" then
page2 = Library:Tab("setting")
else
end
if _G.Mode == "English" then
page3 = Library:Tab("Teleport")
else
end
if _G.Mode == "English" then
page4 = Library:Tab("Shop")
else

end

if _G.Mode == "English" then
    page1:Seperator("Main")
else

end
local levelText = game.Players.LocalPlayer.PlayerGui.HUD.MainFrame.Main.Holder.NumberStats.Level.Stat.Text
local level = tonumber(string.match(levelText, "%d+"))
if level == 1 or (level >= 2 and level <= 10) then
end

--[[FARMBOSSLV
function checklevel()
    local levelText = game.Players.LocalPlayer.PlayerGui.HUD.MainFrame.Main.Holder.NumberStats.Level.Stat.Text
    local level = tonumber(string.match(levelText, "%d+"))

    if level >= 1 and level <= 10 then
        Mon = "Thief"
        questlv = "Level 1"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-2415.621337890625, 44.74401092529297, -3266.807373046875)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 10 and level <= 25 then
        Mon = "Bandit"
        questlv = "Level 10"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1970.1953125, 44.74400329589844, -3218.418212890625)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 25 and level <= 40 then
        Mon = "Bandit Boss"
        questlv = "Level 25"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1943.2662353515625, 66.89073181152344, -3394.779052734375)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 40 and level <= 60 then
        Mon = "Pirate Clown"
        questlv = "Level 40"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Clown Island"
        CFrameMon = CFrame.new(-2351.299560546875, 14.052057266235352, -327.3381652832031)
        CFrameQuest = CFrame.new(-2275.45849609375, 13.928051948547363, -187.22216796875)
    elseif level >= 60 and level <= 90 then
        Mon = "Clown Boss"
        questlv = "Level 60"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Clown Island"
        CFrameMon = CFrame.new(-2255.978759765625, 34.34444046020508, 65.70915985107422)
        CFrameQuest = CFrame.new(-2275.45849609375, 13.928051948547363, -187.22216796875)
    elseif level >= 120 and level <= 200 then
        Mon = "Shark Boss"
        questlv = "Level 120"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Shark Park"
        CFrameMon = CFrame.new(-4809.6708984375, 7.537082672119141, -3047.20947265625)
        CFrameQuest = CFrame.new(-4815.61572265625, 11.840313911437988, -3186.67431640625)
    elseif level >= 200 and level <= 250 then
        Mon = "Bomb Boss"
        questlv = "Level 200"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert Ruins"
        CFrameMon = CFrame.new(-4994.55810546875, 13.781256675720215, 79.60830688476562)
        CFrameQuest = CFrame.new(-4943.4287109375, 13.90863037109375, -331.6298828125)
    elseif level >= 300 and level <= 400 then
        Mon = "Krieg Pirate"
        questlv = "Level 250"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("5")
        islandName = "Sea Restaurant"
        CFrameMon = CFrame.new(-5960.5546875, 7.21144437789917, 2305.033447265625)
        CFrameQuest = CFrame.new(-6002.30419921875, 54.453330993652344, 2418.816650390625)
    elseif level >= 400 and level <= 550 then
        Mon = "Tashii"
        questlv = "Level 400"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("6")
        islandName = "Logue Town"
        CFrameMon = CFrame.new(-3048.50391, 20.0341797, 2417.05713, 0.999785423, 0, 0.0207161717, 0, 1, 0, -0.0207161717,
            0, 0.999785423)
        CFrameQuest = CFrame.new(-2985.597900390625, 21.29482078552246, 2175.296875)
    elseif level >= 550 and level <= 650 then
        Mon = "King Gorilla"
        questlv = "Level 550"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7")
        islandName = "Tall Woods"
        CFrameMon = CFrame.new(-62.9837341, 22.8242512, 2898.15479, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        CFrameQuest = CFrame.new(-58.68986511230469, 10.858784675598145, 2301.73876953125)
    elseif level >= 650 and level <= 750 then
        Mon = "Marine Captain"
        questlv = "Level 650"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("8")
        islandName = "Marine Base Town"
        CFrameMon = CFrame.new(298.652344, 129.046875, 6221.51221, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        CFrameQuest = CFrame.new(212.7763671875, 68.31398010253906, 5945.423828125)
    elseif level >= 750 and level <= 900 then
        Mon = "Minotaur"
        questlv = "Level 750"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("9")
        islandName = "Three Islands"
        CFrameMon = CFrame.new(-2864.16016, 857.220459, 5662.17139, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        CFrameQuest = CFrame.new(-2479.5302734375, 855.3377075195312, 5694.59716796875)
    elseif level >= 900 and level <= 1100 then
        Mon = "Ice Admiral"
        questlv = "Level 900"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10")
        islandName = "Marine HQ"
        CFrameMon = CFrame.new(-6770.55664, 206.675781, 6890.5459, 0.739359975, -0, -0.673310399, 0, 1, -0, 0.673310399,
            0, 0.739359975)
        CFrameQuest = CFrame.new(-6244.291015625, 20.89983558654785, 6498.083984375)
    elseif level >= 1100 and level <= 1250 then
        Mon = "Thunder God"
        questlv = "Level 1100"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11")
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(3165.00928, 2030.35474, 1479.61816, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 1250 and level <= 1400 then
        Mon = "Revolutionary Boss"
        questlv = "Level 1100"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("12")
        islandName = "Revolutionary Base"
        CFrameMon = CFrame.new(3446.61743, 35.6943359, 3759.94849, 0.0189509988, 0.00317387562, -0.999815464,
            -3.00769461e-05, 0.999994934, 0.00317387562, 0.999820471, -3.00769461e-05, 0.0189509988)
        CFrameQuest = CFrame.new(2983.1845703125, 1896.568603515625, 1235.028076171875)
    elseif level >= 1400 and level <= 1550 then
        Mon = "Warden"
        questlv = "Level 1400"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("13")
        islandName = "Impel Jail"
        CFrameMon = CFrame.new(3817.0918, 11.7392578, 7128.38232, 0.914908111, -4.97327419e-05, 0.403662145,
            -0.00123225141, 0.999994993, 0.00291612512, -0.403660238, -0.00316539966, 0.914903462)
        CFrameQuest = CFrame.new(3666.80078125, 35.52538299560547, 3742.72216796875)
    elseif level >= 1550 and level <= 1700 then
        Mon = "Snow Harpy"
        questlv = "Level 1550"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("14")
        islandName = "Half Cold"
        CFrameMon = CFrame.new(3501.61523, 42.2993164, -2440.08838, -0.482544422, 5.09484671e-05, 0.875871956,
            0.00277323904, 0.999995053, 0.00146969198, -0.875867546, 0.0031381927, -0.482542157)
        CFrameQuest = CFrame.new(3592.13720703125, 16.761329650878906, 6761.2529296875)
    elseif level >= 1700 and level <= 1850 then
        Mon = "Neptune"
        questlv = "Level 1700"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("15")
        islandName = "Fishman Island"
        CFrameMon = CFrame.new(7255.5400390625, 140.0634765625, -2492.09130859375)
        CFrameQuest = CFrame.new(2681.619140625, 17.06586265563965, -2522.9970703125)
    elseif level >= 1850 and level <= 2000 then
        Mon = "Shiryu"
        questlv = "Level 1850"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("16")
        islandName = "Skull Island"
        CFrameMon = CFrame.new(7276.16552734375, 122.013671875, 425.2348327636719)
        CFrameQuest = CFrame.new(6901.212890625, 11.682999610900879, -2831.965087890625)
    elseif level >= 2000 and level <= 2150 then
        Mon = "G4 Boss"
        questlv = "Level 2000"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("17")
        islandName = "Bubble Island"
        CFrameMon = CFrame.new(6829.583984375, 59.07470703125, 3137.85888671875)
        CFrameQuest = CFrame.new(6801.58984375, 14.959320068359375, 67.75679779052734)
    elseif level >= 2150 and level <= 2200 then
        Mon = "Ryummy"
        questlv = "Level 2150"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("18")
        islandName = "Thriller Boat"
        CFrameMon = CFrame.new(7406.912109375, 118.8408203125, 7056.98828125)
        CFrameQuest = CFrame.new(7148.8916015625, 15.03661823272705, 2796.40869140625)
    end
end
FARMBOSSLV]]
function checklevel()
    local levelText = game.Players.LocalPlayer.PlayerGui.HUD.MainFrame.Main.Holder.NumberStats.Level.Stat.Text
    local level = tonumber(string.match(levelText, "%d+"))

    if level >= 1 and level <= 10 then
        Mon = "Thief"
        questlv = "Level 1"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-2415.621337890625, 44.74401092529297, -3266.807373046875)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 10 and level <= 40 then
        Mon = "Bandit"
        questlv = "Level 10"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1970.1953125, 44.74400329589844, -3218.418212890625)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 25 and level <= 40 then
        Mon = "Bandit Boss"
        questlv = "Level 25"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1943.2662353515625, 66.89073181152344, -3394.779052734375)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 40 and level <= 90 then
        Mon = "Pirate Clown"
        questlv = "Level 40"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Clown Island"
        CFrameMon = CFrame.new(-2351.299560546875, 14.052057266235352, -327.3381652832031)
        CFrameQuest = CFrame.new(-2275.45849609375, 13.928051948547363, -187.22216796875)
    elseif level >= 90 and level <= 160 then
        Mon = "Fishman"
        questlv = "Level 90"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Shark Park"
        CFrameMon = CFrame.new(-4889.72802734375, 12.14794921875, -3352.36376953125)
        CFrameQuest = CFrame.new(-4819.4365234375, 11.811530113220215, -3186.21630859375)
    elseif level >= 160 and level <= 250 then
        Mon = "Desert Thief"
        questlv = "Level 160"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert Ruins"
        CFrameMon = CFrame.new(-4930.26123046875, 14.233585357666016, -206.42727661132812)
        CFrameQuest = CFrame.new(-4943.4287109375, 13.90863037109375, -331.6298828125)
    elseif level >= 250 and level <= 350 then
        Mon = "Krieg Pirate"
        questlv = "Level 250"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("5")
        islandName = "Sea Restaurant"
        CFrameMon = CFrame.new(-5960.5546875, 7.21144437789917, 2305.033447265625)
        CFrameQuest = CFrame.new(-6002.30419921875, 54.453330993652344, 2418.816650390625)
    elseif level >= 350 and level <= 450 then
        Mon = "Marine Recruit"
        questlv = "Level 350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("6")
        islandName = "Logue Town"
        CFrameMon = CFrame.new(-2878.84619140625, 21.4951171875, 2050.003173828125)
        CFrameQuest = CFrame.new(-2985.597900390625, 21.29482078552246, 2175.296875)
    elseif level >= 450 and level <= 500 then
        Mon = "Monkey"
        questlv = "Level 450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7")
        islandName = "Tall Woods"
        CFrameMon = CFrame.new(-221.78125, 9.39697265625, 2382.0712890625)
        CFrameQuest = CFrame.new(-58.68986511230469, 10.858784675598145, 2301.73876953125)
    elseif level >= 500 and level <= 600 then
        Mon = "Gorilla"
        questlv = "Level 500"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7")
        islandName = "Tall Woods"
        CFrameMon = CFrame.new(507.75439453125, 10.72802734375, 2259.437744140625)
        CFrameQuest = CFrame.new(-58.68986511230469, 10.858784675598145, 2301.73876953125)
    elseif level >= 600 and level <= 700 then
        Mon = "Marine Grunt"
        questlv = "Level 600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("8")
        islandName = "Marine Base Town"
        CFrameMon = CFrame.new(226.05148315429688, 12.4345703125, 5619.0439453125)
        CFrameQuest = CFrame.new(212.7763671875, 68.31398010253906, 5945.423828125)
    elseif level >= 700 and level <= 800 then
        Mon = "Satyr"
        questlv = "Level 700"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("9")
        islandName = "Three Islands"
        CFrameMon = CFrame.new(-2469.349609375, 855.4013671875, 5938.0400390625)
        CFrameQuest = CFrame.new(-2479.5302734375, 855.3377075195312, 5694.59716796875)
    elseif level >= 800 and level <= 900 then
        Mon = "Elite Marine"
        questlv = "Level 800"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10")
        islandName = "Marine HQ"
        CFrameMon = CFrame.new(-6146.212890625, 19.97900390625, 6742.90380859375)
        CFrameQuest = CFrame.new(-6244.291015625, 20.89983558654785, 6498.083984375)
    elseif level >= 900 and level <= 950 then
        Mon = "Ice Admiral"
        questlv = "Level 900"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10")
        islandName = "Marine HQ"
        CFrameMon = CFrame.new(-6770.556640625, 206.6758575439453, 6890.5458984375)
        CFrameQuest = CFrame.new(-6244.291015625, 20.89983558654785, 6498.083984375)
    elseif level >= 950 and level <= 1000 then
        Mon = "Sandorian Warrior"
        questlv = "Level 950"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11")
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(2844.99072265625, 1099.0625, 317.13885498046875)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1000 and level <= 1050 then
        Mon = "Divine Soldier"
        questlv = "Level 1000"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11")
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(3037.369384765625, 1158.702880859375, 735.570068359375)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1050 and level <= 1050 then
        Mon = "Holy Soldier"
        questlv = "Level 1050"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("12") --11
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(3081.501953125, 2030.39892578125, 1307.1292724609375)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1150 and level <= 1200 then
        Mon = "Revolutionary"
        questlv = "Level 1150"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("13")
        islandName = "Revolutionary Base"
        CFrameMon = CFrame.new(3488.315673828125, 35.53047561645508, 3925.003173828125)
        CFrameQuest = CFrame.new(3666.80078125, 35.52538299560547, 3742.72216796875)
    elseif level >= 1200 and level <= 1300 then
        Mon = "Revolutionary Elite"
        questlv = "Level 1200"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("13")
        islandName = "Revolutionary Base"
        CFrameMon = CFrame.new(3604.13671875, 35.37158203125, 3698.8837890625)
        CFrameQuest = CFrame.new(3666.80078125, 35.52538299560547, 3742.72216796875)
    elseif level >= 1300 and level <= 1350 then
        Mon = "Impel Guard"
        questlv = "Level 1300"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("14")
        islandName = "Impel Jail"
        CFrameMon = CFrame.new(3719.19140625, 10.333984375, 6907.6962890625)
        CFrameQuest = CFrame.new(3591.172607421875, 16.74056625366211, 6755.71630859375)
    elseif level >= 1350 and level <= 1450 then
        Mon = "Impel Elite"
        questlv = "Level 1350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("14") --
        islandName = "Impel Jail"
        CFrameMon = CFrame.new(3776.63916015625, 10.171875, 7050.05322265625)
        CFrameQuest = CFrame.new(3591.172607421875, 16.74056625366211, 6755.71630859375)
    elseif level >= 1450 and level <= 1600 then
        Mon = "Corrupt Marine"
        questlv = "Level 1450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("15")
        islandName = "Cold Island"
        CFrameMon = CFrame.new(2682.24609375, 17.068359375, -2455.902587890625)
        CFrameQuest = CFrame.new(2841.9619140625, 17.068359375, -2447.498046875)
    elseif level >= 1600 and level <= 1650 then
        Mon = "Island Fishman"
        questlv = "Level 1600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("16")
        islandName = "Fishman Island"
        CFrameMon = CFrame.new(6853.779296875, 47.6552734375, -3163.587158203125)
        CFrameQuest = CFrame.new(6896.49755859375, 11.743340492248535, -2831.961669921875)
    elseif level >= 1650 and level <= 1750 then
        Mon = "Fishman Elite"
        questlv = "Level 1650"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("16")
        islandName = "Fishman Island"
        CFrameMon = CFrame.new(7014.7138671875, 12.642110824584961, -2803.061767578125)
        CFrameQuest = CFrame.new(6896.49755859375, 11.743340492248535, -2831.961669921875)
    elseif level >= 1750 and level <= 1800 then
        Mon = "Skull Pirate"
        questlv = "Level 1750"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("17")
        islandName = "Skull Island"
        CFrameMon = CFrame.new(6771.54296875, 15.010252952575684, 333.9873046875)
        CFrameQuest = CFrame.new(6806.11865234375, 14.699026107788086, 68.90123748779297)
    elseif level >= 1800 and level <= 1900 then
        Mon = "Pirate Elite"
        questlv = "Level 1800"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("17")
        islandName = "Skull Island"
        CFrameMon = CFrame.new(7211.31884765625, 50.2275390625, 160.16848754882812)
        CFrameQuest = CFrame.new(6806.11865234375, 14.699026107788086, 68.90123748779297)
    elseif level >= 1900 and level <= 1950 then
        Mon = "Pirate"
        questlv = "Level 1900"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("18")
        islandName = "Bubble Island"
        CFrameMon = CFrame.new(7087.83251953125, 15.541773796081543, 3019.6650390625)
        CFrameQuest = CFrame.new(7148.8916015625, 15.03661823272705, 2796.40869140625)
    elseif level >= 1950 and level <= 2050 then
        Mon = "Armored Marine"
        questlv = "Level 1950"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("18")
        islandName = "Bubble Island"
        CFrameMon = CFrame.new(7065.09326171875, 15.39603328704834, 2572.124755859375)
        CFrameQuest = CFrame.new(7148.8916015625, 15.03661823272705, 2796.40869140625)
    elseif level >= 2050 and level <= 2100 then
        Mon = "Skeleton"
        questlv = "Level 2050"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("19")
        islandName = "Thriller Boat"
        CFrameMon = CFrame.new(7474.28759765625, 12.1201171875, 6661.0654296875)
        CFrameQuest = CFrame.new(7318.49512, 13.4426918, 6796.65039, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291,
            0, 0.707134247)
    elseif level >= 2100 and level <= 2200 then
        Mon = "Mummy"
        questlv = "Level 2100"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("19")
        islandName = "Thriller Boat"
        CFrameMon = CFrame.new(7662.3408203125, 12.01318359375, 6854.0029296875)
        CFrameQuest = CFrame.new(7318.49512, 13.4426918, 6796.65039, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291,
            0, 0.707134247)
        --[[Sea2]]
    elseif level >= 2200 and level <= 2250 then
        Mon = "Samurai"
        questlv = "Level 2200"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(2585.486328125, 35.242000579833984, 16508.53515625)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2250 and level <= 2300 then
        Mon = "Strong Samurai"
        questlv = "Level 2250"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(2585.486328125, 35.242000579833984, 16508.53515625)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2300 and level <= 2350 then
        Mon = "Shinobi"
        questlv = "Level 2300"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(1849.009521484375, 25.292816162109375, 16038.0498046875)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2350 and level <= 2400 then
        Mon = "Shinobi Elite"
        questlv = "Level 2350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(1849.009521484375, 25.292816162109375, 16038.0498046875)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2400 and level <= 2450 then
        Mon = "Officer Guard"
        questlv = "Level 2400"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Udon Prison"
        CFrameMon = CFrame.new(2265.251953125, 9.229000091552734, 11661.501953125)
        CFrameQuest = CFrame.new(2130.406005859375, 9.07800006866455, 11481.5087890625)
    elseif level >= 2450 and level <= 2550 then
        Mon = "Sergeant Guard"
        questlv = "Level 2450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Udon Prison"
        CFrameMon = CFrame.new(2184.52099609375, 102.20899963378906, 11302.3154296875)
        CFrameQuest = CFrame.new(2130.406005859375, 9.07800006866455, 11481.5087890625)
    elseif level >= 2550 and level <= 2600 then
        Mon = "Graverobber"
        questlv = "Level 2550"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Snowy Graveyard"
        CFrameMon = CFrame.new(6880.1904296875, 14.87802505493164, 15826.48046875)
        CFrameQuest = CFrame.new(7243.8427734375, 50.86800003051758, 15919.2685546875)
    elseif level >= 2600 and level <= 2700 then
        Mon = "Elite Graverobber"
        questlv = "Level 2600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Snowy Graveyard"
        CFrameMon = CFrame.new(7411.84765625, 14.597492218017578, 16390.7109375)
        CFrameQuest = CFrame.new(7243.8427734375, 50.86800003051758, 15919.2685546875)
    elseif level >= 2700 and level <= 2750 then
        Mon = "Desert Pirate"
        questlv = "Level 2700"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert City"
        CFrameMon = CFrame.new(7391.14794921875, 19.74783706665039, 11600.1650390625)
        CFrameQuest = CFrame.new(7297.27099609375, 19.702999114990234, 11858.0615234375)
    elseif level >= 2750 and level <= 2850 then
        Mon = "Desert Captain"
        questlv = "Level 2750"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert City"
        CFrameMon = CFrame.new(6757.4892578125, 19.72783660888672, 12002.7294921875)
        CFrameQuest = CFrame.new(7297.27099609375, 19.702999114990234, 11858.0615234375)
    end
end
if _G.Mode == "English" then
page1:Toggle("Auto Farm Level", _G.AutoFarm, function(value)
    _G.AutoFarm = value
end)

end
local questMain = game.Players.LocalPlayer.PlayerGui.QuestGui
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                checklevel()
                local starterIsland = workspace["NPC Zones"][islandName]
                for _, v in pairs(starterIsland.NPCS:GetChildren()) do
                    local name = v.Name
                    if not (string.find(name, "King") or string.find(name, "Boss")) then
                        if (level >= 2200 and level <= 2249) then
                            if (level >= 2300 and level <= 2350) then
                                if not (string.find(name, "Strong") or string.find(name, "Elite")) then
                                end
                            end
                        end
                        if string.find(name, Mon) then
                            if v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    if questMain.Enabled == false then
                                        repeat
                                            task.wait()
                                            checklevel()
                                            getgenv().ToTarget(CFrameQuest)
                                        until (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 2 or questMain.Enabled == true
                                        checklevel()
                                        local args = {
                                            [1] = islandlv,
                                            [2] = questlv
                                        }
                                        game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction
                                            :InvokeServer(unpack(args))
                                    end
                                    if _G.AutoObservationHaki then
                                        if game.Players.LocalPlayer.PlayerGui.ObsHakiEffect.Circle.Visible == false then
                                            game:GetService("Players").LocalPlayer.PlayerGui.ObservationHaki_Server
                                                .Comunication:FireServer()
                                            game:GetService("Players").LocalPlayer.PlayerGui.ObservationHaki_Server
                                                .Comunication:FireServer()
                                        end
                                    end

                                    if _G.AutoBuso then
                                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                            local BusoEnabled = game:GetService("Players").LocalPlayer.Character
                                                :WaitForChild("BusoEnabled")
                                            local function IsBusoEnabled()
                                                return BusoEnabled.Value
                                            end

                                            if IsBusoEnabled() then
                                                local BBBB = 2
                                            else
                                                -- game:GetService("Players").LocalPlayer.Character.Buso_Server.Comunication:FireServer()
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.J,
                                                    false, game)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode
                                                    .J, false, game)
                                            end
                                        end
                                    end

                                    --[[
                                            if game.Players.LocalPlayer.Quest.NPCName.Value ~= Mon then
                                                print(1)
                                            else เช็คเควสต้องหาวิธียกเลิกเควสถ้าเควสไม่ตรง
                                                checklevel()
                                                local args = {
                                                    [1] = islandlv,
                                                    [2] = questlv
                                                }
                                                game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction
                                                    :InvokeServer(unpack(args))
                                            end]]

                                    getgenv().ToTarget(v.HumanoidRootPart.CFrame * MethodFarm)

                                    if getgenv().SkillZ then
                                        pcall(function()
                                            keypress(0x5A)
                                            keyrelease(0x5A)
                                        end)
                                    end
                                    if getgenv().SkillX then
                                        pcall(function()
                                            keypress(0x58)
                                            keyrelease(0x58)
                                        end)
                                    end
                                    if getgenv().SkillC then
                                        pcall(function()
                                            keypress(0x43)
                                            keyrelease(0x43)
                                        end)
                                    end
                                    if getgenv().SkillV then
                                        pcall(function()
                                            keypress(0x56)
                                            keyrelease(0x56)
                                        end)
                                    end
                                    if getgenv().SkillB then
                                        pcall(function()
                                            keypress(0x42)
                                            keyrelease(0x42)
                                        end)
                                    end

                                    EquipWeapon(_G.Select_Weapon)
                                    game:GetService('VirtualUser'):CaptureController()
                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                until not _G.AutoFarm or v.Humanoid.Health <= 0
                                getgenv().ToTarget(CFrameMon)
                            end
                        end
                    end
                end
            end
        end)
    end
end)



if _G.Mode == "English" then
page1:Toggle("AutoSetSpawnPoint", _G.AutoSetSpawnPoint, function(value)
    _G.AutoSetSpawnPoint = value
end)

end
task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSetSpawnPoint then
                local clown = Vector3.new(-2297.43115234375, 68.3956069946289, -254.5489959716797)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - clown).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Clown Island")
                end

                local Fishman = Vector3.new(7532.01513671875, -1.0822196006774902, -2977.40576171875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Fishman).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Fishman Island")
                end

                local HalfHot = Vector3.new(3088.55078125, 205.62106323242188, -2676.47412109375)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - HalfHot).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Half Hot Half Cold")
                end


                local Marine = Vector3.new(467.18402099609375, 100.61599731445312, 5504.99560546875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Marine).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Marine Base Town")
                end

                local Impel = Vector3.new(3749.59619140625, 95.50956726074219, 7003.53759765625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Impel).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Impel Jail")
                end

                local MarineHQ = Vector3.new(-6398.89453125, 224.10000610351562, 6473.53857421875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - MarineHQ).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Marine HQ")
                end

                local Revolutionary = Vector3.new(3546.29833984375, 97.4886703491211, 3844.509033203125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Revolutionary).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Revolutionary Base")
                end

                local SeaR = Vector3.new(-5979.048828125, 9.873251914978027, 2477.521484375)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - SeaR).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Sea Resturant")
                end

                local Skull = Vector3.new(7035.6826171875, 91.79483032226562, 178.0691375732422)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Skull).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Skull Island")
                end

                local Skypiea = Vector3.new(3044.330810546875, 1007.5880126953125, 605.1170654296875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Skypiea).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Skypiea Island")
                end

                local TallW = Vector3.new(39.4341087, 16.7828388, 2297.73755, -1.1920929e-07, -0, -1.00000012, 0,
                    -1.00000024, 0, -1.00000012, 0, -1.1920929e-07)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - TallW).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Tall Woods")
                end

                local Desert = Vector3.new(-5092.19921875, 129.68508911132812, -313.27325439453125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Desert).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Desert Ruins")
                end

                local Logue = Vector3.new(-2877.0322265625, -9.251429557800293, 1803.997314453125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Logue).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Logue Town")
                end

                local Rocky = Vector3.new(-98.78933715820312, 225.37521362304688, -2916.687744140625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Rocky).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Rocky Pillars")
                end


                local Shark = Vector3.new(-4948.091796875, 55.05535125732422, -2763.64697265625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Shark).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Shark Park")
                end

                local Starter = Vector3.new(-2209.9765625, 74.17393493652344, -3377.793701171875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Starter).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Starter Island")
                end

                local Thriller = Vector3.new(7462.18457, 18.2402382, 6558.23242, 0, 0, 1, 0, -1, 0, 1, 0, -0)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Thriller).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Thriller Boat")
                end

                local WaterAssets = Vector3.new(2319.9208984375, -76.742431640625, 3913.479248046875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - WaterAssets).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("WaterAssets")

                    local Udon = Vector3.new(1992.2822265625, 15.569685935974121, 11978.8203125)
                    local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                    if (characterPosition - Udon).Magnitude < 900 then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Udon Prison")

                        local Snowy = Vector3.new(6926.8505859375, 48.688419342041016, 16136.0947265625)
                        local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        .Position
                        if (characterPosition - Snowy).Magnitude < 900 then
                            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                            "Snowy Graveyard")

                            local Desert = Vector3.new(7688.09130859375, 26.273921966552734, 11608.1826171875)
                            local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            .Position
                            if (characterPosition - Desert).Magnitude < 900 then
                                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                                "Desert City")

                                local Flower = Vector3.new(2605.515380859375, 47.066383361816406, 15894.533203125)
                                local characterPosition = game:GetService("Players").LocalPlayer.Character
                                .HumanoidRootPart.Position
                                if (characterPosition - Flower).Magnitude < 900 then
                                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint
                                        :FireServer("Flower Capital")
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)


local SelectStats = {
    "Combat",
    "Defense",
    "Sword",
    "Devil Fruits"
}

if _G.Mode == "English" then
page1:Dropdown("Select Stats",SelectStats, function(value)
    _G.StatSelectStats = value
    task.spawn(function()
        pcall(function()
            while wait() do
                if _G.StatEnabledAutoStats then
                    if _G.StatSelectStats == "Combat" then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer("Combat", 1)
                    elseif _G.StatSelectStats == "Defense" then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer("Defense", 1)
                    elseif _G.StatSelectStats == "Sword" then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer("Sword", 1)
                    elseif _G.StatSelectStats == "Devil Fruits" then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer("Fruit", 1)
                    end
                end
            end
        end)
    end)
end)
end
if _G.Mode == "English" then
page1:Toggle("Auto Stats", _G.StatEnabledAutoStats, function(value)
    _G.StatEnabledAutoStats = value
end)

end
spawn(function()
    while task.wait() do
        if _G.AutoRedeemcode then
            function UseCode(Text)
                game:GetService("ReplicatedStorage").Replication.ClientEvents.ClaimCode:InvokeServer(Text)
            end

            UseCode("THANKSFOR70K2023")
            UseCode("FREEX2EXP")
            UseCode("GROUPONLY")
            UseCode("160KLIKESFORNEXT")
            UseCode("WOW190KFORNEXT")
            UseCode("220KLIKES4CODE")
            UseCode("DRAGONUPDATE23")
            UseCode("220KLIKES4CODE")
            UseCode("SHUTDOWN4")
            UseCode("250KLETSGO")
        end
    end
end)

if  _G.Mode == "English" then
page1:Toggle("Auto Redeem Code", _G.AutoRedeemcode, function(value)
    _G.AutoRedeemcode = value
end)

page1:Button("Redeem Code", function()
    function UseCodee(Text)
        game:GetService("ReplicatedStorage").Replication.ClientEvents.ClaimCode:InvokeServer(Text)
    end

    UseCodee("THANKSFOR70K2023")
    UseCodee("FREEX2EXP")
    UseCodee("GROUPONLY")
    UseCodee("160KLIKESFORNEXT")
    UseCodee("WOW190KFORNEXT")
    UseCodee("220KLIKES4CODE")
    UseCodee("DRAGONUPDATE23")
    UseCodee("220KLIKES4CODE")
    UseCodee("SHUTDOWN4")
    UseCodee("250KLETSGO")
end)
end
page1:Line()
--CFrame.new(168.44004821777344, 266.10003662109375, -3102.505615234375) หน้าโพ
--keypress(0x45)กดEค้าง
if _G.Mode == "English then" then
page1:Toggle("AutoSea2", _G.AutoSea2, function(value)
    _G.AutoSea2 = value
end)
end
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoSea2 then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Poneglyph Scroll" and v:IsA("Tool") then
                        getgenv().ToTarget(CFrame.new(-2117.498046875, 46.2481575012207, -2940.043701171875))
                        EquipWeapon("Poneglyph Scroll")
                        workspace.Npc_Workspace["Sea Teleporter"]["Sea 2"].UnlockSea:InvokeServer()
                        workspace.Npc_Workspace["Sea Teleporter"]["Sea 2"].Teleport:InvokeServer()
                    else
                        workspace.Logic.PointsOfInterest:FindFirstChild("Poneglyph Scroll").Pick:InvokeServer()
                    end
                end
            end
        end
    end)
end)

if _G.Mode == "English" then
page2:Seperator("Settings")
end
local Method = {
    "Upper",
    "Behind",
    "Below"
}
if _G.Mode == "English" then
page2:Dropdown("Select Farm Method",Method, function(value)
    _G.Method = value
end)
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.Method == "Behind" then
                MethodFarm = CFrame.new(0, 0, _G.DistanceMob)
            elseif _G.Method == "Below" then
                MethodFarm = CFrame.new(0, -_G.DistanceMob, 0) * CFrame.Angles(math.rad(90), 0, 0)
            elseif _G.Method == "Upper" then
                MethodFarm = CFrame.new(0, _G.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
            else
                MethodFarm = CFrame.new(0, _G.DistanceMob, 0)
            end
        end)
    end
end)

_G.DistanceMob = 6

Weapon = {
    "Melee",
    "Sword",
    "Fruit"
}
if _G.Mode == "English" then
page2:Dropdown("Select Weapon",Weapon, function(value)
    SelectWeapon = value
end)
end
local MeleeWeaponNames = {
    "Black Leg", "Electro", "dragon's breath", "Combat title", "Combat"
}


local swordWeaponNames = {
    "Katana", "Shark Blade", "3 Sword Style", "Shusui", "Yoru (Dark Blade)",
    "Fishman Trident", "Operation Blade", "Raiu Sword", "Bisento V2", "Golden Staff", "Mace", "Pipe",
    "Soul Cane", "Yoru", "Two Sword Style", "Two Sword Style V2", "Sea Beast Hammer"
}

local FruitWeaponNames = {
    "Dragon", "Darkness", "Magma", "Phoenix", "Magnet",
    "Rubber", "Electricity", "Ice", "Tremor", "Operation", "Gas", "Flame",
    "Mammoth", "Snow", "Gravity", "Light", "Sand", "String", "Rubber", "Kilo", "Paw", "Smoke", "Sand",
    "Buddha", "Clear", "Spin", "Spike", "Bomb", "Chop", "Barrier"
}

task.spawn(function()
    while wait() do
        pcall(function()
            if SelectWeapon == "Melee" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(MeleeWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            elseif SelectWeapon == "Sword" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(swordWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            elseif SelectWeapon == "Fruit" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(FruitWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            else
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.Select_Weapon = v.Name
                        end
                    end
                end
            end
        end)
    end
end)


function EquipWeapon(Tool)
    pcall(function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) then
            local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(Tool)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid)
        end
    end)
end

page2:Line()
if _G.Mode == "English" then
page2:Toggle("White Screen", false, function(value)
    _G.WhiteScreen = value
    if value then
        game.RunService:Set3dRenderingEnabled(false)
    else
        game.RunService:Set3dRenderingEnabled(true)
    end
end)

page2:Button("Auto White Screen", function()
    --_G.Settings.HUD["Black Screen"] = value
    game:GetService("UserInputService").WindowFocused:connect(
        function()
            game.RunService:Set3dRenderingEnabled(true)
        end)
    game:GetService("UserInputService").WindowFocusReleased:connect(
        function()
            game.RunService:Set3dRenderingEnabled(false)
        end)
end)

    
    page2:Button("ออโต้เปิดจอขาว", function()
        game:GetService("UserInputService").WindowFocused:connect(
            function()
                game.RunService:Set3dRenderingEnabled(true)
            end)
        game:GetService("UserInputService").WindowFocusReleased:connect(
            function()
                game.RunService:Set3dRenderingEnabled(false)
            end)
    end)
end
if _G.Mode == "English" then
page2:Toggle("AutoBusoHaki", _G.AutoBuso, function(value)
    _G.AutoBuso = value
end)
end
if _G.Mode == "English" then
page2:Toggle("AutoObservationHaki", _G.AutoObservationHaki, function(value)
    _G.AutoObservationHaki = value
    --[[
    if game.Players.LocalPlayer.Character.Humanoid.Health < 0 then
        game.Players.LocalPlayer.PlayerGui.ObsHakiEffect.Circle.Visible = false
    end]]
end)
end


if _G.Mode == "English" then
page2:Toggle("Auto Skill Z", getgenv().SkillZ, function(value)
    getgenv().SkillZ = value
end)
else
    _G.Mode = Thai 
    page2:Toggle("ออโต้สกิล Z", getgenv().SkillZ, function(value)
        getgenv().SkillZ = value
    end)
end
if _G.Mode == "English" then
page2:Toggle("Auto Skill X", getgenv().SkillX, function(value)
    getgenv().SkillX = value
end)
end
if _G.Mode == "Englsih" then
page2:Toggle("Auto Skill C", getgenv().SkillC, function(value)
    getgenv().SkillC = value
end)
end
if _G.Mode == "English" then
page2:Toggle("Auto Skill V", getgenv().SkillV, function(value)
    getgenv().SkillV = value
end)
end
if _G.Mode == "English" then
page2:Toggle("Auto Skill B", getgenv().SkillB, function(value)
    getgenv().SkillB = value
end)
end
if _G.Mode == "English" then
page3:Seperator("Teleport")
end
TeleportTable = {}
if World1 then
    TeleportTable = { "Bubble Island", "Starter Island", "Clown Island", "Desert Ruins", "Fishman Island",
        "Half Hot Half Cold", "Impel Jail", "Logue Town",
        "Marine Base", "Marine HQ", "Revolutionary Base", "Rocky Pillars", "Sea Resturant", "Shark Park",
        "Skull Island", "Skypiea Island", "Tall Woods", "Thriller Boat" }
elseif World2 then
    TeleportTable = { "Flower Capital", "Desert City", "Snowy Graveyard", "Udon Prison" }
end
if _G.Mode == "English" then
page3:Dropdown("Select Island",TeleportTable, function(value)
    _G.SelectIsland = value
end)
end
if _G.Mode == "English" then
page3:Toggle("Teleport", false, function(value)
    _G.TeleportIsland = value
    if _G.TeleportIsland then
        repeat
            wait()
            if _G.SelectIsland == "Bubble Island" then
                getgenv().ToTarget(CFrame.new(6965.49072265625, 60.74586486816406, 2883.4912109375) *
                    CFrame.new(0, 20, 0))
            elseif _G.SelectIsland == "Clown Island" then
                getgenv().ToTarget(CFrame.new(-2297.43115234375, 68.3956069946289, -254.5489959716797))
            elseif _G.SelectIsland == "Desert Ruins" then
                getgenv().ToTarget(CFrame.new(-5092.19921875, 129.68508911132812, -313.27325439453125))
            elseif _G.SelectIsland == "Fishman Island" then
                getgenv().ToTarget(CFrame.new(6824.45849609375, 115.12012481689453, -2772.66357421875))
            elseif _G.SelectIsland == "Half Hot Half Cold" then
                getgenv().ToTarget(CFrame.new(3088.55078125, 205.62106323242188, -2676.47412109375))
            elseif _G.SelectIsland == "Impel Jail" then
                getgenv().ToTarget(CFrame.new(3749.59619, 95.5095673, 7003.5376, 0.903889775, 0, 0.427765429, 0, 1, 0,
                    -0.427765429, 0,
                    0.903889775))
            elseif _G.SelectIsland == "Logue Town" then
                getgenv().ToTarget(CFrame.new(-2995.935791015625, 49.60439682006836, 2155.970458984375))
            elseif _G.SelectIsland == "Marine Base" then
                getgenv().ToTarget(CFrame.new(522.764709, 131.273926, 5737.5918, 0, 0, -1, 0, 1, 0, 1, 0, 0))
            elseif _G.SelectIsland == "Marine HQ" then
                getgenv().ToTarget(CFrame.new(-6214.35986, 44.9428253, 6495.28906, -0.74141252, 0, 0.671049476, 0, 1, 0,
                    -0.671049476, 0,
                    -0.74141252))
            elseif _G.SelectIsland == "Revolutionary Base" then
                getgenv().ToTarget(CFrame.new(3666.80078, 35.9256439, 3742.72192, 0.707134247, 0, 0.707079291, 0, 1, 0,
                    -0.707079291, 0,
                    0.707134247))
            elseif _G.SelectIsland == "Rocky Pillars" then
                getgenv().ToTarget(CFrame.new(-293.37469482421875, 187.09378051757812, -2514.448486328125))
            elseif _G.SelectIsland == "Sea Resturant" then
                getgenv().ToTarget(CFrame.new(-5956.0517578125, 142.18629455566406, 2410.0927734375))
            elseif _G.SelectIsland == "Shark Park" then
                getgenv().ToTarget(CFrame.new(-4998.51171875, 24.218891143798828, -3179.14404296875))
            elseif _G.SelectIsland == "Skull Island" then
                getgenv().ToTarget(CFrame.new(7037.6875, 91.79483795166016, 178.2462158203125))
            elseif _G.SelectIsland == "Skypiea Island" then
                getgenv().ToTarget(CFrame.new(3005.678466796875, 1497.0606689453125, 659.0731811523438))
            elseif _G.SelectIsland == "Starter Island" then
                getgenv().ToTarget(CFrame.new(-2209.9765625, 74.17393493652344, -3377.793701171875))
            elseif _G.SelectIsland == "Tall Woods" then
                getgenv().ToTarget(CFrame.new(257.0096435546875, 265.88824462890625, 2511.776123046875))
            elseif _G.SelectIsland == "Thriller Boat" then
                getgenv().ToTarget(CFrame.new(7388.30859375, 961.5870361328125, 7018.443359375))
            elseif _G.SelectIsland == "WaterAssets" then
                getgenv().ToTarget(CFrame.new(2319.9208984375, -76.742431640625, 3913.479248046875))
            elseif _G.SelectIsland == "Flower Capital" then
                getgenv().ToTarget(CFrame.new(2685.3505859375, 402.4315185546875, 15895.587890625))
            elseif _G.SelectIsland == "Snowy Graveyard" then
                getgenv().ToTarget(CFrame.new(7154.06640625, 344.37890625, 15867.046875))
            elseif _G.SelectIsland == "Desert City" then
                getgenv().ToTarget(CFrame.new(7350.47607421875, 63.85017395019531, 11498.7109375))
            elseif _G.SelectIsland == "WaterAssets" then
                getgenv().ToTarget(CFrame.new(2965.83837890625, -134.9617919921875, 15862.46875))
            elseif _G.SelectIsland == "Udon Prison" then
                getgenv().ToTarget(CFrame.new(2189.2001953125, 233.62026977539062, 11657.498046875))
            end
        until not _G.TeleportIsland
    end
end)
end

if _G.Mode == "English" then
page3:Button("Stop Teleport", function(value)
    getgenv().ToTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)

page3:Button("Teleport To Sea 1", function(value)
    workspace.Npc_Workspace["Sea Teleporter"]["Sea 1"].Teleport:InvokeServer()
end)

page3:Button("Teleport To Sea 2", function(value)
    workspace.Npc_Workspace["Sea Teleporter"]["Sea 2"].Teleport:InvokeServer()
end)
end

page3:Line()
if _G.Mode == "English" then
page3:Button("Rejoin", function()
    local ts = game:GetService("TeleportService")
    local p = game.Players.LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

page3:Button("Hop Server", function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
    local HttpService, TPService = game:GetService "HttpService", game:GetService "TeleportService";
    local OtherServers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" ..
        game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    function joinNew()
        if not isfile('servers.sss') then
            writefile('servers.sss', HttpService:JSONEncode({}))
        end
        local dontJoin = readfile('servers.sss')
        dontJoin = HttpService:JSONDecode(dontJoin)

        for Index, Server in next, OtherServers["data"] do
            if Server ~= game.JobId then
                local j = true
                for a, c in pairs(dontJoin) do
                    if c == Server.id then
                        j = false
                    end
                end
                if j then
                    table.insert(dontJoin, Server["id"])
                    writefile("servers.sss", HttpService:JSONEncode(dontJoin))
                    wait()
                    return Server['id']
                end
            end
        end
    end

    local server = joinNew()
    if not server then
        writefile("servers.sss", HttpService:JSONEncode({}))
        local server = joinNew()
        TPService:TeleportToPlaceInstance(game.PlaceId, server)
    else
        TPService:TeleportToPlaceInstance(game.PlaceId, server)
    end
end)

page3:Button("Hop Little Player Server", function()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    --[[
local File = pcall(function()
AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
table.insert(AllIDs, actualHour)
writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
]]
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                            game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
end)
    
    page3:Button("Hop Server", function()
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        local HttpService, TPService = game:GetService "HttpService", game:GetService "TeleportService";
        local OtherServers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" ..
            game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        function joinNew()
            if not isfile('servers.sss') then
                writefile('servers.sss', HttpService:JSONEncode({}))
            end
            local dontJoin = readfile('servers.sss')
            dontJoin = HttpService:JSONDecode(dontJoin)
    
            for Index, Server in next, OtherServers["data"] do
                if Server ~= game.JobId then
                    local j = true
                    for a, c in pairs(dontJoin) do
                        if c == Server.id then
                            j = false
                        end
                    end
                    if j then
                        table.insert(dontJoin, Server["id"])
                        writefile("servers.sss", HttpService:JSONEncode(dontJoin))
                        wait()
                        return Server['id']
                    end
                end
            end
        end
    
        local server = joinNew()
        if not server then
            writefile("servers.sss", HttpService:JSONEncode({}))
            local server = joinNew()
            TPService:TeleportToPlaceInstance(game.PlaceId, server)
        else
            TPService:TeleportToPlaceInstance(game.PlaceId, server)
        end
    end)
end
if _G.Mode == "English" then
page4:Seperator("Shop")
end
page4:Button("BuyKatana", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(workspace.Npc_Workspace
        ["Sword Sellers"].Katana)
end)

page4:Button("BuyElectro", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.BuyFightingStyle:InvokeServer("Electro")
end)


page4:Button("BuyFlash Step", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer()
end)

page4:Button("BuySky Walk", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.Geppo:InvokeServer(workspace.Npc_Workspace.Geppo
        ["Black Leg"])
end)

page4:Button("BuyBusoHaki", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.Buso:InvokeServer(workspace.Npc_Workspace.Buso["1"])
end)

page4:Button("BuyObservationHaki", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(workspace.Npc_Workspace.ObsHaki
        ["1"])
end)

page4:Button("BuyFlash Step V2", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer()
end)

page4:Button("BuyObservationHaki V2", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(workspace.Npc_Workspace.ObsHaki
        ["2"])
end)

page4:Button("BuyBusoHaki V2", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.Buso:InvokeServer(workspace.Npc_Workspace.Buso["2"])
end)

page4:Button("BuyObservationHaki V2", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(workspace.Npc_Workspace.ObsHaki
        ["2"])
end)

page4:Button("BuyFlash Step V3", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer()
end)

page4:Button("BuyObservationHaki V3", function()
    game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(workspace.Npc_Workspace.ObsHaki["3"])
end)



getgenv().ToTarget = function(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function()
        tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 650, Enum.EasingStyle.Linear), { CFrame = Pos })
    end)
    tween:Play()
    if Distance <= 10 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

local function toTarget(...)
    local RealtargetPos = { ... }
    local targetPos = RealtargetPos[1]
    local RealTarget
    if type(targetPos) == "vector" then
        RealTarget = CFrame.new(targetPos)
    elseif type(targetPos) == "userdata" then
        RealTarget = targetPos
    elseif type(targetPos) == "number" then
        RealTarget = CFrame.new(unpack(RealtargetPos))
    end

    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
        if tween then tween:Cancel() end
        repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2)
    end

    local tweenfunc = {}
    local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
        .Magnitude
    if Distance < 1000 then
        Speed = 500
    elseif Distance >= 1000 then
        Speed = 500
    end

    if _G.BypassTP then
        if Distance > 3000 and not Material and not _G.Settings.FightingStyle["Auto God Human"] and not _G.Settings.Raids["Auto Raids"] and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") then
            pcall(function()
                tween:Cancel()
                fkwarp = false

                if game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("SpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
                    wait(.1)
                    Com("F_", "TeleportToSpawn")
                elseif game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                    wait(0.1)
                    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                else
                    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                        if fkwarp == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
                        end
                        fkwarp = true
                    end
                    wait(.08)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                    wait(.1)
                    Com("F_", "SetSpawnPoint")
                end
                wait(0.2)

                return
            end)
        end
    end



    local tween_s = game:service "TweenService"
    local info = TweenInfo.new(
        (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
        .Magnitude / Speed, Enum.EasingStyle.Linear)
    local tweenw, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, { CFrame = RealTarget })
        tween:Play()
    end)

    function tweenfunc:Stop()
        tween:Cancel()
    end

    function tweenfunc:Wait()
        tween.Completed:Wait()
    end

    return tweenfunc
end

function two(gotoCFrame) --- Tween
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end)
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 10 then
        pcall(function()
            tweenz:Cancel()
        end)
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
    else
        local tween_s = game:service "TweenService"
        local info = TweenInfo.new(
            (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position)
            .Magnitude /
            650, Enum.EasingStyle.Linear)
        tween, err = pcall(function()
            tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, { CFrame = gotoCFrame })
            tweenz:Play()
        end)
        if not tween then return err end
    end
    function _TweenCanCle()
        tweenz:Cancel()
    end
end

function Noclip()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- ทำให้ตัวละครลอยตัว
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false -- ทำให้วัตถุทั้งหมดในตัวละครทะลุผ่านกำแพง
        end
    end
end

Noclip()

-- [Body Gyro]
task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            --[World 1]
            if _G.AutoFarm or _G.TeleportIsland
            then
                if syn then
                    setfflag("HumanoidParallelRemoveNoPhysics", "False")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                    end
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                            end
                            local BodyVelocity = Instance.new("BodyVelocity")
                            BodyVelocity.Name = "BodyVelocity1"
                            BodyVelocity.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
                end
            end
        end)
    end)
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.AutoFarm or _G.TeleportIsland
            then
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
                    wait(5)
                end
                PIO = false
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local L_1 = Instance.new("BodyVelocity")
                    L_1.Name = "BodyGyrozz"
                    L_1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    L_1.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                    L_1.Velocity = Vector3.new(0, 0, 0)
                end
            elseif PIO == false then
                for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                    if v.Name == "BodyGyrozz" then
                        v:Destroy()
                        PIO = true
                    end
                end
            end
        end)
    end
end)


--[[
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.AutoFarm or _G.TeleportIsland
        then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)]]

--[[
spawn(function() ------body velocity
    game:GetService("RunService").Stepped:Connect(function()
        if _G.AutoFarm or _G.TeleportIsland
        then
            if not game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv') then
                local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                bv.Name = 'bv'
                bv.MaxForce = Vector3.new(100000, 100000, 100000)
                bv.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv') then
                game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv'):Destroy()
            end
        end
    end)
end)
]]

function changestate()
    game.Workspace["Part"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.TeleportIsland
            then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
return VectorHub
