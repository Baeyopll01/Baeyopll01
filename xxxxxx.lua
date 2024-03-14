  
repeat wait() until game.Players.LocalPlayer

if not game:IsLoaded() then
	local GameLoadGui = Instance.new("Message",workspace);
	GameLoadGui.Text = 'Wait Game Loading';
	game.Loaded:Wait();
	GameLoadGui:Destroy();
	task.wait(10);
end;

repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("ReplicatedStorage").Effect.Container

-- [Configs]

_G.SettingsUI = {
	Configs = {
		ColorUI = Color3.fromRGB(255, 0, 127),
		Key = Enum.KeyCode.RightControl
	}
}




do  local ui =  game:GetService("CoreGui"):FindFirstChild("UILibrary")  if ui then ui:Destroy() end end  

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
UILibrary.Parent = game:GetService("CoreGui")
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Load.Name = "Load"
Load.Parent = UILibrary
Load.Active = true
Load.AnchorPoint = Vector2.new(0.5, 0.5)
Load.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Load.BackgroundTransparency = 1
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.5, 0, 1, 0)
Load.Size = UDim2.new(0, 100, 0, 100)
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
LoadButton.Size = UDim2.new(0, 70, 0, 70)
LoadButton.Image = "http://www.roblox.com/asset/?id=10731738718"
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
SoundClick.SoundId = "rbxassetid://130785805"
SoundClick.Volume = 1

local Blur = Instance.new("BlurEffect")

Blur.Size = 0
Blur.Parent = game.Lighting

if game.Workspace.Camera.FieldOfView == 50 then
	return game.Workspace.Camera.FieldOfView == 70
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
		{FieldOfView = 50}
	):Play()

	TweenService:Create(
		Blur,
		TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
		{Size = 20}
	):Play()

	TweenService:Create(
		Load,
		TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
		{Position = UDim2.new(0.5, 0, 0.5, 0)}
	):Play()
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
			{Size = UDim2.new(0, 70, 0, 70)}
		):Play()
	end)

	local LoadFocus = false

	LoadButton.MouseButton1Down:Connect(function()
		if LoadFocus == false then
			LoadFocus = true
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Rotation = 180}
			):Play()
			SoundClick:Play()
			TweenService:Create(
				LoadButton,
				TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
				{ImageTransparency = 1}
			):Play()
			wait(.5)
			LoadButton:Destroy()
			wait(.5)
			TweenService:Create(
				Load,
				TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Position = UDim2.new(0.5, 0, 0.025, 0)}
			):Play()
			TweenService:Create(
				Blur,
				TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Size = 0}
			):Play()
			TweenService:Create(
				game.Workspace.Camera,
				TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{FieldOfView = 70}
			):Play()
			wait(.5)
			TweenService:Create(
				Load,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0, 500, 0, 50)}
			):Play()
			repeat wait()
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 0.2}
				):Play()
				TitleLoad.Text = "Loading Interface . . ."
				wait(0.35)
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 1}
				):Play()
				wait(0.35)
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 0.2}
				):Play()
				TitleLoad.Text = "Get Patch Unique Script Version : 1.0.0"
				wait(0.35)
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 1}
				):Play()
				wait(0.35)
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 0.2}
				):Play()
				TitleLoad.Text = "Welcome to Unique Script | Premium Edition"
				TitleLoad.Font = Enum.Font.GothamBold
				TitleLoad.TextTransparency = 0
				wait(3)
				TweenService:Create(
					TitleLoad,
					TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
					{TextTransparency = 1}
				):Play()
			until Load.Size == UDim2.new(0, 500, 0, 50)
			TweenService:Create(
				ClickFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{Size = UDim2.new(0, 500, 0, 50)}
			):Play()
			TweenService:Create(
				Load,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{BackgroundTransparency = 0.05}
			):Play()

			LoadScrollbar.Visible = true
			wait(.5)

			TweenService:Create(
				LoadScrollbar,
				TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
				{ImageTransparency = 0}
			):Play()
			repeat wait() until LoadScrollbar.ImageTransparency == 0
			wait(.5)
			TweenService:Create(
				osday,
				TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
				{TextTransparency = 0}
			):Play()
			wait(.5)
			TweenService:Create(
				Title,
				TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
				{TextTransparency = 0}
			):Play()
		end
	end)
end
LoadFunction()

LoadScrollbarFocus = false

LoadScrollbar.MouseLeave:Connect(function()
	if LoadScrollbarFocus == false then
		TweenService:Create(
			LoadScrollbar,
			TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
			{ImageColor3 = Color3.fromRGB(255, 255, 255)}
		):Play()
	end
end)

LoadScrollbar.MouseEnter:Connect(function()
	if LoadScrollbarFocus == false then
		TweenService:Create(
			LoadScrollbar,
			TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
			{ImageColor3 = Color3.fromRGB(255, 0, 127)}
		):Play()
	end
end)

MakeDraggable(ClickFrame,Load)

local Library = {}

