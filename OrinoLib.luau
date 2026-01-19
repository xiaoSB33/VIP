local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local VirtualUser = game:GetService("VirtualUser")
local Plr = game:GetService("Players")
local LP = Plr.LocalPlayer

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- 1. 初始化头部 UI (显示时间和欢迎气泡)
local TimeGui = Instance.new("ScreenGui", CoreGui) -- 原代码 getParent 通常指 CoreGui
local TimeLabel = Instance.new("TextLabel", TimeGui)

-- 发送聊天气泡
TextChatService:DisplayBubble((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Head"), "欢迎使用此脚本")
TextChatService:DisplayBubble((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Head"), "此信息仅别人看不见")

TimeGui.Name = "LBLG"
TimeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TimeGui.Enabled = true

TimeLabel.Name = "LBL"
TimeLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TimeLabel.BackgroundTransparency = 1
TimeLabel.BorderColor3 = Color3.new(0, 0, 0)
TimeLabel.Position = UDim2.new(0.75, 0, 0.01, 0)
TimeLabel.Size = UDim2.new(0, 133, 0, 40)
TimeLabel.Font = Enum.Font.GothamSemibold
TimeLabel.Text = ""
TimeLabel.TextColor3 = Color3.new(1, 1, 1)
TimeLabel.TextScaled = true
TimeLabel.TextSize = 14
TimeLabel.TextWrapped = true
TimeLabel.Visible = true

-- 时间更新循环
local hue = 0
local fps_buffer = {}
local last_tick = tick()
local fps_start = tick()

RunService.Heartbeat:Connect(function()
    local current_tick = tick()
    -- FPS 计算逻辑
    for i = #fps_buffer, 1, -1 do
        fps_buffer[i + 1] = fps_buffer[i] >= current_tick - 1 and fps_buffer[i] or nil
    end
    fps_buffer[1] = current_tick
    local fps = (tick() - fps_start >= 1 and #fps_buffer) or (#fps_buffer / (tick() - fps_start))
    local fps_cleaned = fps - fps % 1
    
    -- 更新文本
    TimeLabel.Text = ("北京时间:" .. os.date("%H") .. "时" .. os.date("%M") .. "分" .. os.date("%S")) .. "秒"
    TimeLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
    hue = (hue + 0.001) % 1
end)

local LibBackup = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
LibBackup.DefaultColor = Color3.fromRGB(0, 0, 255)
LibBackup:Notification({ Text = "脚本持续更新", Duration = 10 })
wait(1)
LibBackup:Notification({ Text = "谢谢你的使用", Duration = 10 })
wait(1)
LibBackup:Notification({ Text = "最近更新时间：1月18日", Duration = 10 })

game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "大寒脚本 - 主脚本",
  Text = "欢迎使用大寒脚本",
  Duration = 4,
  Callback = bindable,
  Button1 = "感谢您的使用",
})
wait(3)
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "正在加载中",
  Text = "慢慢等待",
  Duration = 4,
  Callback = bindable,
  Button1 = "看到这个代表能用了",
})
wait(4)

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/FIN-Ui/refs/heads/main/FIN-WindUi"))()
function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',math.floor(r * 255),math.floor(g * 255),math.floor(b * 255),chars[i])
    end
    return result
end

local BypassChainAC = false
local infiniteStaminaEnabled = false
local staminaConnection = nil
local infiniteCombatStaminaEnabled = false
local combatStaminaConnection = nil
local WalkSpeed_Enabled = false
local WalkSpeed_Value = 16
local WalkSpeed_Connection = nil
local Noclip_Enabled = false
local Noclip_Connection = nil
local NightVision_Enabled = false
local MonsterESP_Enabled = false
local MonsterESP_Highlights = {}
local ScrapESPEnabled = false
local ScrapESPConnection = nil
local ActiveScrapHighlights = {}
local selectedLocation = nil

local function setupStaminaInfinite(character)
    if character and infiniteStaminaEnabled then
        local stats = character:FindFirstChild("Stats") or character:WaitForChild("Stats", 5)
        if stats then
            local stamina = stats:FindFirstChild("Stamina") or stats:WaitForChild("Stamina", 5)
            if stamina then
                if staminaConnection then staminaConnection:Disconnect() staminaConnection = nil end
                staminaConnection = stamina.Changed:Connect(function()
                    if infiniteStaminaEnabled and stamina.Value ~= 100 then stamina.Value = 100 end
                end)
                stamina.Value = 100
            end
        end
    end
end

local function setupCombatStaminaInfinite(character)
    if character and infiniteCombatStaminaEnabled then
        local stats = character:FindFirstChild("Stats") or character:WaitForChild("Stats", 5)
        if stats then
            local combatStamina = stats:FindFirstChild("CombatStamina") or stats:WaitForChild("CombatStamina", 5)
            if combatStamina then
                if combatStaminaConnection then combatStaminaConnection:Disconnect() combatStaminaConnection = nil end
                combatStaminaConnection = combatStamina.Changed:Connect(function()
                    if infiniteCombatStaminaEnabled and combatStamina.Value ~= 100 then combatStamina.Value = 100 end
                end)
                combatStamina.Value = 100
            end
        end
    end
end

local function UpdateMoveSpeed()
    local player = Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.WalkSpeed = WalkSpeed_Value end
    end
end

local function SetMoveSpeed(state)
    WalkSpeed_Enabled = state
    if state then
        UpdateMoveSpeed()
        if not WalkSpeed_Connection then
            WalkSpeed_Connection = RunService.Heartbeat:Connect(function()
                if WalkSpeed_Enabled then UpdateMoveSpeed() end
            end)
        end
        Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(1) UpdateMoveSpeed() end)
    else
        local player = Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid.WalkSpeed = 16 end
        end
        if WalkSpeed_Connection then WalkSpeed_Connection:Disconnect() WalkSpeed_Connection = nil end
    end
end

local function SetNoclip(state)
    Noclip_Enabled = state
    if state then
        if not Noclip_Connection then
            Noclip_Connection = RunService.Stepped:Connect(function()
                local player = Players.LocalPlayer
                if player and player.Character then
                    for _, part in ipairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                    end
                end
            end)
        end
    else
        if Noclip_Connection then Noclip_Connection:Disconnect() Noclip_Connection = nil end
    end
end

local function SetNightVision(state)
    NightVision_Enabled = state
    if state then
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.FogEnd = 10000
        Lighting.GlobalShadows = false
        Lighting.ExposureCompensation = 1
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        Lighting.FogEnd = 1000
        Lighting.GlobalShadows = true
        Lighting.ExposureCompensation = 0
    end
end

local function AddMonsterESP(monster)
    if not monster or MonsterESP_Highlights[monster] then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "MonsterESP"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = monster
    local head = monster:FindFirstChild("Head")
    if head then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "MonsterInfo"
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0, 20)
        nameLabel.Text = monster.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        nameLabel.TextScaled = true
        nameLabel.BackgroundTransparency = 1
        nameLabel.Parent = frame
        local healthLabel = Instance.new("TextLabel")
        healthLabel.Size = UDim2.new(1, 0, 0, 20)
        healthLabel.Position = UDim2.new(0, 0, 0, 20)
        healthLabel.Text = "HP: 100"
        healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthLabel.TextScaled = true
        healthLabel.BackgroundTransparency = 1
        healthLabel.Parent = frame
    end
    MonsterESP_Highlights[monster] = {highlight = highlight}
end

local function RemoveMonsterESP(monster)
    if MonsterESP_Highlights[monster] then
        if MonsterESP_Highlights[monster].highlight and MonsterESP_Highlights[monster].highlight.Parent then MonsterESP_Highlights[monster].highlight:Destroy() end
        local head = monster:FindFirstChild("Head")
        if head then
            local billboard = head:FindFirstChild("MonsterInfo")
            if billboard then billboard:Destroy() end
        end
        MonsterESP_Highlights[monster] = nil
    end
end

local function UpdateMonsterESP()
    for monster, data in pairs(MonsterESP_Highlights) do
        if not monster.Parent then RemoveMonsterESP(monster) end
    end
    local aiFolder = Workspace:FindFirstChild("Misc")
    if aiFolder then
        aiFolder = aiFolder:FindFirstChild("AI")
        if aiFolder then
            for _, monster in ipairs(aiFolder:GetChildren()) do
                if monster:IsA("Model") and (monster.Name == "CHAIN" or monster.Name == "Entity" or monster.Name == "Monster") then
                    if MonsterESP_Enabled then AddMonsterESP(monster) end
                end
            end
        end
    end
end

local function SetMonsterESP(state)
    MonsterESP_Enabled = state
    if state then
        WindUI:Notify({Title = "✅透视开启", Content = "怪物透视已启用", Duration = 1})
        RunService.Heartbeat:Connect(function() UpdateMonsterESP() end)
    else
        WindUI:Notify({Title = "❌透视关闭", Content = "怪物透视已禁用", Duration = 1})
        for monster, _ in pairs(MonsterESP_Highlights) do RemoveMonsterESP(monster) end
    end
end

local function FindScrapContainer()
    local primaryPath = Workspace:FindFirstChild("Misc") and Workspace.Misc:FindFirstChild("Zones") and Workspace.Misc.Zones:FindFirstChild("LootingItems") and Workspace.Misc.Zones.LootingItems:FindFirstChild("Scrap")
    if primaryPath then return primaryPath end
    for _, child in ipairs(Workspace:GetChildren()) do
        if child.Name == "Scrap" and child:IsA("Folder") then return child end
    end
    for _, descendant in ipairs(Workspace:GetDescendants()) do
        if descendant.Name:lower():find("scrap") and descendant:IsA("Model") then return descendant.Parent end
    end
    return nil
end

local function AddESPToScrap(scrapModel)
    if not scrapModel or ActiveScrapHighlights[scrapModel] or not scrapModel:IsA("Model") then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "ScrapESP_Highlight"
    highlight.FillColor = Color3.fromRGB(46, 204, 113)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.2
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = scrapModel
    local attachPart = scrapModel.PrimaryPart or scrapModel:FindFirstChild("HumanoidRootPart") or scrapModel:FindFirstChild("Head") or scrapModel:FindFirstChildWhichIsA("BasePart")
    if attachPart then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ScrapESP_Billboard"
        billboard.Size = UDim2.new(0, 200, 0, 60)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 1e30
        billboard.Parent = attachPart
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "废料\n距离: 计算中..."
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextStrokeTransparency = 0.3
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 14
        textLabel.TextYAlignment = Enum.TextYAlignment.Center
        textLabel.TextXAlignment = Enum.TextXAlignment.Center
        textLabel.RichText = true
        textLabel.ZIndex = 10
        textLabel.Parent = billboard
        ActiveScrapHighlights[scrapModel] = {Highlight = highlight, Billboard = billboard, TextLabel = textLabel, AttachPart = attachPart}
    else
        highlight.FillTransparency = 0.7
        ActiveScrapHighlights[scrapModel] = {Highlight = highlight, Billboard = nil, TextLabel = nil, AttachPart = nil}
    end
end

local function CleanupRemovedScrap()
    for scrapModel, data in pairs(ActiveScrapHighlights) do
        if not scrapModel.Parent then
            if data.Highlight then data.Highlight:Destroy() end
            if data.Billboard then data.Billboard:Destroy() end
            ActiveScrapHighlights[scrapModel] = nil
        end
    end
end

local function UpdateAllScrapInfo()
    local player = Players.LocalPlayer
    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    local maxDisplayDistance = 999999999999999999999
    for scrapModel, data in pairs(ActiveScrapHighlights) do
        if scrapModel.Parent and data.AttachPart then
            local distance = (rootPart.Position - data.AttachPart.Position).Magnitude
            if distance > maxDisplayDistance then
                if data.Highlight then data.Highlight.Enabled = false end
                if data.Billboard then data.Billboard.Enabled = false end
            else
                if data.Highlight then data.Highlight.Enabled = true end
                if data.Billboard then data.Billboard.Enabled = true end
                local statusText = "状态: 未知"
                local statusColor = Color3.fromRGB(255, 255, 255)
                local isAvailable = nil
                local values = scrapModel:FindFirstChild("Values")
                if values then isAvailable = values:GetAttribute("Available") end
                if isAvailable == nil then isAvailable = scrapModel:GetAttribute("Available") end
                if isAvailable == nil then
                    local prompt = scrapModel:FindFirstChild("ProximityPrompt")
                    if prompt and prompt:IsA("ProximityPrompt") then isAvailable = prompt.Enabled end
                end
                if isAvailable == true then
                    statusText = "状态: ✓ 可拾取"
                    statusColor = Color3.fromRGB(46, 204, 113)
                    if data.Highlight then data.Highlight.FillColor = Color3.fromRGB(46, 204, 113) end
                elseif isAvailable == false then
                    statusText = "状态: ✗ 已拾取"
                    statusColor = Color3.fromRGB(231, 76, 60)
                    if data.Highlight then data.Highlight.FillColor = Color3.fromRGB(231, 76, 60) end
                else
                    if data.Highlight then data.Highlight.FillColor = Color3.fromRGB(155, 89, 182) end
                end
                if data.TextLabel then
                    data.TextLabel.Text = string.format("废料\n距离: %d 米\n%s", math.floor(distance), statusText)
                    data.TextLabel.TextColor3 = statusColor
                end
                if data.Highlight then
                    local maxFadeDistance = 200
                    local minAlpha = 0.3
                    local maxAlpha = 0.5
                    if distance < maxFadeDistance then
                        local alphaRatio = 1 - (distance / maxFadeDistance)
                        local alpha = minAlpha + (maxAlpha - minAlpha) * alphaRatio
                        data.Highlight.FillTransparency = 1 - alpha
                    else
                        data.Highlight.FillTransparency = 1 - minAlpha
                    end
                end
            end
        end
    end
end

local function MainScrapScanLoop()
    if not ScrapESPEnabled then return end
    CleanupRemovedScrap()
    local scrapContainer = FindScrapContainer()
    if scrapContainer then
        for _, child in ipairs(scrapContainer:GetChildren()) do
            if child:IsA("Model") then AddESPToScrap(child) end
        end
        UpdateAllScrapInfo()
    end
end

local function SetScrapESP(state)
    ScrapESPEnabled = state
    if state then
        WindUI:Notify({Title = "✅ 废料透视已启用", Content = "正在扫描并显示废料位置...", Duration = 2})
        if ScrapESPConnection then ScrapESPConnection:Disconnect() ScrapESPConnection = nil end
        for scrapModel, data in pairs(ActiveScrapHighlights) do
            if data.Highlight then data.Highlight:Destroy() end
            if data.Billboard then data.Billboard:Destroy() end
        end
        ActiveScrapHighlights = {}
        ScrapESPConnection = RunService.RenderStepped:Connect(function(deltaTime) MainScrapScanLoop() end)
    else
        WindUI:Notify({Title = "❌ 废料透视已禁用", Content = "已移除所有废料高亮标记", Duration = 2})
        if ScrapESPConnection then ScrapESPConnection:Disconnect() ScrapESPConnection = nil end
        for scrapModel, data in pairs(ActiveScrapHighlights) do
            if data.Highlight then data.Highlight:Destroy() end
            if data.Billboard then data.Billboard:Destroy() end
        end
        ActiveScrapHighlights = {}
    end
end

local function TeleportToLocation(locationName)
    local player = Players.LocalPlayer
    local character = player.Character
    if not character then
        WindUI:Notify({Title = "传送失败", Content = "角色不存在", Duration = 2})
        return
    end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        WindUI:Notify({Title = "传送失败", Content = "未找到HumanoidRootPart", Duration = 2})
        return
    end
    local locations = {
        ["房屋"] = CFrame.new(164.408112, -93.5687103, 228.658173, 0.99991262, 0.000353183481, -0.0132142855, 8.33566993e-9, 0.999642968, 0.0267184861, 0.0132190045, -0.0267161522, 0.999555647),
        ["商店"] = CFrame.new(-113.171844, -85.9600906, 209.123428, -0.00369261508, -0.12829496, -0.9917292, -7.23150917e-9, 0.991735935, -0.128295839, 0.999993205, -0.000473739958, -0.00366209983),
        ["仓库"] = CFrame.new(315.716339, -112.372467, -258.560028, -0.999726713, 0.0000574405785, 0.0233771317, 8.75708484e-9, 0.99999696, -0.0024567449, -0.0233772025, -0.00245607318, -0.999723673),
        ["工作房"] = CFrame.new(171.005341, -101.835281, -30.2862396, 0.258823305, -0.00847451296, -0.965887487, -1.02627325e-6, 0.999961495, -0.0087737469, 0.96592468, 0.00227184128, 0.258813351),
        ["电台"] = CFrame.new(-381.520599, -113.735931, 42.9471855, -0.0306593683, -0.0237039384, -0.999248803, 2.74181366e-6, 0.999718785, -0.0237151701, 0.999529898, -0.000729829073, -0.030650679),
        ["电力站"] = CFrame.new(-207.976364, -109.483444, -86.5617981, 0.999895096, -0.000663155632, 0.014468275, 3.69048212e-6, 0.99896282, 0.045532573, -0.014483464, -0.0455277413, 0.998858094),
        ["仪式"] = CFrame.new(-25.7088108, -106.319954, -199.117996, 0.970376134, -0.00883071404, -0.241437614, 0.0000357253812, 0.999337018, -0.0364077166, 0.241599053, 0.0353205539, 0.969733119)
    }
    local targetCFrame = locations[locationName]
    if targetCFrame then
        humanoidRootPart.CFrame = targetCFrame
        WindUI:Notify({Title = "传送成功", Content = "已传送到: " .. locationName, Duration = 3})
    else
        WindUI:Notify({Title = "传送失败", Content = "未知的传送位置", Duration = 2})
    end
end

local isAntiKickEnabled = false
local originalKick = LocalPlayer.Kick
local originalRemove = LocalPlayer.Remove
local blockedRemotes = {}
local protectConnections = {}

local playerESPEnabled = false
local gunESPEnabled = false
local buildingESPEnabled = false
local espFolder = nil
local playerESPColor = Color3.new(1, 1, 1)
local gunESPColor = Color3.new(1, 0, 0)
local buildingESPColor = Color3.new(1, 1, 0)

local hitboxEnabled = false
local hitboxSize = 20
local hitboxTransparency = 0.7
local hitboxColor = Color3.new(1, 1, 1)
local hitboxRainbow = false

local robableBuildings = {
    {Name = "主银行", X = -396.83038330078125, Y = 617.2534790039062, Z = -1232.5364990234375, Size = Vector3.new(20, 15, 20)},
    {Name = "小银行", X = 1200.543212890625, Y = 105.34567260742188, Z = -3800.765869140625, Size = Vector3.new(15, 12, 15)},
    {Name = "手机店", X = -817.015869140625, Y = 42.50890350341797, Z = -1475.6961669921875, Size = Vector3.new(10, 8, 10)},
    {Name = "黑市", X = -2928.986572265625, Y = 37.00225067138672, Z = 1685.840087890625, Size = Vector3.new(18, 10, 18)},
    {Name = "便利店", X = 950.1234567890625, Y = 45.67890118408203, Z = -2100.34567890625, Size = Vector3.new(8, 6, 8)}
}

local gunLocations = {
    {Name = "M4A1", X = -6343.18310546875, Y = 137.80563354492188, Z = -4332.36181640625},
    {Name = "RPG", X = -7835.48388671875, Y = 24.863780975341797, Z = 1197.772216796875},
    {Name = "Uzi", X = -1393.7154541015625, Y = 275.935302734375, Z = 3200.262939453125},
    {Name = "AWM狙击枪", X = -822.9995727539062, Y = 326.55078125, Z = -501.038818359375},
    {Name = "Ump 45", X = 1666.9974365234375, Y = 146.83499145507812, Z = -641.7549438476562},
    {Name = "M1014", X = 1347.935302734375, Y = 142.10012817382812, Z = -4811.6494140625}
}

local locationPoints = {
    {Name = "银行金库门口", X = -396.83038330078125, Y = 617.2534790039062, Z = -1232.5364990234375},
    {Name = "犯罪出生点", X = -396.83038330078125, Y = 617.2534790039062, Z = -1232.5364990234375},
    {Name = "军事基地", X = -1559.624267578125, Y = 181.16668701171875, Z = 3197.65869140625},
    {Name = "警局", X = 1609.2640380859375, Y = 121.87785339355469, Z = -698.3871459960938},
    {Name = "枪店", X = -162.11431884765625, Y = 42.65122985839844, Z = -2844.806396484375},
    {Name = "手机店", X = -817.015869140625, Y = 42.50890350341797, Z = -1475.6961669921875}
}

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', 
            math.floor(r * 255), 
            math.floor(g * 255), 
            math.floor(b * 255), 
            chars[i])
    end
    return result
end

local sprint = ReplicatedStorage:FindFirstChild("Systems") and ReplicatedStorage.Systems.Character.Game:FindFirstChild("Sprinting") and require(ReplicatedStorage.Systems.Character.Game.Sprinting) or nil
local staminaDefaults = sprint and {
    MaxStamina = sprint.MaxStamina,
    SprintSpeed = sprint.SprintSpeed,
    StaminaGain = sprint.StaminaGain,
    StaminaDrain = sprint.StaminaDrain or 1,
    StaminaRegenDelay = sprint.StaminaRegenDelay or 0.5
} or {}
local staminaValues = table.clone(staminaDefaults)
local infinityStaminaActive, staminaThread = false, nil

local antiFeatures = {
    stun = false,
    slow = false,
    blindness = false,
    subspace = false,
    footsteps = false
}

local espSystem = {}

local autoBlockOn = false
local detectionRange = 18
local looseFacing = true
local strictRangeOn = true
local windupThreshold = 0.75
local autoBlockTriggerAnims = {
    "126830014841198", "126355327951215", "121086746534252", "18885909645",
    "98456918873918", "105458270463374", "83829782357897", "125403313786645"
}
local remoteEvent = ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules.Network:FindFirstChild("RemoteEvent") or nil

local autoCloneOn = false
local cloneDetectionRange = 20
local cloneDetectionRangeSq = cloneDetectionRange * cloneDetectionRange
local autoCloneTriggerSounds = {
    ["102228729296384"] = true, ["140242176732868"] = true, ["112809109188560"] = true,
    ["136323728355613"] = true, ["115026634746636"] = true, ["84116622032112"] = true
}

local aimbot = {enabled = false, smoothness = 1}

local autoPizza = {enabled = false, threshold = 50}

local Part = Instance.new("Part", workspace)
Part.Material = Enum.Material.ForceField
Part.Anchored = true
Part.CanCollide = false
Part.CastShadow = false
Part.Shape = Enum.PartType.Ball
Part.Color = Color3.fromRGB(132, 0, 255)
Part.Transparency = 0.5

local BaseGui = Instance.new("ScreenGui", game.CoreGui)
BaseGui.Name = "BaseGui"

local TL = Instance.new("TextLabel", BaseGui)
TL.Name = "TL"
TL.Parent = BaseGui
TL.BackgroundColor3 = Color3.new(1, 1, 1)
TL.BackgroundTransparency = 1
TL.BorderColor3 = Color3.new(0, 0, 0)
TL.Position = UDim2.new(0.95, -300, 0.85, 0)
TL.Size = UDim2.new(0, 300, 0, 50)
TL.FontFace = Font.new("rbxassetid://12187370000", Enum.FontWeight.Bold)
TL.Text = ""
TL.TextColor3 = Color3.new(1, 1, 1)
TL.TextScaled = true
TL.TextSize = 14
TL.TextWrapped = true
TL.Visible = true
TL.RichText = true

local function rainbowColor(hue)
  return Color3.fromHSV(hue, 1, 1)
end

local function updateRainbowText(distance, ballSpeed, spamRadius, minDistance)
  local hue = (tick() * 0.1) % 1
  local color1 = rainbowColor(hue)
  local color2 = rainbowColor((hue + 0.3) % 1)
  local color3 = rainbowColor((hue + 0.6) % 1)
  local color4 = rainbowColor((hue + 0.9) % 1)

  TL.Text = string.format(
  "<font color='#%s'>distance: %s</font>\n"..
  "<font color='#%s'>ballSpeed: %s</font>\n"..
  "<font color='#%s'>spamRadius: %s</font>\n"..
  "<font color='#%s'>minDistance: %s</font>",
  color1:ToHex(), tostring(distance),
  color2:ToHex(), tostring(ballSpeed),
  color3:ToHex(), tostring(spamRadius),
  color4:ToHex(), tostring(minDistance)
  )
end

local last1, last2
local Cam = workspace.CurrentCamera

local function ZJ()
  local Nearest, Min = nil, math.huge
  for A, B in next, workspace.Alive:GetChildren() do
    if B.Name ~= LP.Name and B:FindFirstChild("HumanoidRootPart") then
      local distance = LP:DistanceFromCharacter(B:GetPivot().Position)
      if distance < Min then
        Min = distance
        Nearest = B
      end
    end
  end
  return Min
end

local function Parry()
  task.spawn(function() game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, nil, 0) end)
end

local function GetBall()
  for a, b in next, workspace.Balls:GetChildren() do
    if b:IsA("BasePart") and b:GetAttribute("realBall") then
      return b
    end
  end
end

local function IsTarget(a)
  return a:GetAttribute("target") == LP.Name
end

local function IsSpamming(a, b)
  if not type(last1) == "number" then return false end
  if not type(last2) == "number" then return false end
  if last1 - last2 > 0.8 then
    return false
  end
  if a > b then
    return false
  end
  if #workspace.Alive:GetChildren() <= 1 then
    return false
  end
  return true
end

local function addRainbowTitleToLocalPlayer(player, titleText)
    local function addTitleToCharacter(character)
        local head = character:FindFirstChild("Head") or character:WaitForChild("Head")
        local old = head:FindFirstChild("PlayerTitle")
        if old then old:Destroy() end
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "PlayerTitle"
        billboardGui.Adornee = head
        billboardGui.Size = UDim2.new(4, 0, 1, 0)
        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
        billboardGui.AlwaysOnTop = true
        billboardGui.MaxDistance = 1000
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = titleText
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextWrapped = true
        textLabel.Parent = billboardGui
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1
        stroke.Color = Color3.new(1, 1, 1)
        stroke.Parent = textLabel
        local gradient = Instance.new("UIGradient")
        gradient.Rotation = 90
        gradient.Parent = textLabel
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            local time = tick() * 0.5
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(time % 1, 1, 1)),
                ColorSequenceKeypoint.new(0.2, Color3.fromHSV((time + 0.2) % 1, 1, 1)),
                ColorSequenceKeypoint.new(0.4, Color3.fromHSV((time + 0.4) % 1, 1, 1)),
                ColorSequenceKeypoint.new(0.6, Color3.fromHSV((time + 0.6) % 1, 1, 1)),
                ColorSequenceKeypoint.new(0.8, Color3.fromHSV((time + 0.8) % 1, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(time % 1, 1, 1))
            })
        end)
        billboardGui.AncestryChanged:Connect(function()
            if not billboardGui:IsDescendantOf(game) then
                if connection then connection:Disconnect() end
            end
        end)
        billboardGui.Parent = head
    end
    local character = player.Character or player.CharacterAdded:Wait()
    addTitleToCharacter(character)
    player.CharacterAdded:Connect(addTitleToCharacter)
end

local Window = WindUI:CreateWindow({
    Title = "大寒脚本『SY公会』[FL团队]",
    Author = "免费汉化",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Folder = "CloudHub",
    Size = UDim2.fromOffset(350, 500),
    Transparent = true,
    Theme = "Sky",
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:EditOpenButton({
    Title = "打开大寒脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 5),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("00AAFF"),
        Color3.fromHex("00FFAA")
    ),
    Draggable = true,
})

local AutoRebirth = false
local AutoSpeed1 = false
local AutoSpeed5 = false
local AutoSpeed10 = false
local AutoUpgradeBase = false
local AutoUpgradeCarry = false
local AutoSellTool = false
local AutoSellAll = false
local autoCollectEnabled = false

local MainTab = Window:Tab({
    Title = "公告",
    Icon = "info",
    Locked = false,
})

MainTab:Paragraph({
    Title = "作者免费汉化",
    Desc = "所有功能都在全部功能标签页",
})

local function mgdcj()
    local AutoTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })

    AutoTab:Toggle({
        Title = "自动重生",
        Icon = "refresh-cw",
        Callback = function(value)
            AutoRebirth = value
            if value then
                task.spawn(function()
                    local RebirthFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("Rebirth")
                    if not RebirthFunc then
                        warn("未找到Rebirth远程函数")
                        AutoRebirth = false
                        return
                    end
                    while AutoRebirth do
                        pcall(function() RebirthFunc:InvokeServer() end)
                        task.wait(0.5)
                    end
                end)
            end
        end
    })

    AutoTab:Section({
        Title = "速度升级",
        Desc = "选择其中一个开启"
    })

    AutoTab:Toggle({
        Title = "速度升级(1级)",
        Icon = "chevron-up",
        Callback = function(value)
            AutoSpeed1 = value
            if value then
                AutoSpeed5 = false
                AutoSpeed10 = false
                task.spawn(function()
                    local SpeedFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeSpeed")
                    if not SpeedFunc then
                        warn("未找到UpgradeSpeed远程函数")
                        AutoSpeed1 = false
                        return
                    end
                    while AutoSpeed1 do
                        pcall(function() SpeedFunc:InvokeServer(1) end)
                        task.wait(0.1)
                    end
                end)
            end
        end
    })

    AutoTab:Toggle({
        Title = "速度升级(5级)",
        Icon = "chevron-up",
        Callback = function(value)
            AutoSpeed5 = value
            if value then
                AutoSpeed1 = false
                AutoSpeed10 = false
                task.spawn(function()
                    local SpeedFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeSpeed")
                    if not SpeedFunc then
                        warn("未找到UpgradeSpeed远程函数")
                        AutoSpeed5 = false
                        return
                    end
                    while AutoSpeed5 do
                        pcall(function() SpeedFunc:InvokeServer(5) end)
                        task.wait(0.1)
                    end
                end)
            end
        end
    })

    AutoTab:Toggle({
        Title = "速度升级(10级)",
        Icon = "chevron-up",
        Callback = function(value)
            AutoSpeed10 = value
            if value then
                AutoSpeed1 = false
                AutoSpeed5 = false
                task.spawn(function()
                    local SpeedFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeSpeed")
                    if not SpeedFunc then
                        warn("未找到UpgradeSpeed远程函数")
                        AutoSpeed10 = false
                        return
                    end
                    while AutoSpeed10 do
                        pcall(function() SpeedFunc:InvokeServer(10) end)
                        task.wait(0.1)
                    end
                end)
            end
        end
    })

    AutoTab:Section({
        Title = "建筑升级",
        Desc = "房屋和运载升级"
    })

    AutoTab:Toggle({
        Title = "自动升级房屋",
        Icon = "",
        Callback = function(value)
            AutoUpgradeBase = value
            if value then
                task.spawn(function()
                    local UpgradeFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeBase") 
                        or game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeHouse")
                    if not UpgradeFunc then
                        warn("未找到房屋升级远程函数")
                        AutoUpgradeBase = false
                        return
                    end
                    while AutoUpgradeBase do
                        pcall(function() UpgradeFunc:InvokeServer() end)
                        task.wait(1)
                    end
                end)
            end
        end
    })

    AutoTab:Toggle({
        Title = "自动运载升级",
        Icon = "",
        Callback = function(value)
            AutoUpgradeCarry = value
            if value then
                task.spawn(function()
                    local CarryFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeCarry") 
                        or game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("UpgradeCapacity")
                    if not CarryFunc then
                        warn("未找到运载升级远程函数")
                        AutoUpgradeCarry = false
                        return
                    end
                    while AutoUpgradeCarry do
                        pcall(function() CarryFunc:InvokeServer() end)
                        task.wait(0.5)
                    end
                end)
            end
        end
    })

    AutoTab:Section({
        Title = "售卖功能",
        Desc = "售卖脑红"
    })

    AutoTab:Toggle({
        Title = "自动售卖手上脑红",
        Icon = "",
        Callback = function(value)
            AutoSellTool = value
            if value then
                task.spawn(function()
                    local SellToolFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("SellTool")
                    if not SellToolFunc then
                        warn("未找到SellTool远程函数")
                        AutoSellTool = false
                        return
                    end
                    while AutoSellTool do
                        pcall(function() SellToolFunc:InvokeServer() end)
                        task.wait(0.2)
                    end
                end)
            end
        end
    })

    AutoTab:Toggle({
        Title = "自动售卖全部脑红",
        Icon = "",
        Callback = function(value)
            AutoSellAll = value
            if value then
                task.spawn(function()
                    local SellAllFunc = game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("SellAll")
                    if not SellAllFunc then
                        warn("未找到SellAll远程函数")
                        AutoSellAll = false
                        return
                    end
                    while AutoSellAll do
                        pcall(function() SellAllFunc:InvokeServer() end)
                        task.wait(0.2)
                    end
                end)
            end
        end
    })

    AutoTab:Section({
        Title = "自动收钱",
        Desc = "自动收钱"
    })

    AutoTab:Toggle({
        Title = "自动收钱",
        Desc = "开启后自动收钱",
        Value = false,
        Callback = function(state)
            autoCollectEnabled = state
            
            if autoCollectEnabled then
                task.spawn(function()
                    while autoCollectEnabled do
                        for i = 1, 30 do
                            if not autoCollectEnabled then break end
                            
                            local slotName = "Slot" .. i
                            local args = {
                                [1] = slotName
                            }
                            
                            game:GetService("ReplicatedStorage").RemoteEvents.CollectMoney:FireServer(unpack(args))
                        end
                        task.wait(1)
                    end
                end)

                WindUI:Notify({
                    Title = "脚本运行中",
                    Content = "已开始自动收钱循环",
                    Duration = 3,
                    Icon = "play"
                })
            end
        end
    })
end

