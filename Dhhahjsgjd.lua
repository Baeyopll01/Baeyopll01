local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
   ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = "ZA HUB"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = "ZA HUB"
Instructions.TextSize = 13
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GetKey.Text = "Get Key"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(150, 150, 150)
GetKey.Parent = Frame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = GetKey

local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(0.35, 0, 0.15, 0)
CheckKey.Position = UDim2.new(0.55, 0, 0.7, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CheckKey.Text = "Check Key"
CheckKey.TextSize = 18
CheckKey.TextColor3 = Color3.fromRGB(150, 150, 150)
CheckKey.Parent = Frame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = CheckKey

GetKey.MouseButton1Click:Connect(function()
   setclipboard("Your Way How To Get The Key")
end)

local function validateKey(key)
    return key == "ZA" -- Replace this with your key
end

CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validateKey(enteredKey) then
        TextBox.PlaceholderText = "Correct Key!"
        TextBox.Text = ""
        wait(1)
        ScreenGui:Destroy()

-- Put Your Script Here
local ZA = loadstring(game:HttpGet("https://raw.githubusercontent.com/barlossxi/barlossxi/main/999.lua"))()


--return library

local Win = library:XoxHi()
local MainTab = Win:CreateTab("Main")
local MainSection = MainTab:CreateSection({
	Name = "Level",
	Side = "Left"
})


local MainSection2 = MainTab:CreateSection({
	Name = "Setting",
	Side = "Right"
})


local AATab = Win:CreateTab("Boss")
local AASection = AATab:CreateSection({
	Name = " BOSS ",
	Side = "Left"
})
local AASection2 = AATab:CreateSection({
	Name = " BOSS ",
	Side = "Right"
})

local BBTab = Win:CreateTab("Stats")

local BBSection = BBTab:CreateSection({
	Name = " Stats ",
	Side = "Left"
})
local BBSection2 = BBTab:CreateSection({
	Name = " Stats ",
	Side = "Right"
})

local CCTab = Win:CreateTab("Teleport")
local CCSection = CCTab:CreateSection({
	Name = " Teleport ",
	Side = "Left"
})
local CCSection2 = CCTab:CreateSection({
	Name = " Player ",
	Side = "Right"
})

local DDTab = Win:CreateTab("Shop")
local DDSection = DDTab:CreateSection({
	Name = " Fruit ",
	Side = "Left"
})
local DDSection2 = DDTab:CreateSection({
	Name = " Shop ",
	Side = "Right"
})

local FFTab = Win:CreateTab("Setting")
local FFSection = FFTab:CreateSection({
	Name = " Setting ",
	Side = "Left"
})
local FFSection2 = FFTab:CreateSection({
	Name = " Setting ",
	Side = "Right"
})


function CheckLV()
local MyLv = tonumber(game.Players.LocalPlayer.PlayerGui.MainUI.Interface.PlayerStatus.Frame.Level.TextLabel.Text:match('%d+'))
 if MyLv == 1 or MyLv <= 149 then
 Mon = "Bandit"
 CFQ = CFrame.new(-953.566528, 34.5999947, -552.164612, -0.0109250434, -3.3378329e-09, -0.999940336, 1.94075778e-09, 1, -3.35923622e-09, 0.999940336, -1.97734162e-09, -0.0109250434)
 elseif MyLv == 150 or MyLv <= 299 then
 Mon = "Clown Pirate"
 CFQ = CFrame.new(-71.5784531, 36.4347496, 50.7921715, 0.00707866857, 2.668971e-08, 0.999974966, -5.85915032e-08, 1, -2.62756199e-08, -0.999974966, -5.84040372e-08, 0.00707866857)
 elseif MyLv == 300 or MyLv <= 499 then
 Mon = "Marine"
 CFQ = CFrame.new(848.661377, 35.5073013, 1264.83777, -0.998497367, 5.36386899e-08, 0.0548002385, 5.90094018e-08, 1, 9.63871685e-08, -0.0548002385, 9.94760612e-08, -0.998497367)
 elseif MyLv == 500 or MyLv <= 799 then
 Mon = "Monkey"
 CFQ = CFrame.new(771.192871, 42.3243141, -1220.74805, -0.996942639, 2.59707669e-08, 0.0781369284, 2.55865924e-08, 1, -5.91784355e-09, -0.0781369284, -3.90049282e-09, -0.996942639)
 elseif MyLv >= 800 then
 Mon = "Snow Bandit"
 CFQ = CFrame.new(1507.57898, 102.05999, -290.12558, -0.998586833, -8.202373e-09, -0.0531440228, -1.01186872e-08, 1, 3.57898209e-08, 0.0531440228, 3.62769903e-08, -0.998586833)
 end
 end
 
 
function MonA()
if free == "Bandit" then
MONName = "Bandit [LV.5]"
elseif free == "Bandit Leader" then
MONName = "Bandit Leader [LV.15]"
elseif free == "Clown Pirate" then
MONName = "Clown Pirate [LV.50]"
elseif free == "Marine" then
MONName = "Marine [LV.300]"
elseif free == "Monkey" then
MONName = "Monkey [LV.750]"
elseif free == "Monkey King" then
MONName = "Monkey King [LV.1000]"
elseif free == "Bomb Man" then
MONName = "Bomb Man [LV.1500]"
elseif free == "Sand Man" then
MONName = "Sand Man [LV.2000]"
elseif free == "Snow Bandit" then
MONName = "Snow Bandit [LV.1750]"
elseif free == "Snow Bandit Leader" then
MONName = "Snow Bandit Leader [LV.2350]"
end
end

function QuestA()
if free == "Bandit" then
CFrameQuest = CFrame.new(-953.566528, 34.5999947, -552.164612, -0.0109250434, -3.3378329e-09, -0.999940336, 1.94075778e-09, 1, -3.35923622e-09, 0.999940336, -1.97734162e-09, -0.0109250434)
elseif free == "Bandit Leader" then
CFrameQuest = CFrame.new(-1097.55042, 34.6000023, -492.550354, -0.0683717504, 2.67226739e-08, 0.997659922, 5.38579563e-08, 1, -2.30943531e-08, -0.997659922, 5.21529238e-08, -0.0683717504)
elseif free == "Clown Pirate" then
CFrameQuest = CFrame.new(-71.5784531, 36.4347496, 50.7921715, 0.00707866857, 2.668971e-08, 0.999974966, -5.85915032e-08, 1, -2.62756199e-08, -0.999974966, -5.84040372e-08, 0.00707866857)
elseif free == "Marine" then
CFrameQuest = CFrame.new(848.661377, 35.5073013, 1264.83777, -0.998497367, 5.36386899e-08, 0.0548002385, 5.90094018e-08, 1, 9.63871685e-08, -0.0548002385, 9.94760612e-08, -0.998497367)
elseif free == "Monkey" then
CFrameQuest = CFrame.new(771.192871, 42.3243141, -1220.74805, -0.996942639, 2.59707669e-08, 0.0781369284, 2.55865924e-08, 1, -5.91784355e-09, -0.0781369284, -3.90049282e-09, -0.996942639)
elseif free == "Monkey King" then
CFrameQuest = CFrame.new(727.094971, 42.2545357, -1380.22131, -0.0418852083, 2.64795439e-08, 0.999122441, -2.36735005e-08, 1, -2.74952416e-08, -0.999122441, -2.48043701e-08, -0.0418852083)
elseif free == "Snow Bandit" then
CFrameQuest = CFrame.new(1507.57898, 102.05999, -290.12558, -0.998586833, -8.202373e-09, -0.0531440228, -1.01186872e-08, 1, 3.57898209e-08, 0.0531440228, 3.62769903e-08, -0.998586833)
elseif free == "Bomb Man" or "Sand Man" or "Snow Bandit Leader" then
CFrameQuest = nil
end
end




MainSection2:AddToggle({Name = "Auto Farm", Value = false,Callback = function(lllkkkzzzzzzhh)
	_G.AutoFarmlv = lllkkkzzzzzzhh
end,})


  
  spawn(function()
while wait() do
if _G.AutoFarmlv then
pcall(function()
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestUI") then
CheckLV()
No()
      for _,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
 if v.Name == Mon and v.Humanoid.Health > 0  then
    v.HumanoidRootPart.Size = Vector3.new(10,10,10)
    v.HumanoidRootPart.Transparency = 0.9
    v.Humanoid.WalkSpeed = 0
    v.Humanoid.JumpPower = 0
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,6,0)  * CFrame.Angles(math.rad(-90),0,0)
until _G.AutoFarmlv == false or v.Humanoid.Health <= 0
end
end
end
  end)
  end
  end
  end)
  
  spawn(function()
while wait() do
if _G.AutoFarmlv then
pcall(function()
CheckLV()
if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestUI") then
repeat task.wait()
TP(CFQ)
until not _G.AutoFarmlv or game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestUI")
end
end)
end
end
end)
  
  spawn(function()
while wait() do
if _G.AutoFarmlv then
pcall(function()
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v.Name == "ProximityPrompt" then
fireproximityprompt(v,30)
end
end
end)
end
end
end)





