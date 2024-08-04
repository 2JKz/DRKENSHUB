local VenyxLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Documantation12/Universal-Vehicle-Script/main/Library.lua"))()
local Venyx = VenyxLibrary.new("🩸DRKENS HUB V1 (BUGGY)🩸", 50125446932)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Theme = { 
	Background = Color3.fromRGB(41, 41, 41), 
	Glow = Color3.fromRGB(255, 0, 0), 
	Accent = Color3.fromRGB(13, 13, 13), 
	LightContrast = Color3.fromRGB(26, 26, 26), 
	DarkContrast = Color3.fromRGB(13, 13, 13),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

for index, value in pairs(Theme) do
	pcall(Venyx.setTheme, Venyx, index, value)
end

local function GetVehicleFromDescendant(Descendant)
	return
		Descendant:FindFirstAncestor(LocalPlayer.Name .. "\'s Car") or
		(Descendant:FindFirstAncestor("Body") and Descendant:FindFirstAncestor("Body").Parent) or
		(Descendant:FindFirstAncestor("Misc") and Descendant:FindFirstAncestor("Misc").Parent) or
		Descendant:FindFirstAncestorWhichIsA("Model")
end

local function TeleportVehicle(CoordinateFrame: CFrame)
	local Parent = LocalPlayer.Character.Parent
	local Vehicle = GetVehicleFromDescendant(LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart)
	LocalPlayer.Character.Parent = Vehicle
	local success, response = pcall(function()
		return Vehicle:SetPrimaryPartCFrame(CoordinateFrame)
	end)
	if not success then
		return Vehicle:MoveTo(CoordinateFrame.Position)
	end
end
local players = game:GetService("Players")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "INJECTED";
    Text = "Welcome, " .. players.LocalPlayer.DisplayName ..". \nTo DRKENS HUB V1                                 Made by kobespliff";
	Icon = "rbxthumb://type=AvatarHeadShot&id=" .. players.LocalPlayer.UserId .. "&w=180&h=180 true";
    Duration = 11
}
)

local players = game:GetService("Players")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "GUI TOGGLE KEY";
    Text = "RIGHT CTRL to toggle GUI";
	Icon = "rbxthumb://type=AvatarHeadShot&id=" .. players.LocalPlayer.UserId .. "&w=180&h=180 true";
    Duration = 11
})

------------------------------------------------------------------------------
local playerPage = Venyx:addPage("Player", 5012544693)
local ncSection = playerPage:addSection("Noclip")
local ncEnabled = false
local jumped = true
ncSection:addToggle("Enable Noclip", false, function(v) ncEnabled = v end)


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local function forceJump()
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	jumped = true
end

local function togglenc()
	if humanoid then
		humanoid.PlatformStand = false
		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end
---------NCENABLED----------
RunService.Stepped:Connect(function()
	if ncEnabled == true then
		jumped = false
		togglenc()
		humanoidRootPart.CFrame = humanoidRootPart.CFrame
	end
end)

RunService.Stepped:Connect(function()
	if ncEnabled == false then
		if jumped == false then
			forceJump()
		end
	end
end)
---------NCENABLED----------
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)



local pflyEnabled = false
local pflySpeed = 5
local pflySection = playerPage:addSection("Flight")
pflySection:addToggle("COMING SOON", false, function(v) soonEnabled = v end)
--pflySection:addToggle("Enable Flight", false, function(v) pflyEnabled = v end)
--pflySection:addSlider("Speed", 5, 1, 200, function(v) pflySpeed = v / 1 end)


------------------------------------------------------------------------------
local wsEnabled = false
local wsSpeed = 16
local wsSection = playerPage:addSection("Walkspeed (DISCLAIMER: SOME FEATURES WILL CAUSE BANS \nIN GAMES WITH A GOOD ANTICHEAT. I am working on it)")
wsSection:addToggle("Enable Walkspeed", false, function(v) wsEnabled = v end)
wsSection:addSlider("Speed", 16, 1, 500, function(v) wsSpeed = v / 1 end)

local function setPlayerWalkspeed(player, speed)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.WalkSpeed = speed
		end
	end
end

