-- ===== Services =====
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ===== Load Dtoan GUI =====
local Dtoan = loadstring(game:HttpGet('https://raw.githubusercontent.com/duytoan429/Menu/refs/heads/main/sourcebydtoan.lua.txt'))()
local Window = Dtoan:CreateWindow({
    Name = "Dtoan",
    Icon = 0,
    LoadingTitle = "Dtoan",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableDtoanPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Dtoan Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "https://discord.gg/9Xhw2AMKw",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- ===== TAB: BLOX FRUIT =====
local BloxFruitTab = Window:CreateTab("Blox Fruit", 4483362458)

BloxFruitTab:CreateButton({
    Name = "Speed Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Teddy Hub",
    Callback = function()
        repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Kiwi Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HieuDepTrai-Z/KiwiHubFree/refs/heads/main/KiwiHub.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Doraemon Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/MasterHub.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Zee Hub",
    Callback = function()
        loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Đạt Thg",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV2"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Maru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/trongdeptraihucscript/MaruHubPremium/refs/heads/main/MaruHubPremium.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "W Azure",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Quantum Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
    end
})

BloxFruitTab:CreateButton({
    Name = "Astral Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
    end
})

-- ===== TAB: Grow A Garden =====
local GrowGardenTab = Window:CreateTab("Grow A Garden", 4483362458)
GrowGardenTab:CreateButton({
    Name = "Grow Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/duytoan429/GrowAGarden/main/script.lua"))()
    end
})

-- ===== TAB: 99 Night In The Forest =====
local ForestTab = Window:CreateTab("99 Night In The Forest", 4483362458)
ForestTab:CreateButton({
    Name = "Forest Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/duytoan429/ForestHub/main/99Night.lua"))()
    end
})

-- ===== TAB: Crossover =====
local CrossoverTab = Window:CreateTab("Crossover", 4483362458)
CrossoverTab:CreateButton({
    Name = "Goomba Hub (Arise Crossover)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustLevel/goombahub/main/AriseCrossover.lua"))()
    end
})

-- ===== TAB: Steal a Brainrot =====
local BrainrotTab = Window:CreateTab("Steal a Brainrot", 4483362458)
BrainrotTab:CreateButton({
    Name = "Kurd Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ninja10908/S4/refs/heads/main/Kurdhub"))()
    end
})
BrainrotTab:CreateButton({
    Name = "Lemon Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/MJw2J4T6/raw"))()
    end
})
BrainrotTab:CreateButton({
    Name = "Chilli Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end
})

-- ===== TAB: Aim bot =====
local aimEnabled = false
local fovRadius = 120
local aimSmooth = 0.35
local wallCheckEnabled = true

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AimBot_FOVGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local fovFrame = Instance.new("Frame", screenGui)
fovFrame.AnchorPoint = Vector2.new(0.5, 0.5)
fovFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
fovFrame.BackgroundTransparency = 1
fovFrame.Visible = false
local fovStroke = Instance.new("UIStroke", fovFrame)
fovStroke.Thickness = 2
fovStroke.Transparency = 0.3
local fovCorner = Instance.new("UICorner", fovFrame)
fovCorner.CornerRadius = UDim.new(1, 0)

local hue = 0
RunService.RenderStepped:Connect(function(dt)
    hue = (hue + dt * 0.2) % 1
    fovStroke.Color = Color3.fromHSV(hue, 1, 1)
end)

local function updateFOVVisual()
    fovFrame.Size = UDim2.new(0, fovRadius * 2, 0, fovRadius * 2)
end
updateFOVVisual()

local function isVisible(part)
    if not part or not part.Parent then return false end
    if not wallCheckEnabled then return true end
    local origin = Camera.CFrame.Position
    local direction = part.Position - origin
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    local result = workspace:Raycast(origin, direction, params)
    return not result or result.Instance:IsDescendantOf(part.Parent)
end

RunService.RenderStepped:Connect(function()
    if aimEnabled then
        local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local bestPart, bestDist = nil, math.huge
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                if onScreen and dist <= fovRadius and dist < bestDist and isVisible(head) then
                    bestDist = dist
                    bestPart = head
                end
            end
        end
        if bestPart then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, bestPart.Position), aimSmooth)
        end
    end
end)