local function loadSCPFunctions()
    local SCPTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })

    SCPTab:Section({
        Title = "玩家"
    })

    SCPTab:Input({
        Title = "设置加速数值(推荐调到0.25)",
        Placeholder = "输入",
        Callback = function(speedValue)
            Speed = speedValue
        end
    })

    SCPTab:Toggle({
        Title = "开启加速(开/关)",
        Callback = function(enabled)
            if enabled == true then
                sudu = game:GetService("RunService").Heartbeat:Connect(function()
                    if game:GetService("Players").LocalPlayer.Character and 
                       game:GetService("Players").LocalPlayer.Character.Humanoid and 
                       game:GetService("Players").LocalPlayer.Character.Humanoid.Parent and 
                       game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 0.5)
                    end
                end)
            elseif not enabled and sudu then
                sudu:Disconnect()
                sudu = nil
            end
        end,
        Default = false
    })

    SCPTab:Input({
        Title = "设置跳跃高度(正常50)",
        Placeholder = "输入",
        Callback = function(jumpValue)
            JumpPower = tonumber(jumpValue) or 50
        end
    })

    SCPTab:Toggle({
        Title = "开启跳跃增强(开/关)",
        Callback = function(enabled)
            if enabled == true then
                JumpEnabled = true
                JumpConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    local player = game:GetService("Players").LocalPlayer
                    local character = player.Character
                    
                    if character and 
                       character:FindFirstChild("Humanoid") and 
                       character:FindFirstChild("HumanoidRootPart") then
                       
                        local humanoid = character.Humanoid
                        local rootPart = character.HumanoidRootPart
                        local currentVelocity = rootPart.Velocity
                        
                        if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                            rootPart.Velocity = Vector3.new(
                                currentVelocity.X,
                                JumpPower,
                                currentVelocity.Z
                            )
                        end
                        
                        if currentVelocity.Y < -50 then
                            rootPart.Velocity = Vector3.new(currentVelocity.X, -50, currentVelocity.Z)
                        end
                    end
                end)
            elseif not enabled and JumpConnection then
                JumpEnabled = false
                JumpConnection:Disconnect()
                JumpConnection = nil
            end
        end,
        Default = false
    })

    SCPTab:Input({
        Title = "设置重力数值(有问题)",
        Placeholder = "输入",
        Callback = function(gravityValue)
            GravityPower = tonumber(gravityValue) or 1.0
        end
    })

    SCPTab:Toggle({
        Title = "开启重力修改(开/关)",
        Callback = function(enabled)
            if enabled == true then
                GravityEnabled = true
                GravityConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    local player = game:GetService("Players").LocalPlayer
                    local character = player.Character
                    
                    if character and 
                       character:FindFirstChild("Humanoid") and 
                       character:FindFirstChild("HumanoidRootPart") then
                       
                        local humanoid = character.Humanoid
                        local rootPart = character.HumanoidRootPart
                        
                        -- 只在跳跃和下落状态应用重力修改
                        if humanoid:GetState() == Enum.HumanoidStateType.Jumping or 
                           humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                           
                            -- 控制跳跃高度和下落速度
                            local currentVelocity = rootPart.Velocity
                            local newYVelocity
                            
                            if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                                -- 跳跃时增加高度
                                newYVelocity = math.max(currentVelocity.Y, GravityPower * 10)
                            else
                                -- 下落时减缓速度
                                newYVelocity = currentVelocity.Y * (2.0 - GravityPower)
                            end
                            
                            rootPart.Velocity = Vector3.new(
                                currentVelocity.X,
                                newYVelocity,
                                currentVelocity.Z
                            )
                        end
                        
                        -- 防坠落伤害
                        if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                        else
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                        end
                    end
                end)
            elseif not enabled and GravityConnection then
                GravityEnabled = false
                GravityConnection:Disconnect()
                GravityConnection = nil
                
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                end
            end
        end,
        Default = false
    })

    SCPTab:Slider({
        Title = "血量",
        Min = 1,
        Max = 999999999,
        Default = 100,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.Health = Value
        end
    })

    SCPTab:Slider({
        Title = "缩放距离",
        Min = 128,
        Max = 200000,
        Default = 128,
        Callback = function(value)
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
        end
    })

    SCPTab:Slider({
        Title = "视界（正常70）",
        Min = 0.1,
        Max = 250,
        Default = 70,
        Callback = function(v)
            game.Workspace.CurrentCamera.FieldOfView = v
        end
    })
    
    SCPTab:Section({
        Title = "通用",
        Desc = " "
    })
    
    SCPTab:Toggle({
        Title = "穿墙(危险程度：低)",
        Callback = function(Value)
            if Value then
                local Player = game:GetService("Players").LocalPlayer
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local Humanoid = Character:WaitForChild("Humanoid")
                
                local NoclipConnection
                
                local function NoclipLoop()
                    if Character then
                        for _, part in pairs(Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end
                
                -- 开启穿墙
                NoclipConnection = game:GetService("RunService").Stepped:Connect(NoclipLoop)
                
                -- 角色重生时重新连接
                Player.CharacterAdded:Connect(function(newCharacter)
                    Character = newCharacter
                    Humanoid = Character:WaitForChild("Humanoid")
                    
                    -- 重新启用穿墙
                    if NoclipConnection then
                        NoclipConnection:Disconnect()
                    end
                    NoclipConnection = game:GetService("RunService").Stepped:Connect(NoclipLoop)
                end)
            else
                -- 关闭穿墙
                if NoclipConnection then
                    NoclipConnection:Disconnect()
                    NoclipConnection = nil
                end
                -- 恢复碰撞
                local Player = game:GetService("Players").LocalPlayer
                if Player.Character then
                    for _, part in pairs(Player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end,
        Default = false
    })

    SCPTab:Button({
        Title = "范围",
        Callback = function()
            _G.HeadSize = 20
            _G.Disabled = true

            game:GetService('RunService').RenderStepped:connect(function()
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
            end)
        end
    })

    SCPTab:Button({
        Title = "中级范围",
        Callback = function()
            _G.HeadSize = 100
            _G.Disabled = true

            game:GetService('RunService').RenderStepped:connect(function()
                if _G.Disabled then
                    for i,v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                                v.Character.HumanoidRootPart.Transparency = 0.7
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                                v.Character.HumanoidRootPart.Material = "Neon"
                                v.Character.HumanoidRootPart.CanCollide = false
                            end)
                        end
                    end
                end
            end)
        end
    })

    SCPTab:Button({
        Title = "高级范围",
        Callback = function()
            _G.HeadSize = 500
            _G.Disabled = true

            game:GetService('RunService').RenderStepped:connect(function()
                if _G.Disabled then
                    for i,v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                                v.Character.HumanoidRootPart.Transparency = 0.7
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                                v.Character.HumanoidRootPart.Material = "Neon"
                                v.Character.HumanoidRootPart.CanCollide = false
                            end)
                        end
                    end
                end
            end)
        end
    })
    
    SCPTab:Section({
        Title = "人物透视",
        Desc = " "
    })
    
    SCPTab:Toggle({
        Title = "人物显示",
        Callback = function(state)
            getgenv().enabled = state
            getgenv().filluseteamcolor = true
            getgenv().outlineuseteamcolor = true
            getgenv().fillcolor = Color3.new(1, 0, 0)
            getgenv().outlinecolor = Color3.new(1, 1, 1)
            getgenv().filltrans = 0.5
            getgenv().outlinetrans = 0.5

            loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
        end,
        Default = false
    })

    SCPTab:Toggle({
        Title = "ESP显示名称(正在修复)",
        Callback = function(state)
            -- 这里应该有一个ToggleESP函数，但未定义
            -- 暂时注释掉或留空
        end,
        Default = false
    })
    
    SCPTab:Section({
        Title = "脚本",
        Desc = " "
    })
    
    SCPTab:Button({
        Title = "变车模型",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Car-Gui-50947"))()
        end
    })

    SCPTab:Button({
        Title = "撸管r6",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
        end
    })

    SCPTab:Button({
        Title = "撸管r15",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        end
    })

    SCPTab:Button({
        Title = "自瞄",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/自瞄"))()
        end
    })
    
    SCPTab:Section({
        Title = "范围",
        Desc = " "
    })
    
    SCPTab:Button({
        Title = "范围清空",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/RqrTrPF5"))()
        end
    })

    SCPTab:Button({
        Title = "正常范围",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/%E8%8C%83%E5%9B%B4"))()
        end
    })

    SCPTab:Button({
        Title = "范围10",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/DT94B37a"))()
        end
    })

    SCPTab:Button({
        Title = "范围20",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Kyyt1e4g"))()
        end
    })

    SCPTab:Button({
        Title = "范围50",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/pMtKEgWd"))()
        end
    })

    SCPTab:Button({
        Title = "范围100",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/aLBSXPYE"))()
        end
    })

    SCPTab:Button({
        Title = "范围150",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/RWxsQuU9"))()
        end
    })

    SCPTab:Button({
        Title = "范围200",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/hbp3RV2p"))()
        end
    })

    SCPTab:Button({
        Title = "范围300",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/x8cZhegq"))()
        end
    })

    SCPTab:Button({
        Title = "范围400",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/LixK0gG3"))()
        end
    })

    SCPTab:Button({
        Title = "范围500",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/yXWMGLYJ"))()
        end
    })
    
    SCPTab:Section({
        Title = "自制功能",
        Desc = " "
    })
    
    SCPTab:Button({
        Title = "围墙自动破坏（不推荐开）",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoSB33/M416/refs/heads/main/Wind/sb/666"))()
        end
    })

    SCPTab:Button({
        Title = "没有坠落伤害建议搭配下面的功能（危险程度：无）",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local runService = game:GetService("RunService")

            local function enableGodMode()
                local character = player.Character
                if not character then
                    player.CharacterAdded:Wait()
                    character = player.Character
                end
                
                local humanoid = character:WaitForChild("Humanoid")
                
                -- 防止死亡的主要函数
                local function preventDeath()
                    -- 锁定生命值
                    humanoid.HealthChanged:Connect(function()
                        if humanoid.Health <= 0 then
                            -- 立即重生角色
                            player:LoadCharacter()
                        else
                            -- 保持生命值在最大值
                            humanoid.Health = humanoid.MaxHealth
                        end
                    end)
                    
                    -- 防止摔落伤害
                    humanoid.StateChanged:Connect(function(oldState, newState)
                        if newState == Enum.HumanoidStateType.Freefall then
                            spawn(function()
                                while humanoid:GetState() == Enum.HumanoidStateType.Freefall do
                                    wait(0.1)
                                    -- 减缓下落速度
                                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                                    if rootPart and rootPart.Velocity.Y < -50 then
                                        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, -10, rootPart.Velocity.Z)
                                    end
                                end
                            end)
                        end
                    end)
                end
                
                -- 立即应用无敌效果
                preventDeath()
                
                -- 角色重生后重新应用无敌
                player.CharacterAdded:Connect(function(newCharacter)
                    character = newCharacter
                    humanoid = newCharacter:WaitForChild("Humanoid")
                    wait(0.5)
                    preventDeath()
                end)
            end

            enableGodMode()
        end
    })

    SCPTab:Button({
        Title = "创造方块飞天2.0（危险程度：低）",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/%EF%BC%9F%EF%BC%9F%EF%BC%9F"))()
        end
    })

    SCPTab:Button({
        Title = "DD传送当混沌可刷逃脱皮肤(如果没当成混沌那就再点一次传送)（危险程度：未知）",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local runService = game:GetService("RunService")

            local targets = {
                CFrame.new(-254.683273, 122.693947 - 7, 20.6552219, -0.0501720905, 0.34106794, -0.938698888, 2.98023224e-08, 0.939882517, 0.341498017, 0.998740673, 0.0171335936, -0.0471558571),
                CFrame.new(-141.604858, 123.425316 - 7, -93.1513672, -0.47030282, -0.17329967, 0.865322173, 7.4505806e-09, 0.980529368, 0.19637242, -0.882505119, 0.0923545063, -0.461145759),
                CFrame.new(-101.070961, 125.499886 - 7, -85.9679489, 0.778721273, 0.228905976, -0.58411926, -7.4505806e-09, 0.931060076, 0.364865959, 0.627370059, -0.284128904, 0.725036263),
                CFrame.new(-76.7874985, 127.238525 - 7, -269.427765, -0.518893003, -0.437407196, 0.734455824, 0, 0.859174013, 0.511683524, -0.854839444, 0.26550889, -0.445819378),
                CFrame.new(-114.507027, 127.024345 - 7, -272.627411, -0.927729845, -0.183740646, 0.324894279, 7.4505806e-09, 0.870442629, 0.492269903, -0.373251826, 0.45669356, -0.807535648),
                CFrame.new(-132.671936, 124.742798 - 7, -248.23793, -0.902290106, 0.199848741, -0.382012397, 7.4505806e-09, 0.886072636, 0.463546455, 0.431129903, 0.418253243, -0.799494505)
            }

            local teleportSpeed = 35

            local function createSafetyPlatform()
                local safetyPlatform = Instance.new("Part")
                safetyPlatform.Name = "SafetyPlatform"
                safetyPlatform.Size = Vector3.new(10, 1, 10)
                safetyPlatform.Anchored = true
                safetyPlatform.CanCollide = true
                safetyPlatform.Transparency = 1
                safetyPlatform.Parent = workspace
                return safetyPlatform
            end

            local function startTeleport()
                local safetyPlatform = createSafetyPlatform()
                
                for i, targetCFrame in ipairs(targets) do
                    local character = player.Character
                    if not character then break end
                    
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if not rootPart then break end
                    
                    local startPosition = rootPart.Position
                    local targetPosition = targetCFrame.Position
                    local distance = (targetPosition - startPosition).Magnitude
                    local duration = distance / teleportSpeed
                    local startTime = tick()
                    
                    safetyPlatform.Position = Vector3.new(startPosition.X, startPosition.Y - 3, startPosition.Z)
                    
                    local connection
                    connection = runService.Heartbeat:Connect(function()
                        if not character or not character.Parent then
                            if connection then connection:Disconnect() end
                            return
                        end
                        
                        rootPart = character:FindFirstChild("HumanoidRootPart")
                        if not rootPart then
                            if connection then connection:Disconnect() end
                            return
                        end
                        
                        local elapsed = tick() - startTime
                        local progress = math.min(elapsed / duration, 1)
                        
                        local currentPosition = startPosition:Lerp(targetPosition, progress)
                        
                        safetyPlatform.Position = Vector3.new(
                            currentPosition.X,
                            currentPosition.Y - 3,
                            currentPosition.Z
                        )
                        
                        rootPart.CFrame = CFrame.new(currentPosition) * rootPart.CFrame.Rotation
                        
                        if progress >= 1 then
                            if connection then connection:Disconnect() end
                            rootPart.CFrame = targetCFrame
                        end
                    end)
                    
                    while tick() - startTime < duration do
                        runService.Heartbeat:Wait()
                    end
                    
                    if connection then connection:Disconnect() end
                    
                    if i < #targets then
                        wait(0.5)
                    end
                end
                
                delay(3, function()
                    if safetyPlatform then safetyPlatform:Destroy() end
                end)
            end

            startTeleport()
        end
    })

    SCPTab:Button({
        Title = "旋转（危险程度：中）",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/964644"))()
        end
    })

    local teleportEnabled = false
    local teleportConnection = nil

    SCPTab:Toggle({
        Title = "飞雷神（危险程度：中-高）",
        Callback = function(state)
            teleportEnabled = state
            
            if teleportEnabled then
                local player = game:GetService("Players").LocalPlayer
                local runService = game:GetService("RunService")
                
                local function startUltraFastHorizontalTeleport()
                    local character = player.Character
                    if not character then return end
                    
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if not humanoidRootPart then return end
                    
                    local teleportDistance = 10
                    local directions = {
                        Vector3.new(1, 0, 0),
                        Vector3.new(-1, 0, 0),
                        Vector3.new(0, 0, 1),
                        Vector3.new(0, 0, -1),
                        Vector3.new(1, 0, 1),
                        Vector3.new(-1, 0, 1),
                        Vector3.new(1, 0, -1),
                        Vector3.new(-1, 0, -1),
                    }
                    
                    local currentDirectionIndex = 1
                    
                    teleportConnection = runService.RenderStepped:Connect(function()
                        if not teleportEnabled or not character or not character.Parent then
                            if teleportConnection then
                                teleportConnection:Disconnect()
                                teleportConnection = nil
                            end
                            return
                        end
                        
                        humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if not humanoidRootPart then return end
                        
                        local direction = directions[currentDirectionIndex]
                        local offset = direction.Unit * teleportDistance
                        
                        humanoidRootPart.CFrame = humanoidRootPart.CFrame + offset
                        
                        currentDirectionIndex = currentDirectionIndex + 1
                        if currentDirectionIndex > #directions then
                            currentDirectionIndex = 1
                        end
                    end)
                end
                
                startUltraFastHorizontalTeleport()
            else
                if teleportConnection then
                    teleportConnection:Disconnect()
                    teleportConnection = nil
                end
            end
        end,
        Default = false
    })
    
    SCPTab:Section({
        Title = "透视SCP",
        Desc = " "
    })
    
    local function ESP(model, Name, color)
        if not model or (not model:IsA("Model") and not model:IsA("BasePart")) then 
            return 
        end
        
        local head
        if model:IsA("BasePart") then
            head = model
        else
            head = model:FindFirstChild("Head") 
                or model:FindFirstChild("HumanoidRootPart") 
                or model:FindFirstChildWhichIsA("BasePart")
        end
        
        if not head then return end
        
        local billboardName = "ModelESP"
        local existingBillboard = head:FindFirstChild(billboardName)
        local billboard = existingBillboard or Instance.new("BillboardGui")
        local TitleLabel = billboard:FindFirstChild("TitleLabel") or Instance.new("TitleLabel")

        billboard.Name = billboardName
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        TitleLabel.Name = "TitleLabel"
        TitleLabel.Size = UDim2.new(1, 0, 1, 0)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.TitleStrokeTransparency = 0
        TitleLabel.TitleSize = 14
        TitleLabel.Font = Enum.Font.SourceSansBold
        TitleLabel.Title = (model.Name or "Part").."\n["..Name.."]"
        TitleLabel.TitleColor3 = color or Color3.new(1, 0, 0)
        TitleLabel.Parent = billboard

        if not existingBillboard then
            billboard.Parent = head
        end

        if model:IsA("Model") then
            for _, part in pairs(model:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.LocalTransparencyModifier = 0
                end
            end
        elseif model:IsA("BasePart") then
            model.LocalTransparencyModifier = 0
        end
    end

    SCPTab:Button({
        Title = "透视173",
        Callback = function()
            ESP(workspace.SCPs["SCP-173"].HumanoidRootPart, "SCP（173）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视096",
        Callback = function()
            ESP(workspace.SCPs["SCP-096"].Torso, "SCP（096）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视066",
        Callback = function()
            ESP(workspace.SCPs["SCP-066"].Body, "SCP（066）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视076",
        Callback = function()
            ESP(workspace.SCPs["SCP-079"].Monitor.Monitor, "SCP（079）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视131-2",
        Callback = function()
            ESP(workspace.SCPs["SCP-131"].Red.HumanoidRootPart, "SCP（131-2）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视131",
        Callback = function()
            ESP(workspace.SCPs["SCP-131"]:GetChildren()[3].HumanoidRootPart, "SCP（131）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视131-1",
        Callback = function()
            ESP(workspace.SCPs["SCP-131"].Yellow.HumanoidRootPart, "SCP（131）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视049",
        Callback = function()
            ESP(workspace.SCPs["SCP-049"].UpperTorso, "SCP（049）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视966",
        Callback = function()
            ESP(workspace.SCPs["SCP-966"].UpperTorso, "SCP（966）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视023",
        Callback = function()
            ESP(workspace.SCPs["SCP-023"].UpperTorso, "SCP（023）", Color3.new(0, 1, 0))
        end
    })

    SCPTab:Button({
        Title = "透视457",
        Callback = function()
            ESP(workspace.SCPs["SCP-457"].HumanoidRootPart, "SCP（457）", Color3.new(0, 1, 0))
        end
    })
    
    SCPTab:Section({
        Title = "娱乐",
        Desc = " "
    })
    
    SCPTab:Button({
        Title = "断头无头(娱乐功能无危险)",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
        end
    })
end

local function huoce()
    local huoceTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
huoceTab:Button({
    Title = "生成Expreso火车",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnTrenExpreso:FireServer()
        WindUI:Notify({
            Title = "成功",
            Content = "Expreso火车已生成",
            Icon = "check"
        })
    end
})

huoceTab:Button({
    Title = "生成列车",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnTrenAve:FireServer()
        WindUI:Notify({
            Title = "成功",
            Content = "列车已生成",
            Icon = "check"
        })
    end
})

huoceTab:Button({
    Title = "生成矿车",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnTrenPalanca:FireServer()
        WindUI:Notify({
            Title = "成功",
            Content = "火车已生成",
            Icon = "check"
        })
    end
})

huoceTab:Button({
    Title = "生成四节火车",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnTrenUnderground:FireServer()
        WindUI:Notify({
            Title = "成功",
            Content = "火车已生成",
            Icon = "check"
        })
    end
})

huoceTab:Button({
    Title = "生成货车",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnTrenContainer:FireServer()
        WindUI:Notify({
            Title = "成功", 
            Content = "货车已生成",
            Icon = "check"
        })
    end
})

huoceTab:Paragraph({
    Title = "火车生成说明",
    Desc = "点击上方按钮生成不同类型的火车。每个按钮对应一种特定的火车类型。"
})

huoceTab:Section({
    Title = "崩服",
    Desc = " "
    })
    
huoceTab:Button({
    Title = "无限循环生成",
    Callback = function()
        while true do
game:GetService("ReplicatedStorage").SpawnTrenUnderground:FireServer()
task.wait()
end
        WindUI:Notify({
            Title = "成功",
            Content = "土豆服务器熟了",
            Icon = "check"
        })
    end
})

huoceTab:Button({
    Title = "卡死（不推荐）",
    Callback = function()
        while true do game:GetService("ReplicatedStorage").SpawnTrenUnderground:FireServer() end
        WindUI:Notify({
            Title = "成功",
            Content = "已生成",
            Icon = "check"
        })
    end
})

huoceTab:Paragraph({
    Title = "说明",
    Desc = "弹出276网络错误或者288崩溃了。"
})
end

local function hiii()
    local hebeiTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
hebeiTab:Section({
    Title = "人物",
    Desc = " "
    })

hebeiTab:Slider("修改速度", 16, 16, 800, function(v)
    LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

hebeiTab:Textbox("人物穿移加速", function(val)
    if tonumber(val) then
        local tp_speed = tonumber(val)
        getgenv().tpwalking = true
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        
        if hum then
            RunService:UnbindFromRenderStep("TPWalk")
            RunService:BindToRenderStep("TPWalk", Enum.RenderPriority.Character.Value, function(delta)
                if getgenv().tpwalking and char and hum and hum.Parent and hum.MoveDirection.Magnitude > 0 then
                    char:TranslateBy(hum.MoveDirection * tp_speed * delta * 10)
                end
            end)
        end
    else
        print("Invalid input")
    end
end)

hebeiTab:Button("点我关闭", function()
    getgenv().tpwalking = false
    RunService:UnbindFromRenderStep("TPWalk")
end)

hebeiTab:Textbox("设置快速脚步（推荐2）", function(val)
    getgenv().Speed = val
end)

hebeiTab:Toggle("开启快速脚步(开/关)", false, function(bool)
    if bool == true then
        getgenv().sudu = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character.Humanoid and LocalPlayer.Character.Humanoid.Parent and LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Speed / 0.5)
            end
        end)
    elseif not bool and getgenv().sudu then
        getgenv().sudu:Disconnect()
        getgenv().sudu = nil
    end
end)

hebeiTab:Slider("修改血量", 100, 1, 100, function(v)
    LocalPlayer.Character.Humanoid.Health = v
end)

hebeiTab:Slider("修改跳跃", 50, 50, 500, function(v)
    LocalPlayer.Character.Humanoid.JumpPower = v
end)

hebeiTab:Slider("修改重力", 198, 0, 9999, function(v)
    Workspace.Gravity = v
end)

hebeiTab:Slider("相机焦距上限", 128, 128, 2000, function(v)
    LocalPlayer.CameraMaxZoomDistance = v
end)

hebeiTab:Toggle("持续回满血", false, function(bool)
    if bool then
        while bool do
            LocalPlayer.Character.Humanoid.Health = 10000
            wait(1e-13)
        end
    end
end)

hebeiTab:Section({
    Title = "工具",
    Desc = " "
    })

hebeiTab:Button("F3X", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

hebeiTab:Button("构建工具", function()
    local Hammer = Instance.new("HopperBin")
    Hammer.Name = "锤子"
    Hammer.BinType = 4
    Hammer.Parent = LocalPlayer.Backpack
    
    local Clone = Instance.new("HopperBin")
    Clone.Name = "复制"
    Clone.BinType = 3
    Clone.Parent = LocalPlayer.Backpack
    
    local Grab = Instance.new("HopperBin")
    Grab.Name = "抓取"
    Grab.BinType = 2
end)

hebeiTab:Section({
    Title = "飞行",
    Desc = " "
    })

hebeiTab:Button("飞行", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jeaenuuK"))()
end)
hebeiTab:Button("超人飞行", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
end)
hebeiTab:Button("飞车", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE%20FLY%20CAR.lua"))()
end)

hebeiTab:Section({
    Title = "互动",
    Desc = " "
    })
    
hebeiTab:Button("快速互动", function()
    ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = 0
    end)
end)

hebeiTab:Toggle("静近自动攻击(需要拿起武器)", false, function(bool)
    if bool then
        local cfg = getgenv().configs
        if cfg and cfg.connections then
            for _, c in pairs(cfg.connections) do c:Disconnect() end
            if cfg.Disable then cfg.Disable:Fire() cfg.Disable:Destroy() end
            table.clear(getgenv().configs)
        end
        
        local disableEvent = Instance.new("BindableEvent")
        getgenv().configs = {
            connections = {},
            Disable = disableEvent,
            Size = Vector3.new(10, 10, 10),
            DeathCheck = true
        }
        
        local run = true
        local params = OverlapParams.new()
        params.FilterType = Enum.RaycastFilterType.Include
        
        local function getChar(plr) return (plr or LocalPlayer).Character end
        local function isAlive(char) return char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 end
        
        local function getOthers(selfChar)
            local chars = {}
            for _, p in pairs(Players:GetPlayers()) do
                local c = getChar(p)
                if c and c ~= selfChar then table.insert(chars, c) end
            end
            return chars
        end
        
        table.insert(getgenv().configs.connections, disableEvent.Event:Connect(function() run = false end))
        
        while run do
            local myChar = getChar()
            if isAlive(myChar) then
                local tool = myChar:FindFirstChildWhichIsA("Tool")
                local handle = tool and (tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart"))
                local transmitter = tool and tool:FindFirstChildWhichIsA("TouchTransmitter", true)
                
                if transmitter then
                    local partWithTransmitter = transmitter.Parent
                    local others = getOthers(myChar)
                    params.FilterDescendantsInstances = others
                    
                    local hits = Workspace:GetPartBoundsInBox(partWithTransmitter.CFrame, partWithTransmitter.Size + getgenv().configs.Size, params)
                    
                    for _, hitPart in pairs(hits) do
                        local enemyChar = hitPart:FindFirstAncestorWhichIsA("Model")
                        if table.find(others, enemyChar) then
                            if not getgenv().configs.DeathCheck or isAlive(enemyChar) then
                                tool:Activate()
                                firetouchinterest(partWithTransmitter, hitPart, 1)
                                firetouchinterest(partWithTransmitter, hitPart, 0)
                            end
                        end
                    end
                end
            end
            RunService.Heartbeat:Wait()
        end
    else
        if getgenv().configs and getgenv().configs.Disable then
            getgenv().configs.Disable:Fire()
            getgenv().configs.Disable:Destroy()
        end
        if getgenv().configs then
            for _, c in pairs(getgenv().configs.connections) do c:Disconnect() end
            table.clear(getgenv().configs.connections)
        end
    end
end)

hebeiTab:Button("自动互动", function(bool)
    if bool then
        getgenv().autoInteract = true
        while getgenv().autoInteract do
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    fireproximityprompt(v)
                end
            end
            task.wait(0.25)
        end
    else
        getgenv().autoInteract = false
    end
end)

hebeiTab:Section({
    Title = "通用",
    Desc = " "
    })

hebeiTab:Button("偷别人物品栏道具", function()
    for _, plr in pairs(Players:GetChildren()) do
        if plr then
            for _, item in pairs(plr.Backpack:GetChildren()) do
                item.Parent = LocalPlayer.Backpack
            end
        end
    end
end)

hebeiTab:Button("穿墙", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

hebeiTab:Button("键盘脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

hebeiTab:Button("踏空行走", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
end)

hebeiTab:Button("自杀", function()
    LocalPlayer.Character.Humanoid.Health = 0
end)

hebeiTab:Toggle("无敌", false, function(bool)
    if bool then
        local cam = Workspace.CurrentCamera
        local cf = cam.CFrame
        local char = LocalPlayer.Character
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        
        local newHum = hum:Clone()
        newHum.Parent = char
        newHum:SetStateEnabled(Enum.HumanoidStateType.Health, false)
        newHum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        newHum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        newHum.BreakJointsOnDeath = true
        hum:Destroy()
        LocalPlayer.Character = char
        cam.CameraSubject = newHum
        cam.CFrame = cf
        newHum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        
        local animate = char:FindFirstChild("Animate")
        if animate then
            animate.Disabled = true
            wait()
            animate.Disabled = false
        end
        newHum.Health = newHum.MaxHealth
    else
        LocalPlayer.Character.Humanoid.Health = 100
    end
end)

hebeiTab:Toggle("上不模式", false, function(bool)
    if bool then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then root:Clone().Parent = char end
    else
        LocalPlayer.Character.Head:Destroy()
    end
end)

hebeiTab:Button("IY指令", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end)

hebeiTab:Section({
    Title = "防踢",
    Desc = " "
    })

hebeiTab:Button("防踢出增强版", function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then
            local args = {...}
            print("拦截到踢出尝试，原因: " .. tostring(args[1]))
            StarterGui:SetCore("SendNotification", {Title = "Anti-Kick", Text = "成功拦截踢出", Duration = 2})
            return nil
        end
        return oldNamecall(self, ...)
    end)
end)

huoceTab:Section({
    Title = "通用2",
    Desc = " "
    })

hebeiTab:Button("防挂机", function()
    wait(2)
    print("Anti Afk On")
    LocalPlayer.Idled:connect(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end)
    StarterGui:SetCore("SendNotification", {Title = "大寒脚本提示", Text = "防挂机已开启", Duration = 2})
end)

hebeiTab:Button("离开游戏", function() game:Shutdown() end)

hebeiTab:Button("点击传送", function()
    local mouse = LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "点击传送的位置"
    tool.Activated:connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
    end)
    tool.Parent = LocalPlayer.Backpack
end)

hebeiTab:Toggle("穿墙", false, function(bool)
    getgenv().Clipon = bool
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().Clipon then
            for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

hebeiTab:Button("无限跳跃", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

hebeiTab:Button("吸人", function()
    loadstring(game:HttpGet("https://shz.al/~HHAKS"))()
end)

hebeiTab:Textbox("修改攻击体积", function(size)
    _G.HeadSize = size
    _G.Disabled = true
    RunService.RenderStepped:connect(function()
        if _G.Disabled then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    pcall(function()
                        local root = p.Character.HumanoidRootPart
                        root.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        root.Transparency = 0.7
                        root.BrickColor = BrickColor.new("Really black")
                        root.Material = "Neon"
                        root.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

huoceTab:Section({
    Title = "脚本",
    Desc = " "
    })

hebeiTab:Button("死亡笔记", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)

hebeiTab:Button("走路割人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
end)

hebeiTab:Button("控制台", function()
    StarterGui:SetCore("DevConsoleVisible", true)
end)

hebeiTab:Button("钱", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))()
end)

hebeiTab:Button("隐身道具", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
end)

hebeiTab:Toggle("人物不可见状态(隐身)", false, function(bool)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = bool and 1 or 0
            v.CanCollide = not bool
        elseif v:IsA("Accessory") then
            v.Handle.Transparency = bool and 1 or 0
        end
    end
end)

hebeiTab:Button("甩飞", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/%E5%8F%B6%E8%84%9A%E6%9C%AC%E7%94%A9%E9%A3%9E%E6%BA%90%E7%A0%81.lua"))()
end)

hebeiTab:Section({
    Title = "自瞄和追踪",
    Desc = " "
    })

hebeiTab:Button("自瞄", function()
    local Fov = 100
    local Smoothness = 10
    local Distance = 5
    local FovCircle = Drawing.new("Circle")
    FovCircle.Visible = true
    FovCircle.Thickness = 2
    FovCircle.Color = Color3.fromRGB(0, 255, 0)
    FovCircle.Filled = false
    FovCircle.Radius = Fov
    FovCircle.Position = Camera.ViewportSize / 2
    
    local settingsGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
    
    RunService.RenderStepped:Connect(function()
        FovCircle.Position = Camera.ViewportSize / 2
        FovCircle.Radius = Fov
        
        local closest = nil
        local minDist = math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local screenPos, onScreen = Camera:WorldToViewportPoint(p.Character.Head.Position)
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - FovCircle.Position).Magnitude
                if onScreen and dist < Fov and dist < minDist then
                    closest = p
                    minDist = dist
                end
            end
        end
        
        if closest then
            local aimPos = closest.Character.Head.Position
            if closest.Character.HumanoidRootPart.Velocity.Magnitude > 0.1 then
                aimPos = aimPos + closest.Character.Head.CFrame.LookVector * Distance
            end
            local currentCF = Camera.CFrame
            Camera.CFrame = currentCF:Lerp(CFrame.new(currentCF.Position, aimPos), 1/Smoothness)
        end
    end)
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Delete then
            FovCircle:Remove()
        end
    end)
end)

hebeiTab:Textbox("自定义范围", function(size)
    _G.HeadSize = size
    _G.Disabled = true
    RunService.RenderStepped:connect(function()
        if _G.Disabled then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    pcall(function()
                        p.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        p.Character.HumanoidRootPart.Transparency = 0.7
                        p.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        p.Character.HumanoidRootPart.Material = "Neon"
                        p.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

hebeiTab:Button("晚通范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))() end)
hebeiTab:Button("中等范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))() end)
hebeiTab:Button("超大范围", function() loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))() end)

hebeiTab:Button("子弹追踪", function()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FindPartOnRayWithIgnoreList" then
            local closest = nil
            local minDist = math.huge
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        closest = p
                        minDist = dist
                    end
                end
            end
            
            if closest and closest.Character then
                args[1] = Ray.new(Camera.CFrame.Position, (closest.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - closest.Character.Head.Position).Magnitude)
            end
        end
        return oldNamecall(self, unpack(args))
    end)
end)

hebeiTab:Section({
    Title = "光影",
    Desc = " "
    })

hebeiTab:Button("光影", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end)
hebeiTab:Button("画质光影", function() loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))() end)
hebeiTab:Button("RTX高优", function() loadstring(game:HttpGet("https://pastebin.com/raw/Bkf0BJb3"))() end)
hebeiTab:Button("RTX光追菜单", function() loadstring(game:HttpGet("https://pastebin.com/raw/MuqQc4FB"))() end)

hebeiTab:Section({
    Title = "FPS",
    Desc = " "
    })

hebeiTab:Button("显示FPS", function()
    local fpsGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
    local fpsLabel = Instance.new("TextLabel", fpsGui)
    fpsLabel.Text = "FPS: 0"
    fpsLabel.Size = UDim2.new(0, 100, 0, 50)
    fpsLabel.TextColor3 = Color3.new(1, 1, 1)
    RunService.RenderStepped:Connect(function()
        fpsLabel.Text = "FPS: " .. math.floor(1 / RunService.RenderStepped:Wait())
    end)
end)
hebeiTab:Slider("修改FPS", 300, 300, 999, function(v) setfpscap(v) end)

hebeiTab:Toggle("非法移动(假身)", false, function(bool)
    local char = LocalPlayer.Character
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") then part.Anchored = bool end
    end
end)
hebeiTab:Button("坐下", function() LocalPlayer.Character.Humanoid.Sit = true end)
hebeiTab:Button("人物旋转上天", function()
    local hum = LocalPlayer.Character.Humanoid
    local animId = (hum.RigType == Enum.HumanoidRigType.R6) and "rbxassetid://27432686" or "rbxassetid://507776043"
    local anim = Instance.new("Animation")
    anim.AnimationId = animId
    local track = hum:LoadAnimation(anim)
    track:Play(); track:AdjustSpeed(0)
    
    local bg = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
    bg.AngularVelocity = Vector3.new(0, 40, 0)
    bg.MaxTorque = Vector3.new(0, math.huge, 0)
    
    spawn(function()
        while hum.Health > 0 do
            wait(0.1)
            hum.HipHeight = hum.HipHeight + 1
        end
    end)
end)

hebeiTab:Textbox("骂人无视规", function(text)
    TextChatService:DisplayBubble(LocalPlayer.Character.Head, text)
end)

hebeiTab:Toggle("声音噪音", false, function(bool)
    getgenv().spamSound = bool
    if bool then
        while getgenv().spamSound do
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then v:Play() end
            end
            task.wait()
        end
    end
end)

hebeiTab:Toggle("七彩构建", false, function(bool)
    getgenv().RainbowBuild = bool
    if bool then
        spawn(function()
            local parts = {}
            for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("BasePart") then table.insert(parts, v) end end
            while getgenv().RainbowBuild do
                for _, p in pairs(parts) do
                    p.Color = Color3.fromHSV(math.random(), 1, 1)
                end
                wait(0.025)
            end
        end)
    end
end)

hebeiTab:Toggle("亮度1", false, function(bool) Lighting.Ambient = bool and Color3.new(1,1,1) or Color3.new(0,0,0) end)

hebeiTab:Section({
    Title = "音乐",
    Desc = " "
    })

hebeiTab:Button("防空警报", function()
    local sound = Instance.new("Sound", Workspace)
    sound.SoundId = "rbxassetid://792323017"
    sound.PlayOnRemove = true
    sound:Play()
end)

hebeiTab:Section({
    Title = "时间",
    Desc = " "
    })

hebeiTab:Button("午夜12点", function() Lighting.TimeOfDay = "00:00:00" end)
hebeiTab:Button("中午12点", function() Lighting.TimeOfDay = "12:00:00" end)

hebeiTab:Section({
    Title = "传送服务器",
    Desc = " "
    })

hebeiTab:Button("断手vs触手", function() TeleportService:Teleport(12355337193, LocalPlayer) end)
hebeiTab:Button("一路向西", function() TeleportService:Teleport(2474168535, LocalPlayer) end)
hebeiTab:Button("力量传奇", function() TeleportService:Teleport(3623096087, LocalPlayer) end)
hebeiTab:Button("fisch(鱼)", function() TeleportService:Teleport(16732694052, LocalPlayer) end)

hebeiTab:Section({
    Title = "ESP",
    Desc = " "
    })

hebeiTab:Button("通用ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
end)

hebeiTab:Toggle("ESP 显示名字", false, function(bool)
    getgenv().NameESP = bool
    if bool then
        local function addEsp(p)
            if p.Character and p.Character:FindFirstChild("Head") and not p.Character.Head:FindFirstChild("NameTag") then
                local bg = Instance.new("BillboardGui", p.Character.Head)
                bg.Name = "NameTag"
                bg.Size = UDim2.new(0, 100, 0, 50)
                bg.Adornee = p.Character.Head
                bg.AlwaysOnTop = true
                
                local lbl = Instance.new("TextLabel", bg)
                lbl.Text = p.Name
                lbl.TextColor3 = Color3.new(1,1,1)
                lbl.BackgroundTransparency = 1
                lbl.Size = UDim2.new(1,0,1,0)
            end
        end
        
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then addEsp(p) end end
        Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function() wait(1) if getgenv().NameESP then addEsp(p) end end) end)
    else
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("NameTag") then
                p.Character.Head.NameTag:Destroy()
            end
        end
    end
end)

hebeiTab:Toggle("Circle ESP (圆圈透视)", false, function(bool)
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character then
            if bool then
                local hl = Instance.new("Highlight", v.Character)
                local bg = Instance.new("BillboardGui", v.Character)
                bg.AlwaysOnTop = true
                bg.Size = UDim2.new(0,100,0,100)
                local img = Instance.new("ImageLabel", bg)
                img.Image = "rbxassetid://2200552246"
                img.BackgroundTransparency = 1
                img.Size = UDim2.new(0,50,0,50)
            else
                if v.Character:FindFirstChildOfClass("Highlight") then v.Character:FindFirstChildOfClass("Highlight"):Destroy() end
                if v.Character:FindFirstChildOfClass("BillboardGui") then v.Character:FindFirstChildOfClass("BillboardGui"):Destroy() end
            end
        end
    end
end)

hebeiTab:Button("查看房间中的所有玩家(Drawing)", function()
    if not Drawing then return warn("不支持 Drawing") end
    RunService.RenderStepped:Connect(function()
        for _, p in pairs(Players:GetPlayers()) do
        end
    end)
end)

hebeiTab:Section({
    Title = "旋转",
    Desc = " "
    })

hebeiTab:Textbox("旋转速度", function(val)
    getgenv().spinSpeed = tonumber(val) or 100
end)

hebeiTab:Toggle("开启/关闭旋转", false, function(bool)
    local char = LocalPlayer.Character
    local root = char:WaitForChild("HumanoidRootPart")
    char.Humanoid.AutoRotate = not bool
    
    if bool then
        local av = Instance.new("AngularVelocity")
        av.Name = "Spinbot"
        av.Attachment0 = root:WaitForChild("RootAttachment")
        av.MaxTorque = math.huge
        av.AngularVelocity = Vector3.new(0, getgenv().spinSpeed or 100, 0)
        av.Parent = root
    else
        if root:FindFirstChild("Spinbot") then root.Spinbot:Destroy() end
    end
end)

huoceTab:Section({
    Title = "挂机",
    Desc = " "
    })

hebeiTab:Toggle("卡车挂机", false, function(bool)
    getgenv().autoTruck = bool
    spawn(function()
        while getgenv().autoTruck do
            wait(0.3)
            pcall(function()
                local rs = ReplicatedStorage
                local remotes = rs.Packages.Shared.Network.RemoteFunctions
                
                if not LocalPlayer.Character.Humanoid.SeatPart then
                    rs.Feature_RemoteEvent.TeamSwitch:FireServer("Trucker")
                    remotes.ClientRequestCoalTrucks:InvokeServer()
                    remotes.ClientRequestCoalJob:InvokeServer(Workspace.TruckingJob.Coal.routeA, "2012 Shacman M3000 4X2")
                    local carName = LocalPlayer.Name .. "'s Car"
                    local car = Workspace.SpawnedCars:FindFirstChild(carName)
                    if car then
                        local seat = car:FindFirstChild("DriveSeat") or car:FindFirstChild("Seat")
                        if seat then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = seat.CFrame + Vector3.new(0,1,0)
                            seat:Sit(LocalPlayer.Character.Humanoid)
                        end
                    end
                else
                    local prompt = LocalPlayer.PlayerGui.PackagesUI:FindFirstChildOfClass("BillboardGui")
                    if prompt then
                        local car = LocalPlayer.Character.Humanoid.SeatPart.Parent
                        car:PivotTo(prompt.Adornee.CFrame * CFrame.new(0, 10, -20))
                        remotes.ClientCoalRequester:InvokeServer("LoadCoal")
                        remotes.ClientCoalRequester:InvokeServer("UnloadCoal")
                    end
                end
            end)
        end
    end)
end)

hebeiTab:Toggle("蜜雪冰城挂机", false, function(bool)
    _G.MixueAuto = bool
    if bool then
        ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Mixue Ice Cream")
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6970, 11, 1757)
        while _G.MixueAuto do
            for _, v in pairs(Workspace.MixueJob:GetDescendants()) do
                if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
            end
            task.wait(0.25)
        end
    end
end)

hebeiTab:Toggle("茶百道挂机", false, function(bool)
    _G.TeaAuto = bool
    if bool then
        ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Teawen Barista")
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5855, 12, 3666)
        while _G.TeaAuto do
            for _, v in pairs(Workspace.BaristaJob:GetDescendants()) do
                if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
            end
            task.wait(0.25)
        end
    end
end)

hebeiTab:Toggle("送货挂机(会自动穿墙)", false, function(bool)
    _G.DeliveryAuto = bool
    if bool then
        ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Delivery Driver")
        
        local function deliver(point)
            local root = LocalPlayer.Character.HumanoidRootPart
            local bp = Instance.new("BodyPosition", root)
            bp.Position = point.Position
            bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            task.wait(8)
            bp:Destroy()
        end
        
        spawn(function()
            while _G.DeliveryAuto do
                fireclickdetector(Workspace.DeliverySys.Misc["Package Pile"].ClickDetector)
                wait(1)
                for _, pt in pairs(Workspace.DeliverySys.DeliveryPoints:GetChildren()) do
                    if pt:IsA("BasePart") and pt.Transparency > 0.7 then
                        deliver(pt.CFrame)
                        break
                    end
                end
            end
        end)
    end
end)

hebeiTab:Toggle("出租车挂机", false, function(bool)
    _G.TaxiAuto = bool
    if bool then
        ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Taxi Driver")
        while _G.TaxiAuto do
            local sys = Workspace:FindFirstChild("TaxiSys")
            if sys then
                for _, pt in pairs(sys.PickupPoints:GetChildren()) do
                    if pt:IsA("BasePart") and pt.Transparency > 0.7 then
                        local seat = LocalPlayer.Character.Humanoid.SeatPart
                        if seat then
                            local car = seat.Parent
                            car:PivotTo(pt.CFrame)
                            wait(4)
                        end
                    end
                end
                for _, pt in pairs(sys.DropOffPoints:GetChildren()) do
                    if pt:IsA("BasePart") and pt.Transparency > 0.7 then
                        local seat = LocalPlayer.Character.Humanoid.SeatPart
                        if seat then
                            local car = seat.Parent
                            car:PivotTo(pt.CFrame)
                            wait(6)
                        end
                    end
                end
            end
            wait(1)
        end
    end
end)

huoceTab:Section({
    Title = "传送",
    Desc = " "
    })

hebeiTab:Button("传送至警局", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5513, 8, 4964) end)
hebeiTab:Button("传送至出生点", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3338, 10, 3741) end)
hebeiTab:Button("传送至医院", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5471, 14, 4259) end)
end

local function toji()
    local tojiTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
tojiTab:Section({
    Title = "绕过反作弊",
    Desc = " "
    })

tojiTab:Toggle({
    Title = "绕过CHAIN反作弊系统",
    Default = false,
    Callback = function(state)
        BypassChainAC = state
        if state then
            WindUI:Notify({Title = "✅成功开启",Content = "已绕过CHAIN所有反作弊检测",Duration = 1.5})
        else
            WindUI:Notify({Title = "❌已关闭",Content = "反作弊绕过功能关闭",Duration = 1})
        end
    end
})

tojiTab:Section({
    Title = "主要",
    Desc = " "
    })

tojiTab:Slider({
    Title = "移动速度",
    Value = {Min = 16, Max = 200, Default = 16},
    Increment = 1,
    Callback = function(Value)
        WalkSpeed_Value = Value
        UpdateMoveSpeed()
    end
})

tojiTab:Toggle({
    Title = "移动速度开关",
    Default = false,
    Callback = function(state)
        SetMoveSpeed(state)
        if state then
            WindUI:Notify({Title = "✅移动速度开启", Content = "移动速度已启用", Duration = 1})
        else
            WindUI:Notify({Title = "❌移动速度关闭", Content = "移动速度已禁用", Duration = 1})
        end
    end
})

tojiTab:Toggle({
    Title = "穿墙功能",
    Default = false,
    Callback = function(Value) SetNoclip(Value) end
})

tojiTab:Toggle({
    Title = "夜视效果",
    Default = false,
    Callback = function(state)
        SetNightVision(state)
        if state then
            WindUI:Notify({Title = "✅夜视开启", Content = "夜视效果已启用", Duration = 1})
        else
            WindUI:Notify({Title = "❌夜视关闭", Content = "夜视效果已禁用", Duration = 1})
        end
    end
})

tojiTab:Toggle({
    Title = "透视怪物",
    Default = false,
    Callback = function(state) SetMonsterESP(state) end
})

tojiTab:Toggle({
    Title = "无限体力",
    Default = false,
    Callback = function(state)
        infiniteStaminaEnabled = state
        local player = Players.LocalPlayer
        if player then
            if state then
                if player.Character then setupStaminaInfinite(player.Character) end
                player.CharacterAdded:Connect(setupStaminaInfinite)
            else
                if staminaConnection then staminaConnection:Disconnect() staminaConnection = nil end
            end
        end
    end
})

tojiTab:Toggle({
    Title = "无限战斗体力",
    Default = false,
    Callback = function(state)
        infiniteCombatStaminaEnabled = state
        local player = Players.LocalPlayer
        if player then
            if state then
                if player.Character then setupCombatStaminaInfinite(player.Character) end
                player.CharacterAdded:Connect(setupCombatStaminaInfinite)
            else
                if combatStaminaConnection then combatStaminaConnection:Disconnect() combatStaminaConnection = nil end
            end
        end
    end
})
end

local function tojis()
    local tojisTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
local tojisTab = Window:Tab({
    Title = "绕过反作弊",
    Icon = "shield",
    Locked = false,
})

tojisTab:Toggle({
    Title = "终极拦截防护",
    Default = false,
    Callback = function(state)
        isAntiKickEnabled = state
        if state then
            LocalPlayer.Kick = function(...)
                WindUI:Notify({Title = "拦截成功", Content = "Kick指令已拦截", Duration = 3, Icon = "warning"})
            end
            LocalPlayer.Remove = function(...)
                WindUI:Notify({Title = "拦截成功", Content = "Remove指令已拦截", Duration = 3, Icon = "warning"})
            end
            local function hookRemote(obj)
                if blockedRemotes[obj] then return end
                blockedRemotes[obj] = true
                if obj:IsA("RemoteEvent") then
                    local originalFire = obj.FireServer
                    obj.FireServer = function(self, ...)
                        local args = table.pack(...)
                        local argsStr = table.concat(args, ", "):lower()
                        if string.find(argsStr, "kick") or string.find(argsStr, "ban") or string.find(argsStr, "remove") or string.find(argsStr, "destroy") or string.find(argsStr, "kickplayer") or string.find(argsStr, "banplayer") then
                            WindUI:Notify({Title = "远程拦截", Content = "可疑事件："..obj.Name, Duration = 2, Icon = "no"})
                            return
                        end
                        return originalFire(self, ...)
                    end
                elseif obj:IsA("RemoteFunction") then
                    local originalInvoke = obj.InvokeServer
                    obj.InvokeServer = function(self, ...)
                        local args = table.pack(...)
                        local argsStr = table.concat(args, ", "):lower()
                        if string.find(argsStr, "kick") or string.find(argsStr, "ban") or string.find(argsStr, "remove") or string.find(argsStr, "destroy") or string.find(argsStr, "kickplayer") or string.find(argsStr, "banplayer") then
                            WindUI:Notify({Title = "远程拦截", Content = "可疑函数："..obj.Name, Duration = 2, Icon = "no"})
                            return nil
                        end
                        return originalInvoke(self, ...)
                    end
                end
            end
            for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                    hookRemote(obj)
                end
            end
            protectConnections[#protectConnections+1] = ReplicatedStorage.DescendantAdded:Connect(function(obj)
                if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                    hookRemote(obj)
                end
            end)
            protectConnections[#protectConnections+1] = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Kick ~= originalKick then LocalPlayer.Kick = LocalPlayer.Kick end
                if LocalPlayer.Remove ~= originalRemove then LocalPlayer.Remove = LocalPlayer.Remove end
            end)
            WindUI:Notify({Title = "防护开启", Content = "终极拦截已激活", Duration = 2, Icon = "check"})
        else
            LocalPlayer.Kick = originalKick
            LocalPlayer.Remove = originalRemove
            for obj in pairs(blockedRemotes) do
                if obj:IsA("RemoteEvent") then obj.FireServer = nil end
                if obj:IsA("RemoteFunction") then obj.InvokeServer = nil end
            end
            blockedRemotes = {}
            for _, conn in ipairs(protectConnections) do
                conn:Disconnect()
            end
            protectConnections = {}
            WindUI:Notify({Title = "防护关闭", Content = "终极拦截已禁用", Duration = 2, Icon = "x"})
        end
    end
})

tojisTab:Button({
    Title = "强制重置防护",
    Icon = "refresh",
    Variant = "Secondary",
    Callback = function()
        LocalPlayer.Kick = originalKick
        LocalPlayer.Remove = originalRemove
        for obj in pairs(blockedRemotes) do
            if obj:IsA("RemoteEvent") then obj.FireServer = nil end
            if obj:IsA("RemoteFunction") then obj.InvokeServer = nil end
        end
        blockedRemotes = {}
        for _, conn in ipairs(protectConnections) do
            conn:Disconnect()
        end
        protectConnections = {}
        isAntiKickEnabled = false
        for _, child in ipairs(tojisTab.Frame:GetChildren()) do
            if child:FindFirstChild("Toggle") then
                child.Toggle.Value = false
            end
        end
        WindUI:Notify({Title = "重置完成", Content = "防护模块已恢复", Duration = 2, Icon = "refresh"})
    end
})

tojisTab:Paragraph({
    Title = "防护说明",
    Desc = "拦截Kick/Remove/封禁指令|检测可疑远程请求|实时防护防篡改|动态监控新增远程对象",
    Color = "Blue"
})

local tojisTab = Window:Tab({
    Title = "主要",
    Icon = "shield",
    Locked = false,
})

    local HitATMAura = false
    
    tojisTab:Toggle({
        Title = "摧毁ATM光环",
     
        Default = HitATMAura,
        Callback = function(Value)
            HitATMAura = Value
            if Value then
                local devv = require(game:GetService("ReplicatedStorage").Devv)
                local Get = devv.GetModule("Network")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                
                local gizmoColors = {
                    "White", "Green", "Blue", "Purple", "Orange", "Red", "Yellow"
                }
                
                local isAttacking = false
                local cooldown = false
                
                local function attackATM(gizmo)
                    if not gizmo or not gizmo:FindFirstChild("Metal") then
                        return false
                    end
                    local metalPart = gizmo.Metal
                    local guid = gizmo:GetAttribute("objectId")
                    if not guid then
                        return false
                    end
                    
                    Get.FireServer("registerMeleeHits", {{
                        normal = Vector3.new(0, 0, 0),
                        direction = Vector3.new(0, 0, 0),
                        source = "Melee",
                        id = guid,
                        material = Enum.Material.Metal,
                        position = metalPart.Position,
                        gizmoType = "ATM",
                        processedPlayerId = localPlayer.UserId,
                        hit = metalPart,
                        speed = 50,
                        collisionPoint = metalPart.Position,
                        hitName = "Metal",
                        hitType = "gizmo"
                    }})
                    return true
                end
                
                local function isATMAlive(gizmo)
                    if not gizmo or not gizmo.Parent then
                        return false
                    end
                    if not gizmo:FindFirstChild("Metal") then
                        return false
                    end
                    return true
                end
                
                local function findAllATMs()
                    local allATMs = {}
                    for _, color in ipairs(gizmoColors) do
                        local colorFolder = Workspace.Local.Gizmos:FindFirstChild(color)
                        if colorFolder then
                            local atm = colorFolder:FindFirstChild("ATM")
                            if atm then
                                table.insert(allATMs, atm)
                            end
                        end
                    end
                    return allATMs
                end
                
                local function attackLoop()
                    while HitATMAura do
                        if cooldown then
                            task.wait(0.1)
                            continue
                        end
                        
                        local allATMs = findAllATMs()
                        
                        if #allATMs == 0 then
                            task.wait(1)
                            continue
                        end
                        
                        for _, atm in ipairs(allATMs) do
                            if not HitATMAura then break end
                            
                            local attackCount = 0
                            
                            while HitATMAura and isATMAlive(atm) and attackCount < 50 do
                                attackATM(atm)
                                attackCount += 1
                                task.wait(0.05)
                            end
                            
                            if HitATMAura then
                                task.wait(0.5)
                            end
                        end
                        
                        task.wait(0.1)
                    end
                end
                
                local function onCharacterDied()
                    if HitATMAura then
                        cooldown = true
                        task.wait(3)
                        cooldown = false
                    end
                end
                
                local function setupCharacterListeners()
                    if character:FindFirstChild("Humanoid") then
                        character.Humanoid.Died:Connect(onCharacterDied)
                    end
                    
                    localPlayer.CharacterAdded:Connect(function(newChar)
                        character = newChar
                        humanoid = newChar:WaitForChild("Humanoid")
                        humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
                        humanoid.Died:Connect(onCharacterDied)
                    end)
                end
                
                setupCharacterListeners()
                task.spawn(attackLoop)
            end
        end
    })
    
    local AutoATM = false
    
    tojisTab:Toggle({
        Title = "自动ATM",

        Default = AutoATM,
        Callback = function(Value)
            AutoATM = Value
            if Value then
                local TimeElapsedATM = 0
                local TimeoutThresholdATM = 30
                local RootPart = (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
                local GizmoFolder = Workspace.Local.Gizmos.White
                
                local ATMPatrolPoints = {
                    Vector3.new(-1137, 78, -1953),
                    Vector3.new(-44, 63, -2083),
                    Vector3.new(194, 60, -2884),
                    Vector3.new(-412, 106, -1301),
                    Vector3.new(-377, 410, -741),
                    Vector3.new(-985, 380, -1145),
                    Vector3.new(-854, 406, -1505)
                }
                
                local function GetBasePart(instance)
                    if instance:IsA("BasePart") then
                        return instance
                    end
                    for _, descendant in ipairs(instance:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            return descendant
                        end
                    end
                end
                
                local function IsValidATMTarget(instance)
                    local typeAttr = instance:GetAttribute("gizmoType")
                    return typeAttr == "ATM"
                end
                
                local function FindClosestATMTarget()
                    local minDistance = math.huge
                    local closestPart = nil
                    for _, item in ipairs(GizmoFolder:GetChildren()) do
                        if IsValidATMTarget(item) then
                            local part = GetBasePart(item)
                            if part then
                                local dist = (RootPart.Position - part.Position).Magnitude
                                if dist < minDistance then
                                    closestPart = part
                                    minDistance = dist
                                end
                            end
                        end
                    end
                    return closestPart
                end
                
                local function TeleportTo(target)
                    if typeof(target) ~= "Instance" then
                        if typeof(target) == "Vector3" then
                            RootPart.CFrame = CFrame.new(target)
                        end
                    else
                        RootPart.CFrame = target.CFrame * CFrame.new(0, 5, 0)
                    end
                end
                
                local function SpamInteract(duration)
                    local start = tick()
                    while tick() - start < duration do
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        task.wait(0.05)
                    end
                end
                
                local function ProcessATMCollection(targetPart)
                    local start = tick()
                    local maxWait = 3
                    while tick() - start < maxWait and (targetPart.Parent and not targetPart:GetAttribute("Collected")) do
                        task.wait(0.1)
                    end
                    SpamInteract(1.5)
                end
                
                task.spawn(function()
                    while AutoATM do
                        local target = FindClosestATMTarget()
                        if target then
                            TeleportTo(target)
                            task.wait(0.3)
                            SpamInteract(1.5)
                            ProcessATMCollection(target)
                            TimeElapsedATM = 0
                        else
                            TimeElapsedATM = TimeElapsedATM + 0.7
                            TeleportTo(ATMPatrolPoints[math.random(1, #ATMPatrolPoints)])
                            if TimeoutThresholdATM <= TimeElapsedATM then
                                TimeElapsedATM = 0
                            end
                        end
                        task.wait(0.7)
                    end
                end)
            end
        end
    })

local tojisTab = Window:Tab({
    Title = "传送",
    Icon = "paper-plane",
    Locked = false,
})

local function teleportTo(posName, x, y, z)
    return function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
            WindUI:Notify({Title = "传送成功", Content = "已传送到「"..posName.."」", Duration = 2, Icon = "check"})
        else
            WindUI:Notify({Title = "传送失败", Content = "角色未加载完成", Duration = 2, Icon = "x"})
        end
    end
end

local function createTeleportMarkers()
    if Workspace:FindFirstChild("GunMarkers") then
        Workspace.GunMarkers:Destroy()
    end
    local markerFolder = Instance.new("Folder")
    markerFolder.Name = "GunMarkers"
    markerFolder.Parent = Workspace

    local function spawnMarker(name, x, y, z, color)
        local marker = Instance.new("Part")
        marker.Name = name.."_Marker"
        marker.Size = Vector3.new(2, 5, 2)
        marker.Position = Vector3.new(x, y + 3, z)
        marker.BrickColor = BrickColor.new(color)
        marker.CanCollide = false
        marker.Transparency = 0.3
        marker.Anchored = true
        marker.Parent = markerFolder

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "MarkerLabel"
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.AlwaysOnTop = true
        billboard.Parent = marker

        local label = Instance.new("TextLabel")
        label.Text = name
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1,1,1)
        label.TextStrokeTransparency = 0
        label.TextScaled = true
        label.Parent = billboard
    end

    for _, gun in ipairs(gunLocations) do
        local colorMap = {
            ["M4A1"] = "Bright red",
            ["RPG"] = "Bright blue",
            ["Uzi"] = "Bright green",
            ["AWM狙击枪"] = "Bright purple",
            ["Ump 45"] = "Orange",
            ["M1014"] = "Yellow"
        }
        spawnMarker(gun.Name, gun.X, gun.Y, gun.Z, colorMap[gun.Name] or "White")
    end

    WindUI:Notify({Title = "标记完成", Content = "已生成所有枪械坐标标记", Duration = 2, Icon = "map"})
end

for _, building in ipairs(robableBuildings) do
    tojisTab:Button({Title = building.Name, Callback = teleportTo(building.Name, building.X, building.Y, building.Z)})
end

for _, gun in ipairs(gunLocations) do
    tojisTab:Button({Title = gun.Name, Callback = teleportTo(gun.Name, gun.X, gun.Y, gun.Z)})
end

for _, loc in ipairs(locationPoints) do
    tojisTab:Button({Title = loc.Name, Callback = teleportTo(loc.Name, loc.X, loc.Y, loc.Z)})
end

tojisTab:Button({
    Title = "批量标记所有枪械坐标",
    Icon = "map-marker",
    Variant = "Primary",
    Callback = createTeleportMarkers
})

local tojisTab = Window:Tab({
    Title = "ESP",
    Icon = "eye",
    Locked = false,
})

local function getESPFolder()
    if not espFolder or not espFolder.Parent then
        espFolder = Instance.new("Folder")
        espFolder.Name = "ESPAdornments"
        espFolder.Parent = Workspace
    end
    return espFolder
end

local function clearESP(typeName)
    local folder = getESPFolder()
    for _, adornment in ipairs(folder:GetChildren()) do
        if adornment.Name == typeName or adornment:FindFirstChild(typeName) then
            adornment:Destroy()
        end
    end
end

local function addPlayerESP(player)
    local function onCharacterAdded(character)
        if not playerESPEnabled then return end
        task.wait(0.5)
        local humanoid = character:FindFirstChild("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then return end

        local box = Instance.new("BoxHandleAdornment")
        box.Name = "PlayerESP_"..player.UserId
        box.Adornee = rootPart
        box.ZIndex = 10
        box.AlwaysOnTop = true
        box.Size = Vector3.new(4, 7, 2)
        box.Color3 = playerESPColor
        box.Transparency = 0.3
        box.Parent = getESPFolder()

        local dieConn = humanoid.Died:Connect(function()
            box:Destroy()
            dieConn:Disconnect()
        end)

        local descConn = character.AncestryChanged:Connect(function(_, parent)
            if not parent then
                box:Destroy()
                descConn:Disconnect()
                dieConn:Disconnect()
            end
        end)
    end

    if player.Character then onCharacterAdded(player.Character) end
    player.CharacterAdded:Connect(onCharacterAdded)
end

local function addGunESP(part)
    if not gunESPEnabled then return end
    local gunKeywords = {"Gun", "Weapon", "AK", "RPG", "Uzi", "AWM", "M4", "Shotgun", "Ump", "M1014", "DesertEagle", "Glock", "MP5", "M249", "Sniper", "Rifle", "Pistol"}
    local isGun = false
    for _, keyword in ipairs(gunKeywords) do
        if part.Name:lower():match(keyword:lower()) or part.Parent and part.Parent.Name:lower():match(keyword:lower()) then
            isGun = true
            break
        end
    end
    if not isGun then return end

    local box = Instance.new("BoxHandleAdornment")
    box.Name = "GunESP_"..part.Name.."_"..tostring(part:GetHashCode())
    box.Adornee = part
    box.ZIndex = 10
    box.AlwaysOnTop = true
    box.Size = part.Size + Vector3.new(0.5, 0.5, 0.5)
    box.Color3 = gunESPColor
    box.Transparency = 0.3
    box.Parent = getESPFolder()

    local conn = part.AncestryChanged:Connect(function(_, parent)
        if not parent then
            box:Destroy()
            conn:Disconnect()
        end
    end)
end

local function addBuildingESP(building)
    if not buildingESPEnabled then return end
    local tempPart = Instance.new("Part")
    tempPart.Name = "BuildingESP_"..building.Name
    tempPart.Size = building.Size
    tempPart.Position = Vector3.new(building.X, building.Y + building.Size.Y/2, building.Z)
    tempPart.Anchored = true
    tempPart.CanCollide = false
    tempPart.Transparency = 1
    tempPart.Parent = getESPFolder()

    local box = Instance.new("BoxHandleAdornment")
    box.Name = "BuildingESPBox_"..building.Name
    box.Adornee = tempPart
    box.ZIndex = 10
    box.AlwaysOnTop = true
    box.Size = building.Size
    box.Color3 = buildingESPColor
    box.Transparency = 0.3
    box.Parent = getESPFolder()

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "BuildingLabel_"..building.Name
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.Parent = tempPart

    local label = Instance.new("TextLabel")
    label.Text = building.Name
    label.Size = UDim2.new(1, 0, 0.5, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)
    label.TextStrokeTransparency = 0
    label.TextScaled = true
    label.Parent = billboard

    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "DistanceLabel_"..building.Name
    distanceLabel.Text = "距离: 0m"
    distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextColor3 = Color3.new(1,1,1)
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextScaled = true
    distanceLabel.Parent = billboard

    RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and tempPart.Parent then
            local playerPos = LocalPlayer.Character.HumanoidRootPart.Position
            local buildingPos = tempPart.Position
            local distance = math.floor(Vector3.Distance(playerPos, buildingPos))
            distanceLabel.Text = "距离: "..distance.."m"
        end
    end)
end

local function enablePlayerESP(state)
    playerESPEnabled = state
    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                addPlayerESP(player)
            end
        end
        Players.PlayerAdded:Connect(function(player)
            if player ~= LocalPlayer then
                addPlayerESP(player)
            end
        end)
        WindUI:Notify({Title = "ESP开启", Content = "人物透视已激活（白色）", Duration = 2, Icon = "eye"})
    else
        clearESP("PlayerESP_")
        WindUI:Notify({Title = "ESP关闭", Content = "人物透视已禁用", Duration = 2, Icon = "eye-slash"})
    end
end

local function enableGunESP(state)
    gunESPEnabled = state
    if state then
        for _, part in ipairs(Workspace:GetDescendants()) do
            addGunESP(part)
        end
        Workspace.DescendantAdded:Connect(addGunESP)
        WindUI:Notify({Title = "ESP开启", Content = "枪械透视已激活（红色）", Duration = 2, Icon = "eye"})
    else
        clearESP("GunESP_")
        WindUI:Notify({Title = "ESP关闭", Content = "枪械透视已禁用", Duration = 2, Icon = "eye-slash"})
    end
end

local function enableBuildingESP(state)
    buildingESPEnabled = state
    if state then
        for _, building in ipairs(robableBuildings) do
            addBuildingESP(building)
        end
        WindUI:Notify({Title = "ESP开启", Content = "可抢劫建筑透视已激活（黄色）", Duration = 2, Icon = "eye"})
    else
        clearESP("BuildingESP_")
        clearESP("BuildingESPBox_")
        clearESP("BuildingLabel_")
        clearESP("DistanceLabel_")
        WindUI:Notify({Title = "ESP关闭", Content = "可抢劫建筑透视已禁用", Duration = 2, Icon = "eye-slash"})
    end
end

tojisTab:Toggle({
    Title = "人物透视（白色）",
    Default = false,
    Callback = enablePlayerESP
})

tojisTab:Toggle({
    Title = "枪械透视（红色）",
    Default = false,
    Callback = enableGunESP
})

tojisTab:Toggle({
    Title = "可抢劫建筑透视（黄色）",
    Default = false,
    Callback = enableBuildingESP
})

tojisTab:Slider({
    Title = "透视框透明度",
    Value = {Min = 0.1, Max = 0.9, Default = 0.3},
    Increment = 0.1,
    Callback = function(value)
        local folder = getESPFolder()
        for _, adornment in ipairs(folder:GetChildren()) do
            if adornment:IsA("BoxHandleAdornment") then
                adornment.Transparency = value
            end
        end
    end
})

local tojisTab = Window:Tab({
    Title = "范围",
    Icon = "target",
    Locked = false,
})

local function GenerateRainbowColor()
    local HueValue = tick() % 5 / 5
    return Color3.fromHSV(HueValue, 1, 1)
end

RunService.RenderStepped:Connect(function()
    if hitboxEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                pcall(function()
                    local character = player.Character
                    if character then
                        local rootPart = character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            rootPart.Transparency = hitboxTransparency
                            if hitboxRainbow then
                                rootPart.BrickColor = BrickColor.new(GenerateRainbowColor())
                            else
                                rootPart.BrickColor = BrickColor.new(hitboxColor)
                            end
                            rootPart.Material = "Neon"
                            rootPart.CanCollide = false
                        end
                    end
                end)
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                pcall(function()
                    local character = player.Character
                    if character then
                        local rootPart = character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.Size = Vector3.new(2, 2, 1)
                            rootPart.Transparency = 1
                            rootPart.BrickColor = BrickColor.new("Medium stone grey")
                            rootPart.Material = "Plastic"
                            rootPart.CanCollide = true
                        end
                    end
                end)
            end
        end
    end
end)

tojisTab:Toggle({
    Title = "开启碰撞箱扩展",
    Default = false,
    Callback = function(state)
        hitboxEnabled = state
        if state then
            WindUI:Notify({Title = "功能开启", Content = "碰撞箱扩展已激活", Duration = 2, Icon = "check"})
        else
            WindUI:Notify({Title = "功能关闭", Content = "碰撞箱扩展已禁用", Duration = 2, Icon = "x"})
        end
    end
})

tojisTab:Slider({
    Title = "碰撞箱大小",
    Value = {Min = 10, Max = 50, Default = 20},
    Increment = 1,
    Callback = function(value)
        hitboxSize = value
    end
})

tojisTab:Slider({
    Title = "碰撞箱透明度",
    Value = {Min = 0, Max = 1, Default = 0.7},
    Increment = 0.1,
    Callback = function(value)
        hitboxTransparency = value
    end
})

tojisTab:ColorPicker({
    Title = "碰撞箱颜色",
    Color = Color3.new(1, 1, 1),
    Callback = function(color)
        hitboxColor = color
        hitboxRainbow = false
    end
})

tojisTab:Toggle({
    Title = "彩虹碰撞箱",
    Default = false,
    Callback = function(state)
        hitboxRainbow = state
    end
})
end

local function jian()
    local jianTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })

jianTab:Button({
    Title = "落叶监狱人生",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/uDs9bhc8"))()
    end
})

jianTab:Button({
    Title = "无敌模式",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
    end
})

jianTab:Button({
    Title = "杀死所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
    end
})

jianTab:Button({
    Title = "手里剑（秒杀）",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
    end
})

jianTab:Button({
    Title = "变钢铁侠",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
    end
})

jianTab:Button({
    Title = "变死神",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
    end
})

jianTab:Button({
    Title = "变车模型",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
    end
})

jianTab:Button({
    Title = "变成警察",
    Callback = function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end
})

jianTab:Button({
    Title = "变成囚犯",
    Callback = function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end
})

jianTab:Button({
    Title = "获取AK",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932.273987, 95.8684235, 2039.37659, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

jianTab:Button({
    Title = "获取喷子",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-939.331909, 95.8085175, 2038.93958, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

jianTab:Button({
    Title = "获取手枪",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(813.189758, 102.235336, 2217.30859, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

jianTab:Button({
    Title = "获取m4（通行证）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.303406, 102.440094, 2217.22144, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

jianTab:Button({
    Title = "新出的枪（通行证）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-915.891785, 95.8527985, 2047.95154, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

jianTab:Button({
    Title = "传送警卫室",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
    end
})

jianTab:Button({
    Title = "传送监狱室内",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
    end
})

jianTab:Button({
    Title = "传送罪犯复活点",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
    end
})

jianTab:Button({
    Title = "传送监狱室外",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
    end
})

jianTab:Button({
    Title = "传送院子",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
    end
})

jianTab:Button({
    Title = "传送警车库",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
    end
})

jianTab:Button({
    Title = "传送死人下水道",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.4256591796875, 78.69828033447266, 2416.18359375)
    end
})

jianTab:Button({
    Title = "传送食堂",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.0059204101562, 99.98993682861328, 2289.23095703125)
    end
})
end

local function bei()
    local beiTab = Window:Tab({
        Title = "体力功能",
        Icon = "zap",
        Locked = false,
    })
    
local function toggleInfinityStamina(state)
    infinityStaminaActive = state
    if state then
        staminaThread = task.spawn(function()
            while infinityStaminaActive do
                for k, v in pairs(staminaValues) do if sprint then sprint[k] = v end end
                if sprint then sprint.Stamina = sprint.MaxStamina end
                task.wait(0.005)
            end
        end)
    elseif staminaThread then
        task.cancel(staminaThread)
        staminaThread = nil
    end
end

local function resetStamina()
    for k, v in pairs(staminaDefaults) do
        staminaValues[k] = v
        if sprint then sprint[k] = v end
    end
end

local function createHighlight(target, color, transparency)
    local h = Instance.new("Highlight", target)
    h.Adornee = target
    h.FillColor, h.OutlineColor = color, color
    h.FillTransparency = transparency or 0.7
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    return h
end

local function createESP(name, config)
    espSystem[name] = {active = false, highlights = {}, thread = nil}
    return function(state)
        local data = espSystem[name]
        data.active = state
        if state then
            data.thread = task.spawn(function()
                while data.active do
                    for _, h in ipairs(data.highlights) do
                        if h and h.Parent then h:Destroy() end
                    end
                    table.clear(data.highlights)
                    config.update(data.highlights)
                    task.wait(config.interval or 5)
                end
            end)
        else
            if data.thread then task.cancel(data.thread) data.thread = nil end
            for _, h in ipairs(data.highlights) do
                if h and h.Parent then h:Destroy() end
            end
            table.clear(data.highlights)
        end
    end
end

local itemESPData = {
    Medkit = {active = false, color = Color3.fromRGB(255, 105, 180), thread = nil},
    BloxyCola = {active = false, color = Color3.fromRGB(0, 150, 255), thread = nil}
}

local function updateItemESP(itemName, data)
    for _, item in ipairs(Workspace:GetDescendants()) do
        if item.Name == itemName then
            local part = item:IsA("BasePart") and item or (item:IsA("Model") and item:FindFirstChildWhichIsA("BasePart"))
            if part and not part:FindFirstChild("ItemHighlight") then
                local h = createHighlight(part:IsA("Model") and item or part, data.color, 0.5)
                h.Name = "ItemHighlight"
            end
        end
    end
end

local function clearItemESP(itemName)
    for _, item in ipairs(Workspace:GetDescendants()) do
        if item.Name == itemName then
            local part = item:IsA("BasePart") and item or (item:IsA("Model") and item:FindFirstChildWhichIsA("BasePart"))
            if part and part:FindFirstChild("ItemHighlight") then
                part.ItemHighlight:Destroy()
            end
        end
    end
end

local function isFacing(localRoot, targetRoot)
    local dir = (localRoot.Position - targetRoot.Position).Unit
    local dot = targetRoot.CFrame.LookVector:Dot(dir)
    return looseFacing and dot > -0.3 or dot > 0
end

local function getAnimId(track)
    return track and track.Animation and tostring(track.Animation.AnimationId):match("%d+")
end

local function isAttackAnimation(track)
    local animId = getAnimId(track)
    return animId and table.find(autoBlockTriggerAnims, animId)
end

local function getNetworkCompensation()
    local stats = game:GetService("Stats")
    local pingItem = stats.Network and stats.Network.ServerStatsItem and stats.Network.ServerStatsItem["Data Ping"]
    if pingItem and typeof(pingItem.GetValueString) == "function" then
        local pingStr = pingItem:GetValueString()
        local ping = tonumber(pingStr:match("%d+")) or 50
        return math.min(ping / 1000, 0.3)
    end
    return 0.05
end

local function fireRemote(ability)
    if remoteEvent then
        remoteEvent:FireServer("UseActorAbility", {buffer.fromstring('"' .. ability .. '"')})
    end
end

local function fireRemoteBlock() fireRemote("Block") end
local function fireRemoteClone() fireRemote("Clone") end

local blockConnection

local function checkAttacker(attacker, myRoot, networkDelay)
    local hrp = attacker:FindFirstChild("HumanoidRootPart")
    if not hrp or (hrp.Position - myRoot.Position).Magnitude > detectionRange then return end
    local hum = attacker:FindFirstChildOfClass("Humanoid")
    local animator = hum and hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        if isAttackAnimation(track) then
            local progress = track.TimePosition / track.Length
            local threshold = math.max(windupThreshold - 0, 0.3) + networkDelay
            if progress < threshold and autoBlockOn and isFacing(myRoot, hrp) then
                if not strictRangeOn or (hrp.Position - myRoot.Position).Magnitude <= detectionRange then
                    fireRemoteBlock()
                end
            end
        end
    end
end

local function startAutoBlock()
    blockConnection = RunService.Heartbeat:Connect(function()
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myRoot, humanoid = myChar:FindFirstChild("HumanoidRootPart"), myChar:FindFirstChildOfClass("Humanoid")
        if not myRoot or not humanoid then return end
        local networkDelay = getNetworkCompensation()
        local killersFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        if killersFolder then
            for _, killer in ipairs(killersFolder:GetChildren()) do
                if killer:IsA("Model") then
                    checkAttacker(killer, myRoot, networkDelay)
                end
            end
        end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                checkAttacker(plr.Character, myRoot, networkDelay)
            end
        end
    end)
end

local function stopAutoBlock()
    if blockConnection then
        blockConnection:Disconnect()
        blockConnection = nil
    end
end

local function refreshCloneUIRefs()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end
    local main = playerGui:FindFirstChild("MainUI")
    if main then
        local ability = main:FindFirstChild("AbilityContainer")
        local cloneBtn = ability and ability:FindFirstChild("Clone")
        cloneCachedCooldown = cloneBtn and cloneBtn:FindFirstChild("CooldownTime")
    else
        cloneCachedCooldown = nil
    end
end

local function extractSoundId(sound)
    if not sound or not sound.SoundId then return nil end
    return tostring(sound.SoundId):match("%d+")
end

local function getCharFromSound(inst)
    if not inst then return nil end
    local model = inst:FindFirstAncestorOfClass("Model")
    if model and model:FindFirstChildOfClass("Humanoid") then return model end
    return nil
end

local function attemptClone(sound)
    if not autoCloneOn or not sound or not sound:IsA("Sound") or not sound.IsPlaying then return end
    local id = extractSoundId(sound)
    if not id or not autoCloneTriggerSounds[id] then return end
    local t = tick()
    if cloneSoundBlockedUntil[sound] and t < cloneSoundBlockedUntil[sound] then return end
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local soundPart = sound.Parent
    if not (soundPart and soundPart.Parent) then return end
    local char = getCharFromSound(soundPart)
    local plr = char and Players:GetPlayerFromCharacter(char)
    if not plr or plr == LocalPlayer then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local dvec = hrp.Position - myRoot.Position
    if dvec:Dot(dvec) > cloneDetectionRangeSq then return end
    if cloneCachedCooldown and cloneCachedCooldown.Text ~= "" then return end
    if not isFacing(myRoot, hrp) then return end
    fireRemoteClone()
    cloneSoundBlockedUntil[sound] = t + 1.2
end

local cloneSoundHooks = {}
local cloneCachedCooldown = nil
local cloneSoundBlockedUntil = {}

local function hookCloneSound(sound)
    if not sound or not sound:IsA("Sound") or cloneSoundHooks[sound] then return end
    local playedConn = sound.Played:Connect(function() pcall(attemptClone, sound) end)
    local propConn = sound:GetPropertyChangedSignal("IsPlaying"):Connect(function()
        if sound.IsPlaying then pcall(attemptClone, sound) end
    end)
    local destroyConn
    destroyConn = sound.Destroying:Connect(function()
        if playedConn and playedConn.Connected then playedConn:Disconnect() end
        if propConn and propConn.Connected then propConn:Disconnect() end
        if destroyConn and destroyConn.Connected then destroyConn:Disconnect() end
        cloneSoundHooks[sound] = nil
        cloneSoundBlockedUntil[sound] = nil
    end)
    cloneSoundHooks[sound] = {playedConn, propConn, destroyConn}
    if sound.IsPlaying then
        task.spawn(function() pcall(attemptClone, sound) end)
    end
end

local function setupHitboxExpanderChar(character)
    hitboxExpander.humanoid = character:WaitForChild("Humanoid")
    hitboxExpander.root = character:WaitForChild("HumanoidRootPart")
end

local function findClosestHead()
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("Head") then return nil end
    local myHeadPos, minDist, target = myChar.Head.Position, math.huge, nil
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("Head") then
            local dist = (pl.Character.Head.Position - myHeadPos).Magnitude
            if dist < minDist then
                minDist, target = dist, pl.Character.Head
            end
        end
    end
    return target
end

local function tryPizzaHeal()
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid, root = char:FindFirstChild("Humanoid"), char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end
    local startPos = root.Position
    local pizza = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Ingame") and Workspace.Map.Ingame:FindFirstChild("Pizza")
    if not pizza or not pizza:IsA("BasePart") then return end
    root.CFrame = CFrame.new(pizza.Position)
    task.wait(1)
    root.CFrame = CFrame.new(startPos)
end

local function setupHealthMonitor(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.HealthChanged:Connect(function(hp)
            if autoPizza.enabled and hp < autoPizza.threshold and hp > 0 then
                tryPizzaHeal()
            end
        end)
    end
end

LocalPlayer.CharacterAdded:Connect(function(newChar)
    Char = newChar
    Humanoid = Char:WaitForChild("Humanoid")
    Animator = Humanoid:WaitForChild("Animator")
    setupHitboxExpanderChar(Char)
    setupHealthMonitor(Char)
    task.delay(0.5, refreshCloneUIRefs)
end)

refreshCloneUIRefs()

for _, desc in ipairs(game:GetDescendants()) do
    if desc:IsA("Sound") then pcall(hookCloneSound, desc) end
end

game.DescendantAdded:Connect(function(desc)
    if desc:IsA("Sound") then pcall(hookCloneSound, desc) end
end)

setupHitboxExpanderChar(Char)
setupHealthMonitor(Char)

beiTab:Toggle({
    Title = "无限体力",
    Default = false,
    Callback = toggleInfinityStamina
})

local staminaSliders = {
    {title = "最大体力", key = "MaxStamina", min = 1, max = 500, step = 1, suffix = "最大"},
    {title = "冲刺速度", key = "SprintSpeed", min = 1, max = 40, step = 1, suffix = " S"},
    {title = "体力恢复", key = "StaminaGain", min = 1, max = 500, step = 1, suffix = " /秒"},
    {title = "体力消耗", key = "StaminaDrain", min = 0, max = 100, step = 1, suffix = " /秒"},
    {title = "恢复延迟", key = "StaminaRegenDelay", min = 0, max = 5, step = 0.1, suffix = " 秒"}
}

for _, config in ipairs(staminaSliders) do
    beiTab:Slider({
        Title = config.title,
        Step = config.step,
        Value = {Min = config.min, Max = config.max, Default = staminaValues[config.key] or config.min},
        Suffix = config.suffix,
        Callback = function(val)
            staminaValues[config.key] = tonumber(val) or staminaDefaults[config.key]
            if sprint then sprint[config.key] = staminaValues[config.key] end
            if config.key == "MaxStamina" and not infinityStaminaActive and sprint and sprint.Stamina > staminaValues[config.key] then
                sprint.Stamina = staminaValues[config.key]
            end
        end
    })
end

beiTab:Button({
    Title = "重置为默认",
    Callback = resetStamina
})

local beiTab = Window:Tab({
    Title = "反制功能",
    Icon = "shield-check",
    Locked = false,
})

beiTab:Toggle({
    Title = "反眩晕",
    Default = false,
    Callback = function(state)
        antiFeatures.stun = state
        if state then
            task.spawn(function()
                while antiFeatures.stun do
                    task.wait(0.1)
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("SpeedMultipliers") then
                        local stunned = char.SpeedMultipliers:FindFirstChild("Stunned")
                        if stunned and stunned.Value ~= 1 then
                            stunned.Value = 1
                        end
                    end
                end
            end)
        end
    end
})

beiTab:Toggle({
    Title = "反减速",
    Default = false,
    Callback = function(state)
        antiFeatures.slow = state
        if state then
            task.spawn(function()
                while antiFeatures.slow do
                    task.wait(0.1)
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("SpeedMultipliers") then
                        for _, v in pairs(char.SpeedMultipliers:GetChildren()) do
                            if v:IsA("NumberValue") and v.Value < 1 then
                                v.Value = 1
                            end
                        end
                    end
                end
            end)
        end
    end
})

beiTab:Toggle({
    Title = "反致盲",
    Default = false,
    Callback = function(state)
        antiFeatures.blindness = state
        if state then
            task.spawn(function()
                while antiFeatures.blindness do
                    task.wait(0.5)
                    if Lighting:FindFirstChild("BlindnessBlur") then
                        Lighting.BlindnessBlur:Destroy()
                    end
                end
            end)
        end
    end
})

beiTab:Toggle({
    Title = "反子空间",
    Default = false,
    Callback = function(state)
        antiFeatures.subspace = state
        if state then
            task.spawn(function()
                while antiFeatures.subspace do
                    task.wait(0.5)
                    local subspaceEffects = {"SubspaceVFXBlur", "SubspaceVFXColorCorrection"}
                    for _, effectName in ipairs(subspaceEffects) do
                        if Lighting:FindFirstChild(effectName) then
                            Lighting[effectName]:Destroy()
                        end
                    end
                end
            end)
        end
    end
})

beiTab:Toggle({
    Title = "反脚步声",
    Default = false,
    Callback = function(state)
        antiFeatures.footsteps = state
        if state then
            task.spawn(function()
                while antiFeatures.footsteps do
                    task.wait(0.5)
                    for _, sound in ipairs(Workspace:GetDescendants()) do
                        if sound:IsA("Sound") and sound.Name:find("Footstep") then
                            sound.Volume = 0
                        end
                    end
                end
            end)
        end
    end
})

local beiTab = Window:Tab({
    Title = "透视功能",
    Icon = "eye",
    Locked = false,
})

beiTab:Toggle({
    Title = "透视杀手",
    Default = false,
    Callback = createESP("killer", {
        interval = 5,
        update = function(highlights)
            local folder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
            if not folder then return end
            for _, v in ipairs(folder:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                    highlights[#highlights + 1] = createHighlight(v, Color3.fromRGB(255, 0, 0))
                end
            end
        end
    })
})

beiTab:Toggle({
    Title = "透视幸存者",
    Default = false,
    Callback = createESP("survivor", {
        interval = 5,
        update = function(highlights)
            local folder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
            if not folder then return end
            for _, v in ipairs(folder:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                    highlights[#highlights + 1] = createHighlight(v, Color3.fromRGB(0, 255, 0))
                end
            end
        end
    })
})

beiTab:Section({Title = "物品透视"})

for itemName, data in pairs(itemESPData) do
    beiTab:Toggle({
        Title = "透视" .. (itemName == "Medkit" and "医疗包" or "可乐"),
        Default = false,
        Callback = function(state)
            data.active = state
            if state then
                data.thread = task.spawn(function()
                    while data.active do
                        updateItemESP(itemName, data)
                        task.wait(2)
                    end
                end)
            else
                if data.thread then task.cancel(data.thread) data.thread = nil end
                clearItemESP(itemName)
            end
        end
    })
end

beiTab:Toggle({
    Title = "发电机透视",
    Default = false,
    Callback = createESP("generator", {
        interval = 10,
        update = function(highlights)
            local mapFolder = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Ingame") and Workspace.Map.Ingame:FindFirstChild("Map")
            if not mapFolder then return end
            for _, obj in ipairs(mapFolder:GetChildren()) do
                if obj.Name == "Generator" and obj:IsA("Model") then
                    local progress = obj:FindFirstChild("Progress")
                    if progress and progress.Value < 100 then
                        highlights[#highlights + 1] = createHighlight(obj, Color3.fromRGB(255, 255, 255), 0.6)
                    end
                end
            end
        end
    })
})

local beiTab = Window:Tab({
    Title = "自动",
    Icon = "shield",
    Locked = false,
})

beiTab:Toggle({
    Title = "自动格挡",
    Default = false,
    Callback = function(state)
        autoBlockOn = state
        if state then
            startAutoBlock()
            WindUI:Notify({ Title = "自动格挡", Content = "启用!", Duration = 1 })
        else
            stopAutoBlock()
            WindUI:Notify({ Title = "自动格挡", Content = "关闭!", Duration = 1 })
        end
    end
})

beiTab:Slider({
    Title = "检测范围",
    Step = 1,
    Value = {Min = 1, Max = 50, Default = detectionRange},
    Suffix = " studs",
    Callback = function(val)
        detectionRange = tonumber(val) or detectionRange
    end
})

beiTab:Slider({
    Title = "蓄力%",
    Step = 5,
    Value = {Min = 1, Max = 100, Default = 75},
    Suffix = "%",
    Callback = function(val)
        windupThreshold = (tonumber(val) or 75) / 100
    end
})

beiTab:Toggle({
    Title = "自动克隆",
    Default = false,
    Callback = function(state)
        autoCloneOn = state
    end
})

beiTab:Slider({
    Title = "克隆检测范围",
    Step = 1,
    Value = {Min = 1, Max = 100, Default = cloneDetectionRange},
    Suffix = " studs",
    Callback = function(val)
        cloneDetectionRange = val
        cloneDetectionRangeSq = val * val
    end
})

local beiTab = Window:Tab({
    Title = "范围扩展",
    Icon = "target",
    Locked = false,
})

beiTab:Toggle({
    Title = "启用范围扩展",
    Default = false,
    Callback = function(v) hitboxExpander.enabled = v end
})

beiTab:Slider({
    Title = "扩展强度",
    Step = 5,
    Value = {Min = 10, Max = 500, Default = hitboxExpander.strength},
    Suffix = " studs",
    Callback = function(val) hitboxExpander.strength = tonumber(val) end
})

beiTab:Slider({
    Title = "攻击时机",
    Step = 0.05,
    Value = {Min = 0.1, Max = 1, Default = hitboxExpander.windupThreshold},
    Suffix = " %",
    Callback = function(val) hitboxExpander.windupThreshold = val end
})

beiTab:Toggle({
    Title = "智能扩展",
    Default = false,
    Callback = function(state) hitboxExpander.smartExpand = state end
})

beiTab:Toggle({
    Title = "爆发模式",
    Default = false,
    Callback = function(state) hitboxExpander.burstMode = state end
})

beiTab:Slider({
    Title = "爆发倍率",
    Step = 0.1,
    Value = {Min = 1, Max = 3, Default = hitboxExpander.burstMultiplier},
    Suffix = "x",
    Callback = function(val) hitboxExpander.burstMultiplier = val end
})

local beiTab = Window:Tab({
    Title = "其他功能",
    Icon = "gift",
    Locked = false,
})

beiTab:Toggle({
    Title = "自瞄",
    Default = false,
    Callback = function(state) aimbot.enabled = state end
})

beiTab:Toggle({
    Title = "自动吃披萨",
    Default = false,
    Callback = function(v) autoPizza.enabled = v end
})

beiTab:Slider({
    Title = "生命值阈值",
    Value = {Min = 1, Max = 100, Default = autoPizza.threshold},
    Step = 1,
    Suffix = "%",
    Callback = function(val) autoPizza.threshold = val end
})

local beiTab = Window:Tab({
    Title = "传送功能",
    Icon = "cable",
    Locked = false,
})

beiTab:Button({
    Title = "传送到杀手",
    Callback = function()
        local folder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        local killer = folder and folder:FindFirstChildWhichIsA("Model")
        if killer and killer.PrimaryPart then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = killer.PrimaryPart.CFrame
            end
        end
    end
})

beiTab:Button({
    Title = "传送到最近幸存者",
    Callback = function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local folder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not folder then return end
        local myPos = char.HumanoidRootPart.Position
        local nearest, minDist = nil, math.huge
        for _, survivor in ipairs(folder:GetChildren()) do
            if survivor:IsA("Model") and survivor:FindFirstChild("HumanoidRootPart") then
                local dist = (survivor.HumanoidRootPart.Position - myPos).Magnitude
                if dist < minDist then
                    nearest, minDist = survivor, dist
                end
            end
        end
        if nearest and nearest:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
        end
    end
})

beiTab:Button({
    Title = "传送到发电机",
    Callback = function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name == "Generator" then
                local target = obj:IsA("BasePart") and obj or (obj:IsA("Model") and obj.PrimaryPart)
                if target then
                    char.HumanoidRootPart.CFrame = target.CFrame + Vector3.new(0, 3, 0)
                    return
                end
            end
        end
    end
})

beiTab:Button({
    Title = "传送到医疗包",
    Callback = function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name == "ItemRoot" and v.Parent and v.Parent.Name == "Medkit" then
                char.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                break
            end
        end
    end
})

RunService.RenderStepped:Connect(function()
    if hitboxExpander.enabled and hitboxExpander.root and hitboxExpander.humanoid then
        local isAttacking = false
        local attackProgress = 0
        for _, track in ipairs(hitboxExpander.humanoid:GetPlayingAnimationTracks()) do
            local animId = track.Animation and track.Animation.AnimationId
            if animId then
                local numId = animId:match("%d+")
                if numId and table.find(hitboxAttackIds, numId) then
                    attackProgress = track.TimePosition / track.Length
                    if attackProgress < hitboxExpander.windupThreshold then
                        isAttacking = true
                        break
                    end
                end
            end
        end
        if not isAttacking then return end
        local look = hitboxExpander.root.CFrame.LookVector
        local original = hitboxExpander.root.Velocity
        local strength = hitboxExpander.strength
        if hitboxExpander.smartExpand then
            strength = strength * (1 - attackProgress * 0.5)
        end
        if hitboxExpander.burstMode then
            strength = strength * hitboxExpander.burstMultiplier
        end
        hitboxExpander.root.Velocity = look * strength
        RunService.RenderStepped:Wait()
        hitboxExpander.root.Velocity = original
    end
end)

RunService.RenderStepped:Connect(function()
    if aimbot.enabled then
        local target = findClosestHead()
        if target then
            local cam = Workspace.CurrentCamera
            cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
        end
    end
end)
end

local function lilian()
    local lilianTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
lilianTab:Toggle({
    Title = "自动比赛开关",
    Callback = function(AR)
        while AR do 
            wait() 
            wait(2) 
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl") 
        end
    end
})

lilianTab:Toggle({
    Title = "自动举哑铃",
    Callback = function(ATYL)
        local part = Instance.new('Part', workspace) 
        part.Size = Vector3.new(500, 20, 530.1) 
        part.Position = Vector3.new(0, 100000, 133.15) 
        part.CanCollide = true 
        part.Anchored = true 
        local rs = game:GetService("RunService").RenderStepped 
        while ATYL do 
            wait() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v.ClassName == "Tool" and v.Name == "Weight" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end 
            end 
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") 
        end
    end
})

lilianTab:Toggle({
    Title = "自动俯卧撑",
    Callback = function(ATFWC)
        local part = Instance.new('Part', workspace) 
        part.Size = Vector3.new(500, 20, 530.1) 
        part.Position = Vector3.new(0, 100000, 133.15) 
        part.CanCollide = true 
        part.Anchored = true 
        local rs = game:GetService("RunService").RenderStepped 
        while ATFWC do 
            wait() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v.ClassName == "Tool" and v.Name == "Pushups" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end 
            end 
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") 
        end
    end
})

lilianTab:Toggle({
    Title = "自动仰卧起坐",
    Callback = function(ATYWQZ)
        local part = Instance.new('Part', workspace) 
        part.Size = Vector3.new(500, 20, 530.1) 
        part.Position = Vector3.new(0, 100000, 133.15) 
        part.CanCollide = true 
        part.Anchored = true 
        local rs = game:GetService("RunService").RenderStepped 
        while ATYWQZ do 
            wait() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v.ClassName == "Tool" and v.Name == "Situps" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end 
            end 
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
    end
})

lilianTab:Toggle({
    Title = "自动倒立身体",
    Callback = function(ATDL)
        local part = Instance.new('Part', workspace) 
        part.Size = Vector3.new(500, 20, 530.1) 
        part.Position = Vector3.new(0, 100000, 133.15) 
        part.CanCollide = true 
        part.Anchored = true 
        local rs = game:GetService("RunService").RenderStepped 
        while ATDL do 
            wait() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v.ClassName == "Tool" and v.Name == "Handstands" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end 
            end 
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
    end
})

lilianTab:Toggle({
    Title = "自动锻炼",
    Callback = function(ATAAA)
        local part = Instance.new('Part', workspace) 
        part.Size = Vector3.new(500, 20, 530.1) 
        part.Position = Vector3.new(0, 100000, 133.15) 
        part.CanCollide = true 
        part.Anchored = true 
        while ATAAA do 
            wait() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) 
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v.ClassName == "Tool" and v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or v.Name == "Weight" then 
                    v:FindFirstChildOfClass("NumberValue").Value = 0 
                    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") 
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) 
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") 
                end 
            end 
        end
    end
})

lilianTab:Button({
    Title = "传送到神话健身房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
    end
})

-- 快速重生功能
lilianTab:Toggle({
    Title = "自动重生",
    Callback = function(ATRE)
        while ATRE do 
            wait() 
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest") 
        end
    end
})

lilianTab:Button({
    Title = "收集宝石",
    Callback = function()
        jk = {} 
        for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do 
            if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then 
                table.insert(jk, v.Name) 
            end 
        end 
        for i = 1, #jk do 
            wait(2) 
            game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i]) 
        end
    end
})

-- 跑步机功能
lilianTab:Toggle({
    Title = "沙滩跑步机10",
    Callback = function(PPJ10)
        getgenv().PPJ10 = PPJ10 
        while getgenv().PPJ10 do 
            wait() 
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874) 
            local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:WaitForChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end 
        if not getgenv().PPJ10 then 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:FindFirstChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end
    end
})

lilianTab:Toggle({
    Title = "健身房跑步机2000",
    Callback = function(PPJ2000)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then 
            getgenv().PPJ2000 = PPJ2000 
            while getgenv().PPJ2000 do 
                wait() 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816) 
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
                local RunService = game:GetService("RunService") 
                local Players = game:GetService("Players") 
                local localPlayer = Players.LocalPlayer 
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                    if localPlayer.Character then 
                        local humanoid = localPlayer.Character:WaitForChild("Humanoid") 
                        if humanoid then 
                            humanoid:Move(Vector3.new(10000, 0, -1), true) 
                        end 
                    end 
                end) 
            end 
        end 
        if not getgenv().PPJ2000 then 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:FindFirstChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end
    end
})

lilianTab:Toggle({
    Title = "神话健身房跑步机2000",
    Callback = function(SHPPJ2000)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then 
            getgenv().SHPPJ2000 = SHPPJ2000 
            while getgenv().SHPPJ2000 do 
                wait() 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231) 
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
                local RunService = game:GetService("RunService") 
                local Players = game:GetService("Players") 
                local localPlayer = Players.LocalPlayer 
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                    if localPlayer.Character then 
                        local humanoid = localPlayer.Character:WaitForChild("Humanoid") 
                        if humanoid then 
                            humanoid:Move(Vector3.new(10000, 0, -1), true) 
                        end 
                    end 
                end) 
            end 
        end 
        if not getgenv().SHPPJ2000 then 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:FindFirstChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end
    end
})

lilianTab:Toggle({
    Title = "永恒健身房跑步机3500",
    Callback = function(YHPPJ3500)
        if game.Players.LocalPlayer.Agility.Value >= 3500 then 
            getgenv().YHPPJ3500 = YHPPJ3500 
            while getgenv().YHPPJ3500 do 
                wait() 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594) 
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
                local RunService = game:GetService("RunService") 
                local Players = game:GetService("Players") 
                local localPlayer = Players.LocalPlayer 
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                    if localPlayer.Character then 
                        local humanoid = localPlayer.Character:WaitForChild("Humanoid") 
                        if humanoid then 
                            humanoid:Move(Vector3.new(10000, 0, -1), true) 
                        end 
                    end 
                end) 
            end 
        end 
        if not getgenv().YHPPJ3500 then 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:FindFirstChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end
    end
})

lilianTab:Toggle({
    Title = "传奇健身房跑步机3000",
    Callback = function(CQPPJ3000)
        if game.Players.LocalPlayer.Agility.Value >= 3000 then 
            getgenv().CQPPJ3000 = CQPPJ3000 
            while getgenv().CQPPJ3000 do 
                wait() 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727) 
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame 
                local RunService = game:GetService("RunService") 
                local Players = game:GetService("Players") 
                local localPlayer = Players.LocalPlayer 
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                    if localPlayer.Character then 
                        local humanoid = localPlayer.Character:WaitForChild("Humanoid") 
                        if humanoid then 
                            humanoid:Move(Vector3.new(10000, 0, -1), true) 
                        end 
                    end 
                end) 
            end 
        end 
        if not getgenv().CQPPJ3000 then 
            local RunService = game:GetService("RunService") 
            local Players = game:GetService("Players") 
            local localPlayer = Players.LocalPlayer 
            RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() 
                if localPlayer.Character then 
                    local humanoid = localPlayer.Character:FindFirstChild("Humanoid") 
                    if humanoid then 
                        humanoid:Move(Vector3.new(10000, 0, -1), true) 
                    end 
                end 
            end) 
        end
    end
})

-- 石头训练功能
lilianTab:Toggle({
    Title = "石头0",
    Callback = function(RK0)
        getgenv().RK0 = RK0 
        while getgenv().RK0 do 
            wait() 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v:IsA("Tool") and v.Name == "Punch" then 
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) 
                end 
            end 
            for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                if h:IsA("Tool") and h.Name == "Punch" then 
                    h:Activate() 
                end 
            end 
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159) 
        end 
        if not getgenv().RK0 then 
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() 
        end
    end
})

lilianTab:Toggle({
    Title = "石头10",
    Callback = function(RK10)
        if game.Players.LocalPlayer.Durability.Value >= 10 then 
            getgenv().RK10 = RK10 
            while getgenv().RK10 do 
                wait() 
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                    if v:IsA("Tool") and v.Name == "Punch" then 
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) 
                    end 
                end 
                for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                    if h:IsA("Tool") and h.Name == "Punch" then 
                        h:Activate() 
                    end 
                end 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299) 
            end 
            if not getgenv().RK10 then 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() 
            end 
        end
    end
})

lilianTab:Toggle({
    Title = "石头100",
    Callback = function(RK100)
        if game.Players.LocalPlayer.Durability.Value >= 100 then 
            getgenv().RK100 = RK100 
            while getgenv().RK100 do 
                wait() 
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                    if v:IsA("Tool") and v.Name == "Punch" then 
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v) 
                    end 
                end 
                for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                    if h:IsA("Tool") and h.Name == "Punch" then 
                        h:Activate() 
                    end 
                end 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928) 
            end 
            if not getgenv().RK100 then 
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools() 
            end 
        end
    end
})

-- 继续添加其他石头训练功能（代码过长，只显示部分）
-- 传送功能
lilianTab:Toggle({
    Title = "X-安全地方",
    Callback = function(Place)
        if Place then 
            getgenv().place = true 
            while getgenv().place do 
                wait() 
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-51.6716728, 32.2157211, 1290.41211, 0.9945544, 1.23613528e-08, -0.104218982, -7.58742402e-09, 1, 4.62031657e-08, 0.104218982, -4.51608102e-08, 0.9945544) 
            end 
        else 
            getgenv().place = false 
            wait() 
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-34.1635208, 3.67689133, 219.640869, 0.599920511, -2.24152163e-09, 0.800059617, 4.46125981e-09, 1, -5.43559087e-10, -0.800059617, 3.89536625e-09, 0.599920511) 
        end
    end
})