MainSection:AddToggle({Name = "Auto Quest", Value = false,Callback = function(abkkll)
	_G.AutoQuest = abkkll
while _G.AutoQuest do wait(.1)
for i,v in pairs(game:GetService("Workspace").Quest:GetDescendants()) do
 if v.ClassName == "ProximityPrompt" then
   fireproximityprompt(v,30)
end
      end
            end
end,})




local Weaponlist = {}
local Weapon = nil
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist, v.Name)
end  

local SelectWeapon = MainSection:AddDropdown({
	Name = "Select Weapon",
	Value = "",
	List = Weaponlist,
	Callback = function(selectedWeapon)
		Weapon = selectedWeapon
	end
})

-- Refresh Weapon List
MainSection:AddButton({Name = "Refresh Weapon", Value = false,Callback = function(a)
SelectWeapon:Clear()
    Weaponlist = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        table.insert(Weaponlist, v.Name)
        if v:IsA("Tool") then
            SelectWeapon:Add(v.Name)
        end
    end
    end,})

-- Auto Equip
local AutoEquipped = false

local toggleAutoEquip = MainSection:AddToggle({Name = "Auto Equip", Value = false,Callback = function(isEnabled)
AutoEquipped = isEnabled
end,})


spawn(function()
    while true do
        if AutoEquipped then
            pcall(function()
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon)
                if tool then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
            end)
        end
        wait(0.2)
    end