local AimTab = Window:CreateTab("Aim bot", 4483362458)
AimTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(v)
        aimEnabled = v
        fovFrame.Visible = v
    end
})

AimTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = wallCheckEnabled,
    Callback = function(v)
        wallCheckEnabled = v
    end
})

AimTab:CreateButton({
    Name = "Reset Defaults",
    Callback = function()
        aimEnabled = false
        fovRadius = 120
        aimSmooth = 0.35
        wallCheckEnabled = true
        fovFrame.Visible = false
        updateFOVVisual()
    end
})

AimTab:CreateSlider({
    Name = "FOV (pixels)",
    Range = {20, 1000},
    Increment = 10,
    CurrentValue = fovRadius,
    Callback = function(v)
        fovRadius = v
        updateFOVVisual()
    end
})

AimTab:CreateSlider({
    Name = "Aim Smooth",
    Range = {0.01, 1},
    Increment = 0.01,
    CurrentValue = aimSmooth,
    Callback = function(v)
        aimSmooth = v
    end
})
-- ===== ESP TAB =====
local ESPTab = Window:CreateTab("ESP", 4483362458)

local ESPEnabled = false
local BoxESPEnabled = false
local LineESPEnabled = false

local function CreateESP(player)
    local highlight = Instance.new("Highlight")
    highlight.Name = "DtoanESPHighlight"
    highlight.FillTransparency = 1
    highlight.OutlineColor = Color3.new(1, 0, 0)
    highlight.Parent = player.Character
end

local function RemoveESP(player)
    if player.Character and player.Character:FindFirstChild("DtoanESPHighlight") then
        player.Character.DtoanESPHighlight:Destroy()
    end
end

local function UpdateESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if ESPEnabled then
                if player.Character and not player.Character:FindFirstChild("DtoanESPHighlight") then
                    CreateESP(player)
                end
            else
                RemoveESP(player)
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        UpdateESP()
    end
end)

ESPTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Callback = function(Value)
        ESPEnabled = Value
        if not Value then
            for _, player in pairs(Players:GetPlayers()) do
                RemoveESP(player)
            end
        end
    end,
})

ESPTab:CreateToggle({
    Name = "Box ESP",
    CurrentValue = false,
    Callback = function(Value)
        BoxESPEnabled = Value
    end,
})

ESPTab:CreateToggle({
    Name = "Line ESP",
    CurrentValue = false,
    Callback = function(Value)
        LineESPEnabled = Value
    end,
})

RunService.RenderStepped:Connect(function()
    if LineESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = player.Character.HumanoidRootPart
                local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                if onScreen then
                    -- Vẽ line từ giữa màn hình đến người chơi
                    local line = Drawing.new("Line")
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    line.To = Vector2.new(rootPos.X, rootPos.Y)
                    line.Color = Color3.fromRGB(255, 0, 0)
                    line.Thickness = 1
                    line.Transparency = 1
                    line.Visible = true
                    task.delay(0.01, function()
                        line:Remove()
                    end)
                end
            end
        end
    end
end)

-- ===== TAB KHÁC =====
local OtherTab = Window:CreateTab("Khác", 4483362458)

local InfiniteJumpEnabled = false
OtherTab:CreateToggle({
    Name = "Infinity Jump",
    CurrentValue = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
    end,
})

UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

OtherTab:CreateSlider({
    Name = "Player Speed",
    Range = {16,200},
    Increment = 5,
    CurrentValue = 16,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
        end
    end,
})

OtherTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,500},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
        end
    end,
})

-- ===== TAB PLATFORM =====
local PlatformTab = Window:CreateTab("Platform", 4483362458)

PlatformTab:CreateButton({
    Name = "Enable Platform",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local platform = Instance.new("Part")
            platform.Name = "DtoanPlatform"
            platform.Size = Vector3.new(10, 1, 10)
            platform.Anchored = true
            platform.CanCollide = true
            platform.Position = LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
            platform.BrickColor = BrickColor.new("Bright blue")
            platform.Parent = workspace
        end
    end,
})

PlatformTab:CreateButton({
    Name = "Remove Platform",
    Callback = function()
        if workspace:FindFirstChild("DtoanPlatform") then
            workspace.DtoanPlatform:Destroy()
        end
    end,
})

-- ===== END OF SCRIPT =====
print("✅ Dtoan Script Loaded Successfully!")