RunService.Stepped:Connect(function()
	if wsEnabled == true then
		setPlayerWalkspeed(player, wsSpeed)
	end
end)

RunService.Stepped:Connect(function()
	if wsEnabled == false then
		setPlayerWalkspeed(player, 16)
	end
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
------------------------------------------------------------------------------
local jpEnabled = false
local jpPower = 50
local jpSection = playerPage:addSection("Jump Power")
jpSection:addToggle("Enable Jump Power", false, function(v) jpEnabled = v end)
jpSection:addSlider("Power", 50, 1, 500, function(v) jpPower = v / 1 end)

local function setPlayerJump(player, jump)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.JumpPower = jump
		end
	end
end

RunService.Stepped:Connect(function()
	if jpEnabled == true then
		setPlayerJump(player, jpPower)
	end
end)

RunService.Stepped:Connect(function()
	if jpEnabled == false then
		setPlayerJump(player, 50)
	end
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)


local ijEnabled = false
local ijSection = playerPage:addSection("Infinite Jump")
ijSection:addToggle("Enable Infinite Jump", false, function(v) ijEnabled = v end)

local function infjump()
	game:GetService("UserInputService").jumpRequest:Connect(function()
		if ijEnabled == true then
        	game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
			wait(0.01)
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Standing")
		end
	end)
end

RunService.Stepped:Connect(function()
	if ijEnabled == true then
		infjump()
	end
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)

--------------------------------------------------------------------------------
local gravEnabled = false
local grav = 196.2
local gravSection = playerPage:addSection("Gravity Manipulation")
gravSection:addToggle("Enable Gravity Changer", false, function(v) gravEnabled = v end)
gravSection:addSlider("Gravity", 196.2, 10, 1000, function(v) grav = v / 1 end)

local function changeGravity(newGravity)
	Workspace.Gravity = newGravity
end

RunService.Stepped:Connect(function()
	if gravEnabled == true then
		changeGravity(grav)
	end
end)

RunService.Stepped:Connect(function()
	if gravEnabled == false then
		changeGravity(196.2)
	end
end)


player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
--------------------------------------------------------------------------------

local function korblox()
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
	if (v:IsA("Decal")) then
	v.Transparency = 1
	end
	end
	
	local ply = game.Players.LocalPlayer
	local chr = ply.Character
	chr.RightLowerLeg.MeshId = "902942093"
	chr.RightLowerLeg.Transparency = "1"
	chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	chr.RightFoot.MeshId = "902942089"
	chr.RightFoot.Transparency = "1"
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)


local khEnabled = false
local khSection = playerPage:addSection("Misc")

khSection:addButton(syn and "Join the Discord server" or "Korblox + Headless", function()
	if syn then
	end
	korblox()
end)

local combatPage = Venyx:addPage("Combat", 2294529381)
local hbSection = combatPage:addSection("Hitbox Expander (Visible)")
local hbEnabled = false

hb = 1
hbSection:addToggle("Enable Hitbox Expander", false, function(v) hbEnabled = v end)
hbSection:addSlider("Size", 1, 1, 50, function(v) hb = v / 1 end)

RunService.Stepped:Connect(function()
	if hbEnabled == true then
		_G.HeadSize = hb
		_G.Disabled = true
		
		
		if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
						v.Character.HumanoidRootPart.Transparency = 0.7
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
		
	end
end)

	

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)




--------------------------------------------------------------------------------
local aimPage = Venyx:addPage("Aimbot+ESP", 13352085735)
local soon = aimPage:addSection("DRKENS AIMBOT AND ESP")
soon:addButton"COMING SOON"

local soon2 = aimPage:addSection("Aceware - Universal Aim+ESP")
soon2:addButton(syn and "Join the Discord server" or "USE THIS UNTIL V2 IS OUT", function()
	if syn then
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/abstractflags/aceware/main/main.lua"))()
end)
--------------------------------------------------------------------------------