function Library.new()

	local PageOrder = -1

	local Scrollingbar = Instance.new("ScrollingFrame")
	local ScrollingbarUIListLayout = Instance.new("UIListLayout")
	local ScrollingbarUIPadding = Instance.new("UIPadding")

	Scrollingbar.Name = "Scrollingbar"
	Scrollingbar.Parent = Load
	Scrollingbar.Active = true
	Scrollingbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Scrollingbar.BackgroundTransparency = 1
	Scrollingbar.BorderSizePixel = 0
	Scrollingbar.AnchorPoint = Vector2.new(0.5,0.5)
	Scrollingbar.Position = UDim2.new(0.5, 0, 1.65, 0)
	Scrollingbar.Size = UDim2.new(0, 500, 0, 0)
	Scrollingbar.ClipsDescendants = true
	Scrollingbar.ScrollBarThickness = 0

	ScrollingbarUIListLayout.Name = "ScrollingbarUIListLayout"
	ScrollingbarUIListLayout.Parent = Scrollingbar
	ScrollingbarUIListLayout.FillDirection = Enum.FillDirection.Horizontal
	ScrollingbarUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ScrollingbarUIListLayout.Padding = UDim.new(0, 5)

	ScrollingbarUIPadding.Name = "ScrollingbarUIPadding"
	ScrollingbarUIPadding.Parent = Scrollingbar
	ScrollingbarUIPadding.PaddingLeft = UDim.new(0, 5)
	ScrollingbarUIPadding.PaddingTop = UDim.new(0, 5)

	ScrollingbarUIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		Scrollingbar.CanvasSize = UDim2.new(0,ScrollingbarUIListLayout.AbsoluteContentSize.X + 5,0,0)
	end)

	local Main2 = Instance.new("Frame")
	local ContainerPage = Instance.new("Frame")
	local FolderPage = Instance.new("Folder")
	local FolderPageUIPageLayout = Instance.new("UIPageLayout")

	Main2.Name = "Main2"
	Main2.Parent = Load
	Main2.AnchorPoint = Vector2.new(0.5, 0.5)
	Main2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main2.BackgroundTransparency = 1.000
	Main2.Position = UDim2.new(0.5, 0, 5.5, 0)
	Main2.Size = UDim2.new(0, 500, 0, 332)

	ContainerPage.Name = "ContainerPage"
	ContainerPage.Parent = Main2
	ContainerPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerPage.BackgroundTransparency = 1.000
	ContainerPage.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ContainerPage.Size = UDim2.new(0, 500, 0, 332)
	ContainerPage.ClipsDescendants = true

	FolderPage.Name = "FolderPage"
	FolderPage.Parent = ContainerPage

	FolderPageUIPageLayout.Name = "FolderPageUIPageLayout"
	FolderPageUIPageLayout.Parent = FolderPage
	FolderPageUIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	FolderPageUIPageLayout.EasingStyle = Enum.EasingStyle.Cubic
	FolderPageUIPageLayout.EasingDirection = Enum.EasingDirection.InOut
	FolderPageUIPageLayout.FillDirection = Enum.FillDirection.Horizontal
	FolderPageUIPageLayout.Padding = UDim.new(0, 10)
	FolderPageUIPageLayout.TweenTime = 0.300

	function Library.Notifcation(options)

		local visualTitle = options.Title or "Notifcation"
		local visualDesc = options.Desc or "Description"
		local visualDelays = options.Delays or 10
		local visualButtonText = options.TextSubmit or "Submit"

		local NotificationFrame = Instance.new("Frame")
		local MainNotification = Instance.new("Frame")
		local MainNotificationUICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Description = Instance.new("TextLabel")
		local Button = Instance.new("TextButton")
		local ButtonUICorner = Instance.new("UICorner")
		local Line1 = Instance.new("Frame")
		local Line2 = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		NotificationFrame.Name = "NotificationFrame"
		NotificationFrame.Parent = Main2
		NotificationFrame.Active = true
		NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		NotificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationFrame.BackgroundTransparency = 0.050
		NotificationFrame.ClipsDescendants = true
		NotificationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

		NotificationFrame:TweenSizeAndPosition(UDim2.new(0, 500, 0, 322),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quart", 0.2, true)

		MainNotification.Name = "MainNotification"
		MainNotification.Parent = NotificationFrame
		MainNotification.Active = true
		MainNotification.AnchorPoint = Vector2.new(0.5, 0.5)
		MainNotification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		MainNotification.BorderSizePixel = 0
		MainNotification.Position = UDim2.new(0.5, 0, 0.5, 0)
		MainNotification.Size = UDim2.new(0, 382, 0, 287)

		MainNotificationUICorner.CornerRadius = UDim.new(0, 3)
		MainNotificationUICorner.Name = "MainNotificationUICorner"
		MainNotificationUICorner.Parent = MainNotification

		Title.Name = "Title"
		Title.Parent = MainNotification
		Title.Active = true
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0209424086, 0, 0.0209059231, 0)
		Title.Size = UDim2.new(0, 367, 0, 33)
		Title.Font = Enum.Font.GothamMedium
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000
		Title.Text = visualTitle
		Title.TextWrapped = true

		Description.Name = "Description"
		Description.Parent = MainNotification
		Description.Active = true
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.ClipsDescendants = true
		Description.Position = UDim2.new(0.0209424086, 0, 0.135888502, 0)
		Description.Size = UDim2.new(0, 367, 0, 196)
		Description.Font = Enum.Font.GothamMedium
		Description.TextColor3 = Color3.fromRGB(255, 255, 255)
		Description.TextSize = 12.000
		Description.TextTransparency = 0.450
		Description.TextWrapped = true
		Description.Text = visualDesc
		Description.TextYAlignment = Enum.TextYAlignment.Top

		Button.Name = "Button"
		Button.Parent = MainNotification
		Button.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0.0209424086, 0, 0.878048778, 0)
		Button.Size = UDim2.new(0, 367, 0, 26)
		Button.Font = Enum.Font.GothamBold
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextSize = 14.000
		Button.Text = visualButtonText
		Button.ClipsDescendants = true

		ButtonUICorner.CornerRadius = UDim.new(0, 4)
		ButtonUICorner.Name = "ButtonUICorner"
		ButtonUICorner.Parent = Button

		Line1.Name = "Line1"
		Line1.Parent = MainNotification
		Line1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Line1.BorderSizePixel = 0
		Line1.Position = UDim2.new(0.0209424086, 0, 0.850174189, 0)
		Line1.Size = UDim2.new(0, 367, 0, 4)

		Line2.Name = "Line2"
		Line2.Parent = Line1
		Line2.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
		Line2.BorderSizePixel = 0
		Line2.Size = UDim2.new(0, 367, 0, 4)

		UICorner.Parent = NotificationFrame

		Button.MouseEnter:Connect(function()
			TweenService:Create(
				Button,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{TextTransparency = 0}
			):Play()
			TweenService:Create(
				Button,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{BackgroundTransparency = 0}
			):Play()
		end)

		Button.MouseLeave:Connect(function()
			TweenService:Create(
				Button,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{TextTransparency = 0.5}
			):Play()
			TweenService:Create(
				Button,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{BackgroundTransparency = 0.5}
			):Play()
		end)

		Button.MouseButton1Click:Connect(function()
			CircleAnim(Button,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
			TweenService:Create(
				NotificationFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				NotificationFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationFrame:Destroy()
		end)

		TweenService:Create(
			Line2,
			TweenInfo.new(tonumber(visualDelays), Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 0, 0, 5)} -- UDim2.new(0, 128, 0, 25)
		):Play()
		delay(tonumber(visualDelays),function()
			TweenService:Create(
				NotificationFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			TweenService:Create(
				NotificationFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotificationFrame:Destroy()
		end)
	end

	local LibraryTab = {}

	function LibraryTab.tab(options)

		local Logo = options.Logo or 6034687957
		local ColorUI = options.ColorUI or _G.Settings.ConfigsUI.Color
		local Sound = options.SoundEffect or 130785805

		PageOrder = PageOrder + 1

		local name = tostring(Title) or tostring(math.random(500,100000))

		local SoundClick = Instance.new("Sound")

		SoundClick.Name = "Sound Effect"
		SoundClick.Parent = Load
		SoundClick.SoundId = "rbxassetid://"..tonumber(Sound)
		SoundClick.Volume = 1

		local ButtonBar = Instance.new("ImageButton")
		local ButtonBarUICorner = Instance.new("UICorner")

		ButtonBar.Name = "ButtonBar"
		ButtonBar.Parent = Scrollingbar
		ButtonBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
		ButtonBar.Size = UDim2.new(0, 45, 0, 45)
		ButtonBar.AutoButtonColor = false

		ButtonBarUICorner.CornerRadius = UDim.new(0, 10)
		ButtonBarUICorner.Name = "ButtonBarUICorner"
		ButtonBarUICorner.Parent = ButtonBar

		local Icon = Instance.new("ImageButton")

		Icon.Name = "Icon"
		Icon.Parent = ButtonBar
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(0, 30, 0, 30)
		Icon.Image = "http://www.roblox.com/asset/?id="..tostring(Logo)
		Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Icon.AutoButtonColor = false

		Icon.MouseEnter:Connect(function()
			TweenService:Create(
				Icon,
				TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
				{ImageColor3 = ColorUI}
			):Play()
		end)

		Icon.MouseLeave:Connect(function()
			TweenService:Create(
				Icon,
				TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
				{ImageColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
		end)

		local FocusUI = false

		local MainPage = Instance.new("Frame")
		local MainPageUICorner = Instance.new("UICorner")
		local ScrollingMainPage = Instance.new("ScrollingFrame")
		local ScrollingMainPageUIListLayout = Instance.new("UIListLayout")
		local ScrollingMainPageUIPadding = Instance.new("UIPadding")

		MainPage.Name = name.."_MainPage"
		MainPage.Parent = FolderPage
		MainPage.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		MainPage.BackgroundTransparency = 1.000
		MainPage.BorderColor3 = Color3.fromRGB(27, 42, 53)
		MainPage.Size = UDim2.new(0, 500, 0, 332)
		MainPage.LayoutOrder = PageOrder

		MainPageUICorner.CornerRadius = UDim.new(0, 3)
		MainPageUICorner.Name = "MainPageUICorner"
		MainPageUICorner.Parent = MainPage

		ScrollingMainPage.Name = "ScrollingMainPage"
		ScrollingMainPage.Parent = MainPage
		ScrollingMainPage.Active = true
		ScrollingMainPage.AnchorPoint = Vector2.new(0.5, 0.5)
		ScrollingMainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingMainPage.BackgroundTransparency = 1.000
		ScrollingMainPage.BorderSizePixel = 0
		ScrollingMainPage.Position = UDim2.new(0.5, 0, 0.5, 0)
		ScrollingMainPage.Size = UDim2.new(0, 0, 0, 0)
		ScrollingMainPage.BottomImage = ""
		ScrollingMainPage.CanvasSize = UDim2.new(0, 0, 0, 515)
		ScrollingMainPage.ScrollBarThickness = 0
		ScrollingMainPage.TopImage = ""
		ScrollingMainPage.ClipsDescendants = true

		local LoadScrollbarFocus = false

		LoadScrollbar.MouseButton1Down:Connect(function()
			SoundClick:Play()
			if LoadScrollbarFocus == false then
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{ImageColor3 = Color3.fromRGB(255, 0, 127)}
				):Play()
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 20, 0, 20)}
				):Play()
				wait(0.1)
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 30, 0, 30)}
				):Play()
				TweenService:Create(
					Scrollingbar,
					TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 500, 0, 55)}
				):Play()
				TweenService:Create(ScrollingMainPage,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Size = UDim2.new(0, 500, 0, 322)}):Play()
			else
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{ImageColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 20, 0, 20)}
				):Play()
				wait(0.1)
				TweenService:Create(
					LoadScrollbar,
					TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 30, 0, 30)}
				):Play()
				TweenService:Create(
					Scrollingbar,
					TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 500, 0, 0)}
				):Play()
				TweenService:Create(ScrollingMainPage,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Size = UDim2.new(0, 0, 0, 0)}):Play()
			end
			FocusUI = not FocusUI
			LoadScrollbarFocus = not LoadScrollbarFocus
		end)

		ScrollingMainPageUIListLayout.Name = "ScrollingMainPageUIListLayout"
		ScrollingMainPageUIListLayout.Parent = ScrollingMainPage
		ScrollingMainPageUIListLayout.FillDirection = Enum.FillDirection.Horizontal
		ScrollingMainPageUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ScrollingMainPageUIListLayout.Padding = UDim.new(0, 5)

		ScrollingMainPageUIPadding.Name = "ScrollingMainPageUIPadding"
		ScrollingMainPageUIPadding.Parent = ScrollingMainPage
		ScrollingMainPageUIPadding.PaddingLeft = UDim.new(0, 5)
		ScrollingMainPageUIPadding.PaddingTop = UDim.new(0, 5)

		Icon.MouseButton1Click:connect(function()
			if FocusUI == false then
				TweenService:Create(ScrollingMainPage,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Size = UDim2.new(0, 500, 0, 322)}):Play()
				if MainPage.Name == name.."_MainPage" then
					FolderPageUIPageLayout:JumpToIndex(MainPage.LayoutOrder)
				end
				SoundClick:Play()
			else
				TweenService:Create(ScrollingMainPage,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Size = UDim2.new(0, 0, 0, 0)}):Play()
			end
			FocusUI = not FocusUI
		end)

		local LibraryPage = {}

		function LibraryPage.page()
			local PageFrame = Instance.new("Frame")
			local PageFrameMainUICorner = Instance.new("UICorner")
			local PageFrameMainUIListLayout = Instance.new("UIListLayout")
			local PageFrameMainUIPadding = Instance.new("UIPadding")

			PageFrame.Name = "PageFrame"
			PageFrame.Parent = ScrollingMainPage
			PageFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			PageFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			PageFrame.Position = UDim2.new(0.274747461, 0, 0.492354751, 0)
			PageFrame.Size = UDim2.new(0, 490, 0, 322)
			PageFrame.BackgroundTransparency = 0

			PageFrameMainUICorner.CornerRadius = UDim.new(0, 4)
			PageFrameMainUICorner.Name = "PageFrameMainUICorner"
			PageFrameMainUICorner.Parent = PageFrame

			local ScrollingPageFrame = Instance.new("ScrollingFrame")
			local ScrollingPageFrameUIListLayout = Instance.new("UIListLayout")
			local ScrollingPageFrameUIPadding = Instance.new("UIPadding")

			ScrollingPageFrame.Name = "ScrollingMainPage"
			ScrollingPageFrame.Parent = PageFrame
			ScrollingPageFrame.Active = true
			ScrollingPageFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ScrollingPageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingPageFrame.BackgroundTransparency = 1
			ScrollingPageFrame.BorderSizePixel = 0
			ScrollingPageFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			ScrollingPageFrame.Size = UDim2.new(0, 490, 0, 322)
			ScrollingPageFrame.BottomImage = ""
			ScrollingPageFrame.CanvasSize = UDim2.new(0, 0, 0, 515)
			ScrollingPageFrame.ScrollBarThickness = 0
			ScrollingPageFrame.TopImage = ""
			ScrollingPageFrame.ClipsDescendants = true

			ScrollingPageFrameUIListLayout.Name = "ScrollingMainPageUIListLayout"
			ScrollingPageFrameUIListLayout.Parent = ScrollingPageFrame
			ScrollingPageFrameUIListLayout.FillDirection = Enum.FillDirection.Vertical
			ScrollingPageFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ScrollingPageFrameUIListLayout.Padding = UDim.new(0, 9)

			ScrollingPageFrameUIPadding.Name = "ScrollingMainPageUIPadding"
			ScrollingPageFrameUIPadding.Parent = ScrollingPageFrame
			ScrollingPageFrameUIPadding.PaddingLeft = UDim.new(0, 7)
			ScrollingPageFrameUIPadding.PaddingTop = UDim.new(0, 8)

			game:GetService("RunService").Stepped:Connect(function()
				pcall(function()
					ScrollingPageFrame.CanvasSize =  UDim2.new(0, 0, 0,ScrollingPageFrameUIListLayout.AbsoluteContentSize.Y + 20)
					ScrollingMainPage.CanvasSize = UDim2.new(0, ScrollingMainPageUIListLayout.AbsoluteContentSize.X +10, 0,0)
				end)
			end)

			local LibraryFunction = {}

			function LibraryFunction.PlayerInfo()

				local UserID = game.Players.LocalPlayer.UserId

				local ThumbType = Enum.ThumbnailType.HeadShot
				local ThumbSize = Enum.ThumbnailSize.Size420x420
				local Content = game.Players:GetUserThumbnailAsync(UserID,ThumbType,ThumbSize)

				local PlayerInfoFrame = Instance.new("Frame")
				local PlayerInfoFrameUICorner = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")
				local UICorner = Instance.new("UICorner")
				local Name = Instance.new("TextLabel")
				local Lvl = Instance.new("TextLabel")
				local Fruit = Instance.new("TextLabel")

				local Line = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")

				Line.Name = "Line"
				Line.Parent = PlayerInfoFrame
				Line.AnchorPoint = Vector2.new(0.5, 0.5)
				Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0.5, 0, 0.311723471, 0)
				Line.Size = UDim2.new(0, 454, 0, 1)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(131, 13, 72)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 127)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 9, 89)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
				UIGradient.Parent = Line

				PlayerInfoFrame.Name = "PlayerInfoFrame"
				PlayerInfoFrame.Parent = ScrollingPageFrame
				PlayerInfoFrame.Active = true
				PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
				PlayerInfoFrame.BorderSizePixel = 0
				PlayerInfoFrame.Size = UDim2.new(0, 475, 0, 300)

				PlayerInfoFrameUICorner.Name = "PlayerInfoFrameUICorner"
				PlayerInfoFrameUICorner.Parent = PlayerInfoFrame

				ImageLabel.Parent = PlayerInfoFrame
				ImageLabel.Active = true
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.0920833349, 0, 0.153858513, 0)
				ImageLabel.Size = UDim2.new(0, 70, 0, 70)
				ImageLabel.Image = Content

				UICorner.Parent = ImageLabel

				Name.Name = "Name"
				Name.Parent = PlayerInfoFrame
				Name.Active = true
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.17916666, 0, 0.0283394177, 0)
				Name.Size = UDim2.new(0, 200, 0, 27)
				Name.Font = Enum.Font.GothamBold
				Name.TextColor3 = Color3.fromRGB(255, 255, 255)
				Name.TextSize = 12.000
				Name.Text = game.Players.LocalPlayer.Name.. " ("..game.Players.LocalPlayer.DisplayName..")"
				Name.TextXAlignment = Enum.TextXAlignment.Left

				Lvl.Name = "Lvl"
				Lvl.Parent = PlayerInfoFrame
				Lvl.Active = true
				Lvl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Lvl.BackgroundTransparency = 1.000
				Lvl.Position = UDim2.new(0.17916666, 0, 0.113057934, 0)
				Lvl.Size = UDim2.new(0, 200, 0, 27)
				Lvl.TextTransparency = 0.8
				Lvl.Font = Enum.Font.GothamBold
				Lvl.TextColor3 = Color3.fromRGB(255, 255, 255)
				Lvl.TextSize = 12.000
				Lvl.TextXAlignment = Enum.TextXAlignment.Left

				Fruit.Name = "Fruit"
				Fruit.Parent = PlayerInfoFrame
				Fruit.Active = true
				Fruit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Fruit.BackgroundTransparency = 1.000
				Fruit.Position = UDim2.new(0.17916666, 0, 0.199820146, 0)
				Fruit.Size = UDim2.new(0, 200, 0, 27)
				Fruit.Font = Enum.Font.GothamBold
				Fruit.TextTransparency = 0.8
				Fruit.TextColor3 = Color3.fromRGB(255, 255, 255)
				Fruit.TextSize = 12.000
				Fruit.TextXAlignment = Enum.TextXAlignment.Left

				local id = game.PlaceId

				if id == 2753915549 or id == 4442272183 or id == 7449423635 then
					Fruit.Text = "Devil Fruit : "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.. " / ".. "Race : " ..game:GetService("Players").LocalPlayer.Data.Race.Value
				else
					Fruit.Text = "Don't Find Your Database"
					Lvl.Text = "Don't Find Your Database"
				end

				local HealthBar = Instance.new("Frame")
				local HealthBarUICorner = Instance.new("UICorner")
				local HealthText = Instance.new("TextLabel")
				local Line = Instance.new("Frame")
				local LineHealth = Instance.new("Frame")

				HealthBar.Name = "HealthBar"
				HealthBar.Parent = PlayerInfoFrame
				HealthBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
				HealthBar.BorderSizePixel = 0
				HealthBar.Position = UDim2.new(0.0187500007, 0, 0.340836018, 0)
				HealthBar.Size = UDim2.new(0, 458, 0, 45)

				HealthBarUICorner.CornerRadius = UDim.new(0, 4)
				HealthBarUICorner.Name = "HealthBarUICorner"
				HealthBarUICorner.Parent = HealthBar

				HealthText.Name = "HealthText"
				HealthText.Parent = HealthBar
				HealthText.Active = true
				HealthText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HealthText.BackgroundTransparency = 1.000
				HealthText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
				HealthText.Size = UDim2.new(0, 446, 0, 22)
				HealthText.Font = Enum.Font.GothamBold
				HealthText.Text = "Health"
				HealthText.TextColor3 = Color3.fromRGB(85, 255, 127)
				HealthText.TextSize = 12.000
				HealthText.TextWrapped = true
				HealthText.TextXAlignment = Enum.TextXAlignment.Left

				Line.Name = "Line"
				Line.Parent = HealthBar
				Line.AnchorPoint = Vector2.new(0.5, 0.5)
				Line.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
				Line.Size = UDim2.new(0, 433, 0, 5)

				LineHealth.Name = "LineHealth"
				LineHealth.Parent = Line
				LineHealth.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
				LineHealth.BorderSizePixel = 0
				LineHealth.Size = UDim2.new(0, 433, 0, 5)

				local StaminaBar = Instance.new("Frame")
				local StaminaBarUICorner = Instance.new("UICorner")
				local StaminaText = Instance.new("TextLabel")
				local StaminaLine = Instance.new("Frame")
				local LineStamina = Instance.new("Frame")

				StaminaBar.Name = "StaminaBar"
				StaminaBar.Parent = PlayerInfoFrame
				StaminaBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
				StaminaBar.BorderSizePixel = 0
				StaminaBar.Position = UDim2.new(0.0166666675, 0, 0.50803858, 0)
				StaminaBar.Size = UDim2.new(0, 458, 0, 45)

				StaminaBarUICorner.CornerRadius = UDim.new(0, 4)
				StaminaBarUICorner.Name = "StaminaBarUICorner"
				StaminaBarUICorner.Parent = StaminaBar

				StaminaText.Name = "StaminaText"
				StaminaText.Parent = StaminaBar
				StaminaText.Active = true
				StaminaText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				StaminaText.BackgroundTransparency = 1.000
				StaminaText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
				StaminaText.Size = UDim2.new(0, 446, 0, 22)
				StaminaText.Font = Enum.Font.GothamBold
				StaminaText.Text = "Stamina"
				StaminaText.TextColor3 = Color3.fromRGB(85, 170, 255)
				StaminaText.TextSize = 12.000
				StaminaText.TextWrapped = true
				StaminaText.TextXAlignment = Enum.TextXAlignment.Left

				StaminaLine.Name = "StaminaLine"
				StaminaLine.Parent = StaminaBar
				StaminaLine.AnchorPoint = Vector2.new(0.5, 0.5)
				StaminaLine.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				StaminaLine.BorderSizePixel = 0
				StaminaLine.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
				StaminaLine.Size = UDim2.new(0, 433, 0, 5)

				LineStamina.Name = "LineStamina"
				LineStamina.Parent = StaminaLine
				LineStamina.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
				LineStamina.BorderSizePixel = 0
				LineStamina.Size = UDim2.new(0, 433, 0, 5)

				local Beli = Instance.new("TextLabel")
				local Fragment = Instance.new("TextLabel")

				Beli.Name = "Beli"
				Beli.Parent = PlayerInfoFrame
				Beli.Active = true
				Beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Beli.BackgroundTransparency = 1.000
				Beli.Position = UDim2.new(0.018749997, 0, 0.67897433, 0)
				Beli.Size = UDim2.new(0, 200, 0, 27)
				Beli.Font = Enum.Font.GothamBold
				Beli.TextColor3 = Color3.fromRGB(85, 255, 127)
				Beli.TextSize = 14.000
				Beli.TextXAlignment = Enum.TextXAlignment.Left

				Fragment.Name = "Fragment"
				Fragment.Parent = PlayerInfoFrame
				Fragment.Active = true
				Fragment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Fragment.BackgroundTransparency = 1.000
				Fragment.Position = UDim2.new(0.018749997, 0, 0.765791059, 0)
				Fragment.Size = UDim2.new(0, 200, 0, 27)
				Fragment.Font = Enum.Font.GothamBold
				Fragment.TextColor3 = Color3.fromRGB(170, 85, 255)
				Fragment.TextSize = 14.000
				Fragment.TextXAlignment = Enum.TextXAlignment.Left

				local Bounty = Instance.new("TextLabel")

				Bounty.Name = "Bounty"
				Bounty.Parent = PlayerInfoFrame
				Bounty.Active = true
				Bounty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Bounty.BackgroundTransparency = 1.000
				Bounty.Position = UDim2.new(0.018749997, 0, 0.852607787, 0)
				Bounty.Size = UDim2.new(0, 200, 0, 27)
				Bounty.Font = Enum.Font.GothamBold
				Bounty.TextColor3 = Color3.fromRGB(255, 170, 0)
				Bounty.TextSize = 14.000
				Bounty.TextXAlignment = Enum.TextXAlignment.Left

				spawn(function()
					while wait(0.001) do 
						pcall(function()
							Lvl.Text = "Level : "..game:GetService("Players").LocalPlayer.Data.Level.Value
							Beli.Text = "Beli : "..game:GetService("Players").LocalPlayer.Data.Beli.Value
							Fragment.Text = "Fragments : "..game:GetService("Players").LocalPlayer.Data.Fragments.Value
							Bounty.Text = "Bounty : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
							StaminaText.Text = "Stamina : "..game.Players.LocalPlayer.Character.Energy.Value.."/"..game.Players.LocalPlayer.Character.Energy.MaxValue
							TweenService:Create(
								LineStamina,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.new(game.Players.LocalPlayer.Character.Energy.Value/game.Players.LocalPlayer.Character.Energy.MaxValue, 0, 1, 0)} -- UDim2.new(0, 128, 0, 25)
							):Play()

							HealthText.Text = "Health : "..game.Players.LocalPlayer.Character.Humanoid.Health.."/"..game.Players.LocalPlayer.Character.Humanoid.MaxHealth
							TweenService:Create(
								LineHealth,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.new(game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth, 0, 0, 5)} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end)
					end
				end)
			end

			function LibraryFunction.Line()
				local LineFrame = Instance.new("Frame")
				local Line = Instance.new("TextButton")

				LineFrame.Name = "LineFrame"
				LineFrame.Parent = ScrollingPageFrame
				LineFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				LineFrame.BackgroundTransparency = 1.000
				LineFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				LineFrame.Size = UDim2.new(0, 475, 0, 15)

				Line.Name = "Line"
				Line.Parent = LineFrame
				Line.AnchorPoint = Vector2.new(0.5, 0.5)
				Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Line.BackgroundTransparency = 0.750
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0.5, 0, 0.5, 0)
				Line.Size = UDim2.new(0, 478, 0, 1)
				Line.Font = Enum.Font.SourceSans
				Line.Text = ""
				Line.TextColor3 = Color3.fromRGB(0, 0, 0)
				Line.TextSize = 14.000
			end
			
			function LibraryFunction.TextBox(options)
				
				local NameTitle = options.Title or "TextBox"
				local Holder = options.Holder or "Holder"
				local callback = options.callback or function() end

				local TextBoxFrame = Instance.new("Frame")
				local TextBoxFrameUICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local TextBoxMain = Instance.new("TextButton")
				local TextBox = Instance.new("TextBox")
				local TextBoxUICorner = Instance.new("UICorner")

				TextBoxFrame.Name = "TextBoxFrame"
				TextBoxFrame.Parent = ScrollingPageFrame
				TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				TextBoxFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				TextBoxFrame.Size = UDim2.new(0, 475, 0, 35)

				TextBoxFrameUICorner.Name = "TextBoxFrameUICorner"
				TextBoxFrameUICorner.Parent = TextBoxFrame

				Title.Name = "Title"
				Title.Parent = TextBoxFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.0208332911, 0, 0, 0)
				Title.Size = UDim2.new(0, 240, 0, 35)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextTransparency = 0.450
				Title.TextWrapped = true
				Title.Text = NameTitle
				Title.TextXAlignment = Enum.TextXAlignment.Left

				TextBoxMain.Name = "TextBoxMain"
				TextBoxMain.Parent = TextBoxFrame
				TextBoxMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBoxMain.BackgroundTransparency = 1.000
				TextBoxMain.Size = UDim2.new(0, 478, 0, 35)
				TextBoxMain.Font = Enum.Font.SourceSans
				TextBoxMain.Text = ""
				TextBoxMain.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextBoxMain.TextSize = 14.000

				TextBox.Parent = TextBoxMain
				TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.819999993, 0, 0.5, 0)
				TextBox.Size = UDim2.new(0, 150, 0, 25)
				TextBox.Font = Enum.Font.GothamBold
				TextBox.Text = Holder
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000
				TextBox.TextTransparency = 0.450

				TextBoxUICorner.Name = "TextBoxUICorner"
				TextBoxUICorner.Parent = TextBox
				
				TextBox.FocusLost:Connect(function(ep)
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
						end
					end
				end)
			end

			function LibraryFunction.Toggle(options)

				local TitleT = options.Title or "Toggle"
				local default = options.Default or false
				local callback = options.callback or function() end

				local ToggleFrame = Instance.new("Frame")
				local ToggleFrameUICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local ButtonToggle = Instance.new("TextButton")
				local Toggle_1 = Instance.new("ImageButton")
				local Toggle_1UICorner = Instance.new("UICorner")
				local Toggle_2 = Instance.new("ImageButton")
				local Toggle_2UICorner = Instance.new("UICorner")

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = ScrollingPageFrame
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
				ToggleFrame.Size = UDim2.new(0, 475, 0, 46)

				ToggleFrameUICorner.Name = "ToggleFrameUICorner"
				ToggleFrameUICorner.Parent = ToggleFrame

				Title.Name = "Title"
				Title.Parent = ToggleFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.020833334, 0, 0, 0)
				Title.Size = UDim2.new(0, 406, 0, 46)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.Text = tostring(TitleT)
				Title.TextTransparency = 0.450
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				ButtonToggle.Name = "ButtonToggle"
				ButtonToggle.Parent = ToggleFrame
				ButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonToggle.BackgroundTransparency = 1.000
				ButtonToggle.Size = UDim2.new(0, 478, 0, 46)
				ButtonToggle.Font = Enum.Font.SourceSans
				ButtonToggle.Text = ""
				ButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtonToggle.TextSize = 14.000
				ButtonToggle.ClipsDescendants = true

				Toggle_1.Name = "Toggle_1"
				Toggle_1.Parent = ButtonToggle
				Toggle_1.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle_1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				Toggle_1.Position = UDim2.new(0.91, 0, 0.5, 0)
				Toggle_1.Size = UDim2.new(0, 50, 0, 24)
				Toggle_1.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				Toggle_1.ImageTransparency = 1.000

				Toggle_1UICorner.CornerRadius = UDim.new(0, 30)
				Toggle_1UICorner.Name = "Toggle_1UICorner"
				Toggle_1UICorner.Parent = Toggle_1

				Toggle_2.Name = "Toggle_2"
				Toggle_2.Parent = Toggle_1
				Toggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle_2.BackgroundTransparency = 0.45
				Toggle_2.Position = UDim2.new(0.219999999, 0, 0.5, 0)
				Toggle_2.Size = UDim2.new(0, 16, 0, 16)
				Toggle_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				Toggle_2.ImageTransparency = 1.000

				Toggle_2UICorner.CornerRadius = UDim.new(0, 30)
				Toggle_2UICorner.Name = "Toggle_2UICorner"
				Toggle_2UICorner.Parent = Toggle_2

				local visual = {toggle = false , lock = true , togglefunction ={

				},}

				ButtonToggle.MouseEnter:Connect(function()
					if visual.toggle == false and visual.lock == true then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end
				end)

				ButtonToggle.MouseLeave:Connect(function()
					if visual.toggle == false and visual.lock == true then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.45}
						):Play()
					end
				end)

				ButtonToggle.MouseButton1Down:Connect(function()
					CircleAnim(ButtonToggle,Color3.fromRGB(255, 255, 255),Color3.fromRGB(255, 255, 255))
					if visual.toggle == false and visual.lock == true then
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 0}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(255, 0, 127)}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.78, 0, 0.5, 0)}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 22, 0, 16)}
						):Play()
						wait(.12)
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 16, 0, 16)}
						):Play()
					elseif visual.lock == true then
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 0.45}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.219999999, 0, 0.5, 0)}
						):Play()
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 22, 0, 16)}
						):Play()
						wait(.12)
						TweenService:Create(
							Toggle_2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 16, 0, 16)}
						):Play()
					end
					if  visual.lock == true  then
						visual.toggle = not visual.toggle
						callback(visual.toggle)
					end
				end)

				if default == true then
					TweenService:Create(
						Title,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						Toggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Toggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255, 0, 127)}
					):Play()
					TweenService:Create(
						Toggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Position = UDim2.new(0.78, 0, 0.5, 0)}
					):Play()
					TweenService:Create(
						Toggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 22, 0, 16)}
					):Play()
					wait(.12)
					TweenService:Create(
						Toggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 16, 0, 16)}
					):Play()
					if  visual.lock == true  then
						visual.toggle = not visual.toggle
						callback(visual.toggle)
					end
				end

				local LockerFrame = Instance.new("Frame")
				local LockIcon = Instance.new("ImageLabel")

				LockerFrame.Name = "LockerFrame"
				LockerFrame.Parent = ToggleFrame
				LockerFrame.Active = true
				LockerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				LockerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				LockerFrame.BorderSizePixel = 0
				LockerFrame.ClipsDescendants = true
				LockerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				LockerFrame.Size = UDim2.new(0, 480, 0, 46)
				LockerFrame.BackgroundTransparency = 1

				LockIcon.Name = "LockIcon"
				LockIcon.Parent = LockerFrame
				LockIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				LockIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LockIcon.BackgroundTransparency = 1.000
				LockIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
				LockIcon.Size = UDim2.new(0, 0, 0, 0)
				LockIcon.Image = "http://www.roblox.com/asset/?id=6031082533"

				function visual.togglefunction.lock()
					visual.lock = false
					TweenService:Create(
						LockerFrame,
						TweenInfo.new(.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out,0.1),
						{BackgroundTransparency = 0.1}
					):Play()
					wait(0.5)
					TweenService:Create(
						LockIcon,
						TweenInfo.new(.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 20, 0, 20)}
					):Play()
				end
				function visual.togglefunction.unlock()
					visual.lock = true
					TweenService:Create(
						LockerFrame,
						TweenInfo.new(.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out,0.1),
						{BackgroundTransparency = 1}
					):Play()
					wait(0.5)
					TweenService:Create(
						LockIcon,
						TweenInfo.new(.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 0, 0, 0)}
					):Play()
				end

				LockerFrame.MouseEnter:Connect(function()
					for i = 1,3 do
						TweenService:Create(LockIcon, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
						wait(.1)
						TweenService:Create(LockIcon, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
						wait(.1)
					end
					TweenService:Create(LockIcon, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				end)
				LockerFrame.MouseLeave:Connect(function()
					TweenService:Create(LockIcon, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				end)
				return visual.togglefunction
			end

			function LibraryFunction.Button(options)

				local TitleButton = options.Title or "Button"
				local callback = options.callback or function() end

				local ButtonFrame = Instance.new("Frame")
				local ButtonFrameUICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local Button = Instance.new("TextButton")

				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = ScrollingPageFrame
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
				ButtonFrame.BackgroundTransparency = 0.450
				ButtonFrame.Size = UDim2.new(0, 475, 0, 35)

				ButtonFrameUICorner.Name = "ButtonFrameUICorner"
				ButtonFrameUICorner.Parent = ButtonFrame

				Title.Name = "Title"
				Title.Parent = ButtonFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.020833334, 0, 0, 0)
				Title.Size = UDim2.new(0, 406, 0, 35)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextTransparency = 0.450
				Title.TextWrapped = true
				Title.Text = tostring(TitleButton)
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Button.Name = "Button"
				Button.Parent = ButtonFrame
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.Size = UDim2.new(0, 478, 0, 35)
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.ClipsDescendants = true

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Title,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Title,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.45}
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0.45}
					):Play()
				end)

				Button.MouseButton1Down:Connect(function()
					CircleAnim(Button,Color3.fromRGB(0, 0, 0),Color3.fromRGB(0, 0, 0))
					pcall(callback)
				end)
			end
			
			function LibraryFunction.MultiDropdown(options)

				local TitleDropdown = options.Title or "MultiDropdown"
				local callback = options.callback or function() end
				local Item = options.Item or {}
				local Default = options.Default or {}
				local DropdownFocus = false
				local DropdownFunctions = {}
				local MultiDropdown = {}

				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameUICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local ButtonDropdown = Instance.new("TextButton")
				local Arrow = Instance.new("ImageLabel")

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = ScrollingPageFrame
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				DropdownFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DropdownFrame.Size = UDim2.new(0, 475, 0, 35)

				DropdownFrameUICorner.Name = "DropdownFrameUICorner"
				DropdownFrameUICorner.Parent = DropdownFrame

				Title.Name = "Title"
				Title.Parent = DropdownFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.020833334, 0, 0, 0)
				Title.Size = UDim2.new(0, 406, 0, 35)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextTransparency = 0.450
				Title.Text = TitleDropdown.." | "
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				ButtonDropdown.Name = "ButtonDropdown"
				ButtonDropdown.Parent = DropdownFrame
				ButtonDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonDropdown.BackgroundTransparency = 1.000
				ButtonDropdown.Size = UDim2.new(0, 478, 0, 35)
				ButtonDropdown.Font = Enum.Font.SourceSans
				ButtonDropdown.Text = ""
				ButtonDropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtonDropdown.TextSize = 14.000
				ButtonDropdown.ClipsDescendants = true

				Arrow.Name = "Arrow"
				Arrow.Parent = DropdownFrame
				Arrow.Active = true
				Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
				Arrow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Arrow.BackgroundTransparency = 1.000
				Arrow.Position = UDim2.new(0.960416675, 0, 0.5, 0)
				Arrow.Rotation = 90.000
				Arrow.Size = UDim2.new(0, 28, 0, 28)
				Arrow.Image = "http://www.roblox.com/asset/?id=6026663699"
				Arrow.ImageTransparency = 0.450

				local SelectionScrollingFrame = Instance.new("ScrollingFrame")
				local UIListLayoutSelectionScrollingFrame = Instance.new("UIListLayout")
				local UIPaddingSelectionScrollingFrame = Instance.new("UIPadding")

				local SelectionFrame = Instance.new("Frame")

				SelectionFrame.Name = "SelectionFrame"
				SelectionFrame.Parent = ScrollingPageFrame
				SelectionFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				SelectionFrame.BorderSizePixel = 0
				SelectionFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				SelectionFrame.Position = UDim2.new(0, 0, 0.413249224, 0)
				SelectionFrame.Size = UDim2.new(0, 475, 0, 0)
				SelectionFrame.ClipsDescendants = true
				SelectionFrame.Visible = true

				local SelectionFrameUICorner = Instance.new("UICorner")

				SelectionFrameUICorner.Name = "SelectionFrameUICorner"
				SelectionFrameUICorner.Parent = SelectionFrame

				SelectionScrollingFrame.Name = "SelectionScrollingFrame"
				SelectionScrollingFrame.Parent = SelectionFrame
				SelectionScrollingFrame.Active = true
				SelectionScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SelectionScrollingFrame.BackgroundTransparency = 1.000
				SelectionScrollingFrame.BorderSizePixel = 0
				SelectionScrollingFrame.Size = UDim2.new(0, 475, 0, 120)
				SelectionScrollingFrame.ScrollBarThickness = 0

				UIListLayoutSelectionScrollingFrame.Name = "UIListLayoutSelectionScrollingFrame"
				UIListLayoutSelectionScrollingFrame.Parent = SelectionScrollingFrame
				UIListLayoutSelectionScrollingFrame.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayoutSelectionScrollingFrame.Padding = UDim.new(0, 5)

				UIPaddingSelectionScrollingFrame.Name = "UIPaddingSelectionScrollingFrame"
				UIPaddingSelectionScrollingFrame.Parent = SelectionScrollingFrame
				UIPaddingSelectionScrollingFrame.PaddingLeft = UDim.new(0, 5)
				UIPaddingSelectionScrollingFrame.PaddingTop = UDim.new(0, 5)

				for i,v in pairs(Item) do
					local BarDropdown = Instance.new("Frame")
					local ButtonBar = Instance.new("TextButton")
					local Logo = Instance.new("ImageLabel")
					local TextButtonBar = Instance.new("TextLabel")

					for o,p in pairs(Default) do
						if v == p  then
							table.insert(MultiDropdown,p)
							Title.Text = tostring(TitleDropdown.." : "..table.concat(MultiDropdown,","))
							pcall(callback,p)
							pcall(callback,MultiDropdown)
						end
					end

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = SelectionScrollingFrame
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BackgroundTransparency = 1.000
					BarDropdown.Size = UDim2.new(0, 465, 0, 36)

					ButtonBar.Name = "ButtonBar"
					ButtonBar.Parent = BarDropdown
					ButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonBar.BackgroundTransparency = 1.000
					ButtonBar.Size = UDim2.new(0, 465, 0, 36)
					ButtonBar.Font = Enum.Font.SourceSans
					ButtonBar.Text = ""
					ButtonBar.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonBar.TextSize = 14.000
					ButtonBar.ClipsDescendants = true

					Logo.Name = "Logo"
					Logo.Parent = ButtonBar
					Logo.AnchorPoint = Vector2.new(0.5, 0.5)
					Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Logo.BackgroundTransparency = 1.000
					Logo.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
					Logo.Size = UDim2.new(0, 25, 0, 25)
					Logo.Image = "http://www.roblox.com/asset/?id=6031251532"
					Logo.ImageTransparency = 0.450

					TextButtonBar.Name = "TextButtonBar"
					TextButtonBar.Parent = ButtonBar
					TextButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.BackgroundTransparency = 1.000
					TextButtonBar.Position = UDim2.new(0.0924731195, 0, 0.138888896, 0)
					TextButtonBar.Size = UDim2.new(0, 422, 0, 25)
					TextButtonBar.Font = Enum.Font.GothamBold
					TextButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.TextSize = 14.000
					TextButtonBar.TextTransparency = 0.450
					TextButtonBar.TextWrapped = true
					TextButtonBar.Text = v
					TextButtonBar.TextXAlignment = Enum.TextXAlignment.Left

					ButtonBar.MouseButton1Down:Connect(function()
						if tablefound(MultiDropdown,v) == false then
							table.insert(MultiDropdown,v)
							TweenService:Create(
								TextButtonBar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Logo,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255, 0, 127)}
							):Play()
						else
							for ine,va in pairs(MultiDropdown) do
								if va == v then
									table.remove(MultiDropdown,ine)
								end
							end
							TweenService:Create(
								TextButtonBar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.45}
							):Play()
							TweenService:Create(
								Logo,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
						end
						Title.Text = tostring(TitleDropdown.." : "..table.concat(MultiDropdown,","))
						CircleAnim(ButtonBar,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
						pcall(callback,MultiDropdown)
					end)
				end

				ButtonDropdown.MouseEnter:Connect(function()
					if DropdownFocus == false then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end
				end)

				ButtonDropdown.MouseLeave:Connect(function()
					if DropdownFocus == false then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.45}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0.45}
						):Play()
					end
				end)

				ButtonDropdown.MouseButton1Down:Connect(function()
					CircleAnim(ButtonDropdown,Color3.fromRGB(255, 255, 255),Color3.fromRGB(255, 255, 255))
					if DropdownFocus == false then
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)}
						):Play()
						wait(.1)
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 28, 0, 28)}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(255, 0, 127)}
						):Play()
						TweenService:Create(
							SelectionFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 475, 0, 120)}
						):Play()
					else
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)}
						):Play()
						wait(.1)
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 28, 0, 28)}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(255, 255, 255)}
						):Play()
						TweenService:Create(
							SelectionFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 475, 0, 0)}
						):Play()
					end
					SelectionScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayoutSelectionScrollingFrame.AbsoluteContentSize.Y + 10)
					DropdownFocus = not DropdownFocus
				end)

				function DropdownFunctions.GetText(value)
					Title.Text = TitleDropdown.." | "..value
				end

				function DropdownFunctions.Clear()
					TweenService:Create(
						SelectionFrame,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 475, 0, 0)}
					):Play()
					DropdownFocus = not DropdownFocus
					Title.Text = tostring(TitleDropdown.." | ")
					for i, v in next, SelectionScrollingFrame:GetChildren() do
						if v:IsA("Frame") then
							v:Destroy()
						end
					end
				end

				function DropdownFunctions.Add(value)

					local BarDropdown = Instance.new("Frame")
					local ButtonBar = Instance.new("TextButton")
					local Logo = Instance.new("ImageLabel")
					local TextButtonBar = Instance.new("TextLabel")

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = SelectionScrollingFrame
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BackgroundTransparency = 1.000
					BarDropdown.Size = UDim2.new(0, 465, 0, 36)

					ButtonBar.Name = "ButtonBar"
					ButtonBar.Parent = BarDropdown
					ButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonBar.BackgroundTransparency = 1.000
					ButtonBar.Size = UDim2.new(0, 465, 0, 36)
					ButtonBar.Font = Enum.Font.SourceSans
					ButtonBar.Text = ""
					ButtonBar.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonBar.TextSize = 14.000
					ButtonBar.ClipsDescendants = true

					Logo.Name = "Logo"
					Logo.Parent = ButtonBar
					Logo.AnchorPoint = Vector2.new(0.5, 0.5)
					Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Logo.BackgroundTransparency = 1.000
					Logo.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
					Logo.Size = UDim2.new(0, 25, 0, 25)
					Logo.Image = "http://www.roblox.com/asset/?id=6031251532"
					Logo.ImageTransparency = 0.450

					TextButtonBar.Name = "TextButtonBar"
					TextButtonBar.Parent = ButtonBar
					TextButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.BackgroundTransparency = 1.000
					TextButtonBar.Position = UDim2.new(0.0924731195, 0, 0.138888896, 0)
					TextButtonBar.Size = UDim2.new(0, 422, 0, 25)
					TextButtonBar.Font = Enum.Font.GothamBold
					TextButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.TextSize = 14.000
					TextButtonBar.TextTransparency = 0.450
					TextButtonBar.TextWrapped = true
					TextButtonBar.Text = value
					TextButtonBar.TextXAlignment = Enum.TextXAlignment.Left

					ButtonBar.MouseButton1Down:Connect(function()
						if tablefound(MultiDropdown,value) == false then
							table.insert(MultiDropdown,value)
							TweenService:Create(
								TextButtonBar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Logo,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255, 0, 127)}
							):Play()
						else
							for ine,va in pairs(MultiDropdown) do
								if va == value then
									table.remove(MultiDropdown,ine)
								end
							end
							TweenService:Create(
								TextButtonBar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.45}
							):Play()
							TweenService:Create(
								Logo,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
						end
						Title.Text = tostring(TitleDropdown.." : "..table.concat(MultiDropdown,","))
						CircleAnim(ButtonBar,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
						pcall(callback,MultiDropdown)
					end)
					SelectionScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayoutSelectionScrollingFrame.AbsoluteContentSize.Y + 10)
					DropdownFocus = not DropdownFocus
				end

				return DropdownFunctions
			end

			function LibraryFunction.Dropdown(options)

				local TitleDropdown = options.Title or "Dropdown | nil"
				local callback = options.callback or function() end
				local Item = options.Item or {}
				local Default = options.Default or {}
				local DropdownFocus = false
				local DropdownFunctions = {}

				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameUICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local ButtonDropdown = Instance.new("TextButton")
				local Arrow = Instance.new("ImageLabel")

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = ScrollingPageFrame
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				DropdownFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DropdownFrame.Size = UDim2.new(0, 475, 0, 35)

				DropdownFrameUICorner.Name = "DropdownFrameUICorner"
				DropdownFrameUICorner.Parent = DropdownFrame

				Title.Name = "Title"
				Title.Parent = DropdownFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.020833334, 0, 0, 0)
				Title.Size = UDim2.new(0, 406, 0, 35)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextTransparency = 0.450
				Title.Text = TitleDropdown.." | "
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				ButtonDropdown.Name = "ButtonDropdown"
				ButtonDropdown.Parent = DropdownFrame
				ButtonDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonDropdown.BackgroundTransparency = 1.000
				ButtonDropdown.Size = UDim2.new(0, 478, 0, 35)
				ButtonDropdown.Font = Enum.Font.SourceSans
				ButtonDropdown.Text = ""
				ButtonDropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtonDropdown.TextSize = 14.000
				ButtonDropdown.ClipsDescendants = true

				Arrow.Name = "Arrow"
				Arrow.Parent = DropdownFrame
				Arrow.Active = true
				Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
				Arrow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Arrow.BackgroundTransparency = 1.000
				Arrow.Position = UDim2.new(0.960416675, 0, 0.5, 0)
				Arrow.Rotation = 90.000
				Arrow.Size = UDim2.new(0, 28, 0, 28)
				Arrow.Image = "http://www.roblox.com/asset/?id=6026663699"
				Arrow.ImageTransparency = 0.450

				local SelectionScrollingFrame = Instance.new("ScrollingFrame")
				local UIListLayoutSelectionScrollingFrame = Instance.new("UIListLayout")
				local UIPaddingSelectionScrollingFrame = Instance.new("UIPadding")

				local SelectionFrame = Instance.new("Frame")

				SelectionFrame.Name = "SelectionFrame"
				SelectionFrame.Parent = ScrollingPageFrame
				SelectionFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				SelectionFrame.BorderSizePixel = 0
				SelectionFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				SelectionFrame.Position = UDim2.new(0, 0, 0.413249224, 0)
				SelectionFrame.Size = UDim2.new(0, 475, 0, 0)
				SelectionFrame.ClipsDescendants = true
				SelectionFrame.Visible = true

				local SelectionFrameUICorner = Instance.new("UICorner")

				SelectionFrameUICorner.Name = "SelectionFrameUICorner"
				SelectionFrameUICorner.Parent = SelectionFrame

				SelectionScrollingFrame.Name = "SelectionScrollingFrame"
				SelectionScrollingFrame.Parent = SelectionFrame
				SelectionScrollingFrame.Active = true
				SelectionScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SelectionScrollingFrame.BackgroundTransparency = 1.000
				SelectionScrollingFrame.BorderSizePixel = 0
				SelectionScrollingFrame.Size = UDim2.new(0, 475, 0, 120)
				SelectionScrollingFrame.ScrollBarThickness = 0

				UIListLayoutSelectionScrollingFrame.Name = "UIListLayoutSelectionScrollingFrame"
				UIListLayoutSelectionScrollingFrame.Parent = SelectionScrollingFrame
				UIListLayoutSelectionScrollingFrame.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayoutSelectionScrollingFrame.Padding = UDim.new(0, 5)

				UIPaddingSelectionScrollingFrame.Name = "UIPaddingSelectionScrollingFrame"
				UIPaddingSelectionScrollingFrame.Parent = SelectionScrollingFrame
				UIPaddingSelectionScrollingFrame.PaddingLeft = UDim.new(0, 5)
				UIPaddingSelectionScrollingFrame.PaddingTop = UDim.new(0, 5)

				for i,v in pairs(Item) do
					local BarDropdown = Instance.new("Frame")
					local ButtonBar = Instance.new("TextButton")
					local Logo = Instance.new("ImageLabel")
					local TextButtonBar = Instance.new("TextLabel")

					for o,p in pairs(Default) do
						if v == p  then
							Title.Text = tostring(Title.." | "..p)
							callback(p)
						end
					end

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = SelectionScrollingFrame
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BackgroundTransparency = 1.000
					BarDropdown.Size = UDim2.new(0, 465, 0, 36)

					ButtonBar.Name = "ButtonBar"
					ButtonBar.Parent = BarDropdown
					ButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonBar.BackgroundTransparency = 1.000
					ButtonBar.Size = UDim2.new(0, 465, 0, 36)
					ButtonBar.Font = Enum.Font.SourceSans
					ButtonBar.Text = ""
					ButtonBar.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonBar.TextSize = 14.000
					ButtonBar.ClipsDescendants = true

					Logo.Name = "Logo"
					Logo.Parent = ButtonBar
					Logo.AnchorPoint = Vector2.new(0.5, 0.5)
					Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Logo.BackgroundTransparency = 1.000
					Logo.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
					Logo.Size = UDim2.new(0, 25, 0, 25)
					Logo.Image = "http://www.roblox.com/asset/?id=6031251532"
					Logo.ImageTransparency = 0.450

					TextButtonBar.Name = "TextButtonBar"
					TextButtonBar.Parent = ButtonBar
					TextButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.BackgroundTransparency = 1.000
					TextButtonBar.Position = UDim2.new(0.0924731195, 0, 0.138888896, 0)
					TextButtonBar.Size = UDim2.new(0, 422, 0, 25)
					TextButtonBar.Font = Enum.Font.GothamBold
					TextButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.TextSize = 14.000
					TextButtonBar.TextTransparency = 0.450
					TextButtonBar.TextWrapped = true
					TextButtonBar.Text = v
					TextButtonBar.TextXAlignment = Enum.TextXAlignment.Left

					ButtonBar.MouseEnter:Connect(function()
						TweenService:Create(
							TextButtonBar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
						TweenService:Create(
							Logo,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end)

					ButtonBar.MouseLeave:Connect(function()
						TweenService:Create(
							TextButtonBar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.45}
						):Play()
						TweenService:Create(
							Logo,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0.45}
						):Play()
					end)

					ButtonBar.MouseButton1Down:Connect(function()
						Title.Text = TitleDropdown.." | "..v
						CircleAnim(ButtonBar,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
						callback(v)
					end)
				end

				ButtonDropdown.MouseEnter:Connect(function()
					if DropdownFocus == false then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end
				end)

				ButtonDropdown.MouseLeave:Connect(function()
					if DropdownFocus == false then
						TweenService:Create(
							Title,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.45}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0.45}
						):Play()
					end
				end)

				ButtonDropdown.MouseButton1Down:Connect(function()
					CircleAnim(ButtonDropdown,Color3.fromRGB(255, 255, 255),Color3.fromRGB(255, 255, 255))
					if DropdownFocus == false then
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)}
						):Play()
						wait(.1)
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 28, 0, 28)}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(255, 0, 127)}
						):Play()
						TweenService:Create(
							SelectionFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 475, 0, 120)}
						):Play()
					else
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)}
						):Play()
						wait(.1)
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 28, 0, 28)}
						):Play()
						TweenService:Create(
							Arrow,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(255, 255, 255)}
						):Play()
						TweenService:Create(
							SelectionFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 475, 0, 0)}
						):Play()
					end
					SelectionScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayoutSelectionScrollingFrame.AbsoluteContentSize.Y + 10)
					DropdownFocus = not DropdownFocus
				end)

				function DropdownFunctions.GetText(value)
					Title.Text = TitleDropdown.." | "..value
				end

				function DropdownFunctions.Clear()
					TweenService:Create(
						SelectionFrame,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 475, 0, 0)}
					):Play()
					DropdownFocus = not DropdownFocus
					Title.Text = tostring(TitleDropdown.." | ")
					for i, v in next, SelectionScrollingFrame:GetChildren() do
						if v:IsA("Frame") then
							v:Destroy()
						end
					end
				end

				function DropdownFunctions.Add(value)

					local BarDropdown = Instance.new("Frame")
					local ButtonBar = Instance.new("TextButton")
					local Logo = Instance.new("ImageLabel")
					local TextButtonBar = Instance.new("TextLabel")

					BarDropdown.Name = "BarDropdown"
					BarDropdown.Parent = SelectionScrollingFrame
					BarDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BarDropdown.BackgroundTransparency = 1.000
					BarDropdown.Size = UDim2.new(0, 465, 0, 36)

					ButtonBar.Name = "ButtonBar"
					ButtonBar.Parent = BarDropdown
					ButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonBar.BackgroundTransparency = 1.000
					ButtonBar.Size = UDim2.new(0, 465, 0, 36)
					ButtonBar.Font = Enum.Font.SourceSans
					ButtonBar.Text = ""
					ButtonBar.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonBar.TextSize = 14.000
					ButtonBar.ClipsDescendants = true

					Logo.Name = "Logo"
					Logo.Parent = ButtonBar
					Logo.AnchorPoint = Vector2.new(0.5, 0.5)
					Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Logo.BackgroundTransparency = 1.000
					Logo.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
					Logo.Size = UDim2.new(0, 25, 0, 25)
					Logo.Image = "http://www.roblox.com/asset/?id=6031251532"
					Logo.ImageTransparency = 0.450

					TextButtonBar.Name = "TextButtonBar"
					TextButtonBar.Parent = ButtonBar
					TextButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.BackgroundTransparency = 1.000
					TextButtonBar.Position = UDim2.new(0.0924731195, 0, 0.138888896, 0)
					TextButtonBar.Size = UDim2.new(0, 422, 0, 25)
					TextButtonBar.Font = Enum.Font.GothamBold
					TextButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButtonBar.TextSize = 14.000
					TextButtonBar.TextTransparency = 0.450
					TextButtonBar.TextWrapped = true
					TextButtonBar.Text = value
					TextButtonBar.TextXAlignment = Enum.TextXAlignment.Left

					ButtonBar.MouseEnter:Connect(function()
						TweenService:Create(
							TextButtonBar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
						TweenService:Create(
							Logo,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0}
						):Play()
					end)

					ButtonBar.MouseLeave:Connect(function()
						TweenService:Create(
							TextButtonBar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.45}
						):Play()
						TweenService:Create(
							Logo,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ImageTransparency = 0.45}
						):Play()
					end)

					ButtonBar.MouseButton1Down:Connect(function()
						Title.Text = TitleDropdown.." | "..value
						CircleAnim(ButtonBar,Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255))
						callback(value)
					end)

					SelectionScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayoutSelectionScrollingFrame.AbsoluteContentSize.Y + 10)
					DropdownFocus = not DropdownFocus
				end

				return DropdownFunctions
			end

			function LibraryFunction.Slider(options)

				local sliderfunc = {}

				local visualTitle = options.Title or "Slider"
				local visualMax = options.Max or 100
				local visualMin = options.Min or 0
				local visualDec = options.Dec or false
				local visualDefault = options.Default or 50
				local visualcallback = options.callback or function() end

				local SliderFrame = Instance.new("Frame")
				local SliderFrame2 = Instance.new("Frame")
				local SliderFrame2UICorner = Instance.new("UICorner")
				local CustomValueMain = Instance.new("Frame")
				local CustomValueMainUICorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")
				local SliderValueFrame = Instance.new("Frame")
				local SliderValueFrame_2 = Instance.new("Frame")
				local SliderValueFrame_3 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local SliderTitle = Instance.new("TextLabel")
				local UICorner_3 = Instance.new("UICorner")

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = ScrollingPageFrame
				SliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				SliderFrame.BorderSizePixel = 0
				SliderFrame.ClipsDescendants = true
				SliderFrame.Position = UDim2.new(0, 0, 0.717121601, 0)
				SliderFrame.Size = UDim2.new(0, 475, 0, 42)

				SliderFrame2.Name = "SliderFrame2"
				SliderFrame2.Parent = SliderFrame
				SliderFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				SliderFrame2.BackgroundTransparency = 1.000
				SliderFrame2.BorderSizePixel = 0
				SliderFrame2.ClipsDescendants = true
				SliderFrame2.Position = UDim2.new(0.500085711, 0, 0.5, 0)
				SliderFrame2.Size = UDim2.new(0, 475, 0, 42)

				SliderFrame2UICorner.CornerRadius = UDim.new(0, 4)
				SliderFrame2UICorner.Name = "SliderFrame2UICorner"
				SliderFrame2UICorner.Parent = SliderFrame2

				CustomValueMain.Name = "CustomValueMain"
				CustomValueMain.Parent = SliderFrame2
				CustomValueMain.AnchorPoint = Vector2.new(0.5, 0.5)
				CustomValueMain.BackgroundColor3 = Color3.fromRGB(68, 187, 165)
				CustomValueMain.BackgroundTransparency = 1.000
				CustomValueMain.BorderSizePixel = 0
				CustomValueMain.ClipsDescendants = true
				CustomValueMain.Position = UDim2.new(0.865607262, 0, 0.25, 0)
				CustomValueMain.Size = UDim2.new(0, 105, 0, 20)

				CustomValueMainUICorner.CornerRadius = UDim.new(0, 4)
				CustomValueMainUICorner.Name = "CustomValueMainUICorner"
				CustomValueMainUICorner.Parent = CustomValueMain

				TextBox.Parent = CustomValueMain
				TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderSizePixel = 0
				TextBox.ClipsDescendants = true
				TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextBox.Size = UDim2.new(0, 68, 0, 18)
				TextBox.Font = Enum.Font.GothamMedium
				TextBox.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
				TextBox.Text = tostring(visualDefault and math.floor( (visualDefault / visualMax) * (visualMax - visualMin) + visualMin) or 0)
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextTransparency = 1.000
				if visualDec == true then
					TextBox.Text =  tostring(visualDefault and string.format("%.1f",(visualDefault / visualMax) * (visualMax - visualMin) + visualMin) or 0)
				else
					TextBox.Text = tostring(visualDefault and math.floor( (visualDefault / visualMax) * (visualMax - visualMin) + visualMin) or 0)
				end

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Name = ""
				UICorner.Parent = TextBox

				SliderValueFrame.Name = "SliderValueFrame"
				SliderValueFrame.Parent = SliderFrame2
				SliderValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderValueFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				SliderValueFrame.BorderSizePixel = 0
				SliderValueFrame.Position = UDim2.new(0.499490649, 0, 0.770000637, 0)
				SliderValueFrame.Size = UDim2.new(0, 465, 0, 5)

				SliderValueFrame_2.Name = "SliderValueFrame"
				SliderValueFrame_2.Parent = SliderValueFrame
				SliderValueFrame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
				SliderValueFrame_2.BorderSizePixel = 0
				SliderValueFrame_2.Size = UDim2.new((visualDefault or 0) / visualMax, 0, 0, 5)

				SliderValueFrame_3.Name = "SliderValueFrame"
				SliderValueFrame_3.Parent = SliderValueFrame
				SliderValueFrame_3.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderValueFrame_3.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
				SliderValueFrame_3.BorderSizePixel = 0
				SliderValueFrame_3.ClipsDescendants = true
				SliderValueFrame_3.Position = UDim2.new((visualDefault or 0)/visualMax, 0.5, 0.5,0.5, 0)
				SliderValueFrame_3.Size = UDim2.new(0, 10, 0, 10)

				UICorner_2.CornerRadius = UDim.new(0, 300)
				UICorner_2.Name = ""
				UICorner_2.Parent = SliderValueFrame_3

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = SliderFrame
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0.0210526325, 0, 0, 0)
				SliderTitle.Size = UDim2.new(0, 438, 0, 27)
				SliderTitle.Font = Enum.Font.GothamBold
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 14.000
				SliderTitle.Text = visualTitle .. " : ".. visualDefault
				SliderTitle.TextTransparency = 0.500
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				UICorner_3.Parent = SliderFrame

				SliderFrame.MouseEnter:Connect(function()
					TweenService:Create(
						SliderTitle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				SliderFrame.MouseLeave:Connect(function()
					TweenService:Create(
						SliderTitle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.45}
					):Play()
				end)

				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0.5,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							5
						)

					SliderValueFrame_2:TweenSize(pos1, "Out", "Sine", 0.2, true)
					SliderValueFrame_3:TweenPosition(pos, "Out", "Sine", 0.2, true)
					if visualDec == true then
						local value = string.format("%.1f",((pos.X.Scale * visualMax) / visualMax) * (visualMax - visualMin) + visualMin)
						TextBox.Text = tostring(value)
						SliderTitle.Text = visualTitle .. " : ".. value
						visualcallback(value)
					else
						local value = math.floor(((pos.X.Scale * visualMax) / visualMax) * (visualMax - visualMin) + visualMin)
						TextBox.Text = tostring(value)
						SliderTitle.Text = visualTitle .. " : ".. value
						visualcallback(value)
					end
				end

				local dragging = false

				SliderFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				SliderFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false

						end
					end
				)


				SliderValueFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				SliderValueFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false

						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				TextBox.FocusLost:Connect(function()
					if TextBox.Text == "" then
						TextBox.Text  = visualDefault
					end
					if  tonumber(TextBox.Text) > visualMax then
						TextBox.Text  = visualMax
					end
					SliderValueFrame_2:TweenSize(UDim2.new((TextBox.Text or 0) / visualMax, 0, 0, 5), "Out", "Sine", 0.2, true)
					SliderValueFrame_3:TweenPosition(UDim2.new((TextBox.Text or 0)/visualMax, 0,0.5, 0) , "Out", "Sine", 0.2, true)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / visualMax) * (visualMax - visualMin) + visualMin) )
					pcall(options.callback, TextBox.Text)
				end)

				function sliderfunc.Update(value)
					SliderValueFrame_2:TweenSize(UDim2.new((value or 0) / visualMax, 0, 0, 5), "Out", "Sine", 0.2, true)
					SliderValueFrame_3:TweenPosition(UDim2.new((value or 0)/visualMax, 0,0.5, 0) , "Out", "Sine", 0.2, true)
					SliderTitle.Text = visualTitle .. " : ".. value
					pcall(function()
						pcall(options.callback, TextBox.Text)
					end)
				end
				return sliderfunc
			end

			function LibraryFunction.Label(options)

				local Label = options.Title or "Label"
				local LabelFunctions = {}

				local LabelFrame = Instance.new("Frame")
				local Title = Instance.new("TextLabel")

				LabelFrame.Name = "LabelFrame"
				LabelFrame.Parent = ScrollingPageFrame
				LabelFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				LabelFrame.BackgroundTransparency = 1.000
				LabelFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				LabelFrame.Size = UDim2.new(0, 475, 0, 35)

				Title.Name = "Title"
				Title.Parent = LabelFrame
				Title.Active = true
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.020833334, 0, 0, 0)
				Title.Size = UDim2.new(0, 406, 0, 35)
				Title.Font = Enum.Font.GothamBold
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextTransparency = 0.450
				Title.TextWrapped = true
				Title.Text = Label
				Title.TextXAlignment = Enum.TextXAlignment.Left

				function LabelFunctions.Color(value)
					Title.TextColor3 = value
					Title.TextTransparency = 0
				end

				function LabelFunctions.Refresh(value)
					Title.Text = value
				end
				return LabelFunctions
			end
			return LibraryFunction
		end
		return LibraryPage
	end	
	return LibraryTab
end


local UI = Library.new()

-- [Create Tab]

local PlayerInfo = UI.tab({
	Logo = 6022668898,
	ColorUI = Color3.fromRGB(255, 0, 127)
})

local Page_PlayerInfo = PlayerInfo.page()

-- [Properties PlayerInfo Page]

Page_PlayerInfo.PlayerInfo()

local Main = UI.tab({
	Logo = 11155842453,
	ColorUI = Color3.fromRGB(255, 0, 127)
})

local Page_Main = Main.page()

-- [Properties Main Page]

local MainLabel =Page_Main.Label({
	Title = "Main",
})
MainLabel.Color(Color3.fromRGB(255, 0, 127))

Page_Main.Toggle({
	Title = "Toggle",
	Default = "false",
	callback = function(value)
	end,
})

Page_Main.Button({
	Title = "Button",
	callback = function(value)
	end,
})

Page_Main.Label({
	Title = "Label"
})

local LabelColor = Page_Main.Label({
	Title = "LabelColor"
})
LabelColor.Color(Color3.fromRGB(255, 0, 127))


local options = {
    Title = "Dropdown",
    callback = function(value)
    end,
    Item = {"1", "2", "3"}
}

Page_Main.Dropdown(options)