lilianTab:Button({
    Title = "传送到出生点",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
    end
})

lilianTab:Button({
    Title = "传送到冰霜健身房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
    end
})

lilianTab:Button({
    Title = "传送到永恒健身房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
    end
})

lilianTab:Button({
    Title = "传送到传说健身房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
    end
})

lilianTab:Button({
    Title = "传送到肌肉之王健身房",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
    end
})

lilianTab:Button({
    Title = "传送到安全岛",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
    end
})

lilianTab:Button({
    Title = "传送到幸运抽奖区域",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
    end
})
end

local AutoRebirth = false
local AutoSpeed1 = false
local AutoSpeed5 = false
local AutoSpeed10 = false
local AutoUpgradeBase = false
local AutoUpgradeCarry = false
local AutoSellTool = false
local AutoSellAll = false
local autoCollectEnabled = false

local function zan()
    local zanTab = Window:Tab({
        Title = "功能",
        Icon = "zap",
        Locked = false,
    })
    
local function AddTab(section, title, icon)
    return section:Tab({Title = title, Icon = icon})
end

local function Btn(tab, title, callback)
    return tab:Button({Title = title, Callback = callback})
end

local function Tg(tab, title, value, callback)
    return tab:Toggle({Title = title, Image = "bird", Value = value, Callback = callback})