local vehiclePage = Venyx:addPage("Vehicle", 8356815386)
local usageSection = vehiclePage:addSection("Usage")
local velocityEnabled = true;
usageSection:addToggle("Keybinds Active", velocityEnabled, function(v) velocityEnabled = v end)
local flightSection = vehiclePage:addSection("Car Flight")
local flightEnabled = false
local flightSpeed = 1
flightSection:addToggle("Enabled", false, function(v) flightEnabled = v end)
flightSection:addSlider("Speed", 100, 0, 800, function(v) flightSpeed = v / 100 end)
local defaultCharacterParent 
RunService.Stepped:Connect(function()
	local Character = LocalPlayer.Character
	if flightEnabled == true then
		if Character and typeof(Character) == "Instance" then
			local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
			if Humanoid and typeof(Humanoid) == "Instance" then
				local SeatPart = Humanoid.SeatPart
				if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
					local Vehicle = GetVehicleFromDescendant(SeatPart)
					if Vehicle and Vehicle:IsA("Model") then
						Character.Parent = Vehicle
						if not Vehicle.PrimaryPart then
							if SeatPart.Parent == Vehicle then
								Vehicle.PrimaryPart = SeatPart
							else
								Vehicle.PrimaryPart = Vehicle:FindFirstChildWhichIsA("BasePart")
							end
						end
						local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
						Vehicle:SetPrimaryPartCFrame(CFrame.new(PrimaryPartCFrame.Position, PrimaryPartCFrame.Position + workspace.CurrentCamera.CFrame.LookVector) * (UserInputService:GetFocusedTextBox() and CFrame.new(0, 0, 0) or CFrame.new((UserInputService:IsKeyDown(Enum.KeyCode.D) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -flightSpeed) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.E) and flightSpeed / 2) or (UserInputService:IsKeyDown(Enum.KeyCode.Q) and -flightSpeed / 2) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.S) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.W) and -flightSpeed) or 0)))
						SeatPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						SeatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					end
				end
			end
		end
	else
		if Character and typeof(Character) == "Instance" then
			Character.Parent = defaultCharacterParent or Character.Parent
			defaultCharacterParent = Character.Parent
		end
	end
end)
local speedSection = vehiclePage:addSection("Acceleration")
local velocityMult = 0.025;
speedSection:addSlider("Multiplier", 25, 0, 50, function(v) velocityMult = v / 1000; end)
local velocityEnabledKeyCode = Enum.KeyCode.W;
speedSection:addKeybind("Velocity Keybind", velocityEnabledKeyCode, function()
	if not velocityEnabled then
		return
	end
	while UserInputService:IsKeyDown(velocityEnabledKeyCode) do
		task.wait(0)
		local Character = LocalPlayer.Character
		if Character and typeof(Character) == "Instance" then
			local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
			if Humanoid and typeof(Humanoid) == "Instance" then
				local SeatPart = Humanoid.SeatPart
				if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
					SeatPart.AssemblyLinearVelocity *= Vector3.new(1 + velocityMult, 1, 1 + velocityMult)
				end
			end
		end
		if not velocityEnabled then
			break
		end
	end
end, function(v) velocityEnabledKeyCode = v.KeyCode end)
local decelerateSelection = vehiclePage:addSection("Deceleration")
local qbEnabledKeyCode = Enum.KeyCode.S
local velocityMult2 = 150e-3
decelerateSelection:addSlider("Brake Force", velocityMult2*1e3, 0, 300, function(v) velocityMult2 = v / 1000; end)
decelerateSelection:addKeybind("Brake Force Keybind", qbEnabledKeyCode, function()
	if not velocityEnabled then
		return
	end
	while UserInputService:IsKeyDown(qbEnabledKeyCode) do
		task.wait(0)
		local Character = LocalPlayer.Character
		if Character and typeof(Character) == "Instance" then
			local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
			if Humanoid and typeof(Humanoid) == "Instance" then
				local SeatPart = Humanoid.SeatPart
				if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
					SeatPart.AssemblyLinearVelocity *= Vector3.new(1 - velocityMult2, 1, 1 - velocityMult2)
				end
			end
		end
		if not velocityEnabled then
			break
		end
	end
end, function(v) qbEnabledKeyCode = v.KeyCode end)
decelerateSelection:addKeybind("Quick Stop", Enum.KeyCode.P, function(v)
	if not velocityEnabled then
		return
	end
	local Character = LocalPlayer.Character
	if Character and typeof(Character) == "Instance" then
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		if Humanoid and typeof(Humanoid) == "Instance" then
			local SeatPart = Humanoid.SeatPart
			if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
				SeatPart.AssemblyLinearVelocity *= Vector3.new(0, 0, 0)
				SeatPart.AssemblyAngularVelocity *= Vector3.new(0, 0, 0)
			end
		end
	end
end)