end)


-- Auto Attack
local Attacking = false
local AutoAttackToggle = false

local toggleAutoAttack = MainSection:AddToggle({Name = "Auto Attack", Value = false,Callback = function(autoattack)
Attacking = autoattack
    AutoAttackToggle = autoattack
 end,})

spawn(function()
    while true do
        if AutoAttackToggle then
            if Attacking then
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                wait(0.3)
            end
        end
        wait(0.1)
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    Attacking = false -- Stop auto attack when player respawns
end)

game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    Attacking = false -- Stop auto attack when player dies
end)

spawn(function()
    while true do
        if game.Players.LocalPlayer.Character then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health <= 0 then
                Attacking = false -- Stop auto attack when player dies
            elseif humanoid and humanoid.Health > 0 then
                wait(1.5) -- Wait 2 seconds after respawn
                Attacking = true -- Start auto attack again
            end
        end
        wait(0.1)
    end
end)


-- Respawn Handler
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    if Attacking then
        -- Re-enable auto attack if it was enabled before respawn
        toggleAutoAttack(true)
    end
end)



MainSection2:AddToggle({Name = "Auto Haki", Value = false,Callback = function(tttttyyy)
_G.hee = tttttyyy
while _G.hee do wait()
pcall(function()
local aa = game.Players.LocalPlayer.Character.HumanoidRootPart

if not aa:FindFirstChild("Haki") then
repeat task.wait()
local args = {
    [1] = "BusoHaki"
}

game:GetService("ReplicatedStorage").Remotes.SkillHolder:FireServer(unpack(args))
until _G.hee == false or aa:FindFirstChild("Haki")
end
end)
end
end,})