end

local function Sld(tab, title, min, max, default, callback)
    return tab:Slider({Title = title, Step = 1, Value = {Min = min, Max = max, Default = default}, Callback = callback})
end

local A = AddTab(LockSection, "传送", "rbxassetid://3944688398")
local B = AddTab(LockSection, "自动", "rbxassetid://4450736564")
local C = AddTab(LockSection, "透视", "rbxassetid://104955103991281")
local D = AddTab(LockSection, "辅助", "rbxassetid://4483362458")
local E = AddTab(LockSection, "自瞄", "rbxassetid://4483345998")

local zanTab = Window:Section({
    Title = "娱乐功能",
    Opened = true,
})

local F = AddTab(zanTab, "攻击", "rbxassetid://4384392464")
local G = AddTab(zanTab, "武器", "rbxassetid://94831304996747")
local H = AddTab(zanTab, "玩家", "rbxassetid://4335480896")
local I = AddTab(zanTab, "子追", "rbxassetid://4483345998")

Window:SelectTab(1)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local PlayerList = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LP then
        PlayerList[#PlayerList + 1] = player.Name
    end
end

local zanTab = {
    ["Alpha"] = CFrame.new(-1197, 65, -4790),
    ["Bravo"] = CFrame.new(-220, 65, -4919),
    ["Charlie"] = CFrame.new(797, 65, -4740),
    ["Delta"] = CFrame.new(2044, 65, -3984),
    ["Echo"] = CFrame.new(2742, 65, -3031),
    ["Foxtrot"] = CFrame.new(3045, 65, -1788),
    ["Golf"] = CFrame.new(3376, 65, -562),
    ["Hotel"] = CFrame.new(3290, 65, 587),
    ["Juliet"] = CFrame.new(2955, 65, 1804),
    ["Kilo"] = CFrame.new(2569, 65, 2926),
    ["Lima"] = CFrame.new(989, 65, 3419),
    ["Omega"] = CFrame.new(-319, 65, 3932),
    ["Romeo"] = CFrame.new(-1479, 65, 3722),
    ["Sierra"] = CFrame.new(-2528, 65, 2549),
    ["Tango"] = CFrame.new(-3018, 65, 1503),
    ["Victor"] = CFrame.new(-3587, 65, 634),
    ["Yankee"] = CFrame.new(-3957, 65, -287),
    ["Zulu"] = CFrame.new(-4049, 65, -1334)
}

Btn(A, "当前玩家基地: " .. LP.Team.Name, function() end)
A:Dropdown({
    Title = "传送基地", 
    Values = {"Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "Juliet", "Kilo", "Lima", "Omega", "Romeo", "Sierra", "Tango", "Victor", "Yankee", "Zulu"}, 
    Value = "Alpha", 
    Callback = function(d) 
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character:FindFirstChild("HumanoidRootPart").CFrame = zanTab[d]
        end
    end
})

local function GetAvailableBases()
    local bases = {}
    if not ExcludedBases then
        ExcludedBases = {}
    end
    if not workspace:FindFirstChild("Tycoon") or not workspace.Tycoon:FindFirstChild("Tycoons") then
        warn("Tycoon or Tycoons folder not found")
        return bases
    end
    
    local tycoons = workspace.Tycoon.Tycoons:GetChildren()
    for _, tycoon in ipairs(tycoons) do
        if not table.find(ExcludedBases, tycoon.Name) then
            table.insert(bases, tycoon.Name)
        end
    end
    
    return bases
end

local zanTab = B:Dropdown({
    Title = "基地白名单{排除列表}", 
    Values = GetAvailableBases(), 
    Multi = true, 
    Default = {}, 
    Callback = function(Values) 
        ExcludedBases = Values 
    end
})

Btn(B, "刷新基地列表", function()
    zanTab:Refresh(GetAvailableBases())
end)

Tg(B,"自动箱子",false,function(value)
        getgenv().auto = value
    end
)

Tg(B,"自动升级",false,function(value)
        getgenv().autoTeleport = value
    end
)


B:Divider()


B:Button({
    Title = "自动重生",
    Description = "正在开发中..",
    Locked = true,
})

B:Button({
    Title = "自动空投",
    Description = "正在开发中..",
    Locked = true,
})



getgenv().ESPEnabled = false
getgenv().ShowBox = false
getgenv().ShowHealth = false
getgenv().ShowName = false
getgenv().ShowDistance = false
getgenv().ShowTracer = false
getgenv().TeamCheck = false
getgenv().ShowSkeleton = false
getgenv().ShowRadar = false
getgenv().ShowPlayerCount = false
getgenv().ShowWeapon = false
getgenv().ShowFOV = false
getgenv().OutOfViewArrows = false
getgenv().Chams = false

getgenv().TracerColor = Color3.new(1, 0, 0)
getgenv().SkeletonColor = Color3.new(0.2, 0.8, 1)
getgenv().BoxColor = Color3.new(1, 1, 1)
getgenv().HealthBarColor = Color3.new(0, 1, 0)
getgenv().HealthTextColor = Color3.new(1, 1, 1)
getgenv().NameColor = Color3.new(1, 1, 1)
getgenv().DistanceColor = Color3.new(1, 1, 0)
getgenv().WeaponColor = Color3.new(1, 0.5, 0)
getgenv().ArrowColor = Color3.new(1, 0, 0)
getgenv().FOVColor = Color3.new(1, 1, 1)
getgenv().ChamsColor = Color3.new(1, 0, 0)

getgenv().BoxThickness = 1
getgenv().TracerThickness = 1
getgenv().SkeletonThickness = 2
getgenv().FOVRadius = 100
getgenv().ArrowSize = 15

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function getGradientColor(time)
    local r = math.sin(time * 2) * 0.5 + 0.5
    local g = math.sin(time * 3) * 0.5 + 0.5
    local b = math.sin(time * 4) * 0.5 + 0.5
    return Color3.new(r, g, b)
end

local playerCountText = Drawing.new("Text")
playerCountText.Visible = false
playerCountText.Color = Color3.new(1, 1, 1)
playerCountText.Size = 20
playerCountText.Font = Drawing.Fonts.Monospace
playerCountText.Outline = true
playerCountText.OutlineColor = Color3.new(0, 0, 0)
playerCountText.Position = Vector2.new(Camera.ViewportSize.X / 2, 10)

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = getgenv().FOVColor
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Radius = getgenv().FOVRadius
fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local function updatePlayerCount()
    local playerCount = #Players:GetPlayers()
    playerCountText.Text = "在线玩家: " .. playerCount
    playerCountText.Visible = getgenv().ESPEnabled and getgenv().ShowPlayerCount

    local time = tick()
    playerCountText.Color = getGradientColor(time)
end

local function updateFOV()
    fovCircle.Visible = getgenv().ShowFOV
    fovCircle.Color = getgenv().FOVColor
    fovCircle.Radius = getgenv().FOVRadius
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

local ESPComponents = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = getgenv().BoxColor
    box.Thickness = getgenv().BoxThickness
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = getgenv().HealthBarColor
    healthBar.Thickness = 1
    healthBar.Filled = true

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Visible = false
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Transparency = 0.5
    healthBarBackground.Thickness = 1
    healthBarBackground.Filled = true

    local healthBarBorder = Drawing.new("Square")
    healthBarBorder.Visible = false
    healthBarBorder.Color = Color3.new(1, 1, 1)
    healthBarBorder.Thickness = 1
    healthBarBorder.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = getgenv().HealthTextColor
    healthText.Size = 14
    healthText.Font = Drawing.Fonts.Monospace
    healthText.Outline = true
    healthText.OutlineColor = Color3.new(0, 0, 0)

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = getgenv().NameColor
    nameText.Size = 16
    nameText.Font = Drawing.Fonts.Monospace
    nameText.Outline = true
    nameText.OutlineColor = Color3.new(0, 0, 0)

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = getgenv().DistanceColor
    distanceText.Size = 14
    distanceText.Font = Drawing.Fonts.Monospace
    distanceText.Outline = true
    distanceText.OutlineColor = Color3.new(0, 0, 0)

    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Color = getgenv().WeaponColor
    weaponText.Size = 14
    weaponText.Font = Drawing.Fonts.Monospace
    weaponText.Outline = true
    weaponText.OutlineColor = Color3.new(0, 0, 0)

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = getgenv().TracerColor
    tracer.Thickness = getgenv().TracerThickness

    local arrow = Drawing.new("Triangle")
    arrow.Visible = false
    arrow.Color = getgenv().ArrowColor
    arrow.Filled = true
    arrow.Thickness = 1

    local skeletonLines = {}
    local skeletonPoints = {}

    local function createSkeleton()
        for i = 1, 15 do
            skeletonLines[i] = Drawing.new("Line")
            skeletonLines[i].Visible = false
            skeletonLines[i].Color = getgenv().SkeletonColor
            skeletonLines[i].Thickness = getgenv().SkeletonThickness
        end

        skeletonPoints["Head"] = Drawing.new("Circle")
        skeletonPoints["Head"].Visible = false
        skeletonPoints["Head"].Color = Color3.new(1, 0.5, 0)
        skeletonPoints["Head"].Thickness = 2
        skeletonPoints["Head"].Filled = true
        skeletonPoints["Head"].Radius = 4
    end

    createSkeleton()

    local lastHealth = 100
    local healthChangeTime = 0
    local smoothHealth = 100

    ESPComponents[player] = {
        box = box,
        healthBar = healthBar,
        healthBarBackground = healthBarBackground,
        healthBarBorder = healthBarBorder,
        healthText = healthText,
        nameText = nameText,
        distanceText = distanceText,
        weaponText = weaponText,
        tracer = tracer,
        arrow = arrow,
        skeletonLines = skeletonLines,
        skeletonPoints = skeletonPoints
    }

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            local weaponName = "无武器"
            for _, tool in ipairs(character:GetChildren()) do
                if tool:IsA("Tool") then
                    weaponName = tool.Name
                    break
                end
            end

            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
                box.Color = getgenv().BoxColor
                box.Thickness = getgenv().BoxThickness
            else
                box.Visible = false
            end

            if getgenv().ShowHealth and onScreen then
                local healthPercentage = humanoid.Health / humanoid.MaxHealth
                local barWidth = 50
                local barHeight = 5
                local barX = headPos.X - barWidth / 2
                local barY = headPos.Y - 20

                healthBarBackground.Size = Vector2.new(barWidth, barHeight)
                healthBarBackground.Position = Vector2.new(barX, barY)
                healthBarBackground.Visible = true

                healthBarBorder.Size = Vector2.new(barWidth, barHeight)
                healthBarBorder.Position = Vector2.new(barX, barY)
                healthBarBorder.Visible = true

                smoothHealth = smoothHealth + (humanoid.Health - smoothHealth) * 0.1
                local smoothHealthPercentage = smoothHealth / humanoid.MaxHealth

                healthBar.Size = Vector2.new(barWidth * smoothHealthPercentage, barHeight)
                healthBar.Position = Vector2.new(barX, barY)

                if smoothHealthPercentage >= 0.8 then
                    healthBar.Color = Color3.new(0, 1, 0)
                elseif smoothHealthPercentage >= 0.5 then
                    healthBar.Color = Color3.new(1, 1, 0)
                elseif smoothHealthPercentage >= 0.2 then
                    healthBar.Color = Color3.new(1, 0.5, 0)
                else
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthBar.Visible = true

                if humanoid.Health ~= lastHealth then
                    healthChangeTime = tick()
                    lastHealth = humanoid.Health
                end

                if tick() - healthChangeTime < 0.5 then
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthText.Position = Vector2.new(barX + barWidth + 5, barY - 5)
                healthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                healthText.Visible = true
            else
                healthBar.Visible = false
                healthBarBackground.Visible = false
                healthBarBorder.Visible = false
                healthText.Visible = false
            end

            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(headPos.X, headPos.Y - 35)
                nameText.Text = player.Name
                nameText.Visible = true

                if getgenv().ShowDistance then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    distanceText.Position = Vector2.new(headPos.X, headPos.Y + 10)
                    distanceText.Text = math.floor(distance) .. "m"
                    distanceText.Visible = true
                else
                    distanceText.Visible = false
                end

                if getgenv().ShowWeapon then
                    weaponText.Position = Vector2.new(headPos.X, headPos.Y - 50)
                    weaponText.Text = weaponName
                    weaponText.Visible = true
                else
                    weaponText.Visible = false
                end
            else
                nameText.Visible = false
                distanceText.Visible = false
                weaponText.Visible = false
            end

            if getgenv().ShowTracer then
                local head = character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        tracer.To = Vector2.new(headPos.X, headPos.Y)
                        tracer.Visible = true
                        tracer.Color = getgenv().TracerColor
                        tracer.Thickness = getgenv().TracerThickness
                        
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance < 20 then
                            tracer.Color = Color3.new(0, 1, 0)
                        elseif distance < 50 then
                            tracer.Color = Color3.new(1, 1, 0) 
                        else
                            tracer.Color = getgenv().TracerColor 
                        end
                    else
                        tracer.Visible = false
                    end
                else
                    tracer.Visible = false
                end
            else
                tracer.Visible = false
            end

            if getgenv().OutOfViewArrows and not onScreen then
                local direction = (rootPart.Position - Camera.CFrame.Position).Unit
                local dotProduct = Camera.CFrame.RightVector:Dot(direction)
                local crossProduct = Camera.CFrame.RightVector:Cross(direction)
                
                local screenPosition = Vector2.new(
                    Camera.ViewportSize.X / 2 + dotProduct * Camera.ViewportSize.X / 3,
                    Camera.ViewportSize.Y / 2 - crossProduct.Y * Camera.ViewportSize.Y / 3
                )
                
                screenPosition = Vector2.new(
                    math.clamp(screenPosition.X, getgenv().ArrowSize, Camera.ViewportSize.X - getgenv().ArrowSize),
                    math.clamp(screenPosition.Y, getgenv().ArrowSize, Camera.ViewportSize.Y - getgenv().ArrowSize)
                )
                
                local angle = math.atan2(screenPosition.Y - Camera.ViewportSize.Y / 2, screenPosition.X - Camera.ViewportSize.X / 2)
                
                arrow.PointA = screenPosition
                arrow.PointB = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle - 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle - 0.5)
                )
                arrow.PointC = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle + 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle + 0.5)
                )
                
                arrow.Color = getgenv().ArrowColor
                arrow.Visible = true
            else
                arrow.Visible = false
            end

            if getgenv().ShowSkeleton and onScreen then
                local head = character:FindFirstChild("Head")
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftUpperArm")
                local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")
                local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftUpperLeg")
                local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightUpperLeg")
                
                if head and torso and leftArm and rightArm and leftLeg and rightLeg then
                    local headPos = Camera:WorldToViewportPoint(head.Position)
                    local torsoPos = Camera:WorldToViewportPoint(torso.Position)
                    local leftArmPos = Camera:WorldToViewportPoint(leftArm.Position)
                    local rightArmPos = Camera:WorldToViewportPoint(rightArm.Position)
                    local leftLegPos = Camera:WorldToViewportPoint(leftLeg.Position)
                    local rightLegPos = Camera:WorldToViewportPoint(rightLeg.Position)

                    skeletonPoints["Head"].Position = Vector2.new(headPos.X, headPos.Y)
                    skeletonPoints["Head"].Visible = true

                    skeletonLines[1].From = Vector2.new(headPos.X, headPos.Y)
                    skeletonLines[1].To = Vector2.new(torsoPos.X, torsoPos.Y) 
                    skeletonLines[1].Visible = true

                    skeletonLines[2].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[2].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
                    skeletonLines[2].Visible = true

                    skeletonLines[3].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[3].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
                    skeletonLines[3].Visible = true

                    skeletonLines[4].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[4].To = Vector2.new(leftLegPos.X, leftLegPos.Y)
                    skeletonLines[4].Visible = true

                    skeletonLines[5].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[5].To = Vector2.new(rightLegPos.X, rightLegPos.Y)
                    skeletonLines[5].Visible = true

                    if character:FindFirstChild("LeftLowerArm") then
                        local leftLowerArmPos = Camera:WorldToViewportPoint(character.LeftLowerArm.Position)
                        skeletonLines[6].From = Vector2.new(leftArmPos.X, leftArmPos.Y)
                        skeletonLines[6].To = Vector2.new(leftLowerArmPos.X, leftLowerArmPos.Y)
                        skeletonLines[6].Visible = true
                    end

                    if character:FindFirstChild("RightLowerArm") then
                        local rightLowerArmPos = Camera:WorldToViewportPoint(character.RightLowerArm.Position)
                        skeletonLines[7].From = Vector2.new(rightArmPos.X, rightArmPos.Y)
                        skeletonLines[7].To = Vector2.new(rightLowerArmPos.X, rightLowerArmPos.Y)
                        skeletonLines[7].Visible = true
                    end

                    if character:FindFirstChild("LeftLowerLeg") then
                        local leftLowerLegPos = Camera:WorldToViewportPoint(character.LeftLowerLeg.Position)
                        skeletonLines[8].From = Vector2.new(leftLegPos.X, leftLegPos.Y)
                        skeletonLines[8].To = Vector2.new(leftLowerLegPos.X, leftLowerLegPos.Y)
                        skeletonLines[8].Visible = true
                    end

                    if character:FindFirstChild("RightLowerLeg") then
                        local rightLowerLegPos = Camera:WorldToViewportPoint(character.RightLowerLeg.Position)
                        skeletonLines[9].From = Vector2.new(rightLegPos.X, rightLegPos.Y)
                        skeletonLines[9].To = Vector2.new(rightLowerLegPos.X, rightLowerLegPos.Y)
                        skeletonLines[9].Visible = true
                    end
                else
                    for _, line in pairs(skeletonLines) do
                        line.Visible = false
                    end
                    for _, point in pairs(skeletonPoints) do
                        point.Visible = false
                    end
                end
            else
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                for _, point in pairs(skeletonPoints) do
                    point.Visible = false
                end
            end
        else
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
        end
    end)