player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
--------------------------------------------------------------------------------

local scriptPage = Venyx:addPage("Script Hub+", 15081504003)
local hub1Section = scriptPage:addSection("More Scripts")
hub1Section:addButton(syn and "Join the Discord server" or "Infinite Yield V6", function()
	if syn then
	end
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
hub1Section:addButton(syn and "Join the Discord server" or "MORE COMING SOON", function()
	if syn then
	end
end)



local hubSection = scriptPage:addSection("Game Specific Scripts")

hubSection:addButton(syn and "Join the Discord server" or "Track & Field/Hoop Nation", function()
	if syn then
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DepHubHolder/DepHub1/main/Loader1"))()
end)
hubSection:addButton(syn and "Join the Discord server" or "Blade Ball", function()
	if syn then
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
end)
hubSection:addButton(syn and "Join the Discord server" or "Hoop Legends - Auto Green", function()
	if syn then
	end
	getgenv().config = {Time = 0.045, Size = 0.9} local UIS = game:GetService("UserInputService") local TweenService = game:GetService("TweenService") local Player = game:GetService("Players").LocalPlayer local Bar = Player.PlayerGui.Visual.Shooting.Bar UIS.InputBegan:Connect(function(input, gpe) if gpe then return end if input.KeyCode == Enum.KeyCode.E then if Player.Character:FindFirstChild("Basketball") then while UIS:IsKeyDown(Enum.KeyCode.E) do Bar:GetPropertyChangedSignal("Size"):Connect(function() if Bar.Size.Y.Scale > getgenv().config.Size then Bar:TweenSize(UDim2.new(1,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, getgenv().config.Time, true) task.wait() Bar.Size = UDim2.new(1,0,1,0) end end) task.wait() end end end end)
end)
hubSection:addButton(syn and "Join the Discord server" or "Murder Mystery - Mega Script", function()
	if syn then
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
end)
hubSection:addButton(syn and "Join the Discord server" or "Pet Simulator99", function()
	if syn then
	end
	loadstring(game:HttpGet('https://raw.githubusercontent.com/PyroXHUB/PyroX/main/PS99'))()
end)
hubSection:addButton(syn and "Join the Discord server" or "Blox Fruits", function()
	if syn then
	end
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits"),true))()
end)
hubSection:addButton(syn and "Join the Discord server" or "Slap Battles", function()
	if syn then
	end
	loadstring(game:HttpGet("https://scriptblox.com/raw/Slap-Battles-Open-source-for-9484"))()
end)


local hub2Section = scriptPage:addSection("^^ ALL FROM DRKENS DISCORD ^^")
hub2Section:addButton(syn and "Join the Discord server" or "JOIN FOR MORE (COPIED TO CLIPBOARD)", function()
	if syn then
		syn.request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.gg"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "T9K8GzTCm6"
				},
				nonce = game:GetService("HttpService"):GenerateGUID(false)
			}),
		})
		return
	end
	setclipboard("https://discord.gg/T9K8GzTCm6")
end)

--------------------------------------------------------------------------------

local infoPage = Venyx:addPage("Information", 8356778308)


local cred = infoPage:addSection("Made by")
cred:addButton"KOBESPLIFF From DRKENS SCRIPTS"
local uiclose = infoPage:addSection("GUI TOGGLE BUTTON")
uiclose:addButton"RIGHT CTRL"
local discordSection = infoPage:addSection("Discord (Copies to clipboard)")
discordSection:addButton(syn and "Join the Discord server" or "Join for more", function()
	if syn then
		syn.request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.gg"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "T9K8GzTCm6"
				},
				nonce = game:GetService("HttpService"):GenerateGUID(false)
			}),
		})
		return
	end
	setclipboard("https://discord.gg/T9K8GzTCm6")
end)

local function CloseGUI()
    Venyx:toggle()
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.RightControl then
        CloseGUI()
    end
end)