MainSection2:AddToggle({Name = "Auto TP Item", Value = false,Callback = function(aaafhbbkwa)
	_G.F = aaafhbbkwa
while _G.F do wait()
for i,v in pairs(game:GetService("Workspace").ItemDrop:GetDescendants()) do
if v.Name == "TouchInterest" then
game.Players.LocalPlayer.Character.HumanoidRootPart .CFrame = v.Parent.CFrame
wait()
            end
      end
end
end,})
    

MainSection2:AddToggle({Name = "Auto Chests", Value = false,Callback = function(aaafhkwa)
	_G.Fd = aaafhkwa   
while _G.Fd do wait(.5)
for i,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
fireproximityprompt(v,30)
game.Players.LocalPlayer.Character.HumanoidRootPart .CFrame = v.Parent.CFrame
end
      end
            end              
end,})





AASection:AddToggle({Name = "Auto Boss", Value = false,Callback = function(lllkkkzzzzzzhh)
	_G.AutoBoss = lllkkkzzzzzzhh
end,})
  

local Mon = {
 "Artoria [LV.3750]",
 "Sukuna [LV.2500]",
 "Gojo [LV.2500]",
 "Kashimo [LV.3250]",
 "Natsu [LV.3500]",
 "Tatsumaki [LV.6250]"
}


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoBoss then
                for _, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                    for _, name in ipairs(Mon) do
                        if v.Humanoid.DisplayName == name then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()
                                EquipWeapon(_G.Select_Weapon)
                                AA()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                until _G.AutoBoss == false or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)




local Gem = {
    "Shank [LV.2500]",
    "Sand Man [LV.2000]",
    "Bomb Man [LV.1500]",
    "Snow Bandit Leader [LV.2350]",
}

AASection:AddToggle({Name = "Auto Gem", Value = false,Callback = function(wyzzz)
	_G.AutoGem = wyzzz
end,})

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoGem then
                for _, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                    for _, name in ipairs(Gem) do
                        if v.Humanoid.DisplayName == name then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                until _G.AutoGem == false or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)



AASection:AddToggle({Name = "Frieren Clone", Value = false,Callback = function(lllo)
	_G.AutoBossxi = lllo
end,})
  

local Monxi = {
 "Frieren Clone [LV.8500]"
}


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoBossxi then
                for _, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                    for _, name in ipairs(Monxi) do
                        if v.Humanoid.DisplayName == name then
                            if v.Humanoid.Health > 0 then
                                repeat task.wait()
                                EquipWeapon(_G.Select_Weapon)
                                AA()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                                until _G.AutoBossxi == false or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)



AASection2:AddDropdown({
	Name = "Select Boss Spawn",
	Value = "",
	List = {"", "Choso" ,"Killua", "Gojo [Unleashed]", "Sukuna [Half Power]"},
	Callback = function(VK)
		_G.Selectspawn = VK
	end
})

AutoBoss:AddDropdown("Select Weapon", {
        Title = "Select Boss Spawn",
        Values = {"ไม่เลือก", "Choso" ,"Killua", "Gojo [Unleashed]", "Sukuna [Half Power]"},
        Multi = false,
        Default = 1,
        Callback = function(v)
          _G.Selectspawn = v
        end
    })
 
function spawnboss()
if _G.Selectspawn == "Choso" then
NameBossspawn = "Choso"
Itembossspawn = "[Choso] Cursed Womb"
elseif _G.Selectspawn == "Killua" then
NameBossspawn = "Killua"
Itembossspawn = "Heart Bag"
elseif _G.Selectspawn == "Gojo [Unleashed]" then
NameBossspawn = "Gojo [Unleashed]"
Itembossspawn = "Infinity Orb"
elseif _G.Selectspawn == "Sukuna [Half Power]" then
NameBossspawn = "Sukuna [Half Power]"
Itembossspawn = "Sukuna Fingers Bag"
end
end