end

local radar = Drawing.new("Circle")
radar.Visible = false
radar.Color = Color3.new(1, 1, 1)
radar.Thickness = 2
radar.Filled = false
radar.Radius = 100
radar.Position = Vector2.new(Camera.ViewportSize.X - 120, 120)

local radarCenter = Drawing.new("Circle")
radarCenter.Visible = false
radarCenter.Color = Color3.new(1, 1, 1)
radarCenter.Thickness = 2
radarCenter.Filled = true
radarCenter.Radius = 3
radarCenter.Position = radar.Position

local radarDirection = Drawing.new("Line")
radarDirection.Visible = false
radarDirection.Color = Color3.new(1, 1, 1)
radarDirection.Thickness = 2

local radarGridLines = {}
for i = 1, 4 do
    radarGridLines[i] = Drawing.new("Line")
    radarGridLines[i].Visible = false
    radarGridLines[i].Color = Color3.new(0.5, 0.5, 0.5)
    radarGridLines[i].Thickness = 1
end

local radarRangeText = Drawing.new("Text")
radarRangeText.Visible = false
radarRangeText.Color = Color3.new(1, 1, 1)
radarRangeText.Size = 14
radarRangeText.Font = Drawing.Fonts.Monospace
radarRangeText.Outline = true
radarRangeText.OutlineColor = Color3.new(0, 0, 0)
radarRangeText.Text = "100m"

local radarPlayers = {}

local function updateRadar()
    if not getgenv().ShowRadar then
        radar.Visible = false
        radarCenter.Visible = false
        radarDirection.Visible = false
        radarRangeText.Visible = false
        
        for _, line in pairs(radarGridLines) do
            line.Visible = false
        end
        
        for _, player in pairs(radarPlayers) do
            if player.dot then player.dot.Visible = false end
            if player.direction then player.direction.Visible = false end
            if player.name then player.name.Visible = false end
        end
        return
    end

    radar.Visible = true
    radarCenter.Visible = true
    radarDirection.Visible = true
    radarRangeText.Visible = true
    
    radarRangeText.Position = Vector2.new(radar.Position.X, radar.Position.Y + radar.Radius + 5)
    
    for i = 1, 4 do
        local angle = (i-1) * math.pi / 2
        radarGridLines[i].From = radar.Position
        radarGridLines[i].To = Vector2.new(
            radar.Position.X + math.cos(angle) * radar.Radius,
            radar.Position.Y + math.sin(angle) * radar.Radius
        )
        radarGridLines[i].Visible = true
    end
    
    radarDirection.From = radar.Position
    radarDirection.To = Vector2.new(radar.Position.X, radar.Position.Y - radar.Radius)

    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
            local rootPart = player.Character.HumanoidRootPart
            local relativePosition = rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position
            
            local radarX = radar.Position.X + (relativePosition.X / 10)
            local radarY = radar.Position.Y + (relativePosition.Z / 10)
            
            local distanceFromCenter = math.sqrt((radarX - radar.Position.X)^2 + (radarY - radar.Position.Y)^2)
            
            if distanceFromCenter > radar.Radius then
                local angle = math.atan2(radarY - radar.Position.Y, radarX - radar.Position.X)
                radarX = radar.Position.X + math.cos(angle) * radar.Radius
                radarY = radar.Position.Y + math.sin(angle) * radar.Radius
            end
            
            if not radarPlayers[player] then
                radarPlayers[player] = {
                    dot = Drawing.new("Circle"),
                    direction = Drawing.new("Line"),
                    name = Drawing.new("Text")
                }
                
                radarPlayers[player].dot.Thickness = 1
                radarPlayers[player].dot.Filled = true
                radarPlayers[player].dot.Radius = 4
                
                radarPlayers[player].direction.Thickness = 2
                radarPlayers[player].direction.Visible = true
                
                radarPlayers[player].name.Size = 12
                radarPlayers[player].name.Font = Drawing.Fonts.Monospace
                radarPlayers[player].name.Outline = true
                radarPlayers[player].name.OutlineColor = Color3.new(0, 0, 0)
            end
            
            if player.Team == LocalPlayer.Team then
                radarPlayers[player].dot.Color = Color3.new(0, 1, 0)  
                radarPlayers[player].direction.Color = Color3.new(0, 0.8, 0)
                radarPlayers[player].name.Color = Color3.new(0, 1, 0)
            else
                radarPlayers[player].dot.Color = Color3.new(1, 0, 0) 
                radarPlayers[player].direction.Color = Color3.new(1, 0, 0)
                radarPlayers[player].name.Color = Color3.new(1, 0, 0)
            end
            
            radarPlayers[player].dot.Position = Vector2.new(radarX, radarY)
            radarPlayers[player].dot.Visible = true
            
            local lookVector = rootPart.CFrame.LookVector
            local directionLength = 10
            radarPlayers[player].direction.From = Vector2.new(radarX, radarY)
            radarPlayers[player].direction.To = Vector2.new(
                radarX + lookVector.X * directionLength,
                radarY + lookVector.Z * directionLength
            )
            
            radarPlayers[player].name.Position = Vector2.new(radarX, radarY - 15)
            radarPlayers[player].name.Text = player.Name
            radarPlayers[player].name.Visible = distanceFromCenter <= radar.Radius
        elseif radarPlayers[player] then
            radarPlayers[player].dot.Visible = false
            radarPlayers[player].direction.Visible = false
            radarPlayers[player].name.Visible = false
        end
    end
    
    for player, components in pairs(radarPlayers) do
        if not Players:FindFirstChild(player.Name) then
            components.dot.Visible = false
            components.direction.Visible = false
            components.name.Visible = false
            radarPlayers[player] = nil
        end
    end
end

RunService.RenderStepped:Connect(updateRadar)
RunService.RenderStepped:Connect(updatePlayerCount)
RunService.RenderStepped:Connect(updateFOV)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPComponents[player] then
        for _, component in pairs(ESPComponents[player]) do
            if typeof(component) == "table" then
                for _, drawing in pairs(component) do
                    drawing:Remove()
                end
            else
                component:Remove()
            end
        end
        ESPComponents[player] = nil
    end
end)

C:Toggle({
    Title = "透视开启", 
    Value = false, 
    Callback = function(Value)
        getgenv().ESPEnabled = Value
    end
})

C:Toggle({
    Title = "模型透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowSkeleton = Value
    end
})

C:Toggle({
    Title = "方框透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowBox = Value
    end
})



C:Toggle({
    Title = "射线透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowTracer = Value
    end
})

C:Toggle({
    Title = "名字透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowName = Value
    end
})


local blockFDMG = false
local oldNamecall = nil
local isHookActive = false

local function initHook()
    if isHookActive then return end
    
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if blockFDMG and getnamecallmethod() == "FireServer" and tostring(self) == "FDMG" then
            return nil
        end
        return oldNamecall(self, ...)
    end)
    
    isHookActive = true
end

local function removeHook()
    if not isHookActive or not oldNamecall then return end
    
    hookmetamethod(game, "__namecall", oldNamecall)
    oldNamecall = nil
    isHookActive = false
end

D:Button({
    Title = "坠落无伤害",
    Value = false,
    Callback = function(value)
        blockFDMG = value
        
        if value then
            if not isHookActive then
                initHook()
            end
        else
            if isHookActive then
                removeHook()
            end
        end
    end
})

D:Button({
    Title = "删除所有门",
    Callback = function()
       for k,v in pairs(Workspace.Tycoon.Tycoons:GetChildren()) do
            for x,y in pairs(v.PurchasedObjects:GetChildren()) do
                if(y.Name:find("Door") or y.Name:find("Gate")) then y:destroy(); end;
            end;
        end;
    end})

D:Toggle({
    Title = "无cd状态",
    Callback = function()
        local ContextActions = game:GetService("Workspace")[game.Players.LocalPlayer.Name].ContextActions
        local ContextMain = require(ContextActions.ContextMain)
        
        ContextMain:New({
            RobPlayerLength = 0.1,
            FixWallLength = 0.1,
            CrackSafeLength = 0.1,
            RobSafeLength = 0.1,
            RobRegisterLength = 0.1,
            PickCellLength = 0.1,
            SkinAnimalLength = 0.1
        }, 200, {
            "Get out of my shop! Outlaws are not welcome here!",
            "Hey, scoundrel! Get out before I call the sheriff!",
            "You're an outlaw! We don't serve your type here!"
        }, {
            "This here's a bandit camp! Get out!",
            "Get lost, cowboy!",
            "Are you an outlaw? Didn't think so! Scram!"
        })
    end
})

local deathPosition = nil
local deathOrientation = nil

local function setupDeathTracking()
    local player = game.Players.LocalPlayer
    
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        
        humanoid.Died:Connect(function()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                deathPosition = rootPart.Position
                deathOrientation = rootPart.CFrame - rootPart.Position
                print("死亡位置已记录: " .. tostring(deathPosition))
            end
        end)
    end)
    
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    deathPosition = rootPart.Position
                    deathOrientation = rootPart.CFrame - rootPart.Position
                    print("死亡位置已记录: " .. tostring(deathPosition))
                end
            end)
        end
    end
end

setupDeathTracking()

D:Button({
    Title = "原地重生",
    Description = "在死亡位置重生角色",
    Callback = function()
        if not deathPosition then
            return
        end
        
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then

                return
            end
        end
        
        local connection
        connection = player.CharacterAdded:Connect(function(newCharacter)
            local newRootPart = newCharacter:WaitForChild("HumanoidRootPart", 5)
            local newHumanoid = newCharacter:WaitForChild("Humanoid", 5)
            
            if newRootPart and newHumanoid then
                wait(0.5)
                
                newRootPart.CFrame = CFrame.new(deathPosition) * deathOrientation
                
                
                deathPosition = nil
                deathOrientation = nil
            end
            
            if connection then
                connection:Disconnect()
            end
        end)
        
        if not character then
            local currentTeam = player.Team
            player.Team = nil
            wait(0.1)
            player.Team = currentTeam
        else
            player:LoadCharacter()
        end
        
        delay(10, function()
            if connection then
                connection:Disconnect()
                WindUI:Notify({
                    Title = "超时",
                    Content = "重生过程超时",
                    Duration = 3,
                })
            end
        end)
    end
})

local fov = 0
local maxDistance = 50
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Cam = workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 0.5
FOVring.Color = Color3.new(1, 1, 1)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local autoAimEnabled = false
local fovVisible = false
local ignoreCover = false
local aimTarget = "敌对"
local aimPosition = "Head"
local fovColor = Color3.new(1, 1, 1)
local rainbowEnabled = false

local function updateDrawings()
    FOVring.Position = Cam.ViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2
    
    for _, player in ipairs(Plr:GetPlayers()) do
        if player ~= LP and (aimTarget == "全部" or player.TeamColor ~= LP.TeamColor) then
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local part = character and character:FindFirstChild(trg_part)
            
            if part and humanoid and humanoid.Health > 0 then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
                
                if distance < last and isVisible and distance < fov then
                    if (part.Position - Cam.CFrame.Position).Magnitude <= tonumber(maxDistance) then
                        if not ignoreCover or #Cam:GetPartsObscuringTarget({part.Position}, {character, LP.Character}) == 0 then
                            last = distance
                            nearest = player
                        end
                    end
                end
            end
        end
    end
    
    return nearest
end

Tg(E, "玩家自瞄", false, function(t)
    autoAimEnabled = t
end)

Tg(E, "显示范围", false, function(t)
    fovVisible = t
    FOVring.Visible = fovVisible
end)

Tg(E, "掩体不瞄", false, function(t)
    ignoreCover = t
end)

Sld(E, "自瞄范围", 1, 200, fov, function(s)
    fov = tonumber(s)
    FOVring.Radius = fov
end)

Sld(E, "自瞄距离", 1, 1200, maxDistance, function(s)
    maxDistance = tonumber(s)
end)

Sld(E, "自瞄圈粗细", 1, 10, FOVring.Thickness, function(s)
    FOVring.Thickness = tonumber(s)
end)

E:Dropdown({
    Title = "选择自瞄目标", 
    Values = {"敌对", "全部"}, 
    Value = "敌对", 
    Callback = function(value) 
        aimTarget = value 
    end
})

E:Dropdown({
    Title = "选择自瞄位置", 
    Values = {"头部", "躯干"}, 
    Value = "头部", 
    Callback = function(value)
        if value == "头部" then
            aimPosition = "Head"
        elseif value == "躯干" then
            aimPosition = "Torso"
        end
    end
})

E:Dropdown({
    Title = "选择圈的颜色", 
    Values = {"红", "黄", "蓝", "绿", "青", "紫", "彩虹"}, 
    Value = "红", 
    Callback = function(value)
        if value == "彩虹" then
            rainbowEnabled = true
        else
            rainbowEnabled = false
            local colors = {
                ["红"] = Color3.new(1, 0, 0),
                ["黄"] = Color3.new(1, 1, 0),
                ["蓝"] = Color3.new(0, 0, 1),
                ["绿"] = Color3.new(0, 1, 0),
                ["青"] = Color3.new(0, 1, 1),
                ["紫"] = Color3.new(1, 0, 1)
            }
            FOVring.Color = colors[value]
        end
    end
})

local excludeTargetsDropdown = F:Dropdown({
    Title = "不攻击的玩家(多选)", 
    Values = PlayerList, 
    Value = {}, 
    Multi = true, 
    AllowNone = true, 
    Callback = function(values) 
        C_NPlayers = values or {} 
    end
})

Btn(F, "刷新玩家列表", function()
    PlayerList = {}
    for _, player in ipairs(Plr:GetPlayers()) do
        if player ~= LP then
            table.insert(PlayerList, player.Name)
        end
    end
    excludeTargetsDropdown:Refresh(PlayerList)
end)

