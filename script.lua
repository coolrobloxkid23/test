-- Ultimate Hacker GUI

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

-- Variables
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local mouse = player:GetMouse()

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "UltimateHackerGUI"

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Position = UDim2.new(0.5, -100, 0.5, -150)
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.SourceSansBold
title.Text = "Ultimate Hacker GUI"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.TextSize = 18

-- Function to create buttons
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Position = UDim2.new(0.1, 0, 0, position)
    button.Size = UDim2.new(0.8, 0, 0, 30)
    button.Font = Enum.Font.SourceSans
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.MouseButton1Click:Connect(callback)
    return button
end

-- KillAura Toggle
local killAuraEnabled = false
createButton("Toggle KillAura", 60, function()
    killAuraEnabled = not killAuraEnabled
    if killAuraEnabled then
        while killAuraEnabled do
            local target = getClosestPlayer(30)
            if target then
                ReplicatedStorage.Remotes.Attack:FireServer(target)
            end
            wait(0.1)
        end
    end
end)

-- AutoBlock Toggle
local autoBlockEnabled = false
createButton("Toggle AutoBlock", 100, function()
    autoBlockEnabled = not autoBlockEnabled
    if autoBlockEnabled then
        while autoBlockEnabled do
            local target = getClosestPlayer(15)
            if target then
                ReplicatedStorage.Remotes.Block:FireServer(true)
            else
                ReplicatedStorage.Remotes.Block:FireServer(false)
            end
            wait(0.1)
        end
    end
end)

-- AutoParry Toggle
local autoParryEnabled = false
createButton("Toggle AutoParry", 140, function()
    autoParryEnabled = not autoParryEnabled
    if autoParryEnabled then
        while autoParryEnabled do
            local target = getClosestPlayer(15)
            if target then
                ReplicatedStorage.Remotes.Parry:FireServer()
            end
            wait(0.1)
        end
    end
end)

-- AutoSprint Toggle
local autoSprintEnabled = false
createButton("Toggle AutoSprint", 180, function()
    autoSprintEnabled = not autoSprintEnabled
    if autoSprintEnabled then
        humanoid.WalkSpeed = 24
    else
        humanoid.WalkSpeed = 16
    end
end)

-- SpinBot Toggle
local spinBotEnabled = false
createButton("Toggle SpinBot", 220, function()
    spinBotEnabled = not spinBotEnabled
    if spinBotEnabled then
        while spinBotEnabled do
            character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(10), 0)
            wait(0.1)
        end
    end
end)

-- Play Audio
local audioTextBox = Instance.new("TextBox")
audioTextBox.Parent = frame
audioTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
audioTextBox.Position = UDim2.new(0.1, 0, 0, 260)
audioTextBox.Size = UDim2.new(0.6, 0, 0, 30)
audioTextBox.Font = Enum.Font.SourceSans
audioTextBox.PlaceholderText = "Audio ID"
audioTextBox.Text = ""
audioTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
audioTextBox.TextSize = 14

local playAudioButton = Instance.new("TextButton")
playAudioButton.Parent = frame
playAudioButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
playAudioButton.Position = UDim2.new(0.7, 0, 0, 260)
playAudioButton.Size = UDim2.new(0.2, 0, 0, 30)
playAudioButton.Font = Enum.Font.SourceSans
playAudioButton.Text = "Play"
playAudioButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playAudioButton.TextSize = 14
playAudioButton.MouseButton1Click:Connect(function()
    local sound = Instance.new("Sound")
    sound.Parent = workspace
    sound.SoundId = "rbxassetid://" .. audioTextBox.Text
    sound:Play()
end)

-- Change Skybox
local skyboxTextBox = Instance.new("TextBox")
skyboxTextBox.Parent = frame
skyboxTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
skyboxTextBox.Position = UDim2.new(0.1, 0, 0, 300)
skyboxTextBox.Size = UDim2.new(0.6, 0, 0, 30)
skyboxTextBox.Font = Enum.Font.SourceSans
skyboxTextBox.PlaceholderText = "Skybox ID"
skyboxTextBox.Text = ""
skyboxTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
skyboxTextBox.TextSize = 14

local changeSkyboxButton = Instance.new("TextButton")
changeSkyboxButton.Parent = frame
changeSkyboxButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
changeSkyboxButton.Position = UDim2.new(0.7, 0, 0, 300)
changeSkyboxButton.Size = UDim2.new(0.2, 0, 0, 30)
changeSkyboxButton.Font = Enum.Font.SourceSans
changeSkyboxButton.Text = "Set"
changeSkyboxButton.TextColor3 = Color3.fromRGB(255
::contentReference[oaicite:0]{index=0}
 