local AASection2 = AATab:AddParagraph({
	Name = " Check Boss ",
	Content = "Status: "
})

    
    spawn(function()
        while wait() do
            pcall(function()
            No()
             if game:GetService("Workspace").Lives:FindFirstChild(_G.Selectspawn) then
                   Bossza:SetTitle("Boss : ✅")
                    Bossza:SetDesc("Health : "..(workspace.Lives[_G.Selectspawn].Humanoid.Health).." / "..(workspace.Lives[_G.Selectspawn].Humanoid.MaxHealth))
                else
                  Bossza:SetTitle("Boss : ❌")
                    Bossza:SetDesc("Health : 0")
                end
end)
end
end)

    AASection2:AddButton({Name = "Trading Item Spawn Boss", Value = false,Callback = function(v)
        spawnboss()
 local args = {
    [1] = "Chxmei",
    [2] = Itembossspawn
}
game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer(unpack(args))
        end,})
    
AASection2:AddButton({Name = "Take out the item", Value = false,Callback = function(v)
        spawnboss()
 local args = {
    [1] = Itembossspawn
}
game:GetService("ReplicatedStorage").Remotes.EquipItem:FireServer(unpack(args))
        end,})
    
  
  
  AASection2:AddToggle({Name = "Auto Spawn Boss", Value = false,Callback = function(S)
	_G.AutoBossspawn = S
_G.hee = false
CF = CFrame.new(2086.08057, 118.110451, -2335.31616, -0.212451905, 1.5769519e-08, -0.97717154, 3.42127926e-08, 1, 8.6995442e-09, 0.97717154, -3.15835322e-08, -0.212451905)

spawn(function()
while wait() do
if _G.AutoBossspawn then
pcall(function()    
No()
spawnboss()
for _,v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
 if v.Name == NameBossspawn and v.Humanoid.Health > 0  then
 _G.hee = false
 repeat task.wait()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,6,0)  * CFrame.Angles(math.rad(-90),0,0)
 until _G.AutoBossspawn == false
 else
 _G.hee = true
 TP(CF)
 end
 end
end)
end
end
end)

spawn(function()
while wait() do
if _G.AutoBossspawn then
pcall(function()    
if _G.hee then
local player = game.Players.LocalPlayer
local backpack = player.Backpack
spawnboss()
for i, v in pairs(backpack:GetChildren()) do
if v.Name == Itembossspawn then
player.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
end
end)
end
end
end)

spawn(function()
while wait() do
if _G.AutoBossspawn then
pcall(function()    
if _G.hee then
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
fireproximityprompt(v,30)
end
end
end
end)
end
end
end)

spawn(function()
while wait() do
pcall(function()
if _G.AutoBossspawn then
for i,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
repeat task.wait()
TP(v.Parent.CFrame)
fireproximityprompt(v,30)
until _G.AutoBossspawn == false
end
      end
            end
                    end)
                            end
                                  end)
                                  
spawn(function()
while wait() do
if _G.AutoBossspawn then
pcall(function()    
if _G.hee == false then
                local player = game.Players.LocalPlayer
                local backpack = player.Backpack

                for i, v in pairs(backpack:GetChildren()) do
                item()
                    if table.find(_G.it, v.Name) then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
end
end)
end
end
end)
   

local automelee = false
local autoweapon = false
local autodefense = false
local autodf = false

BBSection:AddToggle({Name = "Auto Melee", Value = false,Callback = function(v)
	automelee = not automelee
       while automelee do
           wait()
           local args = {
               [1] = "Melee",
               [2] = 1
           }
           game:GetService("ReplicatedStorage").Remotes.UpStats:FireServer(unpack(args))
       end
end,})


BBSection:AddToggle({Name = "Auto Weapon", Value = false,Callback = function(autoweapon)
	autoweapon = not autoweapon
       while autoweapon do
           wait()
           local args = {
               [1] = "Weapon",
               [2] = 1
           }
           game:GetService("ReplicatedStorage").Remotes.UpStats:FireServer(unpack(args))
       end
end,})


BBSection:AddToggle({Name = "Auto Defense", Value = false,Callback = function(autodefense)
	autodefense = not autodefense
       while autodefense do
           wait()
           local args = {
               [1] = "Defense",
               [2] = 1
           }
           game:GetService("ReplicatedStorage").Remotes.UpStats:FireServer(unpack(args))
       end
end,})


BBSection:AddToggle({Name = "Auto Devil Fruit", Value = false,Callback = function(autodf)
	autodf = not autodf
       while autodf do
           wait()
           local args = {
               [1] = "DemonFruit",
               [2] = 1
           }
           game:GetService("ReplicatedStorage").Remotes.UpStats:FireServer(unpack(args))
       end
end,})




function No()
for i, v in ipairs(workspace.Lives:GetChildren()) do
    if not game:GetService("Players"):GetPlayerFromCharacter(v) then -- if not player then
        local cleanedName = string.gsub(v.Name, "%d+$", "")
        v.Name = tostring(cleanedName)
    end
end

workspace.Lives.ChildAdded:Connect(function(model)
task.wait()
if not game:GetService("Players"):GetPlayerFromCharacter(model) then -- if not player then
        local cleanedName = string.gsub(model.Name, "%d+$", "")
        model.Name = cleanedName
        end
    end)
end

function TP(CFrame)
    pcall(function()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame
    end)
end

MainSection:AddToggle({Name = "Z", Value = false,Callback = function(mbbb)
	_G.x = mbbb
while _G.x do wait()

game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)

end
end,})