Btn(F, "获取RPG", function()
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local TycoonsFolder = workspace.Tycoon.Tycoons
    local savedPosition
    
    local function findNearestTeleportPosition()
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local playerPosition = humanoidRootPart.Position
        local closestDistance = math.huge
        local closestCFrame = nil
        
        for _, tycoonModel in ipairs(TycoonsFolder:GetChildren()) do
            if tycoonModel:IsA("Model") then
                local purchasedObjects = tycoonModel:FindFirstChild("PurchasedObjects")
                if purchasedObjects then
                    local rpgGiver = purchasedObjects:FindFirstChild("RPG Giver")
                    if rpgGiver then
                        local prompt = rpgGiver:FindFirstChild("Prompt")
                        if prompt and prompt:IsA("BasePart") then
                            local distance = (playerPosition - prompt.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestCFrame = prompt.CFrame
                            end
                        end
                    end
                end
            end
        end
        
        return closestCFrame
    end
    
    local function teleportPlayer()
        local character = localPlayer.Character
        if not character then
            return
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            savedPosition = humanoidRootPart.CFrame
        end
        
        local targetCFrame = findNearestTeleportPosition()
        if targetCFrame then
            humanoidRootPart.CFrame = targetCFrame
            
            spawn(function()
                while wait(0.5) do
                    if not character.Parent then
                        break
                    end
                    
                    local backpack = localPlayer:FindFirstChild("Backpack")
                    if backpack and backpack:FindFirstChild("RPG") then
                        humanoidRootPart.CFrame = savedPosition
                        break
                    end
                end
            end)
        else
            WindUI:Notify({
                Title = "ERROR",
                Content = "未能找到附近的RPG",
                Duration = 4,
            })
        end
    end
    
    teleportPlayer()
end)

local loopActive = false
local rpgAttackThread = nil

Tg(F, "RPG轰炸", false, function(t)
    loopActive = t
    
    if t then
        if rpgAttackThread then
            coroutine.close(rpgAttackThread)
            rpgAttackThread = nil
        end
        
        rpgAttackThread = coroutine.create(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RocketSystem = ReplicatedStorage:WaitForChild("RocketSystem")
            local FireRocket = RocketSystem.Events.FireRocket
            local RocketHit = RocketSystem.Events.RocketHit
            local attackPhase = "attack"
            local phaseStartTime = os.clock()
            
            while loopActive do
                local currentTime = os.clock()
                local elapsed = currentTime - phaseStartTime
                
                if not loopActive then break end
                
                if attackPhase == "attack" then
                    if elapsed >= 3 then
                        attackPhase = "pause"
                        phaseStartTime = os.clock()
                    else
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local attackPosition = character.HumanoidRootPart.Position + Vector3.new(0, 1000, 0)
                            local weapon = character:FindFirstChild("RPG")
                            
                            if weapon then
                                for _, player in ipairs(Players:GetPlayers()) do
                                    if player ~= LocalPlayer and player.Character and not table.find(C_NPlayers, player.Name) then
                                        local target = player.Character:FindFirstChild("HumanoidRootPart")
                                        if target then
                                            FireRocket:InvokeServer(Vector3.new(), weapon, weapon, attackPosition)
                                            RocketHit:FireServer(attackPosition, Vector3.new(), weapon, weapon, target, nil, "asdfghvcqawRocket4")
                                            task.wait(0.3)
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif attackPhase == "pause" then
                    if elapsed >= 2 then
                        attackPhase = "attack"
                        phaseStartTime = os.clock()
                    end
                end
                
                task.wait(0.1)
            end
        end)
        
        coroutine.resume(rpgAttackThread)
    else
        if rpgAttackThread then
            coroutine.close(rpgAttackThread)
            rpgAttackThread = nil
        end
    end
end)

local shieldAttackActive = false
local shieldAttackThread = nil

Tg(F, "护盾攻击", false, function(t)
    shieldAttackActive = t
    
    if t then
        if shieldAttackThread then
            coroutine.close(shieldAttackThread)
            shieldAttackThread = nil
        end
        
        shieldAttackThread = coroutine.create(function()
            while shieldAttackActive do
                if not shieldAttackActive then break end
                
                local rpg = LP.Character and LP.Character:FindFirstChild("RPG")
                if not rpg then
                    task.wait(1)
                    continue
                end
                
                local attackPosition = LP.Character.HumanoidRootPart.Position + Vector3.new(0, 1000, 0)
                local tycoonFolder = workspace:WaitForChild("Tycoon"):WaitForChild("Tycoons")
                
                for _, tycoon in ipairs(tycoonFolder:GetChildren()) do
                    if not shieldAttackActive then break end
                    
                    if tycoon:FindFirstChild("Owner") and tycoon.Owner.Value ~= LP then
                        local shield = tycoon:FindFirstChild("PurchasedObjects", true) and
                                      tycoon.PurchasedObjects:FindFirstChild("Base Shield", true) and
                                      tycoon.PurchasedObjects["Base Shield"]:FindFirstChild("Shield", true) and
                                      tycoon.PurchasedObjects["Base Shield"].Shield:FindFirstChild("Shield4", true)
                        
                        if shield then
                            local fireArgs = { Vector3.new(0, 0, 0), rpg, rpg, attackPosition }
                            
                            for _ = 1, 2 do
                                local hitArgs = {attackPosition, Vector3.new(0, -1, 0), rpg, rpg, shield, nil, string.format("%sRocket%d", string.char(math.random(65, 90)), math.random(1, 1000))}
                                RocketSystem.Events.RocketHit:FireServer(unpack(hitArgs))
                                RocketSystem.Events.FireRocket:InvokeServer(unpack(fireArgs))
                                task.wait(0.3)
                            end
                        end
                    end
                end
                
                task.wait(0.3)
            end
        end)
        
        coroutine.resume(shieldAttackThread)
    else
        if shieldAttackThread then
            coroutine.close(shieldAttackThread)
            shieldAttackThread = nil
        end
    end
end)

RunService.RenderStepped:Connect(function()
    updateDrawings()
    
    if autoAimEnabled then
        local closestPlayer = getClosestPlayerInFOV(aimPosition)
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild(aimPosition) then
            lookAt(closestPlayer.Character[aimPosition].Position)
        end
    end
    
    if rainbowEnabled then
        local t = tick() * 2
        local r = math.abs(math.sin(t))
        local g = math.abs(math.sin(t + 2 * math.pi / 3))
        local b = math.abs(math.sin(t + 4 * math.pi / 3))
        FOVring.Color = Color3.new(r, g, b)
    end
end)

pcall(function()
getgenv().autoTeleport = false 
local function getDistance(objectPosition)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPosition = player.Character.HumanoidRootPart.Position
        return (objectPosition - playerPosition).Magnitude
    end
    return math.huge
end

local function getClosestNeon()
    local player = game.Players.LocalPlayer
    local teamName = player.Team.Name
    local buttonsFolder = workspace.Tycoon.Tycoons:FindFirstChild(teamName).UnpurchasedButtons

    if buttonsFolder then
        local closestNeon = nil
        local closestDistance = math.huge 

        for _, button in pairs(buttonsFolder:GetChildren()) do
            if not button:FindFirstChild("Mission") then
                local neon = button:FindFirstChild("Neon")
                local price = button:FindFirstChild("Price")

                if neon and price and price.Value ~= 0 then
                    local distance = getDistance(neon.Position)
                    if distance < closestDistance then
                        closestNeon = neon
                        closestDistance = distance
                    end
                end
            end
        end

        return closestNeon
    end

    return nil
end

local function teleportToClosestNeon()
    local player = game.Players.LocalPlayer

    while getgenv().autoTeleport do
        wait(0.2) 

        local closestNeon = getClosestNeon()

        if closestNeon then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(closestNeon.Position)
            end
        else
            warn("no neon found")
        end
    end
end

local function checkTeleportToggle()
    while true do
        wait(0.5)
        if getgenv().autoTeleport then
            teleportToClosestNeon()
        end
    end
end

spawn(checkTeleportToggle)
end)

pcall(function()
    local ps = game:GetService("Players")
    local ws = game:GetService("Workspace")
    local rs = game:GetService("ReplicatedStorage")
    local rss = game:GetService("RunService")

    local lp = ps.LocalPlayer
    local crateRemote = rs:FindFirstChild("TankCrates") and rs.TankCrates:FindFirstChild("WeldCrate")
    local hrp
    getgenv().auto = false
    local currentCrate 
    local lastCrateCheck = 0
    local crateCheckInterval = 5 

    local function setupCharacter()
        if lp.Character then
            hrp = lp.Character:WaitForChild("HumanoidRootPart")
        end
    end

    setupCharacter()
    lp.CharacterAdded:Connect(function()
        setupCharacter()
    end)

    local function tp(target)
        if not getgenv().auto or not target or not hrp then return end
        
        local cf = typeof(target) == "CFrame" and target or target.CFrame
        local success = pcall(function()
            local randomOffset = Vector3.new(
                math.random(-2, 2),
                0,
                math.random(-2, 2)
            )
            hrp.CFrame = cf + randomOffset
        end)
        
        if not success then
            warn("Teleport failed")
        end
    end

    local function firePrompt(prompt, crate)
        if not prompt then return end
        
        prompt.MaxActivationDistance = 10
        fireproximityprompt(prompt, 1)
        
        if crate and crateRemote then
            task.wait(0.1) 
            pcall(crateRemote.InvokeServer, crateRemote, crate)
        end
    end

    local function findCrate()
        local crateWorkspace = ws:FindFirstChild("Game Systems") and ws["Game Systems"]:FindFirstChild("Crate Workspace")
        if not crateWorkspace then return nil end
        
        for _, c in ipairs(crateWorkspace:GetChildren()) do
            if c:GetAttribute("Owner") ~= lp.Name then
                return c
            end
        end
        return nil
    end

    local function getTycoon()
        local leaderstats = lp:FindFirstChild("leaderstats")
        if not leaderstats then return nil end
        
        local team = leaderstats:FindFirstChild("Team")
        if not team then return nil end
        
        return ws.Tycoon.Tycoons:FindFirstChild(team.Value)
    end

    local function getSellPoint(tycoon)
        if not tycoon then return nil end
        
        local essentials = tycoon:FindFirstChild("Essentials")
        if not essentials then return nil end
        
        local oilCollector = essentials:FindFirstChild("Oil Collector")
        if not oilCollector then return nil end
        
        local cratePromptPart = oilCollector:FindFirstChild("CratePromptPart")
        if not cratePromptPart then return nil end
        
        return cratePromptPart
    end

    local function getWaitPoint(tycoon)
        if not tycoon then return nil end
        
        local floor = tycoon:FindFirstChild("Floor")
        if not floor then return nil end
        
        local floorOrigin = floor:FindFirstChild("FloorOrigin")
        if not floorOrigin then return nil end
        
        return CFrame.new(
            floorOrigin.Position.X + math.random(-10, 10),
            floorOrigin.Position.Y + 3,
            floorOrigin.Position.Z + math.random(-10, 10)
        )
    end

    local function sellCrate(tycoon)
        if not tycoon then return false end
        
        local sellPoint = getSellPoint(tycoon)
        if not sellPoint then return false end
        
        tp(sellPoint)
        task.wait(0.1) 
        
        local sellPrompt = sellPoint:FindFirstChild("SellPrompt")
        if sellPrompt then
            firePrompt(sellPrompt)
            task.wait(0.1)
            return true
        end
        
        return false
    end

    function autofarmLoop()
        while getgenv().auto and task.wait(0.1) do
            local tycoon = getTycoon()
            if not tycoon then continue end

            local holdingCrate = false
            local crateWorkspace = ws:FindFirstChild("Game Systems") and ws["Game Systems"]:FindFirstChild("Crate Workspace")
            if crateWorkspace then
                for _, crate in ipairs(crateWorkspace:GetChildren()) do
                    if crate:GetAttribute("Holding") == lp.Name then
                        holdingCrate = true
                        currentCrate = crate
                        break
                    end
                end
            end

            if holdingCrate then
                if sellCrate(tycoon) then
                    currentCrate = nil
                    task.wait(1)
                end
            else
                local currentTime = tick()
                if currentTime - lastCrateCheck > crateCheckInterval then
                    lastCrateCheck = currentTime
                    
                    local nextCrate = findCrate()
                    if nextCrate then
                        currentCrate = nextCrate
                        tp(nextCrate)
                        task.wait(0.5)
                        
                        local prompt = nextCrate:FindFirstChild("StealPrompt")
                        if prompt then
                            firePrompt(prompt, nextCrate)
                            task.wait(0.01) 
                        end
                    else
                        local waitPoint = getWaitPoint(tycoon)
                        if waitPoint then
                            tp(waitPoint)
                            task.wait(0.1)
                            if getgenv().auto then
                                local humanoid = lp.Character and lp.Character:FindFirstChild("Humanoid")
                                if humanoid then
                                    humanoid.Jump = true
                                    task.wait(0.2)
                                    humanoid.Jump = false
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    spawn(function()
        while task.wait(0.1) do
            if getgenv().auto then
                autofarmLoop()
            end
        end
    end)
end)
end

local function door()
local MovementTab = Window:Tab({Title = "人物", Icon = "running"})
    MovementTab:Button({
        Title = "禁用反作弊",
        Tooltip = "在电梯中使用，可能会有bug但通常有效",
        Callback = function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local currentRoom = LocalPlayer:GetAttribute("CurrentRoom")

            if currentRoom == 0 then
                if replicatesignal then
                    replicatesignal(LocalPlayer.Kill)
                    WindUI:Notify("反作弊", "反作弊已禁用，你可以飞行穿过一切", 10)
                else
                    WindUI:Notify("错误", "您的执行器不支持replicatesignal功能", 5)
                end
            else
                WindUI:Notify("提示", "你需要在电梯中使用此功能", 5)
            end
        end
    })
    MovementTab:Toggle({
        Title = "反作弊绕过",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local RemoteFolder = game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder")

            if not Value then
                if RemoteFolder and RemoteFolder:FindFirstChild("ClimbLadder") then
                    RemoteFolder.ClimbLadder:FireServer()
                end
            else
                WindUI:Notify("反作弊", "请上梯子以激活绕过", 9)
            end
        end
    })

   
    local LocalPlayer = game:GetService("Players").LocalPlayer
    LocalPlayer.Character:GetAttributeChangedSignal("Climbing"):Connect(function()
        if LocalPlayer.Character:GetAttribute("Climbing") == true then
            task.spawn(function()
                task.wait(0.1)
                LocalPlayer.Character:SetAttribute("Climbing", false)
                WindUI:Notify("反作弊", "已绕过反作弊，攀爬重置", 7)
            end)
        end
    end)

  
    MovementTab:Toggle({
        Title = "反作弊操纵",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local Camera = workspace.CurrentCamera
            local LocalPlayer = Players.LocalPlayer
            local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
            local UserInputService = game:GetService("UserInputService")
            local savedCamCFrame
            local camLocked = false
            local acmButton
            local acmButtonActive = false

            local BUTTON_SIZE = UDim2.new(0, 70, 0, 35)
            local BUTTON_POSITION = UDim2.new(1, -80, 0.5, -17)
            local BUTTON_COLOR = Color3.fromRGB(45, 45, 45)
            local BUTTON_ACTIVE_COLOR = Color3.fromRGB(90, 90, 90)
            local BUTTON_TEXT_COLOR = Color3.fromRGB(255, 255, 255)

            local function createACMButton()
                if not UserInputService.TouchEnabled or acmButton then
                    return
                end

                local screenGui = Instance.new("ScreenGui")
                screenGui.Name = "ACMGui"
                screenGui.ResetOnSpawn = false
                screenGui.Parent = PlayerGui

                local button = Instance.new("TextButton")
                button.Name = "ACMButton"
                button.Size = BUTTON_SIZE
                button.Position = BUTTON_POSITION
                button.BackgroundColor3 = BUTTON_COLOR
                button.Text = "ACM"
                button.TextColor3 = BUTTON_TEXT_COLOR
                button.Font = Enum.Font.GothamBold
                button.TextSize = 16
                button.BorderSizePixel = 0
                button.Parent = screenGui

                button.MouseButton1Down:Connect(function()
                    acmButtonActive = true
                    button.BackgroundColor3 = BUTTON_ACTIVE_COLOR
                end)

                button.MouseButton1Up:Connect(function()
                    acmButtonActive = false
                    button.BackgroundColor3 = BUTTON_COLOR
                end)

                acmButton = screenGui
            end

            local function removeACMButton()
                if acmButton then
                    acmButton:Destroy()
                    acmButton = nil
                    acmButtonActive = false
                end
            end

            if Value then
                createACMButton()
                
                RunService.RenderStepped:Connect(function()
                    local cam = workspace.CurrentCamera
                    if not cam then return end

                    local active = Value and acmButtonActive
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")

                    if active and hrp then
                        if not camLocked then
                            savedCamCFrame = cam.CFrame
                            cam.CameraType = Enum.CameraType.Scriptable
                            camLocked = true
                            hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 10000)
                        end

                        cam.CFrame = savedCamCFrame
                    elseif camLocked then
                        cam.CameraType = Enum.CameraType.Custom
                        camLocked = false
                        savedCamCFrame = nil
                    end
                end)
            else
                removeACMButton()
            end
        end
    })

    MovementTab:Keybind({
        Title = "反作弊操纵按键",
        Default = "T",
        Mode = "Hold",
        Callback = function(Value) end
    })
    
    local SpeedValue = 21
    local SpeedEnabled = false
    local SpeedConnection = nil
    local BypassLabel = nil

    MovementTab:Toggle({
        Title = "开启速度",
        Default = false,
        Tooltip = "将你的行走速度更改为设定值",
        Callback = function(Value)
            SpeedEnabled = Value
            local LocalPlayer = game:GetService("Players").LocalPlayer
            
            if Value then
                SpeedConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = SpeedValue
                    end
                end)
                WindUI:Notify("移速", "自定义移速已启用: " .. SpeedValue, 3)
            else
                if SpeedConnection then
                    SpeedConnection:Disconnect()
                    SpeedConnection = nil
                end
                WindUI:Notify("移速", "自定义移速已禁用", 3)
            end
        end
    })

    MovementTab:Slider({
        Title = "速度数值",
        Value = {Min = 0, Max = 100, Default = 21},
        Suffix = " 速度",
        Tooltip = "设置你的行走速度",
        Callback = function(Value)
            SpeedValue = Value
            if SpeedEnabled then
                WindUI:Notify("移速", "移速已更新: " .. Value, 2)
            end
        end
    })
    MovementTab:Toggle({
        Title = "即时加速度",
        Default = false,
        Tooltip = "移除改变方向时的减速效果",
        Callback = function(Value)
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local OldAccel = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
            
            local function updateAcceleration()
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CustomPhysicalProperties = Value and PhysicalProperties.new(100, 0, 0, 0, 0) or OldAccel
                end
            end

            if Value then
                updateAcceleration()
                WindUI:Notify("加速度", "即时加速度已启用", 3)
            else
                updateAcceleration()
                WindUI:Notify("加速度", "即时加速度已禁用", 3)
            end
            LocalPlayer.CharacterAdded:Connect(function()
                task.wait(1.5)
                updateAcceleration()
            end)
        end
    })
    local isFlying = false
    local flyConnections = {}
    local flyKeys = {
        W = false,
        A = false,
        S = false,
        D = false,
        Space = false,
        Shift = false,
    }
    local FlySpeed = 50

    local function startFly()
        local player = game.Players.LocalPlayer
        local character = player.Character

        if not character then
            return
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            return
        end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            return
        end
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = hrp

        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(1000000000, 1000000000, 1000000000)
        bg.P = 20000
        bg.D = 1000
        bg.Parent = hrp

        humanoid.AutoRotate = false
        humanoid.PlatformStand = true
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        local inputBegan = game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
            if gpe then return end
            
            if input.KeyCode == Enum.KeyCode.W then
                flyKeys.W = true
            elseif input.KeyCode == Enum.KeyCode.A then
                flyKeys.A = true
            elseif input.KeyCode == Enum.KeyCode.S then
                flyKeys.S = true
            elseif input.KeyCode == Enum.KeyCode.D then
                flyKeys.D = true
            elseif input.KeyCode == Enum.KeyCode.Space then
                flyKeys.Space = true
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                flyKeys.Shift = true
            end
        end)

        table.insert(flyConnections, inputBegan)

        local inputEnded = game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then
                flyKeys.W = false
            elseif input.KeyCode == Enum.KeyCode.A then
                flyKeys.A = false
            elseif input.KeyCode == Enum.KeyCode.S then
                flyKeys.S = false
            elseif input.KeyCode == Enum.KeyCode.D then
                flyKeys.D = false
            elseif input.KeyCode == Enum.KeyCode.Space then
                flyKeys.Space = false
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                flyKeys.Shift = false
            end
        end)

        table.insert(flyConnections, inputEnded)
        local renderConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local cam = workspace.CurrentCamera

            if not cam or not hrp or not hrp:FindFirstChild("FlyVelocity") or not humanoid or humanoid.Health <= 0 then
                stopFly()
                return
            end

            local move = Vector3.new(0, 0, 0)

            if flyKeys.W then
                move = move + cam.CFrame.LookVector
            end
            if flyKeys.S then
                move = move - cam.CFrame.LookVector
            end
            if flyKeys.A then
                move = move - cam.CFrame.RightVector
            end
            if flyKeys.D then
                move = move + cam.CFrame.RightVector
            end
            if flyKeys.Space then
                move = move + Vector3.new(0, 1, 0)
            end
            if flyKeys.Shift then
                move = move - Vector3.new(0, 1, 0)
            end

            local direction = (move.Magnitude > 0) and (move.Unit * FlySpeed) or Vector3.new(0, 0, 0)
            bv.Velocity = direction
            bg.CFrame = cam.CFrame
        end)

        table.insert(flyConnections, renderConnection)
    end

    local function stopFly()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local hrp = character and character:FindFirstChild("HumanoidRootPart")

        if hrp then
            local flyVelocity = hrp:FindFirstChild("FlyVelocity")
            if flyVelocity then
                flyVelocity:Destroy()
            end

            local flyGyro = hrp:FindFirstChild("FlyGyro")
            if flyGyro then
                flyGyro:Destroy()
            end
        end

        if humanoid then
            humanoid.AutoRotate = true
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end

        for _, conn in ipairs(flyConnections) do
            conn:Disconnect()
        end

        flyConnections = {}
        flyKeys = {
            W = false,
            A = false,
            S = false,
            D = false,
            Space = false,
            Shift = false,
        }
    end

    MovementTab:Toggle({
        Title = "开启飞行",
        Default = false,
        Callback = function(Value)
            isFlying = Value

            if Value then
                startFly()
                WindUI:Notify("飞行", "飞行模式已启用", 3)
            else
                stopFly()
                WindUI:Notify("飞行", "飞行模式已禁用", 3)
            end
        end
    })

    MovementTab:Keybind({
        Title = "飞行电脑切换键",
        Default = "F",
        Mode = "Toggle",
        Callback = function(Value) end
    })

    MovementTab:Slider({
        Title = "飞行速度",
        Value = {Min = 0, Max = 150, Default = 50},
        Suffix = " 速度",
        Tooltip = "更改飞行速度",
        Callback = function(Value)
            FlySpeed = Value
            if isFlying then
                WindUI:Notify("飞行", "飞行速度已更新: " .. Value, 2)
            end
        end
    })
    local noclipConnection = nil
    local originalGroups = {}

    MovementTab:Toggle({
        Title = "穿墙模式",
        Default = false,
        Tooltip = "让你可以穿过墙壁",
        Callback = function(Value)
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local lp = Players.LocalPlayer

            local function enableNoclip()
                if noclipConnection then
                    return
                end

                noclipConnection = RunService.Stepped:Connect(function()
                    if lp.Character then
                        for _, part in pairs(lp.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                                if not originalGroups[part] then
                                    originalGroups[part] = part.CollisionGroup
                                end
                                part.CollisionGroup = "Default"
                            end
                        end
                    end
                end)
            end

            local function disableNoclip()
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end

                local char = lp.Character
                if not char then
                    return
                end

                local collision = char:FindFirstChild("Collision")
                local crouch = collision and collision:FindFirstChild("CollisionCrouch")

                if collision and crouch then
                    local crouching = collision.CollisionGroup == "PlayerCrouching"
                    collision.CanCollide = not crouching
                    crouch.CanCollide = crouching
                end
            end

            if Value then
                enableNoclip()
                WindUI:Notify("穿墙", "穿墙模式已启用", 3)
            else
                disableNoclip()
                WindUI:Notify("穿墙", "穿墙模式已禁用", 3)
            end
        end
    })

    MovementTab:Keybind({
        Title = "穿墙电脑切换键",
        Default = "N",
        Mode = "Toggle",
        Callback = function(Value) end
    })
    local LadderSpeedValue = 20
    local LadderSpeedEnabled = false
    local LadderConnection = nil

    MovementTab:Toggle({
        Title = "更快爬梯",
        Default = false,
        Callback = function(on)
            local LocalPlayer = game.Players.LocalPlayer
            local RunService = game:GetService("RunService")

            if on then
                LadderConnection = RunService.Heartbeat:Connect(function()
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")

                    if hum and hrp and hum:GetState() == Enum.HumanoidStateType.Climbing then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, LadderSpeedValue, hrp.Velocity.Z)
                    end
                end)
                WindUI:Notify("爬梯", "梯子加速已启用", 3)
            elseif LadderConnection then
                LadderConnection:Disconnect()
                LadderConnection = nil
                WindUI:Notify("爬梯", "梯子加速已禁用", 3)
            end
        end
    })

    MovementTab:Slider({
        Title = "爬梯速度",
        Value = {Min = 0, Max = 100, Default = 20},
        Suffix = " 速度",
        Tooltip = "爬梯的加速值，过高可能不稳定",
        Callback = function(Value)
            LadderSpeedValue = Value
            if LadderSpeedEnabled then
                WindUI:Notify("爬梯", "爬梯速度已更新: " .. Value, 2)
            end
        end
    })
    MovementTab:Toggle({
        Title = "始终可跳跃",
        Default = false,
        Tooltip = "让你随时可以跳跃",
        Callback = function(Value)
            local LocalPlayer = game.Players.LocalPlayer
            LocalPlayer.Character:SetAttribute("CanJump", Value)
            
            if Value then
                WindUI:Notify("跳跃", "始终跳跃已启用", 3)
            else
                WindUI:Notify("跳跃", "始终跳跃已禁用", 3)
            end
            LocalPlayer.CharacterAdded:Connect(function(newCharacter)
                task.wait(1.5)
                newCharacter:SetAttribute("CanJump", Value)
            end)
        end
    })
    local B = Window:Tab({Title = "自动类", Icon = "puzzle"})
    B:Toggle({
        Title = "自动锚点代码求解",
        Default = false,
        Callback = function(enabled)
            local running = false
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Workspace = game:GetService("Workspace")
            
            if enabled then
                if running then return end
                running = true
                
                task.spawn(function()
                    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
                    
                    local function findFrame()
                        local mainUI = playerGui:FindFirstChild("MainUI")
                        if mainUI and mainUI:FindFirstChild("MainFrame") then
                            local frame = mainUI.MainFrame:FindFirstChild("AnchorHintFrame")
                            if frame then return frame end
                        end

                        local anchorUI = playerGui:FindFirstChild("AnchorHintUI")
                        if anchorUI then
                            local frame = anchorUI:FindFirstChild("AnchorHintFrame")
                            if frame then return frame end
                        end
                        return nil
                    end

                    while running do
                        task.wait(0.9)
                        local frame = findFrame()
                        
                        if frame then
                            local anchorName = (frame:FindFirstChild("AnchorCode") and frame.AnchorCode.Text) or ''
                            local codeText = (frame:FindFirstChild("Code") and frame.Code.Text) or ''
                            
                            if anchorName ~= '' and codeText ~= '' then
                                local anchorObject
                                for _, obj in ipairs(Workspace.CurrentRooms:GetDescendants()) do
                                    if obj.Name == "MinesAnchor" then
                                        local sign = obj:FindFirstChild("Sign")
                                        if sign then
                                            local label = sign:FindFirstChild("TextLabel") or sign:FindFirstChildWhichIsA("TextLabel")
                                            if label and label.Text == anchorName then
                                                anchorObject = obj
                                                break
                                            end
                                        end
                                    end
                                end

                                if anchorObject then
                                    local note = anchorObject:FindFirstChild("Note")
                                    if not note then
                                        WindUI:Notify("锚点代码", "锚点 " .. anchorName .. " 代码是 " .. codeText, 3)
                                    else
                                        local surfaceGui = note:FindFirstChildOfClass("SurfaceGui") or note:FindFirstChild("SurfaceGui")
                                        local noteText = (surfaceGui and surfaceGui:FindFirstChild("TextLabel") and surfaceGui.TextLabel.Text) or '0'
                                        local noteValue = tonumber(noteText) or 0
                                        local solved = ''
                                        
                                        for i = 1, #codeText do
                                            local digit = tonumber(codeText:sub(i, i)) or 0
                                            digit = (digit + noteValue) % 10
                                            solved = solved .. tostring(digit)
                                        end
                                        
                                        WindUI:Notify("锚点代码", "锚点 " .. anchorName .. " 代码是 " .. solved, 5)
                                    end
                                end
                            end
                        else
                            task.wait(0.25)
                        end
                    end
                end)
            else
                running = false
            end
        end
    })
    B:Toggle({
        Title = "自动断路器游戏",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local LocalPlayer = Players.LocalPlayer
            local RemoteFolder = ReplicatedStorage:FindFirstChild("RemotesFolder") or ReplicatedStorage:FindFirstChild("EntityInfo") or ReplicatedStorage:FindFirstChild("Bricks")
            
            while task.wait() and Value do
                if not Value then break end
                
                local currentRoom = LocalPlayer:GetAttribute("CurrentRoom")
                if currentRoom ~= 100 then
                    WindUI:Notify("提示", "你需要在100号房间使用此功能", 5)
                    break
                end

                local Breaker = nil
                for _, v in ipairs(workspace.CurrentRooms:GetDescendants()) do
                    if v.Name == "ElevatorBreaker" then
                        Breaker = v
                        break
                    end
                end

                if Breaker then
                    local solved = true
                    for _, v in ipairs(Breaker:GetChildren()) do
                        if v.Name == "BreakerSwitch" then
                            local codeText = Breaker:WaitForChild("SurfaceGui").Frame.Code.Text
                            if v:GetAttribute("ID") == tonumber(codeText) then
                                if Breaker.SurfaceGui.Frame.Code.Frame.BackgroundTransparency == 0 then
                                    v:SetAttribute("Enabled", true)
                                    if not v.Sound.Playing then
                                        v.Sound.Playing = true
                                    end
                                    v.Material = Enum.Material.Neon
                                    v.Light.Attachment.Spark:Emit(1)
                                    v.PrismaticConstraint.TargetPosition = -0.2
                                else
                                    v:SetAttribute("Enabled", false)
                                    if not v.Sound.Playing then
                                        v.Sound.Playing = true
                                    end
                                    v.PrismaticConstraint.TargetPosition = 0.2
                                    v.Material = Enum.Material.Glass
                                    solved = false
                                end
                            end
                        end
                    end

                    if solved and RemoteFolder then
                        local breakerRemote = RemoteFolder:FindFirstChild("BreakerMinigame")
                        if breakerRemote then
                            breakerRemote:FireServer("Solved")
                        end
                    end
                end
            end
        end
    })
    B:Toggle({
        Title = "自动隐藏[防怪物]",
        Default = false,
        Risky = true,
        Tooltip = "自动为你隐藏",
        Callback = function(Value)
            local EntityDistances = {
                RushMoving = 50,
                BackdoorRush = 50,
                AmbushMoving = 100,
                A60 = 100,
                A120 = 35,
            }
            local Rooms = workspace.CurrentRooms
            local LocalPlayer = game.Players.LocalPlayer
            local Connections = {}

            local function GetHiding()
                local Closest, Prompt
                local currRoom = Rooms and Rooms[LocalPlayer:GetAttribute("CurrentRoom")]
                if not currRoom then return nil end

                local char = LocalPlayer.Character
                if not char then return nil end

                local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Collision") or char.PrimaryPart
                if not hrp then return nil end

                local function distFromPlayer(model)
                    if not model then return math.huge end
                    local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
                    if not part then return math.huge end
                    return (part.Position - hrp.Position).Magnitude
                end

                local assets = currRoom:FindFirstChild("Assets")
                if assets then
                    for _, v in pairs(assets:GetChildren()) do
                        if v:IsA("Model") then
                            if ((v.Name == "Locker_Large") or (v.Name == "Wardrobe") or (v.Name == "Toolshed") or (v.Name == "Bed") or (v.Name == "Rooms_Locker") or (v.Name == "Rooms_Locker_Fridge") or (v.Name == "Backdoor_Wardrobe")) and v:FindFirstChild("HidePrompt") and v:FindFirstChild("HiddenPlayer") then
                                if not v.HiddenPlayer.Value and not v:FindFirstChild("HideEntityOnSpot", true) then
                                    if Closest then
                                        if distFromPlayer(v) < distFromPlayer(Closest) then
                                            Closest = v
                                            Prompt = v.HidePrompt
                                        end
                                    else
                                        Closest = v
                                        Prompt = v.HidePrompt
                                    end
                                end
                            elseif v.Name == "Double_Bed" then
                                for _, x in pairs(v:GetChildren()) do
                                    if x.Name == "DoubleBed" and x:FindFirstChild("HidePrompt") and x:FindFirstChild("HiddenPlayer") then
                                        if not x.HiddenPlayer.Value and not x:FindFirstChild("HideEntityOnSpot", true) then
                                            if Closest then
                                                if distFromPlayer(x) < distFromPlayer(Closest) then
                                                    Closest = x
                                                    Prompt = x.HidePrompt
                                                end
                                            else
                                                Closest = x
                                                Prompt = x.HidePrompt
                                            end
                                        end
                                    end
                                end
                            elseif v.Name == "Dumpster" then
                                for _, x in pairs(v:GetChildren()) do
                                    if x:FindFirstChild("HidePrompt") and x:FindFirstChild("HiddenPlayer") then
                                        local dumpsterBaseHasSpot = v:FindFirstChild("DumpsterBase") and v.DumpsterBase:FindFirstChild("HideEntityOnSpot")
                                        if not x.HiddenPlayer.Value and not dumpsterBaseHasSpot then
                                            if Closest then
                                                if distFromPlayer(x) < distFromPlayer(Closest) then
                                                    Closest = x
                                                    Prompt = x.HidePrompt
                                                end
                                            else
                                                Closest = x
                                                Prompt = x.HidePrompt
                                            end
                                        end
                                    end
                                end
                            end
                        elseif v:IsA("Folder") then
                            if v.Name == "Blockage" then
                                for _, x in pairs(v:GetChildren()) do
                                    if x:IsA("Model") and x.Name == "Wardrobe" and x:FindFirstChild("HiddenPlayer") and x:FindFirstChild("HidePrompt") then
                                        if not x.HiddenPlayer.Value then
                                            if Closest then
                                                if distFromPlayer(x) < distFromPlayer(Closest) then
                                                    Closest = x
                                                    Prompt = x.HidePrompt
                                                end
                                            else
                                                Closest = x
                                                Prompt = x.HidePrompt
                                            end
                                        end
                                    end
                                end
                            elseif v.Name == "Vents" then
                                for _, x in pairs(v:GetChildren()) do
                                    if x.Name == "CircularVent" and x:FindFirstChild("Grate") and x.Grate:FindFirstChild("HidePrompt") and x:FindFirstChild("HiddenPlayer") then
                                        if not x.HiddenPlayer.Value and not v:FindFirstChild("HideEntityOnSpot", true) then
                                            if Closest then
                                                if distFromPlayer(x) < distFromPlayer(Closest) then
                                                    Closest = x
                                                    Prompt = x.Grate.HidePrompt
                                                end
                                            else
                                                Closest = x
                                                Prompt = x.Grate.HidePrompt
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                for _, v in pairs(currRoom:GetChildren()) do
                    if v:IsA("Model") then
                        if v.Name == "CircularVent" and v:FindFirstChild("Grate") and v.Grate:FindFirstChild("HidePrompt") and v:FindFirstChild("HiddenPlayer") then
                            if not v.HiddenPlayer.Value and not v:FindFirstChild("HideEntityOnSpot", true) then
                                if Closest then
                                    if distFromPlayer(v) < distFromPlayer(Closest) then
                                        Closest = v
                                        Prompt = v.Grate.HidePrompt
                                    end
                                else
                                    Closest = v
                                    Prompt = v.Grate.HidePrompt
                                end
                            end
                        end
                    end
                end

                return Prompt
            end

            if Value then
                table.insert(Connections, workspace.ChildAdded:Connect(function(v)
                    if v:IsA("Model") and EntityDistances[v.Name] then
                        task.wait(1)
                        local Part = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)
                        if not Part then return end

                        v:SetAttribute("_Prediction", Part.Position)

                        while task.wait() and v.Parent do
                            task.spawn(function()
                                local LastPosition = Part.Position
                                task.wait(0.3333333333333333)
                                if Part and Part.Parent then
                                    v:SetAttribute("_Prediction", Part.Position - LastPosition)
                                end
                            end)

                            if Value then
                                local IncludeList = {}
                                for _, Room in pairs(Rooms:GetChildren()) do
                                    if Room:FindFirstChild("Assets") then
                                        table.insert(IncludeList, Room.Assets)
                                    end
                                    if Room:FindFirstChild("Parts") then
                                        table.insert(IncludeList, Room.Parts)
                                    end
                                end

                                local RaycastParams = RaycastParams.new()
                                RaycastParams.FilterDescendantsInstances = IncludeList
                                RaycastParams.FilterType = Enum.RaycastFilterType.Include

                                local Count = {0.2, 0.4, 0.6, 0.8, 1}
                                local entityInRange = false

                                for i = 1, #Count do
                                    local Number = 1.5 * Count[i]
                                    local predAttr = v:GetAttribute("_Prediction")
                                    local Prediction = (predAttr and (predAttr * 3)) or Vector3.new(0, 0, 0)
                                    Prediction = Prediction * Number

                                    local char = LocalPlayer.Character
                                    if not char then break end

                                    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Collision") or char.PrimaryPart
                                    if not hrp then break end

                                    if Vector3.new(Prediction.X, 0, Prediction.Z).Magnitude > 1 then
                                        local PredictionPosition = Part.Position + Prediction
                                        local Raycast
                                        if true then
                                            Raycast = workspace:Raycast(hrp.Position, PredictionPosition - hrp.Position, RaycastParams)
                                        end

                                        local distMultiplier = 1
                                        local mode = "Safety"
                                        local adjust = 0

                                        if mode == "Safety" then
                                            adjust = 20
                                        elseif mode == "Close Call" then
                                            adjust = -20
                                        end

                                        local adjustedDistance = EntityDistances[v.Name] + adjust
                                        local distanceToEntity = (PredictionPosition - hrp.Position).Magnitude

                                        if not Raycast and distanceToEntity <= (adjustedDistance * distMultiplier) then
                                            entityInRange = true
                                            local Prompt = GetHiding()
                                            if Prompt then
                                                pcall(function()
                                                    fireproximityprompt(Prompt)
                                                end)
                                            end
                                            break
                                        end
                                    end
                                end

                                local char = LocalPlayer.Character
                                if char and not entityInRange and char:GetAttribute("Hiding") then
                                    char:SetAttribute("Hiding", false)
                                end
                            end
                        end
                    end
                end))
            else
                for _, conn in ipairs(Connections) do
                    conn:Disconnect()
                end
                Connections = {}
            end
        end
    })

