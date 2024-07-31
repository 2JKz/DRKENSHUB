local VenyxLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Documantation12/Universal-Vehicle-Script/main/Library.lua"))()
local Venyx = VenyxLibrary.new("🩸DRKENS HUB V1🩸", 50125446932)

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
local hb1Section = combatPage:addSection("BIG UPDATE TO MAKE THIS SCRIPT HAVE LOTS OF FEATURES \n(NOCLIP, AIMBOT+ESP ETC) COMING SOON")

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