MainSection:AddToggle({Name = "X", Value = false,Callback = function(mbbgb)
	_G.xz = mbbgb
while _G.xz do wait()

game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)

end
end,})




MainSection:AddToggle({Name = "C", Value = false,Callback = function(mbbgllb)
	_G.xa = mbbgllb
while _G.xa do wait()

game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)

end
end,})

MainSection:AddToggle({Name = "V", Value = false,Callback = function(mbbgllob)
	_G.xxc = mbbgllob
while _G.xxc do wait()

game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)

end
end,})






CCSection:AddButton({Name = "Starter Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-898.974243, 34.5999947, -559.051453, 0.0182777327, 3.36339987e-08, -0.999832928, -6.71313103e-08, 1, 3.24124017e-08, 0.999832928, 6.65276758e-08, 0.0182777327)
end,})
    
    CCSection:AddButton({Name = "Orange Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(74.4107437, 36.9179535, 79.3588791, -0.999664903, 3.31894299e-08, -0.0258848667, 3.20130162e-08, 1, 4.58622864e-08, 0.0258848667, 4.50182682e-08, -0.999664903)
end,})
    
    CCSection:AddButton({Name = "Shell Town", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(886.932739, 35.5073013, 1153.22998, -0.0238624346, 4.11765164e-08, -0.999715269, 1.07852067e-07, 1, 3.86138979e-08, 0.999715269, -1.06899932e-07, -0.0238624346)
end,})
        
   CCSection:AddButton({Name = "Ape Realm", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(735.348877, 42.3243103, -1181.01147, -0.0751134604, -5.73425822e-08, -0.997174978, -4.65505181e-08, 1, -5.39985585e-08, 0.997174978, 4.23629949e-08, -0.0751134604)
end,})
        
    CCSection:AddButton({Name = "Sunset Isle", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-696.604614, 36.2596169, 786.971252, -0.0137904296, 3.84323009e-08, -0.999904931, -8.1107423e-09, 1, 3.85478174e-08, 0.999904931, 8.64156213e-09, -0.0137904296)
end,})
        
    CCSection:AddButton({Name = "Frost Isle", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1640.46484, 41.6599922, -355.940918, -0.999989569, 2.44405012e-08, 0.00457085157, 2.402248e-08, 1, -9.15084968e-08, -0.00457085157, -9.13977374e-08, -0.999989569)
end,})
        CCSection:AddButton({Name = "Arena Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1748.12256, 38.3027344, -2731.5647, -0.999986649, -4.07616874e-09, 0.00517317979, -4.20341095e-09, 1, -2.45856029e-08, -0.00517317979, -2.46070186e-08, -0.999986649)
end,})
    
    CCSection:AddButton({Name = "Warrior's Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-694.33667, 72.2849884, -4241.08984, -0.999456286, -6.74034411e-08, -0.0329719782, -6.97373963e-08, 1, 6.96360658e-08, 0.0329719782, 7.18975812e-08, -0.999456286)
end,})
        
    CCSection:AddButton({Name = "Autumnal Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1864.88025, 50.2648354, 44.572113, 0.0335859843, -1.23333841e-08, -0.999435842, -7.68625199e-08, 1, -1.4923307e-08, 0.999435842, 7.73203723e-08, 0.0335859843)
end,})
        
    CCSection:AddButton({Name = "Forgotten Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-695.397583, 44.025898, -2004.11902, 0.999338925, -4.83633311e-09, 0.0363560542, 8.25968627e-09, 1, -9.40116536e-08, -0.0363560542, 9.4249792e-08, 0.999338925)
end,})
        
    CCSection:AddButton({Name = "Cursed Isle", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2203.427, 40.2717476, -1220.50366, -0.986698627, -2.22477081e-09, 0.162560165, 3.8775787e-09, 1, 3.72217421e-08, -0.162560165, 3.73569797e-08, -0.986698627)
end,})
        
    CCSection:AddButton({Name = "Chxmei Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(497.929443, 34.5998955, -3094.66699, -0.0192264654, -5.09017362e-08, 0.999815166, -8.70739143e-08, 1, 4.92367143e-08, -0.999815166, -8.61111715e-08, -0.0192264654)
end,})
        
    CCSection:AddButton({Name = "Niflheim Island", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2019.97729, 118.110451, -2310.68457, -0.999597907, 0, -0.0283546709, 0, 0.99999994, -0, 0.0283546709, -0, -0.999597907)
end,})