B:Dropdown({
        Title = "自动隐藏模式",
        Values = {"Safety", "Close Call"},
        Default = "Safety",
        Callback = function(Value) end
    })

   B:Slider({
        Title = "预测时间",
        Value = {Min = 0.1, Max = 1.5, Default = 1.5},
        Suffix = "s",
        Callback = function(Value) end
    })

    B:Slider({
        Title = "距离倍数",
        Value = {Min = 1, Max = 1.5, Default = 1},
        Suffix = "x",
        Callback = function(Value) end
    })
    local AutoInteractDistance = 10
    B:Toggle({
        Title = "自动互动",
        Default = false,
        Callback = function(Value)
            if Value then
                local RunService = game:GetService("RunService")
                local LocalPlayer = game.Players.LocalPlayer

                local AutoInteractConnection
                local CachedInteractables = {}
                local PromptSeen = {}
                local InteractableModels = {
                    AlarmClock = true, GlitchCub = true, Aloe = true, BandagePack = true, Battery = true,
                    TimerLever = true, OuterPart = true, BatteryPack = true, Candle = true, LiveBreakerPolePickup = true,
                    Compass = true, Crucifix = true, ElectricalRoomKey = true, Flashlight = true, Glowstick = true,
                    HolyHandGrenade = true, Lantern = true, LaserPointer = true, Lighter = true, Lockpick = true,
                    LotusFlower = true, LotusPetalPickup = true, Multitool = true, NVCS3000 = true, OutdoorsKey = true,
                    Shears = true, SkeletonKey = true, Smoothie = true, SolutionPaper = true, Spotlight = true,
                    StarlightVial = true, StarlightJug = true, StarlightBottle = true, Vitamins = true,
                }

                local function PickRootPart(obj, prompt)
                    if prompt and prompt.Parent and prompt.Parent:IsA("BasePart") then
                        return prompt.Parent
                    end
                    if obj:IsA("Model") then
                        if obj.PrimaryPart and obj.PrimaryPart:IsA("BasePart") then
                            return obj.PrimaryPart
                        end
                        local common = obj:FindFirstChild("Main", true) or obj:FindFirstChild("Handle", true) or obj:FindFirstChild("Door", true)
                        if common and common:IsA("BasePart") then
                            return common
                        end
                    end
                    return obj:FindFirstChildWhichIsA("BasePart", true)
                end

                local function AddPromptsFromObject(obj)
                    for _, desc in ipairs(obj:GetDescendants()) do
                        if desc:IsA("ProximityPrompt") and not PromptSeen[desc] then
                            local root = PickRootPart(obj, desc)
                            if root then
                                PromptSeen[desc] = true
                                table.insert(CachedInteractables, {
                                    prompt = desc,
                                    part = root,
                                    last = 0,
                                })
                            end
                        end
                    end
                end

                local function CollectTargets(folder)
                    for _, v in ipairs(folder:GetChildren()) do
                        if v:IsA("Model") or v:IsA("Folder") then
                            if v.Name == "DrawerContainer" or InteractableModels[v.Name] or v.Name == "RoomsLootItem" or v.Name == "Locker_Small" or v.Name == "Toolbox" or v.Name == "ChestBox" or v.Name == "Toolshed_Small" or v.Name == "CrucifixOnTheWall" then
                                AddPromptsFromObject(v)
                            end
                            CollectTargets(v)
                        end
                    end
                end

                local function RefreshTargets()
                    CachedInteractables = {}
                    PromptSeen = {}
                    local CurrentRoom = workspace.CurrentRooms[LocalPlayer:GetAttribute("CurrentRoom")]
                    if not CurrentRoom then return end
                    CollectTargets(CurrentRoom)
                end

                local lastCheck = 0
                local interval = 0.2

                local function AutoInteractStep(dt)
                    lastCheck = lastCheck + dt
                    if lastCheck < interval then return end
                    lastCheck = 0

                    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Collision") then
                        return
                    end

                    local charPos = LocalPlayer.Character.Collision.Position
                    local now = tick()

                    for i = #CachedInteractables, 1, -1 do
                        local entry = CachedInteractables[i]
                        local prompt, part = entry.prompt, entry.part

                        if not prompt or not prompt.Parent or not part or not part:IsDescendantOf(workspace) then
                            table.remove(CachedInteractables, i)
                        else
                            local dist = (part.Position - charPos).Magnitude
                            if dist <= AutoInteractDistance and (now - (entry.last or 0)) >= 0.35 then
                                entry.last = now
                                task.spawn(function()
                                    pcall(function()
                                        fireproximityprompt(prompt)
                                    end)
                                end)
                            end
                        end
                    end
                end

                RefreshTargets()
                AutoInteractConnection = RunService.Heartbeat:Connect(AutoInteractStep)

                local attributeConn
                local roomDescConn

                attributeConn = LocalPlayer:GetAttributeChangedSignal("CurrentRoom"):Connect(function()
                    RefreshTargets()
                    if roomDescConn then
                        roomDescConn:Disconnect()
                        roomDescConn = nil
                    end
                    local cr = workspace.CurrentRooms[LocalPlayer:GetAttribute("CurrentRoom")]
                    if cr then
                        roomDescConn = cr.DescendantAdded:Connect(function()
                            task.defer(RefreshTargets)
                        end)
                    end
                end)

                local cr = workspace.CurrentRooms[LocalPlayer:GetAttribute("CurrentRoom")]
                if cr then
                    roomDescConn = cr.DescendantAdded:Connect(function()
                        task.defer(RefreshTargets)
                    end)
                end

                _G.StopAutoInteract = function()
                    if AutoInteractConnection then
                        AutoInteractConnection:Disconnect()
                        AutoInteractConnection = nil
                    end
                    if attributeConn then
                        attributeConn:Disconnect()
                        attributeConn = nil
                    end
                    if roomDescConn then
                        roomDescConn:Disconnect()
                        roomDescConn = nil
                    end
                    CachedInteractables, PromptSeen = {}, {}
                end
            elseif _G.StopAutoInteract then
                _G.StopAutoInteract()
                _G.StopAutoInteract = nil
            end
        end
    })

    B:Slider({
        Title = "自动互动距离",
        Value = {Min = 1, Max = 20, Default = 10},
        Suffix = " studs",
        Callback = function(Value)
            AutoInteractDistance = Value
        end
    })
    B:Toggle({
        Title = "自动矿车推动",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer
            local Workspace = game:GetService("Workspace")
            local Rooms = Workspace:WaitForChild("CurrentRooms")

            if _G.AutoMinecartConn then
                _G.AutoMinecartConn:Disconnect()
                _G.AutoMinecartConn = nil
            end
            if _G.AutoMinecartLoop then
                _G.AutoMinecartLoop:Disconnect()
                _G.AutoMinecartLoop = nil
            end

            if Value then
                local function tryPush(cartModel)
                    local cart = cartModel:FindFirstChild("Cart")
                    if not cart then return end
                    local prompt = cart:FindFirstChild("PushPrompt")
                    if not prompt then return end

                    local character = LocalPlayer.Character
                    local root = character and character:FindFirstChild("HumanoidRootPart")
                    if not root then return end

                    if (root.Position - prompt.Parent.Position).Magnitude <= (prompt.MaxActivationDistance or 10) then
                        fireproximityprompt(prompt)
                    end
                end

                _G.AutoMinecartConn = Rooms.DescendantAdded:Connect(function(obj)
                    if obj.Name == "MinecartMoving" then
                        task.defer(function()
                            tryPush(obj)
                        end)
                    end
                end)

                _G.AutoMinecartLoop = RunService.Heartbeat:Connect(function()
                    local character = LocalPlayer.Character
                    local root = character and character:FindFirstChild("HumanoidRootPart")
                    if not root then return end

                    for _, obj in ipairs(Rooms:GetDescendants()) do
                        if obj.Name == "MinecartMoving" then
                            tryPush(obj)
                        end
                    end
                end)
            else
                if _G.AutoMinecartConn then
                    _G.AutoMinecartConn:Disconnect()
                end
                if _G.AutoMinecartLoop then
                    _G.AutoMinecartLoop:Disconnect()
                end
                _G.AutoMinecartConn = nil
                _G.AutoMinecartLoop = nil
            end
        end
    })
    B:Toggle({
        Title = "自动拾取投掷物",
        Default = false,
        Callback = function(Value)
            local targetProps = {
                "WoodenCrate", "OilBarrel", "GarbageBag", "Trashcan", 
                "CardboardBox_Normal", "Hat_Stand", "CardboardBox_Wide", "Office_Chair"
            }
            local running = true

            if Value then
                task.spawn(function()
                    while running and Value do
                        local bigProps = workspace:FindFirstChild("BigProps")
                        if bigProps then
                            for _, name in ipairs(targetProps) do
                                local prop = bigProps:FindFirstChild(name)
                                if prop then
                                    for _, d in ipairs(prop:GetDescendants()) do
                                        if d:IsA("ProximityPrompt") then
                                            d.MaxActivationDistance = 20
                                            if d.Enabled then
                                                pcall(fireproximityprompt, d)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(0.5)
                    end
                end)
            else
                running = false
            end
        end
    })
    B:Toggle({
        Title = "自动破门",
        Default = false,
        Callback = function(Value)
            local connections = {}
            local running = false
            local targetNames = {"DoorPieceBottom", "DoorPieceTop"}

            local function safeDisconnect()
                for _, c in ipairs(connections) do
                    if c and c.Disconnect then
                        pcall(function() c:Disconnect() end)
                    elseif c and c.disconnect then
                        pcall(function() c:disconnect() end)
                    end
                end
                connections = {}
            end

            local function handlePrompt(p)
                pcall(function() p.MaxActivationDistance = 40 end)
                if p.Enabled then
                    pcall(fireproximityprompt, p)
                end
            end

            local function processModel(m)
                for _, n in ipairs(targetNames) do
                    local part = m:FindFirstChild(n, true)
                    if part then
                        for _, d in ipairs(part:GetDescendants()) do
                            if d:IsA("ProximityPrompt") then
                                pcall(handlePrompt, d)
                            end
                        end

                        local con = part.DescendantAdded:Connect(function(desc)
                            if desc:IsA("ProximityPrompt") then
                                pcall(function() task.defer(handlePrompt, desc) end)
                            end
                        end)
                        table.insert(connections, con)
                    end
                end
            end

            local function scanAll()
                local cr = workspace:FindFirstChild("CurrentRooms")
                if not cr then return end

                for _, room in ipairs(cr:GetDescendants()) do
                    if room:IsA("Model") or room:IsA("Folder") then
                        processModel(room)
                    end
                end
            end

            if Value then
                running = true
                safeDisconnect()
                
                task.spawn(function()
                    scanAll()
                    local cr = workspace:FindFirstChild("CurrentRooms")
                    if cr then
                        local con = cr.DescendantAdded:Connect(function(d)
                            if not running then return end
                            local model = d
                            while model and not (model:IsA("Model") or model:IsA("Folder")) do
                                model = model.Parent
                            end
                            if model then
                                task.defer(processModel, model)
                            end
                        end)
                        table.insert(connections, con)
                    end

                    while running and Value do
                        scanAll()
                        task.wait(0.8)
                    end
                end)
            else
                running = false
                safeDisconnect()
            end
        end
    })
    B:Toggle({
        Title = "自动拾取",
        Default = false,
        Callback = function(Value)
            local connections = {}
            local running = false

            local function safeDisconnect()
                for _, c in ipairs(connections) do
                    if c and c.Disconnect then
                        pcall(function() c:Disconnect() end)
                    elseif c and c.disconnect then
                        pcall(function() c:disconnect() end)
                    end
                end
                connections = {}
            end

            local function handlePrompt(p)
                pcall(function() p.MaxActivationDistance = 40 end)
                if p.Enabled then
                    pcall(fireproximityprompt, p)
                end
            end

            local function processDrop(d)
                for _, desc in ipairs(d:GetDescendants()) do
                    if desc:IsA("ProximityPrompt") then
                        pcall(handlePrompt, desc)
                    end
                end

                local con = d.DescendantAdded:Connect(function(desc)
                    if desc:IsA("ProximityPrompt") then
                        pcall(function() task.defer(handlePrompt, desc) end)
                    end
                end)
                table.insert(connections, con)
            end

            local function scanDrops()
                local drops = workspace:FindFirstChild("Drops")
                if not drops then return end

                for _, child in ipairs(drops:GetChildren()) do
                    if child:IsA("Model") or child:IsA("Folder") then
                        processDrop(child)
                    end
                end
            end

            if Value then
                running = true
                safeDisconnect()
                
                task.spawn(function()
                    scanDrops()
                    local drops = workspace:FindFirstChild("Drops")
                    if drops then
                        local con = drops.ChildAdded:Connect(function(c)
                            if not running then return end
                            if c:IsA("Model") or c:IsA("Folder") then
                                task.defer(processDrop, c)
                            end
                        end)
                        table.insert(connections, con)
                    end

                    while running and Value do
                        scanDrops()
                        task.wait(0.8)
                    end
                end)
            else
                running = false
                safeDisconnect()
            end
        end
    })
    B:Toggle({
        Title = "自动开火",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            local RAY_DISTANCE = 50
            local con = nil
            local triggered = false

            local function safeMouse1Press() pcall(mouse1press) end
            local function safeMouse1Release() pcall(mouse1release) end

            local function isTargetVisible(targetPos)
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                rayParams.FilterDescendantsInstances = {LocalPlayer.Character}

                local origin = Camera.CFrame.Position
                local direction = targetPos - origin
                local result = workspace:Raycast(origin, direction, rayParams)

                if not result then return true end
                return (result.Instance.Position - targetPos).Magnitude < 3
            end

            local function update()
                if not LocalPlayer.Character or not Camera then
                    if triggered then
                        safeMouse1Release()
                        triggered = false
                    end
                    return
                end

                local myChar = LocalPlayer.Character
                local myHead = myChar:FindFirstChild("Head")
                if not myHead then return end

                local lookVector = Camera.CFrame.LookVector
                local origin = Camera.CFrame.Position
                local bestTarget = nil
                local bestDot = 0.995

                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local targetPos = plr.Character.HumanoidRootPart.Position
                        local dirToTarget = (targetPos - origin).Unit
                        local dot = lookVector:Dot(dirToTarget)

                        if dot > bestDot then
                            local dist = (targetPos - origin).Magnitude
                            if dist < RAY_DISTANCE and isTargetVisible(targetPos) then
                                bestDot = dot
                                bestTarget = plr
                            end
                        end
                    end
                end

                if bestTarget then
                    if not triggered then
                        WindUI:Notify("自动开火", "正在向 " .. bestTarget.Name .. " 开火", 2)
                        safeMouse1Press()
                        triggered = true
                    end
                elseif triggered then
                    safeMouse1Release()
                    triggered = false
                end
            end

            if Value then
                if con and con.Connected then
                    con:Disconnect()
                end
                con = RunService.RenderStepped:Connect(function()
                    pcall(update)
                end)
            else
                if con then
                    con:Disconnect()
                    con = nil
                end
                if triggered then
                    safeMouse1Release()
                    triggered = false
                end
            end
        end
    })
    B:Toggle({
        Title = "自动房间",
        Default = false,
        Callback = function(enabled)
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local PathfindingService = game:GetService("PathfindingService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Workspace = game:GetService("Workspace")
            local player = Players.LocalPlayer
            local rooms = Workspace:WaitForChild("CurrentRooms")
            local gameData = ReplicatedStorage:WaitForChild("GameData")
            local floor = gameData:WaitForChild("Floor")
            local active = false
            local runner
            local clone

            local function stop()
                active = false
                if runner then
                    runner:Disconnect()
                    runner = nil
                end
                if clone and clone.Parent then
                    clone:Destroy()
                end
                player:SetAttribute("AutoRoomsActive", false)
            end

            if not enabled then
                stop()
                return
            end

            player:SetAttribute("AutoRoomsActive", true)
            active = true

            if player.Character and player.Character:FindFirstChild("CollisionPart") then
                clone = player.Character.CollisionPart:Clone()
                clone.Name = "_AutoRoomsCollision"
                clone.Massless = true
                clone.Anchored = false
                clone.CanCollide = false
                clone.CanQuery = false
                clone.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
                clone.Parent = player.Character
            end

            local function findClosestLocker()
                local best, bestDist = nil, math.huge
                for _, obj in ipairs(rooms:GetDescendants()) do
                    if obj.Name == "Rooms_Locker" or obj.Name == "Rooms_Locker_Fridge" then
                        if obj.PrimaryPart then
                            local dist = (player.Character.HumanoidRootPart.Position - obj.PrimaryPart.Position).Magnitude
                            if dist < bestDist then
                                best = obj
                                bestDist = dist
                            end
                        end
                    end
                end
                return best
            end

            local function walkTo(target)
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local path = PathfindingService:CreatePath({
                    AgentRadius = 2,
                    AgentHeight = 1,
                    AgentCanJump = false,
                    WaypointSpacing = 5,
                })

                path:ComputeAsync(char.HumanoidRootPart.Position, target.Position)

                if path.Status == Enum.PathStatus.Success then
                    for _, waypoint in ipairs(path:GetWaypoints()) do
                        if not active then return end
                        char:FindFirstChildOfClass("Humanoid"):MoveTo(waypoint.Position)
                        char.Humanoid.MoveToFinished:Wait()
                    end
                end
            end

            runner = RunService.Heartbeat:Connect(function()
                if not active then return end
                if floor.Value ~= "Rooms" then return stop() end
                if gameData.LatestRoom.Value >= 1000 then return stop() end

                local entity = Workspace:FindFirstChild("A60") or Workspace:FindFirstChild("A120") or Workspace:FindFirstChild("GlitchRush") or Workspace:FindFirstChild("GlitchAmbush")

                if entity and entity.PrimaryPart and entity.PrimaryPart.Position.Y > -6 then
                    local locker = findClosestLocker()
                    if locker and locker.PrimaryPart then
                        local hide = locker:FindFirstChild("HidePoint")
                        if not hide then
                            hide = Instance.new("Part")
                            hide.Name = "HidePoint"
                            hide.Anchored = true
                            hide.Transparency = 1
                            hide.CanCollide = false
                            hide.Position = locker.PrimaryPart.Position + (locker.PrimaryPart.CFrame.LookVector * 7)
                            hide.Parent = locker
                        end

                        walkTo(hide)
                        task.wait(0.1)

                        local prompt = locker:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then
                            if fireproximityprompt then
                                fireproximityprompt(prompt)
                            else
                                prompt:InputHoldBegin()
                                prompt:InputHoldEnd()
                            end
                        end
                    end
                else
                    local currentRoom = gameData.LatestRoom.Value
                    local door = rooms[currentRoom] and rooms[currentRoom]:FindFirstChild("Door", true)
                    if door and door:FindFirstChild("Door") then
                        walkTo(door.Door)
                    end
                end
            end)
        end
    })

   B:Toggle({
        Title = "反AFK",
        Default = false,
        Callback = function(Value)
            local Players = game:GetService("Players")
            local VirtualUser = game:GetService("VirtualUser")
            local LocalPlayer = Players.LocalPlayer
            local AntiAFKConnection

            if Value then
                AntiAFKConnection = LocalPlayer.Idled:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
                WindUI:Notify("反AFK", "反AFK已启用", 3)
            elseif AntiAFKConnection then
                AntiAFKConnection:Disconnect()
                AntiAFKConnection = nil
                WindUI:Notify("反AFK", "反AFK已禁用", 3)
            end
        end
    })
    B:Toggle({
        Title = "自动门范围",
        Default = false,
        Callback = function(Value)
            local doorReachLoop

            if Value then
                local Rooms = workspace:FindFirstChild("CurrentRooms")
                if not Rooms then return end

                doorReachLoop = task.spawn(function()
                    while Value do
                        for _, room in pairs(Rooms:GetChildren()) do
                            local door = room:FindFirstChild("Door")
                            if door and door:FindFirstChild("ClientOpen") then
                                door.ClientOpen:FireServer()
                            end
                        end
                        task.wait(0.5)
                    end
                end)
                WindUI:Notify("自动门", "自动门范围已启用", 3)
            else
                doorReachLoop = nil
                WindUI:Notify("自动门", "自动门范围已禁用", 3)
            end
        end
    })
    B:Toggle({
        Title = "即时互动",
        Default = false,
        Callback = function(Value)
            if getgenv().ProximityConnection then
                getgenv().ProximityConnection:Disconnect()
                getgenv().ProximityConnection = nil
            end

            local function modifyPrompt(prompt, instant)
                if not prompt:IsA("ProximityPrompt") then return end
                if instant then
                    if not prompt:GetAttribute("OriginalHoldDuration") then
                        prompt:SetAttribute("OriginalHoldDuration", prompt.HoldDuration)
                        prompt:SetAttribute("OriginalLineOfSight", prompt.RequiresLineOfSight)
                    end
                    prompt.HoldDuration = 0
                    prompt.RequiresLineOfSight = false
                else
                    prompt.HoldDuration = prompt:GetAttribute("OriginalHoldDuration") or 1
                    prompt.RequiresLineOfSight = prompt:GetAttribute("OriginalLineOfSight") or true
                end
            end

            local currentRooms = workspace:FindFirstChild("CurrentRooms")
            if currentRooms then
                for _, prompt in ipairs(currentRooms:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        modifyPrompt(prompt, Value)
                    end
                end
            end

            if Value and currentRooms then
                getgenv().ProximityConnection = currentRooms.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("ProximityPrompt") then
                        modifyPrompt(descendant, true)
                    end
                end)
            end

            WindUI:Notify("即时互动", Value and "已启用" or "已禁用", 3)
        end
    })
    B:Slider({
        Title = "既时互动范围提升",
        Value = {Min = 1, Max = 5, Default = 1},
        Suffix = "x",
        Callback = function(multiplier)
            local originalRanges = {}
            local rangeConnections = {}

            local function updateProximityPromptRanges(multiplier)
                local function modifyPrompt(prompt)
                    if not originalRanges[prompt] then
                        originalRanges[prompt] = prompt.MaxActivationDistance
                    end
                    prompt.MaxActivationDistance = originalRanges[prompt] * multiplier
                end

                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        modifyPrompt(descendant)
                    end
                end
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player.PlayerGui then
                        for _, descendant in pairs(player.PlayerGui:GetDescendants()) do
                            if descendant:IsA("ProximityPrompt") then
                                modifyPrompt(descendant)
                            end
                        end
                    end
                end
            end

            local function setupRangeConnections(multiplier)
                for _, connection in pairs(rangeConnections) do
                    connection:Disconnect()
                end
                rangeConnections = {}

                table.insert(rangeConnections, workspace.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("ProximityPrompt") then
                        task.wait(0.1)
                        originalRanges[descendant] = descendant.MaxActivationDistance
                        descendant.MaxActivationDistance = originalRanges[descendant] * multiplier
                    end
                end))

                for _, player in pairs(game.Players:GetPlayers()) do
                    if player.PlayerGui then
                        table.insert(rangeConnections, player.PlayerGui.DescendantAdded:Connect(function(descendant)
                            if descendant:IsA("ProximityPrompt") then
                                task.wait(0.1)
                                originalRanges[descendant] = descendant.MaxActivationDistance
                                descendant.MaxActivationDistance = originalRanges[descendant] * multiplier
                            end
                        end))
                    end
                end
            end

            if multiplier == 1 then
                for prompt, originalRange in pairs(originalRanges) do
                    if prompt and prompt.Parent then
                        prompt.MaxActivationDistance = originalRange
                    end
                end
                for _, connection in pairs(rangeConnections) do
                    connection:Disconnect()
                end
                rangeConnections = {}
            else
                updateProximityPromptRanges(multiplier)
                setupRangeConnections(multiplier)
            end

            WindUI:Notify("互动范围", "已设置为 " .. multiplier .. "x", 3)
        end
    })
    local A = Window:Tab({Title = "规避类", Icon = "shield"})
    A:Toggle({
        Title = "规避Screech",
        Default = false,
        Callback = function(on)
            if on then
                for _, inst in ipairs(workspace:GetDescendants()) do
                    if inst.Name == "Screech" then
                        pcall(function()
                            inst:Destroy()
                        end)
                    end
                end

                getgenv().AntiScreechConn = workspace.DescendantAdded:Connect(function(inst)
                    if inst.Name == "Screech" then
                        task.defer(function()
                            if inst and inst.Parent then
                                pcall(function()
                                    inst:Destroy()
                                end)
                            end
                        end)
                    end
                end)
            elseif getgenv().AntiScreechConn then
                getgenv().AntiScreechConn:Disconnect()
                getgenv().AntiScreechConn = nil
            end
        end
    })

    A:Toggle({
        Title = "规避Gloom蛋",
        Default = false,
        Callback = function(Value)
            if getgenv().AntiGloomConn then
                getgenv().AntiGloomConn:Disconnect()
                getgenv().AntiGloomConn = nil
            end

            local rooms = workspace:WaitForChild("CurrentRooms")

            if Value then
                for _, v in ipairs(rooms:GetDescendants()) do
                    if v.Name == "GloomEgg" then
                        local egg = v:FindFirstChild("Egg")
                        if egg then
                            egg.CanTouch = false
                        end
                    end
                end

                getgenv().AntiGloomConn = rooms.DescendantAdded:Connect(function(v)
                    if v.Name == "GloomEgg" then
                        local egg = v:WaitForChild("Egg", 8999999488)
                        egg.CanTouch = false
                    elseif v.Name == "Egg" and v.Parent and v.Parent.Name == "GloomEgg" then
                        v.CanTouch = false
                    end
                end)
            else
                for _, v in ipairs(rooms:GetDescendants()) do
                    if v.Name == "GloomEgg" then
                        local egg = v:FindFirstChild("Egg")
                        if egg then
                            egg.CanTouch = true
                        end
                    end
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Dread",
        Default = false,
        Callback = function(isEnabled)
            local player = game:GetService("Players").LocalPlayer
            local modules = player.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules
            local dreadModule = modules:FindFirstChild("Dread") or modules:FindFirstChild("_Dread")

            if dreadModule then
                dreadModule.Name = isEnabled and "_Dread" or "Dread"
            end
        end
    })

    A:Toggle({
        Title = "规避Giggle",
        Default = false,
        Callback = function(Value)
            if getgenv().AntiGiggleConn then
                getgenv().AntiGiggleConn:Disconnect()
                getgenv().AntiGiggleConn = nil
            end

            local rooms = workspace:WaitForChild("CurrentRooms")

            if Value then
                for _, v in ipairs(rooms:GetDescendants()) do
                    if v.Name == "GiggleCeiling" then
                        local hitbox = v:FindFirstChild("Hitbox")
                        if hitbox then
                            hitbox.CanTouch = false
                        end
                    end
                end

                getgenv().AntiGiggleConn = rooms.DescendantAdded:Connect(function(v)
                    if v.Name == "GiggleCeiling" then
                        local hitbox = v:WaitForChild("Hitbox", 8999999488)
                        hitbox.CanTouch = false
                    elseif v.Name == "Hitbox" and v.Parent and v.Parent.Name == "GiggleCeiling" then
                        v.CanTouch = false
                    end
                end)
            else
                for _, v in ipairs(rooms:GetDescendants()) do
                    if v.Name == "GiggleCeiling" then
                        local hitbox = v:FindFirstChild("Hitbox")
                        if hitbox then
                            hitbox.CanTouch = true
                        end
                    end
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Figure听觉",
        Default = false,
        Tooltip = "让游戏认为你在蹲下",
        Callback = function(Value)
            local crouchConnection
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RunService = game:GetService("RunService")

            if crouchConnection then
                crouchConnection:Disconnect()
                crouchConnection = nil
            end

            if Value then
                crouchConnection = RunService.Heartbeat:Connect(function()
                    ReplicatedStorage.RemotesFolder.Crouch:FireServer(true)
                end)
            else
                ReplicatedStorage.RemotesFolder.Crouch:FireServer(false)
            end
        end
    })

    A:Toggle({
        Title = "规避Surge",
        Default = false,
        Callback = function(Value)
            if Value then
                local surgeClient = game.ReplicatedStorage:WaitForChild("FloorReplicated"):WaitForChild("ClientRemote"):FindFirstChild("SurgeClient")
                if surgeClient then
                    surgeClient:Destroy()
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Halt",
        Default = false,
        Callback = function(Value)
            local entityModules = game:GetService("ReplicatedStorage"):WaitForChild("ModulesClient"):WaitForChild("EntityModules")

            if Value then
                local shade = entityModules:FindFirstChild("Shade")
                if shade and shade:IsA("ModuleScript") then
                    shade.Name = "_Shade"
                end
            else
                local shade = entityModules:FindFirstChild("_Shade")
                if shade and shade:IsA("ModuleScript") then
                    shade.Name = "Shade"
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Lookman",
        Default = false,
        Callback = function(Value)
            if Value then
                if workspace:FindFirstChild("BackdoorLookman") then
                    game.ReplicatedStorage.RemotesFolder.MotorReplication:FireServer(-890)
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Snare",
        Default = false,
        Callback = function(Value)
            local currentRooms = workspace:WaitForChild("CurrentRooms")

            local function handleSnare(snare)
                if snare.Name == "Snare" then
                    local hitbox = snare:FindFirstChild("Hitbox")
                    if hitbox then
                        hitbox.CanTouch = not Value
                    else
                        snare.ChildAdded:Connect(function(child)
                            if child.Name == "Hitbox" then
                                child.CanTouch = not Value
                            end
                        end)
                    end
                end
            end

            for _, v in ipairs(currentRooms:GetDescendants()) do
                handleSnare(v)
            end

            currentRooms.DescendantAdded:Connect(handleSnare)
        end
    })

    A:Toggle({
        Title = "规避Seek障碍物",
        Default = false,
        Callback = function(Value)
            local Rooms = workspace.CurrentRooms

            if Value then
                getgenv().AntiSeekObstaclesConn = Rooms.DescendantAdded:Connect(function(desc)
                    if desc.Name == "Seek_Arm" then
                        desc:WaitForChild("AnimatorPart", 8999999488)
                        desc.AnimatorPart.CanTouch = false
                        desc.AnimatorPart.Transparency = 1

                        for _, part in desc:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 1
                            end
                        end
                    elseif desc.Name == "ChandelierObstruction" then
                        desc:WaitForChild("HurtPart", 8999999488)
                        desc.HurtPart.CanTouch = false
                        desc.HurtPart.Transparency = 1

                        for _, part in desc:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 1
                            end
                        end
                    end
                end)

                for _, v in Rooms:GetDescendants() do
                    if v.Name == "Seek_Arm" and v:IsA("Model") then
                        v:WaitForChild("AnimatorPart", 8999999488)
                        v.AnimatorPart.CanTouch = false
                        v.AnimatorPart.Transparency = 1

                        for _, part in v:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 1
                            end
                        end
                    elseif v.Name == "ChandelierObstruction" and v:IsA("Model") then
                        v:WaitForChild("HurtPart", 8999999488)
                        v.HurtPart.CanTouch = false
                        v.HurtPart.Transparency = 1

                        for _, part in v:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 1
                            end
                        end
                    end
                end
            else
                if getgenv().AntiSeekObstaclesConn then
                    getgenv().AntiSeekObstaclesConn:Disconnect()
                end

                for _, v in Rooms:GetDescendants() do
                    if v.Name == "Seek_Arm" and v:IsA("Model") then
                        v:WaitForChild("AnimatorPart", 8999999488)
                        v.AnimatorPart.CanTouch = true
                        v.AnimatorPart.Transparency = 0

                        for _, part in v:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 0
                            end
                        end
                    elseif v.Name == "ChandelierObstruction" and v:IsA("Model") then
                        v:WaitForChild("HurtPart", 8999999488)
                        v.HurtPart.CanTouch = true
                        v.HurtPart.Transparency = 0

                        for _, part in v:GetDescendants() do
                            if part:IsA("BasePart") then
                                part.Transparency = 0
                            end
                        end
                    end
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Dupe门",
        Default = false,
        Callback = function(Value)
            for _, v in ipairs(workspace.CurrentRooms:GetDescendants()) do
                if v.Name == "DoorFake" then
                    v:WaitForChild("Hidden").CanTouch = not Value

                    local lock = v:FindFirstChild("Lock")
                    if lock then
                        local prompt = lock:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then
                            prompt.ClickablePrompt = not Value
                        end
                    end
                end
            end
        end
    })

    A:Toggle({
        Title = "规避真空区域",
        Default = false,
        Callback = function(Value)
            for _, v in ipairs(workspace.CurrentRooms:GetDescendants()) do
                if v.Name == "SideroomSpace" then
                    for _, part in ipairs(v:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanTouch = not Value
                            part.CanCollide = Value
                        end
                    end
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Eyes",
        Default = false,
        Tooltip = "当Eyes出现时自动向下看以防止伤害",
        Callback = function(Value)
            local LocalPlayer = game.Players.LocalPlayer
            local Connections = {}

            if Value then
                Connections.AntiEyes = game:GetService("RunService").RenderStepped:Connect(function()
                    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        return
                    end
                    if not LocalPlayer.Character:GetAttribute("Hiding") then
                        for _, v in pairs(workspace:GetChildren()) do
                            if v.Name == "Eyes" and v:FindFirstChild("Core") and v.Core:FindFirstChild("Ambience") and v.Core.Ambience.Playing then
                                game.ReplicatedStorage.RemotesFolder.MotorReplication:FireServer(-650)
                                break
                            end
                        end
                    end
                end)
            elseif Connections.AntiEyes then
                Connections.AntiEyes:Disconnect()
                Connections.AntiEyes = nil
            end
        end
    })

    A:Toggle({
        Title = "规避A-90",
        Default = false,
        Tooltip = "移除A90",
        Callback = function(ad)
            local LocalPlayer = game.Players.LocalPlayer
            local modules = LocalPlayer.PlayerGui:FindFirstChild("MainUI") and 
                           LocalPlayer.PlayerGui.MainUI:FindFirstChild("Initiator") and 
                           LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild("Main_Game") and 
                           LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game:FindFirstChild("RemoteListener") and 
                           LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Modules")
            local c3 = modules and (modules:FindFirstChild("A90") or modules:FindFirstChild("_A90"))

            if c3 then
                c3.Name = ad and "_A90" or "A90"
            end

            local remote = (game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") and 
                           game:GetService("ReplicatedStorage").RemotesFolder:FindFirstChild("A90")) or 
                           game:GetService("ReplicatedStorage").RemotesFolder:FindFirstChild("_A90")

            if remote then
                remote.Name = ad and "_A90" or "A90"
            end
        end
    })
    A:Toggle({
        Title = "规避虚空效果",
        Default = false,
        Callback = function(Value)
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local entityModules = ReplicatedStorage:FindFirstChild("ModulesClient") and 
                                 ReplicatedStorage.ModulesClient:FindFirstChild("EntityModules")

            if not entityModules then
                return
            end

            local voidModule = entityModules:FindFirstChild("Void") or entityModules:FindFirstChild("_Void")

            if not voidModule then
                return
            end

            if Value then
                if voidModule.Name == "Void" then
                    voidModule.Name = "_Void"
                end
            elseif voidModule.Name == "_Void" then
                voidModule.Name = "Void"
            end
        end
    })

    A:Toggle({
        Title = "规避Haste效果",
        Default = false,
        Callback = function(Value)
            if game.ReplicatedStorage.FloorReplicated.ClientRemote:FindFirstChild("Haste") then
                local HasteChanged = game.ReplicatedStorage.FloorReplicated.ClientRemote.Haste.Ambience:GetPropertyChangedSignal("Playing"):Connect(function()
                    if Value then
                        game.ReplicatedStorage.FloorReplicated.ClientRemote.Haste.Ambience.Playing = false
                    end
                end)
            end

            for _, v in workspace.CurrentCamera:GetChildren() do
                if v.Name == "LiveSanity" and workspace:FindFirstChild("EntityModel") then
                    v.Enabled = not Value
                end
            end
        end
    })

    A:Toggle({
        Title = "规避Firedamp",
        Default = false,
        Callback = function(Value)
            local camera = workspace:WaitForChild("Camera")
            local targets = {
                LiveSantity = true,
                LiveFiredamp = true,
            }

            local function checkAndDelete(obj)
                if targets[obj.Name] then
                    obj:Destroy()
                end
            end

            if getgenv().AntiFiredampConnection then
                getgenv().AntiFiredampConnection:Disconnect()
                getgenv().AntiFiredampConnection = nil
            end

            if Value then
                for _, child in ipairs(camera:GetChildren()) do
                    checkAndDelete(child)
                end

                getgenv().AntiFiredampConnection = camera.ChildAdded:Connect(function(child)
                    checkAndDelete(child)
                end)
            end
        end
    })

    A:Toggle({
        Title = "规避矿井氛围",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                local caveAtmosphere = Lighting:FindFirstChild("CaveAtmosphere")
                if caveAtmosphere then
                    caveAtmosphere:Destroy()
                end

                local caves = Lighting:FindFirstChild("Caves")
                if caves then
                    caves:Destroy()
                end
            end
        end
    })

    A:Toggle({
        Title = "规避氧气/理智效果",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                local sanity = Lighting:FindFirstChild("Sanity")
                if sanity then
                    sanity:Destroy()
                end

                local oxygenCC = Lighting:FindFirstChild("OxygenCC")
                if oxygenCC then
                    oxygenCC:Destroy()
                end

                local oxygenBlur = Lighting:FindFirstChild("OxygenBlur")
                if oxygenBlur then
                    oxygenBlur:Destroy()
                end
            end
        end
    })

    A:Toggle({
        Title = "无雾效果",
        Default = false,
        Callback = function(Value)
            local lighting = game:GetService("Lighting")
            local cave = lighting:FindFirstChild("CaveAtmosphere")

            if Value then
                if cave and cave:IsA("Atmosphere") then
                    cave.Density = 0
                else
                    lighting.FogStart = 1000000
                    lighting.FogEnd = 1000000
                end
            elseif cave and cave:IsA("Atmosphere") then
                cave.Density = 0.15
            else
                lighting.FogStart = 150
                lighting.FogEnd = 150
            end
        end
    })

    A:Toggle({
        Title = "无相机抖动",
        Default = false,
        Callback = function(Value)
            local RequiredMainGame = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("Initiator"):WaitForChild("Main_Game"))
            
            task.spawn(function()
                while Value and RequiredMainGame do
                    task.wait()
                    if typeof(RequiredMainGame.csgo) == "CFrame" then
                        RequiredMainGame.csgo = CFrame.new()
                    end
                end
            end)
        end
    })

    A:Toggle({
        Title = "无头部晃动",
        Default = false,
        Callback = function(Value)
            local RunService = game:GetService("RunService")
            local RequiredMainGame = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("Initiator"):WaitForChild("Main_Game"))

            if Value then
                if not getgenv().HeadBobDisabler then
                    getgenv().HeadBobDisabler = RunService.RenderStepped:Connect(function()
                        if RequiredMainGame and RequiredMainGame.spring then
                            if typeof(RequiredMainGame.spring.Target) == "Vector3" then
                                RequiredMainGame.spring.Target = Vector3.zero
                                RequiredMainGame.spring.Position = Vector3.zero
                            end
                        end
                    end)
                end
            elseif getgenv().HeadBobDisabler then
                getgenv().HeadBobDisabler:Disconnect()
                getgenv().HeadBobDisabler = nil
            end
        end
    })
    A:Toggle({
        Title = "无过场动画",
        Default = false,
        Callback = function(Value)
            local player = game:GetService("Players").LocalPlayer
            local RemoteListener = player.PlayerGui.MainUI.Initiator.Main_Game:WaitForChild("RemoteListener")
            local CutScenes = RemoteListener:FindFirstChild("Cutscenes") or RemoteListener:FindFirstChild("_Cutscenes")

            if not CutScenes then
                CutScenes = RemoteListener:WaitForChild("Cutscenes", 3) or RemoteListener:WaitForChild("_Cutscenes", 3)
            end

            if CutScenes then
                CutScenes.Name = Value and "_Cutscenes" or "Cutscenes"
            end
        end
    })

    A:Toggle({
        Title = "规避隐藏边缘",
        Default = false,
        Tooltip = "移除隐藏时的黑暗边缘",
        Callback = function(Value)
            local LocalPlayer = game.Players.LocalPlayer
            LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Image = Value and "rbxassetid://0" or "rbxassetid://6100076320"
        end
    })

   A:Toggle({
        Title = "防卡顿",
        Default = false,
        Callback = function(Value)
            local Modifiers = workspace:FindFirstChild("Modifiers")
            if Modifiers and not Modifiers:FindFirstChild("Jammin") then
                return
            end

            local mainTrack = game["SoundService"]:FindFirstChild("Main")
            if mainTrack then
                local jamming = mainTrack:FindFirstChild("Jamming")
                if jamming then
                    jamming.Enabled = not Value
                end
            end

            local mainUI = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("MainUI")
            if mainUI then
                local healthGui = mainUI:FindFirstChild("Initiator") and 
                                 mainUI.Initiator:FindFirstChild("Main_Game") and 
                                 mainUI.Initiator.Main_Game:FindFirstChild("Health")
                if healthGui then
                    local jamSound = healthGui:FindFirstChild("Jam")
                    if jamSound then
                        jamSound.Playing = not Value
                    end
                end
            end
        end
    })
    A:Toggle({
        Title = "防香蕉皮",
        Default = false,
        Callback = function(Value)
            local currentRooms = workspace:WaitForChild("CurrentRooms")
            
            if getgenv().antiBananaConn then
                getgenv().antiBananaConn:Disconnect()
                getgenv().antiBananaConn = nil
            end

            for _, v in pairs(currentRooms:GetDescendants()) do
                if v.Name == "BananaPeel" and v:IsA("BasePart") then
                    v.CanTouch = not Value
                end
            end

            if Value then
                getgenv().antiBananaConn = currentRooms.DescendantAdded:Connect(function(v)
                    if v.Name == "BananaPeel" and v:IsA("BasePart") then
                        v.CanTouch = false
                    end
                end)
            end
        end
    })

    A:Toggle({
        Title = "防Jeff杀手",
        Default = false,
        Callback = function(Value)
            local currentRooms = workspace:WaitForChild("CurrentRooms")
            
            if getgenv().antiJeffConn then
                getgenv().antiJeffConn:Disconnect()
                getgenv().antiJeffConn = nil
            end

            for _, model in pairs(currentRooms:GetDescendants()) do
                if model.Name == "JeffTheKiller" and model:IsA("Model") then
                    for _, part in ipairs(model:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanTouch = not Value
                        end
                    end
                end
            end

            if Value then
                getgenv().antiJeffConn = currentRooms.DescendantAdded:Connect(function(v)
                    if v.Name == "JeffTheKiller" and v:IsA("Model") then
                        for _, part in ipairs(v:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.CanTouch = false
                            end
                        end
                    end
                end)
            end
        end
    })
    local ESPTab = Window:Tab({Title = "透视功能", Icon = "eye"})
local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSESP/refs/heads/main/source.luau"))()
ESPLibrary.GlobalConfig.Distance = false
local ColorConfig = {
    ["红色"] = Color3.fromRGB(255, 0, 0),
    ["绿色"] = Color3.fromRGB(0, 255, 0),
    ["蓝色"] = Color3.fromRGB(0, 0, 255),
    ["黄色"] = Color3.fromRGB(255, 255, 0),
    ["紫色"] = Color3.fromRGB(255, 0, 255),
    ["青色"] = Color3.fromRGB(0, 255, 255),
    ["粉色"] = Color3.fromRGB(255, 182, 193),
    ["橙色"] = Color3.fromRGB(255, 165, 0),
    ["白色"] = Color3.fromRGB(255, 255, 255),
    ["彩虹动态"] = Color3.fromRGB(255, 0, 0)
}
local ESPGroup = ESPTab:Section({Title = "ESP设置[展开]", Side = "Left"})

ESPGroup:Toggle({
    Title = "启用追踪线",
    Default = false,
    Callback = function(Value)
        _G.EnableTracers = Value
        UpdateAllESP()
    end
})

ESPGroup:Toggle({
    Title = "启用方向箭头", 
    Default = false,
    Callback = function(Value)
        _G.EnableArrows = Value
        UpdateAllESP()
    end
})

ESPGroup:Dropdown({
    Title = "ESP类型",
    Values = {"高亮", "文字", "选择框"},
    Default = "高亮",
    Callback = function(Value)
        local espTypes = {
            ["高亮"] = "Highlight",
            ["文字"] = "Text", 
            ["选择框"] = "SelectionBox"
        }
        _G.ESPType = espTypes[Value]
        UpdateAllESP()
    end
})

local ObjectESPGroup = ESPTab:Section({Title = "物体透视[展开]", Side = "Left"})

local ObjectESPConfig = {
    {
        Name = "DoorESP",
        Title = "门透视",
        DefaultColor = "白色",
        Models = {"Door"},
        DisplayName = "门"
    },
    {
        Name = "ObjectiveESP", 
        Title = "目标物品透视",
        DefaultColor = "黄色",
        Models = {"KeyObtain", "FuseObtain", "LiveBreakerPolePickup"},
        DisplayName = "目标物品"
    },
    {
        Name = "CoinESP",
        Title = "金币透视",
        DefaultColor = "白色", 
        Models = {"GoldPile"},
        DisplayName = "金币"
    },
    {
        Name = "MinesGeneratorESP",
        Title = "矿洞发电机透视",
        DefaultColor = "青色",
        Models = {"MinesGenerator"},
        DisplayName = "发电机"
    },
    {
        Name = "LeverESP",
        Title = "杠杆透视",
        DefaultColor = "橙色",
        Models = {"LeverForGate"},
        DisplayName = "杠杆"
    },
    {
        Name = "ItemESP",
        Title = "所有物品透视", 
        DefaultColor = "黄色",
        Models = {
            "AlarmClock", "Aloe", "BandagePack", "Battery", "BatteryPack", "Candle",
            "Compass", "Crucifix", "Flashlight", "Glowstick", "HolyHandGrenade",
            "Lantern", "LaserPointer", "Lighter", "Lockpick", "LotusFlower", 
            "Multitool", "NVCS3000", "Shears", "SkeletonKey", "Smoothie", "Vitamins"
        },
        DisplayName = "物品"
    },
    {
        Name = "ClosetESP",
        Title = "柜子透视",
        DefaultColor = "粉色",
        Models = {"Wardrobe", "Toolshed", "Locker_Large", "Backdoor_Wardrobe"},
        DisplayName = "柜子"
    },
    {
        Name = "AnchorESP",
        Title = "锚点透视",
        DefaultColor = "粉色",
        Models = {"MinesAnchor"},
        DisplayName = "锚点"
    },
    {
        Name = "LibraryBookESP",
        Title = "图书馆书籍透视",
        DefaultColor = "青色", 
        Models = {"LiveHintBook"},
        DisplayName = "书籍"
    },
    {
        Name = "ChestESP",
        Title = "宝箱透视",
        DefaultColor = "绿色",
        Models = {"ChestBox", "ChestBoxLocked"},
        DisplayName = "宝箱"
    }
}

local EntityESPConfig = {
    {
        Name = "SeekESP",
        Title = "追逐者透视", 
        DefaultColor = "红色",
        Models = {"SeekMoving"},
        DisplayName = "追逐者"
    },
    {
        Name = "FigureESP",
        Title = "雕像透视",
        DefaultColor = "白色",
        Models = {"FigureRig"},
        DisplayName = "雕像"
    },
    {
        Name = "AmbushESP",
        Title = "伏击透视",
        DefaultColor = "白色",
        Models = {"AmbushMoving"},
        DisplayName = "伏击"
    },
    {
        Name = "RushESP", 
        Title = "冲刺透视",
        DefaultColor = "白色",
        Models = {"RushMoving"},
        DisplayName = "冲刺"
    },
    {
        Name = "SnareESP",
        Title = "陷阱透视",
        DefaultColor = "白色",
        Models = {"Snare"},
        DisplayName = "陷阱"
    },
    {
        Name = "GiggleESP",
        Title = "傻笑透视",
        DefaultColor = "白色",
        Models = {"GiggleCeiling"},
        DisplayName = "傻笑"
    },
    {
        Name = "EyestalkESP",
        Title = "眼柄透视",
        DefaultColor = "白色", 
        Models = {"EyestalkMoving"},
        DisplayName = "眼柄"
    },
    {
        Name = "MandrakeESP",
        Title = "曼德拉草透视",
        DefaultColor = "白色",
        Models = {"Mandrake"},
        DisplayName = "曼德拉草"
    },
    {
        Name = "GroundskeeperESP",
        Title = "园丁透视",
        DefaultColor = "白色",
        Models = {"Groundskeeper"},
        DisplayName = "园丁"
    },
    {
        Name = "BlitzESP",
        Title = "闪电透视",
        DefaultColor = "白色",
        Models = {"BackdoorRush"},
        DisplayName = "闪电"
    }
}

for _, config in ipairs(ObjectESPConfig) do
    ObjectESPGroup:Toggle({
        Title = config.Title,
        Default = false,
        Callback = function(Value)
            CreateESP(config.Name, Value, config.Models, config.DisplayName, _G[config.Name .. "_Color"])
        end
    })
    
    ObjectESPGroup:Dropdown({
        Title = config.Title .. "颜色",
        Values = {"红色", "绿色", "蓝色", "黄色", "紫色", "青色", "粉色", "橙色", "白色", "彩虹动态"},
        Default = config.DefaultColor,
        Callback = function(Value)
            _G[config.Name .. "_Color"] = ColorConfig[Value]
            if _G[config.Name .. "_Enabled"] then
                CreateESP(config.Name, true, config.Models, config.DisplayName, _G[config.Name .. "_Color"])
            end
        end
    })
end
local EntityESPGroup = ESPTab:Section({Title = "实体透视[展开]", Side = "Right"})
for _, config in ipairs(EntityESPConfig) do
    EntityESPGroup:Toggle({
        Title = config.Title,
        Default = false,
        Callback = function(Value)
            CreateESP(config.Name, Value, config.Models, config.DisplayName, _G[config.Name .. "_Color"])
        end
    })
    
    EntityESPGroup:Dropdown({
        Title = config.Title .. "颜色",
        Values = {"红色", "绿色", "蓝色", "黄色", "紫色", "青色", "粉色", "橙色", "白色", "彩虹动态"},
        Default = config.DefaultColor,
        Callback = function(Value)
            _G[config.Name .. "_Color"] = ColorConfig[Value]
            if _G[config.Name .. "_Enabled"] then
                CreateESP(config.Name, true, config.Models, config.DisplayName, _G[config.Name .. "_Color"])
            end
        end
    })
end
local ESPData = {}
local RainbowConnection
function CreateESP(espName, enabled, targetModels, displayName, color)
    if not enabled then
     
        if ESPData[espName] then
            for _, element in pairs(ESPData[espName].Elements) do
                if element and element.Destroy then
                    element:Destroy()
                end
            end
            
            if ESPData[espName].Connections then
                for _, conn in pairs(ESPData[espName].Connections) do
                    if conn then conn:Disconnect() end
                end
            end
            
            ESPData[espName] = nil
        end
        _G[espName .. "_Enabled"] = false
        return
    end
    
  
    _G[espName .. "_Enabled"] = true
    
    if not ESPData[espName] then
        ESPData[espName] = {
            Elements = {},
            Connections = {},
            Models = targetModels,
            DisplayName = displayName,
            Color = color or Color3.fromRGB(255, 255, 255)
        }
    else
       
        for _, element in pairs(ESPData[espName].Elements) do
            if element and element.Destroy then
                element:Destroy()
            end
        end
        ESPData[espName].Elements = {}
    end
    
    ESPData[espName].Color = color or ESPData[espName].Color
    
    local function AddESPToObject(obj)
        if not obj:IsA("Model") then return end
        
        local isValid = false
        for _, modelName in ipairs(targetModels) do
            if obj.Name == modelName then
                isValid = true
                break
            end
        end
        
        if not isValid then return end
        
        local targetPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
        if not targetPart then return end
        
     
        for _, existingElement in pairs(ESPData[espName].Elements) do
            if existingElement.Object == obj then
                return
            end
        end
        
        local espSettings = {
            Name = displayName,
            Model = targetPart,
            Color = ESPData[espName].Color,
            MaxDistance = 1000,
            TextSize = 14,
            ESPType = _G.ESPType or "Highlight",
            FillColor = ESPData[espName].Color,
            OutlineColor = ESPData[espName].Color,
            FillTransparency = 0.7,
            OutlineTransparency = 0,
            Tracer = {
                Enabled = _G.EnableTracers or false,
                Color = ESPData[espName].Color,
                From = "Bottom",
            },
            Arrow = {
                Enabled = _G.EnableArrows or false,
                Color = ESPData[espName].Color,
            },
        }
        
        local espElement = ESPLibrary:Add(espSettings)
        
        table.insert(ESPData[espName].Elements, {
            Object = obj,
            Element = espElement,
            Part = targetPart
        })
    end
    
   
    for _, obj in ipairs(workspace:GetDescendants()) do
        AddESPToObject(obj)
    end
    
   
    local addedConn = workspace.DescendantAdded:Connect(function(obj)
        if _G[espName .. "_Enabled"] then
            AddESPToObject(obj)
        end
    end)
    local removingConn = workspace.DescendantRemoving:Connect(function(obj)
        if not _G[espName .. "_Enabled"] then return end
        
        for i, elementData in ipairs(ESPData[espName].Elements) do
            if elementData.Object == obj then
                if elementData.Element and elementData.Element.Destroy then
                    elementData.Element:Destroy()
                end
                table.remove(ESPData[espName].Elements, i)
                break
            end
        end
    end)
    
 
    local updateConn = game:GetService("RunService").Heartbeat:Connect(function()
        if not _G[espName .. "_Enabled"] then
            updateConn:Disconnect()
            return
        end
        
        local player = game.Players.LocalPlayer
        local character = player and player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if not rootPart then return end
        
      
        local currentColor = ESPData[espName].Color
        if ESPData[espName].Color == ColorConfig["彩虹动态"] then
            local time = tick()
            local r = math.sin(time * 2) * 0.5 + 0.5
            local g = math.sin(time * 2 + 2) * 0.5 + 0.5  
            local b = math.sin(time * 2 + 4) * 0.5 + 0.5
            currentColor = Color3.new(r, g, b)
        end
        
        for i, elementData in ipairs(ESPData[espName].Elements) do
            if elementData.Object and elementData.Object.Parent and elementData.Part and elementData.Part.Parent then
                if elementData.Element then
                    local distance = (rootPart.Position - elementData.Part.Position).Magnitude
                    elementData.Element.CurrentSettings.Name = string.format("%s\n%d单位", displayName, math.floor(distance))
                    
                 
                    elementData.Element.CurrentSettings.Color = currentColor
                    elementData.Element.CurrentSettings.FillColor = currentColor
                    elementData.Element.CurrentSettings.OutlineColor = currentColor
                    elementData.Element.CurrentSettings.Tracer.Color = currentColor
                    elementData.Element.CurrentSettings.Arrow.Color = currentColor
                    
                 
                    elementData.Element.CurrentSettings.Tracer.Enabled = _G.EnableTracers or false
                    elementData.Element.CurrentSettings.Arrow.Enabled = _G.EnableArrows or false
                    elementData.Element.CurrentSettings.ESPType = _G.ESPType or "Highlight"
                end
            else
              
                if elementData.Element and elementData.Element.Destroy then
                    elementData.Element:Destroy()
                end
                table.remove(ESPData[espName].Elements, i)
            end
        end
    end)
    
    table.insert(ESPData[espName].Connections, addedConn)
    table.insert(ESPData[espName].Connections, removingConn) 
    table.insert(ESPData[espName].Connections, updateConn)
end
function UpdateAllESP()
    for espName, data in pairs(ESPData) do
        if _G[espName .. "_Enabled"] then
            CreateESP(espName, true, data.Models, data.DisplayName, data.Color)
        end
    end
end
for _, config in ipairs(ObjectESPConfig) do
    _G[config.Name .. "_Color"] = ColorConfig[config.DefaultColor]
end

for _, config in ipairs(EntityESPConfig) do
    _G[config.Name .. "_Color"] = ColorConfig[config.DefaultColor]
end
local function StartRainbowEffect()
    if RainbowConnection then RainbowConnection:Disconnect() end
    
    RainbowConnection = game:GetService("RunService").Heartbeat:Connect(function()
        local time = tick()
        local r = math.sin(time * 2) * 0.5 + 0.5
        local g = math.sin(time * 2 + 2) * 0.5 + 0.5
        local b = math.sin(time * 2 + 4) * 0.5 + 0.5
        
        ColorConfig["彩虹动态"] = Color3.new(r, g, b)
        for espName, data in pairs(ESPData) do
            if data.Color == ColorConfig["彩虹动态"] and _G[espName .. "_Enabled"] then
                data.Color = ColorConfig["彩虹动态"]
            end
        end
    end)
end
local function CleanupESP()
    for espName, data in pairs(ESPData) do
        for _, elementData in pairs(data.Elements) do
            if elementData.Element and elementData.Element.Destroy then
                elementData.Element:Destroy()
            end
        end
        
        for _, conn in pairs(data.Connections) do
            if conn then conn:Disconnect() end
        end
    end
    
    ESPData = {}
    
    if RainbowConnection then
        RainbowConnection:Disconnect()
        RainbowConnection = nil
    end
end
game:GetService("Players").LocalPlayer.AncestryChanged:Connect(function(_, parent)
    if not parent then
        CleanupESP()
    end
end)
StartRainbowEffect()
_G.ESPType = "Highlight"
_G.EnableTracers = false
_G.EnableArrows = false
    local NotificationTab = Window:Tab({Title = "提示", Icon = "bell"})

local EntityNotifyGroup = NotificationTab:Section({Title = "实体刷新提示[展开]", Side = "Left"})

local EntityNotifications = {
    Screech = {
        Description = "尖啸者已生成",
        Color = Color3.fromRGB(255, 255, 0)
    },
    Halt = {
        Description = "暂停实体已出现", 
        Color = Color3.fromRGB(0, 255, 255)
    },
    FigureRig = {
        Description = "检测到雕像",
        Color = Color3.fromRGB(255, 0, 0)
    },
    Eyes = {
        Description = "眼睛实体已生成",
        Color = Color3.fromRGB(127, 30, 220)
    },
    SeekMoving = {
        Description = "追逐者已生成",
        Color = Color3.fromRGB(255, 100, 100)
    },
    RushMoving = {
        Description = "冲刺正在接近",
        Color = Color3.fromRGB(0, 255, 0)
    },
    AmbushMoving = {
        Description = "伏击正在接近", 
        Color = Color3.fromRGB(80, 255, 110)
    },
    A60 = {
        Description = "A-60 正在冲刺",
        Color = Color3.fromRGB(200, 50, 50)
    },
    A120 = {
        Description = "A-120 在附近",
        Color = Color3.fromRGB(55, 55, 55)
    },
    GiggleCeiling = {
        Description = "傻笑在天花板上",
        Color = Color3.fromRGB(200, 200, 200)
    },
    GrumbleRig = {
        Description = "咕噜在巡逻",
        Color = Color3.fromRGB(150, 150, 150)
    },
    GloombatSwarm = {
        Description = "暗影蝙蝠群来袭",
        Color = Color3.fromRGB(100, 100, 100)
    },
    Dread = {
        Description = "恐惧实体已激活",
        Color = Color3.fromRGB(80, 80, 80)
    },
    BackdoorLookman = {
        Description = "观察者在注视",
        Color = Color3.fromRGB(110, 15, 15)
    },
    Snare = {
        Description = "陷阱已生成",
        Color = Color3.fromRGB(100, 100, 100)
    },
    WorldLotus = {
        Description = "检测到世界莲花",
        Color = Color3.fromRGB(200, 230, 50)
    },
    Bramble = {
        Description = "荆棘在生长",
        Color = Color3.fromRGB(50, 150, 30)
    },
    Caws = {
        Description = "乌鸦在飞行",
        Color = Color3.fromRGB(30, 30, 30)
    },
    Eyestalk = {
        Description = "眼柄将要追逐",
        Color = Color3.fromRGB(150, 80, 200)
    },
    Grampy = {
        Description = "爷爷已出现",
        Color = Color3.fromRGB(180, 180, 180)
    },
    Groundskeeper = {
        Description = "园丁在附近",
        Color = Color3.fromRGB(100, 150, 50)
    },
    Mandrake = {
        Description = "曼德拉草在尖叫",
        Color = Color3.fromRGB(130, 80, 30)
    },
    Monument = {
        Description = "纪念碑已激活",
        Color = Color3.fromRGB(150, 150, 150)
    },
    Surge = {
        Description = "浪涌在充能",
        Color = Color3.fromRGB(230, 130, 30)
    },
    BackdoorRush = {
        Description = "闪电即将到来",
        Color = Color3.fromRGB(230, 130, 30)
    }
}

local NotifyConnections = {}

EntityNotifyGroup:Toggle({
    Title = "尖啸者提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Screech", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "暂停实体提示", 
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Halt", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "雕像提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("FigureRig", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "眼睛提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Eyes", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "追逐者提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("SeekMoving", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "冲刺提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("RushMoving", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "伏击提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("AmbushMoving", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "A-60提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("A60", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "A-120提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("A120", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "傻笑提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("GiggleCeiling", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "咕噜提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("GrumbleRig", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "暗影蝙蝠提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("GloombatSwarm", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "恐惧提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Dread", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "观察者提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("BackdoorLookman", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "陷阱提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Snare", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "世界莲花提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("WorldLotus", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "荆棘提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Bramble", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "乌鸦提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Caws", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "眼柄提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Eyestalk", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "爷爷提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Grampy", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "园丁提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Groundskeeper", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "曼德拉草提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Mandrake", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "纪念碑提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Monument", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "浪涌提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("Surge", Value)
    end
})

EntityNotifyGroup:Toggle({
    Title = "闪电提示",
    Default = false,
    Callback = function(Value)
        SetupEntityNotification("BackdoorRush", Value)
    end
})

function SetupEntityNotification(entityName, enabled)
    if NotifyConnections[entityName] then
        NotifyConnections[entityName]:Disconnect()
        NotifyConnections[entityName] = nil
    end

    if not enabled then return end

    local entityData = EntityNotifications[entityName]
    if not entityData then return end

    local function onEntityAdded(obj)
        if obj.Name == entityName then
            WindUI:Notify("实体刷新", entityData.Description, 5)
        end
    end

    NotifyConnections[entityName] = workspace.ChildAdded:Connect(onEntityAdded)

    local rooms = workspace:FindFirstChild("CurrentRooms")
    if rooms then
        local roomConn = rooms.DescendantAdded:Connect(function(obj)
            if obj.Name == entityName then
                WindUI:Notify("实体刷新", entityData.Description, 5)
            end
        end)
        NotifyConnections[entityName .. "_Rooms"] = roomConn
    end
end
end

-- 添加状态监控功能
local function UpdateStatus()
    if Character and Character:FindFirstChildOfClass("Humanoid") then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local statusText = string.format("速度: %d | 跳跃: %d | 重力: %.1f", 
            Humanoid.WalkSpeed, Humanoid.JumpPower, workspace.Gravity)
        
        -- 更新状态显示
        StatusSection:SetDesc(statusText)
    end
end

-- 定期更新状态
while true do
    UpdateStatus()
    wait(2)
end
    
local GameTab = Window:Tab({
    Title = "游戏",
    Icon = "gamepad-2",
    Locked = false,
})

GameTab:Section({Title = "选择加载服务器", Icon = "settings", IconSize = 30, Opened = true})

local function checkID(id)
    return game.PlaceId == id
end

GameTab:Button({
    Title = "点击加载逃走海啸获得脑力服务器",
    Value = false,
    Callback = function(value)
        if checkID(131623223084840) then
            mgdcj()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是逃走海啸获得脑力",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载SCP角色扮演服务器",
    Value = false,
    Callback = function(value)
        if checkID(5041144419) then
            loadSCPFunctions()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是SCP角色扮演服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载把火车开到终点服务器",
    Value = false,
    Callback = function(value)
        if checkID(18133095266) then
            huoce()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是把火车开到终点服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载河北唐县服务器",
    Value = false,
    Callback = function(value)
        if checkID(4618049391) then
            hiii()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是河北唐县服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载chain服务器",
    Value = false,
    Callback = function(value)
        if checkID(10204250851) then
            toji()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是chain服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})


GameTab:Button({
    Title = "点击加载通缉服务器",
    Value = false,
    Callback = function(value)
        if checkID(14438406081) then
            tojis()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是通缉服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载监狱人生服务器",
    Value = false,
    Callback = function(value)
        if checkID(155615604) then
            jian()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是监狱人生服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载被遗弃服务器",
    Value = false,
    Callback = function(value)
        if checkID(18687417158) then
            bei()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是被遗弃服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载力量传奇服务器",
    Value = false,
    Callback = function(value)
        if checkID(3623096087) then
            lilian()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是力量传奇服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载战争大亨服务器",
    Value = false,
    Callback = function(value)
        if checkID(4639625707) then
            zan()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是战争大亨服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

GameTab:Button({
    Title = "点击加载doors服务器",
    Value = false,
    Callback = function(value)
        if checkID(2440500124) then
            door()
        else
            WindUI:Notify({
                Title = "错误",
                Content = "当前游戏不是doors服务器",
                Duration = 5,
                Icon = "x"
            })
        end
    end
})

local Scripts = window:Tab({
    Title = "脚本大全",
    Icon = "server",
    Locked = false,
})

Scripts:Button({
		Title = "云脚本",
		Callback = function()
		loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10")()
		end
	})
	
Scripts:Button({
		Title = "皮脚本",
		Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
		end
	})
	
Scripts:Button({
		Title = "XA HUB",
		Callback = function()
loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
		end
	})
	
Scripts:Button({
		Title = "XK脚本",
		Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
		end
	})
	
Scripts:Button({
		Title = "叶脚本",
		Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-CNVIP-XIAOYE.lua"))()
		end
	})
	
Scripts:Button({
		Title = "X脚本",
		Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/maowang1/xx/refs/heads/main/Protected_8858329470146381.txt"))()
		end
	})
	
Scripts:Button({
		Title = "剑客破解版",
		Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/eksan966/Sword_Guest/refs/heads/main/VIP"))()
		end
	})
	
local PlayerTab = Window:Tab({
    Title = "角色控制",
    Icon = "settings"
})

-- 存储当前设置的值
local Settings = {
    WalkSpeed = 16,
    JumpPower = 50,
    Gravity = 196.2
}

-- 获取本地玩家
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- 监听角色变化
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    wait(1) -- 等待角色完全加载
    ApplySettings()
end)

-- 应用设置函数
local function ApplySettings()
    if Character then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.WalkSpeed = Settings.WalkSpeed
            Humanoid.JumpPower = Settings.JumpPower
        end
    end
    
    -- 设置重力
    game:GetService("Workspace").Gravity = Settings.Gravity
end

-- 速度控制滑块
PlayerTab:Slider({
    Title = "移动速度",
    Desc = "控制角色移动速度",
    Value = {
        Min = 0,
        Max = 100,
        Default = Settings.WalkSpeed
    },
    Callback = function(value)
        Settings.WalkSpeed = value
        ApplySettings()
    end
})

-- 跳跃高度控制滑块
PlayerTab:Slider({
    Title = "跳跃高度",
    Desc = "控制角色跳跃高度",
    Value = {
        Min = 0,
        Max = 100,
        Default = Settings.JumpPower
    },
    Callback = function(value)
        Settings.JumpPower = value
        ApplySettings()
    end
})

-- 重力控制滑块
PlayerTab:Slider({
    Title = "重力设置",
    Desc = "控制游戏世界重力",
    Value = {
        Min = 0,
        Max = 500,
        Default = Settings.Gravity
    },
    Callback = function(value)
        Settings.Gravity = value
        ApplySettings()
    end
})

-- 添加一个段落来显示当前状态
local StatusSection = PlayerTab:Paragraph({
    Title = "当前状态",
    Desc = "实时显示角色状态信息"
})

-- 创建重置按钮
PlayerTab:Button({
    Title = "重置设置",
    Desc = "恢复默认设置",
    Icon = "refresh-cw",
    Callback = function()
        Settings.WalkSpeed = 16
        Settings.JumpPower = 50
        Settings.Gravity = 196.2
        ApplySettings()
        
        -- 刷新滑块显示
        Window:SelectTab(1) -- 重新选择标签页来刷新
    end
})

-- 添加预设配置部分
local PresetSection = PlayerTab:Section({
    Title = "预设配置",
    Icon = "zap"
})

-- 快速预设按钮
PlayerTab:Button({
    Title = "超级速度",
    Desc = "设置超高速移动",
    Icon = "rocket",
    Callback = function()
        Settings.WalkSpeed = 100
        Settings.JumpPower = 75
        ApplySettings()
    end
})

PlayerTab:Button({
    Title = "月球模式",
    Desc = "低重力环境",
    Icon = "moon",
    Callback = function()
        Settings.Gravity = 50
        Settings.JumpPower = 100
        ApplySettings()
    end
})

PlayerTab:Button({
    Title = "正常模式",
    Desc = "恢复默认游戏设置",
    Icon = "home",
    Callback = function()
        Settings.WalkSpeed = 16
        Settings.JumpPower = 50
        Settings.Gravity = 196.2
        ApplySettings()
    end
})

-- 添加状态监控功能
local function UpdateStatus()
    if Character and Character:FindFirstChildOfClass("Humanoid") then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local statusText = string.format("速度: %d | 跳跃: %d | 重力: %.1f", 
            Humanoid.WalkSpeed, Humanoid.JumpPower, workspace.Gravity)
        
        -- 更新状态显示
        StatusSection:SetDesc(statusText)
    end
end

-- 定期更新状态
while true do
    UpdateStatus()
    wait(2)
end

print("持续更新，谢谢 ")
print("想要什么功能来找我我的群聊1077645648我是免费汉化，谢谢🌹🌹")

Window:Open()