DDSection:AddDropdown({
	Name = "Select Fruit",
	Value = "",
	List = {"God Light Fruit", "Dark Flame Fruit", "Quake Fruit"},
	Callback = function(vyiyeh)
		_G.FruitSelect = vyiyeh
	end
})

    DDSection:AddToggle({Name = "Auto Random Fruit Select Gem", Value = false,Callback = function(FSE)
	_G.FruitRD = FSE
end,})


DDSection1:AddToggle({Name = "Auto Random Fruit Select Beli", Value = false,Callback = function(kkll)
	_G.FruitNOSEe = kkll
end,})



local Fruitteen = CFrame.new(-741.048889, 43.4787788, -1933.82019, -0.0251465552, 7.8026531e-08, 0.999683797, -1.09866749e-09, 1, -7.80788483e-08, -0.999683797, -3.06173398e-09, -0.0251465552)

spawn(function()
                        while wait() do
                            pcall(function()
                              if _G.FruitRD then
for i,v in pairs(game:GetService("Workspace").Shop:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
fireproximityprompt(v,30)
   TP(Fruitteen)
 if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(_G.FruitSelect)) then
   break
end
 end
end
end
end)
end
end)


spawn(function()
while wait()do
 if _G.FruitRD then
   if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(_G.FruitSelect)) then
   wait(1)
    Nofty()
   end
   end
end
end)


 spawn(function()
                         while wait() do
                             pcall(function()
                               if _G.FruitNOSEe then
 for i,v in pairs(game:GetService("Workspace").Shop:GetDescendants()) do
 if v.ClassName == "ProximityPrompt" then
 fireproximityprompt(v,30)
    TP(Fruitteen)
 end
 end
 end
 end)
 end
 end)
 
 function TP(CFrame)
    pcall(function()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame
    end)
end
 

 
DDSection2:AddButton({Name = "Katana", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Katana:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
    
    DDSection2:AddButton({Name = "Random DemonFruit", Value = false,Callback = function(v)
	 for i,v in pairs(game:GetService("Workspace").Shop.RandomDemonFruit:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
        
    DDSection2:AddButton({Name = "Yoru", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Yoru:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "Sukuna", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Sukuna:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "SukunaV2", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop["Sukuna [Half Power]"]:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "Higuruma", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Higuruma:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})

DDSection2:AddButton({Name = "Gojo", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Gojo:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
        
    DDSection2:AddButton({Name = "GojoV2", Value = false,Callback = function(v)
	 for i,v in pairs(game:GetService("Workspace").Shop.GojoV2:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    
    DDSection2:AddButton({Name = "Choso", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Choso:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
        
    DDSection2:AddButton({Name = "Hakari", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-813.912781, 37.8596077, 775.874817, -0.676209033, 2.4955737e-08, -0.736709774, -2.9928259e-08, 1, 6.13450482e-08, 0.736709774, 6.35305142e-08, -0.676209033)
end,})
        
        
    DDSection2:AddButton({Name = "Cid", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Cid:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "KashimoV1", Value = false,Callback = function(v)
	for i,v in 
pairs(game:GetService("Workspace").Shop.KashimoV1:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "KashimoV2", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.KashimoV2:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "Itadori", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Itadori:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    DDSection2:AddButton({Name = "Gon", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Gon:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    
DDSection2:AddButton({Name = "Uraume", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Uraume:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})
        
    
    DDSection2:AddButton({Name = "Merchant", Value = false,Callback = function(v)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-637.258911, 64.484993, -4232.65381, 0.997468472, -2.76135541e-08, -0.0711097643, 3.43178499e-08, 1, 9.30592279e-08, 0.0711097643, -9.52639851e-08, 0.997468472)
end,})
        
    DDSection2:AddButton({Name = "Remove Fruit from lnventory", Value = false,Callback = function(v)
	for i,v in pairs(game:GetService("Workspace").Shop.Garbage:GetChildren()) do
if v.ClassName == "ProximityPrompt" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(3,1,0)
end
      end
end,})



FFSection:AddButton({Name = "Boots FPS", Value = false,Callback = function(v)
	 local decalsyeeted = true
    local g, w, l = game, game.Workspace, game.Lighting
    local t = w.Terrain
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize, t.WaterWaveSpeed, t.WaterReflectance, t.WaterTransparency = 0, 0, 0, 0
    l.GlobalShadows, l.FogEnd, l.Brightness = false, 9e9, 0
    settings().Rendering.QualityLevel = "Level01"

    local function handleDescendant(v)
        if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
            v:Remove()
        elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material, v.Reflectance = "Plastic", 0
        elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure, v.BlastRadius = 1, 1
        elseif (v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles")) then
            v.Enabled = false
        elseif v:IsA("MeshPart") and decalsyeeted then
            v.Material, v.Reflectance, v.TextureID = "Plastic", 0, 10385902758728957
        elseif v:IsA("SpecialMesh") and decalsyeeted then
            v.TextureId = 0
       end
end

    for _, v in pairs(w:GetDescendants()) do
        handleDescendant(v)
    end

    w.DescendantAdded:Connect(function(v)
        wait()
        handleDescendant(v)
    end)

    for _, e in ipairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
            end
      end
end,})
    
FFSection:AddButton({Name = "Unlock FPS", Value = false,Callback = function(v)
	loadstring(game:HttpGet("https://pastebin.com/raw/y5reZYnG", true))()
end,})
    
    
    
    
    
FFSection:AddToggle({Name = "Anti AFK", Value = false,Callback = function(lllll)
	_G.AntiAFKEnabled = lllll
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:connect(function()
        if _G.AntiAFKEnabled then
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
      end)
end,})
    
    
    FFSection:AddToggle({Name = "White Screen", Value = false,Callback = function(adfhjf)
	_G.WhiteScreen = adfhjf
    while wait(0.1) do
        game:GetService("RunService"):Set3dRenderingEnabled(not _G.WhiteScreen)
      end
end,})
    
    
    function AA()
  game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
wait(.3)
end
    
    function EquipWeapon(ToolSe)
	if not _G.NotAutoEquip then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.9)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
		end
	end
end


if _G.Select_Weapon == nil then
	for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == "Melee" then
			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
				_G.Select_Weapon = tostring(v.Name)
				wait(.9)
			end
		end
	end
end

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
	end
end})

    else
        TextBox.PlaceholderText = "Invalid key. Try again."
        TextBox.Text = ""
        wait(1)
        TextBox.PlaceholderText = "Enter Key..."
        TextBox.Text = ""
    end
end)
