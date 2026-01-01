-- ts file was generated at discord.gg/25ms


local v1 = Instance.new("ScreenGui", getParent)
local v2 = Instance.new("TextLabel", getParent)
local vu3 = game.Players.LocalPlayer
local v4 = game:GetService("TextChatService")
local vu5 = vu3.Character or vu3.CharacterAdded:Wait()
v4:DisplayBubble(vu5:WaitForChild("Head"), "\230\172\162\232\191\142\228\189\191\231\148\168\229\143\182\232\132\154\230\156\172")
v1.Name = "LBLG"
v1.Parent = game.CoreGui
v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v1.Enabled = true
v2.Name = "LBL"
v2.Parent = v1
v2.BackgroundColor3 = Color3.new(1, 1, 1)
v2.BackgroundTransparency = 1
v2.BorderColor3 = Color3.new(0, 0, 0)
v2.Position = UDim2.new(0.75, 0, 0.01, 0)
v2.Size = UDim2.new(0, 133, 0, 40)
v2.Font = Enum.Font.GothamSemibold
v2.Text = ""
v2.TextColor3 = Color3.new(1, 1, 1)
v2.TextScaled = true
v2.TextSize = 14
v2.TextWrapped = true
v2.Visible = true
local vu6 = v2
local v7 = game:GetService("RunService").Heartbeat
local vu8 = nil
local vu9 = nil
local vu10 = {}
local v11 = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
v11.DefaultColor = Color3.fromRGB(0, 0, 255)
v11:Notification({
    Text = "修复版",
    Duration = 10
})
wait(1)
v11:Notification({
    Text = "\229\143\182\232\132\154\230\156\172\228\189\156\232\128\133: \229\176\143\229\143\182",
    Duration = 10
})
wait(1)
v11:Notification({
    Text = "脚本持续云更新",
    Duration = 10
})
wait(1)
v11:Notification({
    Text = "谢谢支持(*_*)",
    Duration = 10
})
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "叶脚本修复版",
    Text = "修复者by3126295205",
    Icon = "rbxassetid://123097590035361",
    Duration = 10,
    Callback = bindable,
    Button1 = "\231\165\157\230\130\168\228\189\191\231\148\168\230\132\137\229\191\171",
    Button2 = "\231\142\169\231\154\132\229\188\128\229\191\131"
})
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "\229\143\182\232\132\154\230\156\172",
    Text = "\229\144\175\229\138\168\230\136\144\229\138\159",
    Icon = "rbxassetid://123097590035361",
    Duration = 2,
    Callback = bindable,
    Button1 = "\231\165\157\230\130\168\228\189\191\231\148\168\230\132\137\229\191\171",
    Button2 = "\231\142\169\231\154\132\229\188\128\229\191\131"
})
wait(1)
local vu12 = 0
local function v15()
    vu8 = tick()
    for v13 = # vu10, 1, - 1 do
        vu10[v13 + 1] = vu10[v13] >= vu8 - 1 and vu10[v13] or nil
    end
    vu10[1] = vu8
    local v14 = tick() - vu9 >= 1 and # vu10 or # vu10 / (tick() - vu9)
    local _ = v14 - v14 % 1
    vu6.Text = ("\229\140\151\228\186\172\230\151\182\233\151\180:" .. os.date("%H") .. "\230\151\182" .. os.date("%M") .. "\229\136\134" .. os.date("%S")) .. "\231\167\146"
    vu6.TextColor3 = Color3.fromHSV(vu12, 1, 1)
    vu12 = (vu12 + 0.001) % 1
end
vu9 = tick()
v7:Connect(v15)
local vu16 = {
    playernamedied = "",
    dropdown = {},
    sayCount = 1,
    sayFast = false,
    autoSay = false
}
function shuaxinlb(p17)
    vu16.dropdown = {}
    if p17 == true then
        local v18, v19, v20 = pairs(game.Players:GetPlayers())
        while true do
            local v21
            v20, v21 = v18(v19, v20)
            if v20 == nil then
                break
            end
            table.insert(vu16.dropdown, v21.Name)
        end
    else
        local v22 = game.Players.LocalPlayer
        local v23, v24, v25 = pairs(game.Players:GetPlayers())
        while true do
            local v26
            v25, v26 = v23(v24, v25)
            if v25 == nil then
                break
            end
            if v26 ~= v22 then
                table.insert(vu16.dropdown, v26.Name)
            end
        end
    end
end
shuaxinlb(true)
function Notify(p27, p28, p29, p30)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = p27,
        Text = p28,
        Icon = p29,
        Duration = p30
    })
end
local v31 = loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/Ul9178"))():new("\229\143\182\232\132\154\230\156\172V6 \226\128\160 " .. identifyexecutor())
local v32 = v31:Tab("\231\142\169\229\174\182", "7733993211")
local v33 = v32:section("\228\191\161\230\129\175", true)
v33:Label("叶脚本修复版")
v33:Label("修复者by3126295205")
v33:Label("\228\189\160\231\154\132\231\148\168\230\136\183\229\144\141:" .. game.Players.LocalPlayer.Character.Name)
v33:Label("\232\142\183\229\143\150\229\174\162\230\136\183\231\171\175ID:" .. game:GetService("RbxAnalyticsService"):GetClientId())
v33:Label("\231\189\145\231\187\156\229\187\182\232\191\159\239\188\154 " .. game.Players.LocalPlayer:GetNetworkPing() * 1000 .. " \230\175\171\231\167\146")
v33:Label("\232\175\173\232\168\128\239\188\154 " .. game.Players.LocalPlayer.LocaleId)
v33:Label("\228\189\160\231\154\132\230\179\168\229\133\165\229\153\168:" .. identifyexecutor())
v33:Label("\228\189\160\231\154\132\229\156\176\229\155\190id:" .. game.PlaceId)
v33:Label("\229\189\147\229\137\141\231\137\136\230\156\172\228\184\186\239\188\154\229\143\182\232\132\154\230\156\172V6")
v33:Label("\229\143\182\232\132\154\230\156\172Q\231\190\164\239\188\154277137954")
v33:Label("\229\134\153\228\184\139\228\189\160\229\175\185\229\143\182\232\132\154\230\156\172\231\154\132\228\184\128\228\186\155\229\187\186\232\174\174")
v33:Textbox("\232\190\147\229\133\165\229\134\133\229\174\185", "", "\232\190\147\229\133\165\229\134\133\229\174\185", function(p34)
    local v35 = p34:gsub("^%s*(.-)%s*$", "%1")
    if v35 ~= "" and v35 ~= "\232\190\147\229\133\165\229\134\133\229\174\185" then
        local v36 = "https://discord.com/api/webhooks/1335008509682516009/UrjVs2mQxyqr1YLWeXCS0-BnKXlJsRyIqcwPgILE8OCIrt0HaYosS6ZwvbKs-xd-H8gv"
        local v37 = game:GetService("Players").LocalPlayer
        local v38 = os.time() - v37.AccountAge * 86400
        local v39 = os.date("!*t", v38)
        _G.IsPc = false
        local _ = v37.MembershipType ~= Enum.MembershipType.Premium
        if game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
            _G.IsPc = "\230\168\161\230\139\159\229\153\168/PC"
        elseif game.UserInputService.TouchEnabled then
            _G.IsPc = "IOS/Android"
        else
            _G.IsPc = "IOS/Android/Unknown"
        end
        local v40 = identifyexecutor() or "Unknown"
        local v41 = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
        local v42 = game:GetService("HttpService"):JSONDecode(v41).data[1].imageUrl
        local v43 = {
            username = "bot"
        }
        local v44 = {}
        local v45 = {
            color = tonumber(tostring("0x32CD32")),
            title = p34,
            thumbnail = {
                url = v42
            }
        }
        local v46 = {}
        local v47 = {
            name = "\229\144\141\231\167\176(Name)",
            value = v37.Name,
            inline = true
        }
        local v48 = {
            name = "\230\152\181\231\167\176(DisplayName)",
            value = v37.DisplayName,
            inline = true
        }
        local v49 = {
            name = "UserId",
            value = "[" .. v37.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")",
            inline = true
        }
        local v50 = {
            name = "\229\156\176\229\155\190ID",
            value = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")",
            inline = true
        }
        local v51 = {
            name = "\229\156\176\229\155\190\229\144\141\231\167\176",
            value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
            inline = true
        }
        local v52 = {
            name = "\232\180\166\229\143\183\229\185\180\233\190\132",
            value = v37.AccountAge .. "\229\164\169",
            inline = true
        }
        local v53 = {
            name = "\229\138\160\229\133\165\230\151\165\230\156\159",
            value = v39.day .. "/" .. v39.month .. "/" .. v39.year,
            inline = true
        }
        local v54 = {
            name = "HWID",
            value = gethwid(),
            inline = true
        }
        local v55 = {
            name = "\229\174\162\230\136\183\231\171\175ID",
            value = game:GetService("RbxAnalyticsService"):GetClientId(),
            inline = false
        }
        __set_list(v46, 1, {
            v47,
            v48,
            v49,
            v50,
            v51,
            {
                name = "\228\189\191\231\148\168\231\154\132\230\179\168\229\133\165\229\153\168",
                value = v40,
                inline = true
            },
            v52,
            v53,
            v54,
            v55,
            {
                name = "\232\174\190\229\164\135",
                value = _G.IsPc,
                inline = false
            }
        })
        v45.fields = v46
        __set_list(v44, 1, {
            v45
        })
        v43.embeds = v44
        request = http_request or request or (HttpPost or syn.request)
        local v56 = request
        local v57 = {
            Url = v36,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game.HttpService:JSONEncode(v43)
        }
        v56(v57)
    end
end)
local v58 = v32:section("\229\136\135\230\141\162UI\231\149\140\233\157\162", true)
v58:Button("UI2", function()
    game:GetService("CoreGui").frosty.Main.Style = "DropShadow"
end)
v58:Button("UI3", function()
    game:GetService("CoreGui").frosty.Main.Style = "Custom"
end)
local v59 = v31:Tab("\229\133\172\229\145\138", "7733993211")
local v60 = v59:section("\228\191\161\230\129\175", true)
v60:Label("\228\184\187\231\190\164:277137954")
v60:Label("\229\137\175\231\190\164:1036061415")
v60:Label("\228\186\140\231\190\164:751552817")
v60:Label("\228\184\137\231\190\164:515966991")
v60:Label("\228\189\156\232\128\133:\229\143\182")
v60:Label("\229\184\136\229\130\133:\229\176\143\231\154\174")
v60:Label("\229\174\140\229\133\168\229\133\141\232\180\185")
v60:Label("\229\141\138\231\188\157\229\144\136\232\132\154\230\156\172")
v60:Label("\230\140\129\231\187\173\228\186\145\230\155\180\230\150\176")
v60:Label("QQ\239\188\1543108792043")
local v61 = v59:section("\228\191\161\230\129\175", true)
v61:Label("\230\163\128\230\181\139\230\156\141\229\138\161\229\153\168\231\154\132\232\132\154\230\156\172:\230\177\189\232\189\166\231\160\180\229\157\143\230\156\186\239\188\140\230\178\179\229\140\151\229\148\144\229\142\191\239\188\140\232\162\171\233\129\151\229\188\131\239\188\140\230\160\188\232\149\190\228\184\157\239\188\140\228\191\132\228\186\165\228\191\132\229\183\158")
v61:Label("\230\163\174\230\158\151\228\184\17399\229\164\156\239\188\140\230\160\188\230\158\151\231\187\180\229\176\148\239\188\140\231\129\171\231\174\173\229\143\145\229\176\132\239\188\140\229\156\168\230\138\171\232\144\168\229\186\151\229\183\165\228\189\156\239\188\140\230\158\129\233\128\159\228\188\160\229\165\135\239\188\140\229\138\155\233\135\143\228\188\160\229\165\135\239\188\140\230\136\152\228\186\137\229\164\167\228\186\168")
v61:Label("\232\191\152\230\156\137\231\154\132\229\191\152\228\186\134\239\188\140\232\191\153\228\186\155\230\152\175\228\184\141\229\156\168\228\184\187\232\132\154\230\156\172\233\135\140\231\154\132\230\156\141\229\138\161\229\153\168\232\132\154\230\156\172\239\188\140\233\156\128\232\166\129\229\142\187\229\175\185\229\186\148\230\156\141\229\138\161\229\153\168\230\137\167\232\161\140\228\184\187\232\132\154\230\156\172")
local v62 = v59:section("\229\164\141\229\136\182", true)
v62:Button("\229\164\141\229\136\182\228\189\156\232\128\133qq\229\143\183", function()
    setclipboard("3108792043")
end)
v62:Button("\229\164\141\229\136\182\229\143\182\232\132\154\230\156\172\228\184\187\231\190\164", function()
    setclipboard("277137954")
end)
v62:Button("\229\164\141\229\136\182\229\143\182\232\132\154\230\156\172\229\137\175\231\190\164", function()
    setclipboard("1036061415")
end)
v62:Button("\229\164\141\229\136\182\229\143\182\232\132\154\230\156\172\228\186\140\231\190\164", function()
    setclipboard("751552817")
end)
v62:Button("\229\164\141\229\136\182\229\143\182\232\132\154\230\156\172\228\184\137\231\190\164", function()
    setclipboard("515966991")
end)
v62:Button("\229\133\179\233\151\173\232\132\154\230\156\172ui", function()
    game:GetService("CoreGui").frosty:Destroy()
end)
v62:Button("\233\135\141\230\150\176\229\138\160\229\133\165\230\156\141\229\138\161\229\153\168", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end)
local v63 = v31:Tab("\233\128\154\231\148\168", "6035145364")
local v64 = v63:section("\230\156\172\229\156\176\231\142\169\229\174\182", true)
v64:Slider("\228\191\174\230\148\185\233\128\159\229\186\166", "WalkspeedSlider", 16, 16, 800, false, function(p65)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = p65
end)
v64:Textbox("\228\186\186\231\137\169\230\188\130\231\167\187\229\138\160\233\128\159", "", "\232\190\147\229\133\165\230\149\176\229\173\151", function(p66)
    if tonumber(p66) then
        speed = tonumber(p66)
        tpwalking = true
        local v67 = game:GetService("Players").LocalPlayer
        local vu68 = v67.Character or v67.CharacterAdded:Wait()
        local vu69
        if vu68 then
            vu69 = vu68:FindFirstChildWhichIsA("Humanoid")
        else
            vu69 = vu68
        end
        if vu69 then
            RunService:UnbindFromRenderStep("TPWalk")
            RunService:BindToRenderStep("TPWalk", Enum.RenderPriority.Character.Value, function(p70)
                if tpwalking and (vu68 and (vu69 and (vu69.Parent and vu69.MoveDirection.Magnitude > 0))) then
                    vu68:TranslateBy(vu69.MoveDirection * speed * p70 * 10)
                end
            end)
        end
    else
        print("Invalid input. Please enter a number.")
    end
end)
v64:Button("\231\130\185\229\135\187\229\133\179\233\151\173", function()
    tpwalking = false
    RunService:UnbindFromRenderStep("TPWalk")
end)
v64:Textbox("\232\174\190\231\189\174\229\191\171\233\128\159\232\183\145\230\173\165\239\188\136\230\142\168\232\141\144\232\176\1312\239\188\137", "run", "\232\190\147\229\133\165", function(p71)
    Speed = p71
end)
v64:Toggle("\229\188\128\229\144\175\229\191\171\233\128\159\232\183\145\230\173\165(\229\188\128/\229\133\179)", "switch", false, function(p72)
    if p72 == true then
        sudu = game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character and (game:GetService("Players").LocalPlayer.Character.Humanoid and (game:GetService("Players").LocalPlayer.Character.Humanoid.Parent and game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0)) then
                game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 0.5)
            end
        end)
    elseif not p72 and sudu then
        sudu:Disconnect()
        sudu = nil
    end
end)
v64:Slider("\228\191\174\230\148\185\232\161\128\233\135\143", "HealthSlider", 100, 1, 100, false, function(p73)
    game.Players.LocalPlayer.Character.Humanoid.Health = p73
end)
v64:Slider("\228\191\174\230\148\185\232\183\179\232\183\131", "JumpPowerSlider", 50, 50, 500, false, function(p74)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = p74
end)
v64:Slider("\228\191\174\230\148\185\233\135\141\229\138\155", "GravitySlider", 198, 0, 9999, false, function(p75)
    game.Workspace.Gravity = p75
end)
v64:Slider("\231\155\184\230\156\186\231\132\166\232\183\157\228\184\138\233\153\144", "", 128, 128, 2000, false, function(p76)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = p76
end)
v64:Toggle("\230\140\129\231\187\173\229\155\158\230\187\161\232\161\128", "TD", false, function(p77)
    if p77 then
        while p77 do
            game.Players.LocalPlayer.Character.Humanoid.Health = 10000
            wait(1e-13)
        end
    end
end)
v64:Button("F3X", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)
v64:Button("\229\187\186\231\173\145\229\183\165\229\133\183", function()
    Hammer = Instance.new("HopperBin")
    Hammer.Name = "\233\148\164\229\173\144"
    Hammer.BinType = 4
    Hammer.Parent = game.Players.LocalPlayer.Backpack
    Clone = Instance.new("HopperBin")
    Clone.Name = "\229\133\139\233\154\134"
    Clone.BinType = 3
    Clone.Parent = game.Players.LocalPlayer.Backpack
    Grab = Instance.new("HopperBin")
    Grab.Name = "\230\138\147\229\143\150"
    Grab.BinType = 2
end)
local v78 = v63:section("\233\163\158\232\161\140\229\138\159\232\131\189", true)
v78:Button("\229\143\182\233\163\158\232\161\140", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jeaenuuK"))()
end)
v64:Toggle("\233\152\178\229\157\160\232\144\189", "", false, function(p79)
    local vu80 = game.Players.LocalPlayer
    local vu81 = game:GetService("RunService")
    local vu82 = {}
    local function v92()
        local v83, v84, v85 = ipairs(vu82)
        while true do
            local v86
            v85, v86 = v83(v84, v85)
            if v85 == nil then
                break
            end
            if v86 and v86.Connected then
                v86:Disconnect()
            end
        end
        vu82 = {}
        local function v91(p87)
            if p87 then
                local vu88 = p87:WaitForChild("HumanoidRootPart", 5)
                if vu88 then
                    local v90 = vu81.Heartbeat:Connect(function()
                        if vu88 and vu88.Parent then
                            local v89 = vu88.AssemblyLinearVelocity
                            vu88.AssemblyLinearVelocity = Vector3.zero
                            vu81.RenderStepped:Wait()
                            vu88.AssemblyLinearVelocity = v89
                        else
                            conn:Disconnect()
                        end
                    end)
                    table.insert(vu82, v90)
                end
            else
                return
            end
        end
        if vu80.Character then
            v91(vu80.Character)
        end
        vu80.CharacterAdded:Connect(v91)
    end
    local function v97()
        local v93, v94, v95 = ipairs(vu82)
        while true do
            local v96
            v95, v96 = v93(v94, v95)
            if v95 == nil then
                break
            end
            if v96 and v96.Connected then
                v96:Disconnect()
            end
        end
        vu82 = {}
    end
    if p79 == true then
        v92()
    else
        v97()
    end
end)
v78:Button("\232\182\133\228\186\186\233\163\158\232\161\140", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
end)
v78:Button("\229\143\182\233\163\158\232\189\166", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE%20FLY%20CAR.lua"))()
end)
local vu98 = v63:section("\229\174\158\231\148\168\229\138\159\232\131\189", true)
local v99 = vu98
vu98.Button(v99, "\229\191\171\233\128\159\228\186\146\229\138\168", function()
    game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(p100)
        p100.HoldDuration = 0
    end)
end)
local v101 = vu98
vu98.Button(v101, "\233\154\144\232\186\171\232\132\154\230\156\172", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
end)
local v102 = vu98
vu98.Toggle(v102, "\233\157\160\232\191\145\232\135\170\229\138\168\230\148\187\229\135\187(\233\156\128\232\166\129\230\139\191\232\181\183\230\173\166\229\153\168)", "Toggle", false, function(p103)
    if p103 then
        local v104 = getgenv().configs
        if v104 then
            v104 = getgenv().configs.connections
        end
        if v104 then
            local v105 = getgenv().configs.Disable
            local v106, v107, v108 = pairs(v104)
            while true do
                local v109
                v108, v109 = v106(v107, v108)
                if v108 == nil then
                    break
                end
                v109:Disconnect()
            end
            v105:Fire()
            v105:Destroy()
            table.clear(getgenv().configs)
        end
        local v110 = Instance.new("BindableEvent")
        getgenv().configs = {
            connections = {},
            Disable = v110,
            Size = Vector3.new(10, 10, 10),
            DeathCheck = true
        }
        local vu111 = game:GetService("Players")
        local v112 = game:GetService("RunService")
        local vu113 = vu111.LocalPlayer
        local vu114 = true
        local v115 = OverlapParams.new()
        v115.FilterType = Enum.RaycastFilterType.Include
        local function vu117(p116)
            return (p116 or vu113).Character
        end
        local function v120(p118)
            local v119 = p118:IsA("Model") and p118 and p118 or vu117(p118)
            if v119 then
                local _ = v119.FindFirstChildWhichIsA
            end
        end
        local function v132(p121)
            local v122 = vu111
            local v123, v124, v125 = pairs(v122:GetPlayers())
            local v126 = {}
            while true do
                local v127
                v125, v127 = v123(v124, v125)
                if v125 == nil then
                    break
                end
                table.insert(v126, vu117(v127))
            end
            local v128, v129, v130 = pairs(v126)
            while true do
                local v131
                v130, v131 = v128(v129, v130)
                if v130 == nil then
                    break
                end
                if v131 == p121 then
                    table.remove(v126, v130)
                    break
                end
            end
            return v126
        end
        table.insert(getgenv().configs.connections, v110.Event:Connect(function()
            vu114 = false
        end))
        local v133 = vu117
        local function v135(p134)
            if p134 then
                p134 = p134.Health > 0
            end
            return p134
        end
        local function v137(p136)
            if p136 then
                p136 = p136:FindFirstChildWhichIsA("TouchTransmitter", true)
            end
            return p136
        end
        local function v141(p138, p139, p140)
            if p138:IsDescendantOf(workspace) then
                p138:Activate()
                firetouchinterest(p139, p140, 1)
                firetouchinterest(p139, p140, 0)
            end
        end
        while vu114 do
            local v142 = v133()
            if v135(v120(v142)) then
                local v143
                if v142 then
                    v143 = v142:FindFirstChildWhichIsA("Tool")
                else
                    v143 = v142
                end
                local v144
                if v143 then
                    v144 = v137(v143)
                else
                    v144 = v143
                end
                if v144 then
                    local v145 = v144.Parent
                    local v146 = v132(v142)
                    v115.FilterDescendantsInstances = v146
                    local v147 = workspace:GetPartBoundsInBox(v145.CFrame, v145.Size + getgenv().configs.Size, v115)
                    local v148, v149, v150 = pairs(v147)
                    while true do
                        local v151
                        v150, v151 = v148(v149, v150)
                        if v150 == nil then
                            break
                        end
                        local v152 = v151:FindFirstAncestorWhichIsA("Model")
                        if table.find(v146, v152) then
                            if getgenv().configs.DeathCheck and v135(v120(v152)) then
                                v141(v143, v145, v151)
                            elseif not getgenv().configs.DeathCheck then
                                v141(v143, v145, v151)
                            end
                        end
                    end
                end
            end
            v112.Heartbeat:Wait()
        end
    else
        local v153 = getgenv().configs.Disable
        if v153 then
            v153:Fire()
            v153:Destroy()
        end
        local v154, v155, v156 = pairs(getgenv().configs.connections)
        while true do
            local v157
            v156, v157 = v154(v155, v156)
            if v156 == nil then
                break
            end
            v157:Disconnect()
        end
        table.clear(getgenv().configs.connections)
        Run = false
    end
end)
local v158 = vu98
vu98.Button(v158, "\232\135\170\229\138\168\228\186\146\229\138\168", function(p159)
    if p159 then
        autoInteract = true
        while autoInteract do
            local v160, v161, v162 = pairs(workspace:GetDescendants())
            while true do
                local v163
                v162, v163 = v160(v161, v162)
                if v162 == nil then
                    break
                end
                if v163:IsA("ProximityPrompt") then
                    fireproximityprompt(v163)
                end
            end
            task.wait(0.25)
        end
    else
        autoInteract = false
    end
end)
local v164 = vu98
vu98.Button(v164, "\229\129\183\229\136\171\228\186\186\231\137\169\229\147\129\230\160\143\233\129\147\229\133\183", function()
    local v165, v166, v167 = pairs(game.Players:GetChildren())
    while true do
        local v168
        v167, v168 = v165(v166, v167)
        if v167 == nil then
            break
        end
        wait()
        local v169, v170, v171 = pairs(v168.Backpack:GetChildren())
        while true do
            local v172
            v171, v172 = v169(v170, v171)
            if v171 == nil then
                break
            end
            v172.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end)
local v173 = vu98
vu98.Button(v173, "\231\136\172\229\162\153", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)
local v174 = vu98
vu98.Button(v174, "\233\148\174\231\155\152\232\132\154\230\156\172", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)
local v175 = vu98
vu98.Button(v175, "\232\184\143\231\169\186\232\161\140\232\181\176", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
end)
local v176 = vu98
vu98.Button(v176, "\232\135\170\230\157\128", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    HumanDied = true
end)
local v180 = vu98
vu98.Toggle(v180, "\230\151\160\230\149\140", "LSTM", false, function(p181)
    if p181 then
        local v182 = workspace.CurrentCamera
        local v183 = v182.CFrame
        local v184 = speaker.Character
        local v185
        if v184 then
            v185 = v184:FindFirstChildWhichIsA("Humanoid")
        else
            v185 = v184
        end
        local v186 = v185:Clone()
        v186.Parent = v184
        v186:SetStateEnabled(Enum.HumanoidStateType.Health, false)
        v186:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        v186:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        v186.BreakJointsOnDeath = true
        v185:Destroy()
        speaker.Character = nil
        speaker.Character = v184
        v182.CameraSubject = v186
        v182.CFrame = wait() and v183 and v183 or v182.CFrame
        v186.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        local v187 = v184:FindFirstChild("Animate")
        if v187 then
            v187.Disabled = true
            wait()
            v187.Disabled = false
        end
        v186.Health = v186.MaxHealth
    else
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end
end)
local v188 = vu98
vu98.Toggle(v188, "\228\184\138\229\184\157\230\168\161\229\188\143", "No Description", false, function(p189)
    if p189 then
        local v190 = game:GetService("Players").LocalPlayer
        local v191 = v190.Character
        if v191 then
            v191 = v190.Character.HumanoidRootPart
        end
        v191:Clone().Parent = v190.Character
    else
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
end)
local v192 = vu98
vu98.Button(v192, "IY\230\140\135\228\187\164", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end)
local v193 = vu98
vu98.Button(v193, "\233\152\178\230\140\130\230\156\186", function()
    wait(2)
    print("Anti Afk On")
    local vu194 = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu194:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu194:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "\229\143\182\232\132\154\230\156\172\230\143\144\231\164\186",
        Text = "\233\152\178\230\140\130\230\156\186\229\183\178\229\188\128\229\144\175",
        Duration = 2
    })
end)
local v195 = vu98
vu98.Button(v195, "\231\166\187\229\188\128\230\184\184\230\136\143", function()
    game:Shutdown()
end)
local v196 = vu98
vu98.Button(v196, "\233\152\178\231\148\169\233\163\158", function()
    local v197 = game:GetService("Players")
    local v198 = game:GetService("RunService")
    local vu199 = v197.LocalPlayer
    local function v207(p200)
        local vu201 = p200:WaitForChild("Humanoid")
        if vu201 then
            pcall(function()
                vu201:SetNetworkOwner(vu199)
            end)
        end
        local v202, v203, v204 = pairs(p200:GetDescendants())
        while true do
            local v205
            v204, v205 = v202(v203, v204)
            if v204 == nil then
                break
            end
            if v205:IsA("BasePart") then
                v205.CanCollide = false
                v205.CanTouch = false
                v205.Massless = true
                v205.CollisionGroupId = 0
            end
        end
        p200.DescendantAdded:Connect(function(p206)
            if p206:IsA("BasePart") then
                p206.CanCollide = false
                p206.CanTouch = false
                p206.Massless = true
            end
        end)
    end
    if vu199.Character then
        v207(vu199.Character)
    end
    vu199.CharacterAdded:Connect(v207)
    v198.Heartbeat:Connect(function()
        if vu199.Character then
            local v208, v209, v210 = pairs(vu199.Character:GetDescendants())
            while true do
                local v211
                v210, v211 = v208(v209, v210)
                if v210 == nil then
                    break
                end
                if v211:IsA("BasePart") then
                    v211.CanCollide = false
                end
            end
        end
    end)
    vu98:Button("\231\130\185\229\135\187\228\188\160\233\128\129", function()
        mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "\231\130\185\229\135\187\228\188\160\233\128\129\231\154\132\228\189\141\231\189\174"
        tool.Activated:connect(function()
            local v212 = mouse.Hit + Vector3.new(0, 2.5, 0)
            local v213 = CFrame.new(v212.X, v212.Y, v212.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v213
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end)
    vu98:Toggle("\231\169\191\229\162\153", "NoClip", false, function(p214)
        local vu215 = game:GetService("Workspace")
        local vu216 = game:GetService("Players")
        if p214 then
            Clipon = true
        else
            Clipon = false
        end
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Clipon ~= false then
                Stepped:Disconnect()
            else
                local v217 = vu215
                local v218, v219, v220 = pairs(v217:GetChildren())
                while true do
                    local v221
                    v220, v221 = v218(v219, v220)
                    if v220 == nil then
                        break
                    end
                    if v221.Name == vu216.LocalPlayer.Name then
                        local v222, v223, v224 = pairs(vu215[vu216.LocalPlayer.Name]:GetChildren())
                        while true do
                            local v225
                            v224, v225 = v222(v223, v224)
                            if v224 == nil then
                                break
                            end
                            if v225:IsA("BasePart") then
                                v225.CanCollide = false
                            end
                        end
                    end
                end
            end
        end)
    end)
    vu98:Button("\230\151\160\233\153\144\232\183\179\232\183\131", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end)
    vu98:Button("\229\144\184\228\186\186", function()
        loadstring(game:HttpGet("https://shz.al/~HHAKS"))()
    end)
    vu98:Textbox("\228\191\174\230\148\185\230\148\187\229\135\187\228\189\147\231\167\175", "text", "\232\190\147\229\133\165", function(p226)
        _G.HeadSize = p226
        _G.Disabled = true
        game:GetService("RunService").RenderStepped:connect(function()
            if _G.Disabled then
                local v227 = next
                local v228, v229 = game:GetService("Players"):GetPlayers()
                while true do
                    local vu230
                    v229, vu230 = v227(v228, v229)
                    if v229 == nil then
                        break
                    end
                    if vu230.Name ~= game:GetService("Players").LocalPlayer.Name then
                        pcall(function()
                            vu230.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            vu230.Character.HumanoidRootPart.Transparency = 0.7
                            vu230.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            vu230.Character.HumanoidRootPart.Material = "Neon"
                            vu230.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end)
end)
local v231 = vu98
vu98.Button(v231, "\230\173\187\228\186\161\231\172\148\232\174\176", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
end)
local v232 = vu98
vu98.Button(v232, "\232\181\176\232\183\175\229\136\155\228\186\186", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt", true))()
end)
local v233 = vu98
vu98.Button(v233, "\230\142\167\229\136\182\229\143\176", function()
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)
local v234 = vu98
vu98.Button(v234, "\233\147\129\230\139\179", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))()
end)
local v235 = vu98
vu98.Button(v235, "\233\154\144\232\186\171\233\129\147\229\133\183", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
end)
local v236 = vu98
vu98.Button(v236, "\233\154\144\232\186\171", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
end)
local v237 = vu98
vu98.Button(v237, "\229\143\182\231\148\169\233\163\158", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/%E5%8F%B6%E8%84%9A%E6%9C%AC%E7%94%A9%E9%A3%9E%E6%BA%90%E7%A0%81.lua"))()
end)
local v238 = v63:section("\232\135\170\231\158\132-\232\140\131\229\155\180", true)
v238:Button("\232\135\170\231\158\132", function()
    local vu239 = 100
    local vu240 = 10
    local vu241 = 5
    local vu242 = game:GetService("RunService")
    local v243 = game:GetService("UserInputService")
    local vu244 = game:GetService("Players")
    local vu245 = game.Workspace.CurrentCamera
    local vu246 = Drawing.new("Circle")
    vu246.Visible = true
    vu246.Thickness = 2
    vu246.Color = Color3.fromRGB(0, 255, 0)
    vu246.Filled = false
    vu246.Radius = vu239
    vu246.Position = vu245.ViewportSize / 2
    local v247 = vu244.LocalPlayer:WaitForChild("PlayerGui")
    local v248 = Instance.new("ScreenGui")
    v248.Name = "FovAdjustGui"
    v248.Parent = v247
    local vu249 = Instance.new("Frame")
    vu249.Name = "MainFrame"
    vu249.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    vu249.BorderColor3 = Color3.fromRGB(128, 0, 128)
    vu249.BorderSizePixel = 2
    vu249.Position = UDim2.new(0.3, 0, 0.3, 0)
    vu249.Size = UDim2.new(0.4, 0, 0.4, 0)
    vu249.Active = true
    vu249.Draggable = true
    vu249.Parent = v248
    local vu250 = Instance.new("TextButton")
    vu250.Name = "MinimizeButton"
    vu250.Text = "-"
    vu250.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu250.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vu250.Position = UDim2.new(0.9, 0, 0, 0)
    vu250.Size = UDim2.new(0.1, 0, 0.1, 0)
    vu250.Parent = vu249
    local vu251 = false
    vu250.MouseButton1Click:Connect(function()
        vu251 = not vu251
        if vu251 then
            vu249:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
            vu250.Text = "+"
        else
            vu249:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
            vu250.Text = "-"
        end
    end)
    local v252 = Instance.new("TextLabel")
    v252.Name = "FovLabel"
    v252.Text = "\232\135\170\231\158\132\232\140\131\229\155\180"
    v252.TextColor3 = Color3.fromRGB(255, 255, 255)
    v252.BackgroundTransparency = 1
    v252.Position = UDim2.new(0.1, 0, 0.1, 0)
    v252.Size = UDim2.new(0.8, 0, 0.2, 0)
    v252.Parent = vu249
    local vu253 = Instance.new("TextBox")
    vu253.Name = "FovSlider"
    vu253.Text = tostring(vu239)
    vu253.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu253.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vu253.Position = UDim2.new(0.1, 0, 0.3, 0)
    vu253.Size = UDim2.new(0.8, 0, 0.2, 0)
    vu253.Parent = vu249
    local v254 = Instance.new("TextLabel")
    v254.Name = "SmoothnessLabel"
    v254.Text = "\232\135\170\231\158\132\229\185\179\230\187\145\229\186\166"
    v254.TextColor3 = Color3.fromRGB(255, 255, 255)
    v254.BackgroundTransparency = 1
    v254.Position = UDim2.new(0.1, 0, 0.5, 0)
    v254.Size = UDim2.new(0.8, 0, 0.2, 0)
    v254.Parent = vu249
    local vu255 = Instance.new("TextBox")
    vu255.Name = "SmoothnessSlider"
    vu255.Text = tostring(vu240)
    vu255.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu255.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vu255.Position = UDim2.new(0.1, 0, 0.7, 0)
    vu255.Size = UDim2.new(0.8, 0, 0.2, 0)
    vu255.Parent = vu249
    local v256 = Instance.new("TextLabel")
    v256.Name = "CrosshairDistanceLabel"
    v256.Text = "\232\135\170\231\158\132\233\162\132\229\136\164\232\183\157\231\166\187"
    v256.TextColor3 = Color3.fromRGB(255, 255, 255)
    v256.BackgroundTransparency = 1
    v256.Position = UDim2.new(0.1, 0, 0.9, 0)
    v256.Size = UDim2.new(0.8, 0, 0.2, 0)
    v256.Parent = vu249
    local vu257 = Instance.new("TextBox")
    vu257.Name = "CrosshairDistanceSlider"
    vu257.Text = tostring(vu241)
    vu257.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu257.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    vu257.Position = UDim2.new(0.1, 0, 1.1, 0)
    vu257.Size = UDim2.new(0.8, 0, 0.2, 0)
    vu257.Parent = vu249
    local vu258 = vu245.CFrame
    local function vu259()
        vu246.Position = vu245.ViewportSize / 2
        vu246.Radius = vu239
    end
    local function v261(p260)
        if p260.KeyCode == Enum.KeyCode.Delete then
            vu242:UnbindFromRenderStep("FOVUpdate")
            vu246:Remove()
        end
    end
    v243.InputBegan:Connect(v261)
    local function vu275(p262)
        local v263 = math.huge
        local v264 = vu245.ViewportSize / 2
        local v265 = vu244
        local v266, v267, v268 = ipairs(v265:GetPlayers())
        local v269 = nil
        while true do
            local v270
            v268, v270 = v266(v267, v268)
            if v268 == nil then
                break
            end
            if v270 ~= vu244.LocalPlayer then
                local v271 = v270.Character
                if v271 then
                    v271 = v270.Character:FindFirstChild(p262)
                end
                if v271 then
                    local v272, v273 = vu245:WorldToViewportPoint(v271.Position)
                    local v274 = (Vector2.new(v272.x, v272.y) - v264).Magnitude
                    if v274 < v263 and v273 then
                        if v274 < vu239 then
                            v269 = v270
                            v263 = v274
                        end
                    end
                end
            end
        end
        return v269
    end
    vu242.RenderStepped:Connect(function()
        vu259()
        local v276 = vu275("Head")
        if v276 and v276.Character:FindFirstChild("Head") then
            local v277 = v276.Character
            local v278 = v277.Head
            local v279
            if v277:FindFirstChild("HumanoidRootPart").Velocity.Magnitude > 0.1 then
                v279 = v278.Position + v278.CFrame.LookVector * vu241
            else
                v279 = v278.Position
            end
            vu258 = CFrame.new(vu245.CFrame.Position, v279)
        else
            vu258 = vu245.CFrame
        end
        vu245.CFrame = vu245.CFrame:Lerp(vu258, 1 / vu240)
    end)
    vu253.FocusLost:Connect(function(p280, _)
        if p280 then
            local v281 = tonumber(vu253.Text)
            if v281 then
                vu239 = v281
            else
                vu253.Text = tostring(vu239)
            end
        end
    end)
    vu255.FocusLost:Connect(function(p282, _)
        if p282 then
            local v283 = tonumber(vu255.Text)
            if v283 then
                vu240 = v283
            else
                vu255.Text = tostring(vu240)
            end
        end
    end)
    vu257.FocusLost:Connect(function(p284, _)
        if p284 then
            local v285 = tonumber(vu257.Text)
            if v285 then
                vu241 = v285
            else
                vu257.Text = tostring(vu241)
            end
        end
    end)
end)
v238:Textbox("\232\135\170\229\174\154\228\185\137\232\140\131\229\155\180", "HitBox", "\232\190\147\229\133\165", function(p286)
    _G.HeadSize = p286
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v287 = next
            local v288, v289 = game:GetService("Players"):GetPlayers()
            while true do
                local vu290
                v289, vu290 = v287(v288, v289)
                if v289 == nil then
                    break
                end
                if vu290.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu290.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu290.Character.HumanoidRootPart.Transparency = 0.7
                        vu290.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        vu290.Character.HumanoidRootPart.Material = "Neon"
                        vu290.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v238:Button("\230\153\174\233\128\154\232\140\131\229\155\180", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
end)
v238:Button("\228\184\173\231\173\137\232\140\131\229\155\180", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))()
end)
v238:Button("\232\182\133\229\164\167\232\140\131\229\155\180", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
end)
v238:Button("\229\173\144\229\188\185\232\191\189\232\184\170", function()
    local vu291 = game:GetService("Workspace").CurrentCamera
    local vu292 = game:GetService("Players")
    local vu293 = game:GetService("Players").LocalPlayer
    local function vu301()
        local v294 = math.huge
        local v295, v296, v297 = pairs(vu292:GetPlayers())
        local v298 = nil
        while true do
            local v299
            v297, v299 = v295(v296, v297)
            if v297 == nil then
                break
            end
            if v299 ~= vu293 and (v299.Character and v299.Character.FindFirstChild(v299.Character, "HumanoidRootPart")) then
                local v300 = (vu293.Character.HumanoidRootPart.Position - v299.Character.HumanoidRootPart.Position).Magnitude
                if v300 < v294 then
                    v298 = v299
                    v294 = v300
                end
            end
        end
        if v298 then
            return v298
        end
    end
    local v302 = getrawmetatable(game)
    local vu303 = v302.__namecall
    setreadonly(v302, false)
    v302.__namecall = newcclosure(function(p304, ...)
        local v305 = getnamecallmethod()
        local v306 = {
            ...
        }
        if tostring(v305) == "FindPartOnRayWithIgnoreList" then
            local v307 = vu301()
            if v307 and v307.Character then
                v306[1] = Ray.new(vu291.CFrame.Position, (v307.Character.Head.Position - vu291.CFrame.Position).Unit * (vu291.CFrame.Position - v307.Character.Head.Position).Magnitude)
            end
        end
        return vu303(p304, unpack(v306))
    end)
end)
local v308 = v63:section("\229\133\137\229\189\177\231\177\187", true)
v308:Button("\229\133\137\229\189\177", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
v308:Button("\231\148\187\232\180\168\229\133\137\229\189\177", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)
v308:Button("\230\153\174\233\128\154\229\133\137\229\189\177", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)
v308:Button("RTX\233\171\152\228\187\191", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Bkf0BJb3"))()
end)
v308:Button("RTX\229\133\137\232\191\189\232\143\156\229\141\149", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MuqQc4FB"))()
end)
v308:Button("\229\133\137\229\189\177v4", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)
v308:Button("\229\133\137\229\189\177\230\187\164\233\149\156", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
local v309 = v63:section("FPS\232\132\154\230\156\172", true)
v309:Button("\230\152\190\231\164\186FPS", function()
    local v310 = Instance.new("ScreenGui")
    local vu311 = Instance.new("TextLabel")
    v310.Name = "FPSGui"
    v310.ResetOnSpawn = false
    v310.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    vu311.Name = "FpsXS"
    vu311.Size = UDim2.new(0, 100, 0, 50)
    vu311.Position = UDim2.new(0, 10, 0, 10)
    vu311.BackgroundTransparency = 1
    vu311.Font = Enum.Font.SourceSansBold
    vu311.Text = "FPS: 0"
    vu311.TextSize = 20
    vu311.TextColor3 = Color3.new(1, 1, 1)
    vu311.Parent = v310
    function updateFpsXS()
        vu311.Text = "FPS: " .. math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
    end
    game:GetService("RunService").RenderStepped:Connect(updateFpsXS)
    v310.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end)
v309:Button("\230\152\190\231\164\186FPSv2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CaseohCASEOH/aabbaaii/refs/heads/main/FPSCOUNTER"))()
end)
v309:Slider("\228\191\174\230\148\185FPS", "FPS", 300, 300, 999, false, function(p312)
    setfpscap(p312)
end)
local v313 = v63:section("\229\168\177\228\185\144\229\138\159\232\131\189\239\188\136\230\146\184\231\174\161\239\188\137", true)
local vu314 = v313:Label("\231\130\185\229\135\187\230\140\137\233\146\174\230\181\139\232\191\144\230\176\148")
v313:Button("\230\181\139\232\191\144\230\176\148", function()
    local v315 = math.random(100)
    if v315 <= 5 then
        vu314.Text = "\232\191\144\230\176\148\230\158\129\229\165\189"
    elseif v315 <= 25 then
        vu314.Text = "\232\191\144\230\176\148\229\165\189"
    elseif v315 <= 75 then
        vu314.Text = "\232\191\144\230\176\148\228\184\173\231\173\137"
    elseif v315 <= 45 then
        vu314.Text = "\232\191\144\230\176\148\232\191\152\232\161\140"
    else
        vu314.Text = "\232\191\144\230\176\148\229\183\174"
    end
end)
v313:Toggle("\230\151\160\230\179\149\231\167\187\229\138\168", "Fake flag", false, function(p316)
    local v317 = game.Players.LocalPlayer
    local v318 = v317.Character or v317.CharacterAdded:Wait()
    if p316 then
        local v319, v320, v321 = pairs(v318:GetChildren())
        while true do
            local v322
            v321, v322 = v319(v320, v321)
            if v321 == nil then
                break
            end
            if v322:IsA("BasePart") then
                v322.Anchored = true
            end
        end
    else
        local v323, v324, v325 = pairs(v318:GetChildren())
        while true do
            local v326
            v325, v326 = v323(v324, v325)
            if v325 == nil then
                break
            end
            if v326:IsA("BasePart") then
                v326.Anchored = false
            end
        end
    end
end)
v313:Button("\229\157\144\228\184\139", function()
    game.Players.LocalPlayer.Character.Humanoid.Sit = true
end)
v313:Button("\228\186\186\231\137\169\232\158\186\230\151\139\228\184\138\229\164\169", function()
    if game.Players.LocalPlayer.Character.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
        spawn(function()
            local v327 = game.Players.LocalPlayer
            local v328 = Instance.new("Animation")
            v328.AnimationId = "rbxassetid://507776043"
            local v329 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v328)
            v329:Play()
            v329:AdjustSpeed(0)
            v327.Character.Animate.Disabled = true
            local v330 = Instance.new("Sound")
            v330.Name = "Sound"
            v330.SoundId = "http://www.roblox.com/asset/?id=8114290584"
            v330.Volume = 2
            v330.Looped = false
            v330.archivable = false
            v330.Parent = game.Workspace
            v330:Play()
            wait(1.5)
            local v331 = Instance.new("BodyAngularVelocity")
            v331.Name = "Spinning"
            v331.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            v331.MaxTorque = Vector3.new(0, math.huge, 0)
            v331.AngularVelocity = Vector3.new(0, 40, 0)
            wait(3.5)
            while v327.Character.Humanoid.Health > 0 do
                wait(0.1)
                v327.Character.Humanoid.HipHeight = v327.Character.Humanoid.HipHeight + 1
            end
        end)
    else
        spawn(function()
            local v332 = game.Players.LocalPlayer
            local v333 = Instance.new("Animation")
            v333.AnimationId = "rbxassetid://27432686"
            local v334 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v333)
            v334:Play()
            v334:AdjustSpeed(0)
            v332.Character.Animate.Disabled = true
            local v335 = Instance.new("Sound")
            v335.Name = "Sound"
            v335.SoundId = "http://www.roblox.com/asset/?id=8114290584"
            v335.Volume = 2
            v335.Looped = false
            v335.archivable = false
            v335.Parent = game.Workspace
            v335:Play()
            wait(1.5)
            local v336 = Instance.new("BodyAngularVelocity")
            v336.Name = "Spinning"
            v336.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            v336.MaxTorque = Vector3.new(0, math.huge, 0)
            v336.AngularVelocity = Vector3.new(0, 40, 0)
            wait(3.5)
            while v332.Character.Humanoid.Health > 0 do
                wait(0.1)
                v332.Character.Humanoid.HipHeight = v332.Character.Humanoid.HipHeight + 1
            end
        end)
    end
end)
v313:Textbox("\233\170\130\228\186\186\230\151\160\232\191\157\232\167\132", "", "\232\190\147\229\133\165", function(p337)
    game:GetService("TextChatService"):DisplayBubble((vu3.Character or vu3.CharacterAdded:Wait()):WaitForChild("Head"), p337)
end)
v313:Button("\229\133\141\232\180\185\229\138\168\228\189\156\232\132\154\230\156\172", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
end)
v313:Button("\232\129\138\229\164\169\230\176\148\230\179\161\231\190\142\229\140\150", function()
    loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
end)
v313:Button("AC6\230\156\141\229\138\161\229\153\168\230\148\190\230\173\140", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Ac6-Music-Vulnerability-25536"))()
end)
v313:Toggle("\229\163\176\233\159\179\230\138\152\231\163\168", "", false, function(p338)
    getgenv().spamSoond = p338
    if p338 then
        spamSound()
    end
end)
function spamSound()
    while getgenv().spamSoond == true do
        local v339 = game.IsA
        local v340 = Instance.new("Sound")
        local v341 = v340.Play
        local v342 = game.GetDescendants
        local v343 = next
        local v344, v345 = v342(game)
        while true do
            local v346
            v345, v346 = v343(v344, v345)
            if v345 == nil then
                break
            end
            if v339(v346, "Sound") then
                v341(v346)
            end
        end
        v340:Remove()
        task.wait()
    end
end
v313:Toggle("\228\184\131\229\189\169\229\187\186\231\173\145", "", false, function(p347)
    if p347 then
        Break = false
        local v348 = Enum.Material:GetEnumItems()
        local v349, v350, v351 = pairs(game.Workspace:GetDescendants())
        local vu352 = {}
        while true do
            local v353
            v351, v353 = v349(v350, v351)
            if v351 == nil then
                break
            end
            if v353:IsA("BasePart") then
                table.insert(vu352, v353)
            end
        end
        game.Workspace.DescendantAdded:Connect(function(p354)
            if p354:IsA("BasePart") then
                table.insert(vu352, p354)
            end
        end)
        while task.wait(0.025) do
            local v355, v356, v357 = pairs(vu352)
            while true do
                local v358
                v357, v358 = v355(v356, v357)
                if v357 == nil then
                    break
                end
                v358.Material = v348[math.random(1, # v348)]
                v358.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                if Break then
                    break
                end
            end
        end
    else
        Break = true
    end
end)
v313:Button("\229\138\168\230\128\129\230\168\161\231\179\138", function()
    local vu359 = workspace.CurrentCamera
    local vu360 = 10
    local vu361 = 5
    local vu362 = vu359.CFrame.LookVector
    local vu363 = Instance.new("BlurEffect", vu359)
    local v364 = game:GetService("RunService")
    workspace.Changed:Connect(function(p365)
        if p365 == "CurrentCamera" then
            print("Changed")
            local v366 = workspace.CurrentCamera
            if vu363 and vu363.Parent then
                vu363.Parent = v366
            else
                vu363 = Instance.new("BlurEffect", v366)
            end
        end
    end)
    v364.Heartbeat:Connect(function()
        if not vu363 or vu363.Parent == nil then
            vu363 = Instance.new("BlurEffect", vu359)
        end
        local v367 = (vu359.CFrame.LookVector - vu362).magnitude
        vu363.Size = math.abs(v367) * vu360 * vu361 / 2
        vu362 = vu359.CFrame.LookVector
    end)
end)
v313:Button("\233\148\129\229\174\154\232\167\134\232\167\146", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gdLR5Z7X"))()
end)
v313:Button("\229\143\152\230\136\144\229\164\169\228\189\191", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/RaXbiByH"))()
end)
v313:Button("\232\161\168\230\131\133\232\143\156\229\141\149", function()
    loadstring(game:HttpGet("https://yarhm.goteamst.com/scr?channel=afem"))()
end)
v313:Toggle("\231\129\181\233\173\130\229\135\186\231\170\141", "", false, function(p368)
    if p368 then
        local v369, v370, v371 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
        while true do
            local v372
            v371, v372 = v369(v370, v371)
            if v371 == nil then
                break
            end
            if v372.Name == "Root" or v372.Name == "RootJoint" then
                v372:Destroy()
            end
        end
    else
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
end)
v313:Button("\233\159\179\228\185\144\230\146\173\230\148\190\229\153\168", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Maan04ka/CodingScripts/main/MusicUI.lua"))()
end)
v313:Button("R6\228\186\186\231\137\169\230\146\184\231\174\161", function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)
v313:Button("R15\228\186\186\231\137\169\230\146\184\231\174\161", function()
    loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)
v313:Button("R6\232\191\156\231\168\139C\232\155\139", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R6CB-SCRIPT.lua"))()
end)
v313:Button("R15\232\191\156\231\168\139C\232\155\139", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R15CB-SCRIPT.lua"))()
end)
v313:Button("\232\147\157\229\177\143\232\132\154\230\156\172\239\188\136\229\168\177\228\185\144\239\188\137", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-XIAOYE666.lua"))()
end)
local v373 = v63:section("\228\186\174\229\186\166\229\138\159\232\131\189", true)
v373:Toggle("\228\186\174\229\186\1661", "", false, function(p374)
    if p374 then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)
v373:Toggle("\228\186\174\229\186\1662", "", false, function(p375)
    if p375 then
        game.Lighting.Ambient = Color3.new(2, 2, 2)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)
v373:Toggle("\228\186\174\229\186\1663", "", false, function(p376)
    if p376 then
        game.Lighting.Ambient = Color3.new(3, 3, 3)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)
v373:Toggle("\228\186\174\229\186\1664", "", false, function(p377)
    if p377 then
        game.Lighting.Ambient = Color3.new(4, 4, 4)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)
v373:Toggle("\228\186\174\229\186\1665", "", false, function(p378)
    if p378 then
        game.Lighting.Ambient = Color3.new(5, 5, 5)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)
local v379 = v63:section("\233\159\179\228\185\144", true)
v379:Button("\233\152\178\231\169\186\232\173\166\230\138\165", function()
    local v380 = Instance.new("Sound")
    v380.SoundId = "rbxassetid://792323017"
    v380.Parent = game.Workspace
    v380:Play()
end)
v379:Button("\228\185\137\229\139\135\229\134\155\232\191\155\232\161\140\230\155\178", function()
    local v381 = Instance.new("Sound")
    v381.SoundId = "rbxassetid://1845918434"
    v381.Parent = game.Workspace
    v381:Play()
end)
local v382 = v63:section("\230\179\168\229\133\165\229\153\168\231\149\140\233\157\162", true)
v382:Button("syn", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))()
end)
v382:Button("syn2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
end)
v382:Button("\233\152\191\229\176\148\229\174\153\230\150\175V3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
end)
local v394 = v63:section("\229\144\142\233\151\168\230\139\166\230\136\170", true)
local vu395 = nil
v394:Textbox("\232\190\147\229\133\165\232\132\154\230\156\172\233\147\190\230\142\165", "", "\232\190\147\229\133\165\229\134\133\229\174\185", function(p396)
    vu395 = p396
end)
v394:Button("\230\137\167\232\161\140", function()
    if vu395 then
        local v397, v398 = pcall(loadstring, vu395)
        if v397 then
            v398()
        else
            print("\230\137\167\232\161\140\232\132\154\230\156\172\229\164\177\232\180\165:", v398)
        end
    else
        print("\232\175\183\229\133\136\229\156\168\230\150\135\230\156\172\230\161\134\228\184\173\232\190\147\229\133\165\232\132\154\230\156\172\233\147\190\230\142\165")
    end
end)
local vu399 = v394:Label("\229\183\178\230\139\166\230\136\170\229\136\176\231\154\132\229\144\142\233\151\168url: ")
local vu400 = ""
local v401 = http_request or request or (HttpPost or syn.request)
local vu402 = nil
vu402 = hookfunction(v401, function(p403, ...)
    if p403.Url:find("discord.com/api/webhooks") then
        local v404 = p403.Url
        vu400 = v404
        vu399.Text = "\229\183\178\230\139\166\230\136\170\229\136\176\231\154\132\229\144\142\233\151\168url: " .. v404
        if vu399.Text ~= "\229\183\178\230\139\166\230\136\170\229\136\176\231\154\132\229\144\142\233\151\168url: https://discord.com/api/webhooks/1324884393025736714/sCnL4xnjHV775a9bLx2p2kW__7DMMVRKydH7EPNWx3yrGWnxAid_gccn3aYconex9BrW" then
            print("Webhook URL: " .. v404)
        else
            vu399.Text = ""
        end
    end
    return vu402(p403, ...)
end)
v394:Button("\230\184\133\231\169\186\233\147\190\230\142\165", function()
    vu399.Text = ""
    vu400 = ""
end)
v394:Button("\229\164\141\229\136\182\229\183\178\230\139\166\230\136\170\229\136\176\231\154\132\229\144\142\233\151\168\233\147\190\230\142\165", function()
    setclipboard(vu400)
end)
local v405 = v63:section("\229\144\142\233\151\168\232\189\176\231\130\184", true)
local vu406 = nil
v405:Textbox("\232\190\147\229\133\165\229\144\142\233\151\168url", "", "\232\190\147\229\133\165\229\134\133\229\174\185", function(p407)
    vu406 = p407
end)
v405:Button("\229\188\128\229\167\139\232\189\176\231\130\184", function()
    local vu408 = vu406
    local vu409 = {
        username = "\229\143\182\232\132\154\230\156\172",
        embeds = {
            {
                color = tonumber(tostring("0x32CD32")),
                title = "\230\139\146\231\187\157Wehook",
                fields = {}
            }
        }
    }
    local vu410 = game:GetService("HttpService")
    for _ = 1, 10 do
        local v411, v412 = pcall(function()
            return vu410:PostAsync(vu408, vu410:JSONEncode(vu409), false, {
                ["Content-Type"] = "application/json"
            })
        end)
        if v411 then
            print("\229\143\145\233\128\129\230\136\144\229\138\159\239\188\140\229\147\141\229\186\148\239\188\154", v412)
        else
            warn("\229\143\145\233\128\129\229\164\177\232\180\165\239\188\154", v412)
        end
        task.wait(1)
    end
end)
local v413 = v63:section("\230\151\182\233\151\180", true)
v413:Button("\229\135\140\230\153\16812\231\130\185", function()
    lighting = game:GetService("Lighting")
    if lighting.TimeOfDay ~= "00:00:00" then
        lighting.TimeOfDay = 24
    else
        lighting.TimeOfDay = 11
    end
end)
v413:Button("\228\184\139\229\141\1364\231\130\185", function()
    lighting = game:GetService("Lighting")
    if lighting.TimeOfDay ~= "16:00:00" then
        lighting.TimeOfDay = 24
    else
        lighting.TimeOfDay = 11
    end
end)
v413:Button("\228\184\173\229\141\136\229\141\129\228\184\128\231\130\185", function()
    lighting = game:GetService("Lighting")
    if lighting.TimeOfDay ~= "11:00:00" then
        lighting.TimeOfDay = 24
    else
        lighting.TimeOfDay = 11
    end
end)
v413:Button("\230\151\169\228\184\138\229\133\173\231\130\185", function()
    local v414 = game:GetService("Lighting")
    v414.TimeOfDay = "06:00:00"
    v414.Brightness = 6
end)

local v614 = v31:Tab("\232\135\170\231\158\132", "6035145364")
local v615 = v614:section("\229\156\136\229\156\136\232\135\170\231\158\132", true)
local vu616 = {
    fovsize = 20,
    fovlookAt = false,
    fovcolor = Color3.fromRGB(255, 255, 255),
    fovthickness = 2,
    Visible = false,
    distance = 40,
    ViewportSize = 2,
    Transparency = 1,
    Position = "Head"
}
local function vu651(p617, p618, p619, p620)
    local vu621 = game:GetService("RunService")
    local v622 = game:GetService("UserInputService")
    local vu623 = game:GetService("Players")
    local vu624 = game.Workspace.CurrentCamera
    if FOVring then
        FOVring:Remove()
    end
    FOVring = Drawing.new("Circle")
    FOVring.Visible = true
    FOVring.Thickness = p619
    FOVring.Color = p618
    FOVring.Filled = false
    FOVring.Radius = p617
    FOVring.Position = vu624.ViewportSize / 2
    FOVring.Transparency = p620
    local function vu626()
        local v625 = vu624.ViewportSize
        FOVring.Position = v625 / 2
    end
    v622.InputBegan:Connect(function(p627)
        if p627.KeyCode == Enum.KeyCode.Delete then
            vu621:UnbindFromRenderStep("FOVUpdate")
            FOVring:Remove()
        end
    end)
    local function vu630(p628)
        local v629 = (p628 - vu624.CFrame.Position).unit
        vu624.CFrame = CFrame.new(vu624.CFrame.Position, vu624.CFrame.Position + v629)
    end
    local function vu633(p631)
        local v632 = p631.Character and p631.Character:FindFirstChild("Humanoid")
        if v632 then
            v632 = p631.Character.Humanoid.Health > 0
        end
        return v632
    end
    local function vu648(p634)
        local v635 = math.huge
        local v636 = vu624.ViewportSize / 2
        local v637 = vu616.distance
        local v638 = vu623
        local v639, v640, v641 = ipairs(v638:GetPlayers())
        local v642 = nil
        while true do
            local v643
            v641, v643 = v639(v640, v641)
            if v641 == nil then
                break
            end
            if (not vu616.aliveCheck or vu633(v643)) and v643 ~= vu623.LocalPlayer then
                local v644 = v643.Character
                if v644 then
                    v644 = v643.Character:FindFirstChild(p634)
                end
                if v644 then
                    local v645, v646 = vu624:WorldToViewportPoint(v644.Position)
                    if v645 and v646 then
                        local v647 = (Vector2.new(v645.x, v645.y) - v636).Magnitude
                        if v647 < v635 and (v647 <= vu616.fovsize and (v647 <= v637 and (not vu616.teamCheck or vu616.teamCheck and isSameTeam(v643)))) then
                            if not vu616.wallCheck or vu616.wallCheck and isNearWall(v643, v637) then
                                v642 = v643
                                v635 = v647
                            end
                        end
                    end
                end
            end
        end
        return v642
    end
    vu621.RenderStepped:Connect(function()
        vu626()
        local v649 = vu616.fovlookAt and vu648(vu616.Position)
        if v649 and v649.Character:FindFirstChild(vu616.Position) then
            local v650 = v649.Character[vu616.Position].Position
            if not (vu616.teamCheck and isSameTeam(v649) or vu616.wallCheck and isNearWall(v649, vu616.distance)) then
                vu630(v650)
            end
        end
    end)
end
local function vu652()
    if FOVring then
        game:GetService("RunService"):UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
        FOVring = nil
    end
end
local function vu653()
    if FOVring then
        FOVring.Thickness = vu616.fovthickness
        FOVring.Radius = vu616.fovsize
        FOVring.Color = vu616.fovcolor
        FOVring.Transparency = vu616.Transparency / 10
    end
end

v615:Toggle("\230\152\190\231\164\186\229\156\136\229\156\136\232\135\170\231\158\132", "open/close", false, function(p655)
    if p655 then
        vu651(vu616.fovsize, vu616.fovcolor, vu616.fovthickness, vu616.Transparency)
    else
        vu652()
    end
end)
v615:Toggle("\229\144\175\229\138\168/\229\133\179\233\151\173\229\156\136\229\156\136\232\135\170\231\158\132", "open/close", false, function(p656)
    vu616.fovlookAt = p656
end)
v615:Slider("\229\156\136\229\156\136\232\135\170\231\158\132\229\142\154\229\186\166", "thickness", 2, 0, 10, false, function(p657)
    vu616.fovthickness = p657
    vu653()
end)
v615:Slider("\229\156\136\229\156\136\232\135\170\231\158\132\233\128\143\230\152\142\229\186\166", "Transparency", 1, 0, 10, false, function(p659)
    vu616.Transparency = p659
    vu653()
end)
v615:Slider("\229\156\136\229\156\136\232\135\170\231\158\132\232\183\157\231\166\187", "distance", 40, 10, 500, false, function(p660)
    vu616.distance = p660
end)
v615:Toggle("\233\152\159\228\188\141\230\163\128\230\181\139", "Enable/Disable Team Check", false, function(p663)
    vu616.teamCheck = p663
end)
v615:Toggle("\230\180\187\228\189\147\230\163\128\230\181\139", "Alive Check", false, function(p664)
    vu616.aliveCheck = p664
end)
v615:Toggle("\229\162\153\229\163\129\230\163\128\230\181\139", "Enable/Disable Wall Check", false, function(p665)
    vu616.wallCheck = p665
end)
local v666 = v614:section("\230\150\176\232\135\170\231\158\132", true)
local vu667 = false
local vu668 = false
local vu669 = false
local vu670 = 50
local vu671 = game:GetService("Players").LocalPlayer
local vu672 = game:GetService("RunService")
local vu673 = game:GetService("Players")
local vu674 = workspace.CurrentCamera
local vu675 = Drawing.new("Circle")
vu675.Visible = false
vu675.Thickness = 2
vu675.Color = Color3.fromRGB(255, 0, 0)
vu675.Filled = false
vu675.Radius = vu670
vu675.Position = Vector2.new(vu674.ViewportSize.X / 2, vu674.ViewportSize.Y / 2)
local vu676 = "Head"
local function vu677()
    vu675.Position = Vector2.new(vu674.ViewportSize.X / 2, vu674.ViewportSize.Y / 2)
end
local function vu678()
    vu675.Visible = false
end
local function vu681(p679)
    local v680 = (p679 - vu674.CFrame.Position).Unit
    vu674.CFrame = CFrame.new(vu674.CFrame.Position, vu674.CFrame.Position + v680)
end
local function vu697()
    local v682 = math.huge
    local v683 = math.huge
    local v684 = Vector2.new(vu674.ViewportSize.X / 2, vu674.ViewportSize.Y / 2)
    local v685 = vu673
    local v686, v687, v688 = ipairs(v685:GetPlayers())
    local v689 = nil
    local v690 = nil
    while true do
        local v691
        v688, v691 = v686(v687, v688)
        if v688 == nil then
            break
        end
        if v691 ~= vu671 then
            local v692 = v691.Character
            if v692 and v692:FindFirstChild(vu676) then
                local v693, v694 = vu674:WorldToViewportPoint(v692[vu676].Position)
                local v695 = (Vector2.new(v693.x, v693.y) - v684).Magnitude
                if v695 < v682 and v694 then
                    if v695 >= vu670 then
                        v695 = v682
                    else
                        v690 = v691
                    end
                else
                    v695 = v682
                end
                local v696 = v692:FindFirstChildOfClass("Humanoid")
                if v696 and (v696.Health > 0 and v696.Health < v683) then
                    v683 = v696.Health
                    v689 = v691
                    v682 = v695
                else
                    v682 = v695
                end
            end
        end
    end
    return vu669 and v689 and v689 or v690
end
local function vu703(p698, p699)
    local v700 = p698.Character
    if v700 and v700:FindFirstChild(vu676) then
        local v701 = v700[vu676]
        local v702 = v701.Velocity
        return v701.Position + v702 * p699 * 1.2
    end
end
local function vu708(p704)
    if p704 then
        vu667 = true
        vu675.Visible = true
        vu676 = "Head"
        vu675.Connection = vu672.RenderStepped:Connect(function(p705)
            vu677()
            local v706 = vu697()
            if v706 and v706.Character and v706.Character:FindFirstChild(vu676) then
                local v707 = v706.Character[vu676].Position
                if vu668 then
                    v707 = vu703(v706, p705)
                end
                vu681(v707)
            end
        end)
    else
        vu667 = false
        vu675.Visible = false
        if vu675.Connection then
            vu675.Connection:Disconnect()
            vu675.Connection = nil
        end
        vu674.CFrame = workspace.CurrentCamera.CFrame
        vu676 = nil
    end
end
local function vu710(p709)
    vu668 = p709
end
local function vu712(p711)
    vu669 = p711
end
v666:Toggle("\232\135\170\231\158\132 (\229\188\128/\229\133\179)", "\229\188\128\229\133\179", false, function(p713)
    vu708(p713)
end)
v666:Toggle("\233\162\132\229\136\164\232\135\170\231\158\132 (\229\188\128/\229\133\179)", "\229\188\128\229\133\179", false, function(p714)
    vu710(p714)
end)
v666:Toggle("\228\188\152\229\133\136\231\158\132\229\135\134\232\161\128\233\135\143\228\189\142\231\154\132\231\142\169\229\174\182 (\229\188\128/\229\133\179)", "\229\188\128\229\133\179", false, function(p715)
    vu712(p715)
end)
v666:Slider("\232\135\170\231\158\132\229\156\136\229\164\167\229\176\143", "\230\139\137\230\157\161", vu670, 1, 600, false, function(p716)
    vu670 = p716
    if vu667 then
        vu675.Radius = vu670
    else
        vu678()
    end
end)
v666:Slider("\232\135\170\231\158\132\229\156\136\229\142\154\229\186\166", "\230\139\137\230\157\161", vu675.Thickness, 1, 10, false, function(p717)
    if vu667 then
        vu675.Thickness = p717
    else
        vu678()
    end
end)

local v720 = v614:section("\229\138\159\232\131\189", true)
v720:Button("\229\141\129\229\173\151\229\135\134\229\191\131", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Raw.Dong-Ling-Zhon-Xin.Lua/refs/heads/main/%E5%87%86%E5%BF%83.lua"))()
end)
v720:Button("\230\158\151\229\144\140\230\172\190", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/bu/refs/heads/main/%E6%9C%88%E4%BA%AE%E5%8A%A0%E5%AF%86%E8%BF%87%E7%9A%84%E6%9E%97%E7%9A%84%E8%87%AA%E7%9E%84.lua"))()
end)
v720:Toggle("\233\148\129\229\164\180\239\188\136\230\156\137\233\152\159\228\188\141\230\163\128\230\181\139\239\188\137", "", false, function(p721)
    _G.AimbotEnabled = p721
    local vu722 = workspace.CurrentCamera
    local vu723 = game:GetService("Players")
    local v724 = game:GetService("RunService")
    local vu725 = game:GetService("UserInputService")
    local vu726 = game:GetService("TweenService")
    local vu727 = vu723.LocalPlayer
    local vu728 = false
    _G.TeamCheck = true
    _G.AimPart = "Head"
    _G.Sensitivity = 0
    _G.CircleSides = 64
    _G.CircleColor = Color3.fromRGB(255, 255, 255)
    _G.CircleTransparency = 0.7
    _G.CircleRadius = 80
    _G.CircleFilled = false
    _G.CircleVisible = false
    _G.CircleThickness = 0
    local vu729 = Drawing.new("Circle")
    vu729.Position = Vector2.new(vu722.ViewportSize.X / 2, vu722.ViewportSize.Y / 2)
    vu729.Radius = _G.CircleRadius
    vu729.Filled = _G.CircleFilled
    vu729.Color = _G.CircleColor
    vu729.Visible = _G.CircleVisible
    vu729.Radius = _G.CircleRadius
    vu729.Transparency = _G.CircleTransparency
    vu729.NumSides = _G.CircleSides
    vu729.Thickness = _G.CircleThickness
    local function vu742()
        local v730 = _G.CircleRadius
        local v731 = next
        local v732, v733 = vu723:GetPlayers()
        local v734 = nil
        while true do
            local v735
            v733, v735 = v731(v732, v733)
            if v733 == nil then
                break
            end
            if v735.Name ~= vu727.Name then
                if _G.TeamCheck ~= true then
                    if v735.Character ~= nil and (v735.Character:FindFirstChild("HumanoidRootPart") ~= nil and (v735.Character:FindFirstChild("Humanoid") ~= nil and v735.Character:FindFirstChild("Humanoid").Health ~= 0)) then
                        local v736 = vu722:WorldToScreenPoint(v735.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                        local v737 = vu725
                        local v738 = vu725
                        if (Vector2.new(v737:GetMouseLocation().X, v738:GetMouseLocation().Y) - Vector2.new(v736.X, v736.Y)).Magnitude < v730 then
                            v734 = v735
                        end
                    end
                elseif v735.Team ~= vu727.Team and v735.Character ~= nil and (v735.Character:FindFirstChild("HumanoidRootPart") ~= nil and (v735.Character:FindFirstChild("Humanoid") ~= nil and v735.Character:FindFirstChild("Humanoid").Health ~= 0)) then
                    local v739 = vu722:WorldToScreenPoint(v735.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                    local v740 = vu725
                    local v741 = vu725
                    if (Vector2.new(v740:GetMouseLocation().X, v741:GetMouseLocation().Y) - Vector2.new(v739.X, v739.Y)).Magnitude < v730 then
                        v734 = v735
                    end
                end
            end
        end
        return v734
    end
    vu725.InputBegan:Connect(function(p743)
        if p743.UserInputType == Enum.UserInputType.MouseButton2 then
            vu728 = true
        end
    end)
    vu725.InputEnded:Connect(function(p744)
        if p744.UserInputType == Enum.UserInputType.MouseButton2 then
            vu728 = false
        end
    end)
    v724.RenderStepped:Connect(function()
        local v745 = vu725
        local v746 = vu725
        vu729.Position = Vector2.new(v745:GetMouseLocation().X, v746:GetMouseLocation().Y)
        vu729.Radius = _G.CircleRadius
        vu729.Filled = _G.CircleFilled
        vu729.Color = _G.CircleColor
        vu729.Visible = _G.CircleVisible
        vu729.Radius = _G.CircleRadius
        vu729.Transparency = _G.CircleTransparency
        vu729.NumSides = _G.CircleSides
        vu729.Thickness = _G.CircleThickness
        if vu728 == true and _G.AimbotEnabled == true then
            vu726:Create(vu722, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                CFrame = CFrame.new(vu722.CFrame.Position, vu742().Character[_G.AimPart].Position)
            }):Play()
        end
    end)
end)
v720:Toggle("\233\148\129\229\164\180(\230\151\160\233\152\159\228\188\141\230\163\128\230\181\139)", "", false, function(p747)
    _G.AimbotEnabled = p747
    local vu748 = workspace.CurrentCamera
    local vu749 = game:GetService("Players")
    local v750 = game:GetService("RunService")
    local vu751 = game:GetService("UserInputService")
    local vu752 = game:GetService("TweenService")
    local vu753 = vu749.LocalPlayer
    local vu754 = false
    _G.TeamCheck = false
    _G.AimPart = "Head"
    _G.Sensitivity = 0
    _G.CircleSides = 64
    _G.CircleColor = Color3.fromRGB(255, 255, 255)
    _G.CircleTransparency = 0.7
    _G.CircleRadius = 80
    _G.CircleFilled = false
    _G.CircleVisible = false
    _G.CircleThickness = 0
    local vu755 = Drawing.new("Circle")
    vu755.Position = Vector2.new(vu748.ViewportSize.X / 2, vu748.ViewportSize.Y / 2)
    vu755.Radius = _G.CircleRadius
    vu755.Filled = _G.CircleFilled
    vu755.Color = _G.CircleColor
    vu755.Visible = _G.CircleVisible
    vu755.Radius = _G.CircleRadius
    vu755.Transparency = _G.CircleTransparency
    vu755.NumSides = _G.CircleSides
    vu755.Thickness = _G.CircleThickness
    local function vu768()
        local v756 = _G.CircleRadius
        local v757 = next
        local v758, v759 = vu749:GetPlayers()
        local v760 = nil
        while true do
            local v761
            v759, v761 = v757(v758, v759)
            if v759 == nil then
                break
            end
            if v761.Name ~= vu753.Name then
                if _G.TeamCheck ~= true then
                    if v761.Character ~= nil and (v761.Character:FindFirstChild("HumanoidRootPart") ~= nil and (v761.Character:FindFirstChild("Humanoid") ~= nil and v761.Character:FindFirstChild("Humanoid").Health ~= 0)) then
                        local v762 = vu748:WorldToScreenPoint(v761.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                        local v763 = vu751
                        local v764 = vu751
                        if (Vector2.new(v763:GetMouseLocation().X, v764:GetMouseLocation().Y) - Vector2.new(v762.X, v762.Y)).Magnitude < v756 then
                            v760 = v761
                        end
                    end
                elseif v761.Team ~= vu753.Team and v761.Character ~= nil and (v761.Character:FindFirstChild("HumanoidRootPart") ~= nil and (v761.Character:FindFirstChild("Humanoid") ~= nil and v761.Character:FindFirstChild("Humanoid").Health ~= 0)) then
                    local v765 = vu748:WorldToScreenPoint(v761.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                    local v766 = vu751
                    local v767 = vu751
                    if (Vector2.new(v766:GetMouseLocation().X, v767:GetMouseLocation().Y) - Vector2.new(v765.X, v765.Y)).Magnitude < v756 then
                        v760 = v761
                    end
                end
            end
        end
        return v760
    end
    vu751.InputBegan:Connect(function(p769)
        if p769.UserInputType == Enum.UserInputType.MouseButton2 then
            vu754 = true
        end
    end)
    vu751.InputEnded:Connect(function(p770)
        if p770.UserInputType == Enum.UserInputType.MouseButton2 then
            vu754 = false
        end
    end)
    v750.RenderStepped:Connect(function()
        local v771 = vu751
        local v772 = vu751
        vu755.Position = Vector2.new(v771:GetMouseLocation().X, v772:GetMouseLocation().Y)
        vu755.Radius = _G.CircleRadius
        vu755.Filled = _G.CircleFilled
        vu755.Color = _G.CircleColor
        vu755.Visible = _G.CircleVisible
        vu755.Radius = _G.CircleRadius
        vu755.Transparency = _G.CircleTransparency
        vu755.NumSides = _G.CircleSides
        vu755.Thickness = _G.CircleThickness
        if vu754 == true and _G.AimbotEnabled == true then
            vu752:Create(vu748, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                CFrame = CFrame.new(vu748.CFrame.Position, vu768().Character[_G.AimPart].Position)
            }):Play()
        end
    end)
end)
v720:Button("\232\135\170\231\158\13230", function()
    local vu773 = 30
    local vu774 = game:GetService("RunService")
    local v775 = game:GetService("UserInputService")
    local vu776 = game:GetService("Players")
    local vu777 = game.Workspace.CurrentCamera
    local vu778 = Drawing.new("Circle")
    vu778.Visible = true
    vu778.Thickness = 2
    vu778.Color = Color3.fromRGB(255, 0, 0)
    vu778.Filled = false
    vu778.Radius = vu773
    vu778.Position = vu777.ViewportSize / 2
    local function vu779()
        vu778.Position = vu777.ViewportSize / 2
    end
    local function v781(p780)
        if p780.KeyCode == Enum.KeyCode.Delete then
            vu774:UnbindFromRenderStep("FOVUpdate")
            vu778:Remove()
        end
    end
    v775.InputBegan:Connect(v781)
    local function vu784(p782)
        local v783 = (p782 - vu777.CFrame.Position).unit
        vu777.CFrame = CFrame.new(vu777.CFrame.Position, vu777.CFrame.Position + v783)
    end
    local function vu798(p785)
        local v786 = math.huge
        local v787 = vu777.ViewportSize / 2
        local v788 = vu776
        local v789, v790, v791 = ipairs(v788:GetPlayers())
        local v792 = nil
        while true do
            local v793
            v791, v793 = v789(v790, v791)
            if v791 == nil then
                break
            end
            if v793 ~= vu776.LocalPlayer then
                local v794 = v793.Character
                if v794 then
                    v794 = v793.Character:FindFirstChild(p785)
                end
                if v794 then
                    local v795, v796 = vu777:WorldToViewportPoint(v794.Position)
                    local v797 = (Vector2.new(v795.x, v795.y) - v787).Magnitude
                    if v797 < v786 and v796 then
                        if v797 < vu773 then
                            v792 = v793
                            v786 = v797
                        end
                    end
                end
            end
        end
        return v792
    end
    vu774.RenderStepped:Connect(function()
        vu779()
        local v799 = vu798("Head")
        if v799 and v799.Character:FindFirstChild("Head") then
            vu784(v799.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\13240", function()
    local vu800 = 40
    local vu801 = game:GetService("RunService")
    local v802 = game:GetService("UserInputService")
    local vu803 = game:GetService("Players")
    local vu804 = game.Workspace.CurrentCamera
    local vu805 = Drawing.new("Circle")
    vu805.Visible = true
    vu805.Thickness = 2
    vu805.Color = Color3.fromRGB(231, 231, 236)
    vu805.Filled = false
    vu805.Radius = vu800
    vu805.Position = vu804.ViewportSize / 2
    local function vu806()
        vu805.Position = vu804.ViewportSize / 2
    end
    local function v808(p807)
        if p807.KeyCode == Enum.KeyCode.Delete then
            vu801:UnbindFromRenderStep("FOVUpdate")
            vu805:Remove()
        end
    end
    v802.InputBegan:Connect(v808)
    local function vu811(p809)
        local v810 = (p809 - vu804.CFrame.Position).unit
        vu804.CFrame = CFrame.new(vu804.CFrame.Position, vu804.CFrame.Position + v810)
    end
    local function vu825(p812)
        local v813 = math.huge
        local v814 = vu804.ViewportSize / 2
        local v815 = vu803
        local v816, v817, v818 = ipairs(v815:GetPlayers())
        local v819 = nil
        while true do
            local v820
            v818, v820 = v816(v817, v818)
            if v818 == nil then
                break
            end
            if v820 ~= vu803.LocalPlayer then
                local v821 = v820.Character
                if v821 then
                    v821 = v820.Character:FindFirstChild(p812)
                end
                if v821 then
                    local v822, v823 = vu804:WorldToViewportPoint(v821.Position)
                    local v824 = (Vector2.new(v822.x, v822.y) - v814).Magnitude
                    if v824 < v813 and v823 then
                        if v824 < vu800 then
                            v819 = v820
                            v813 = v824
                        end
                    end
                end
            end
        end
        return v819
    end
    vu801.RenderStepped:Connect(function()
        vu806()
        local v826 = vu825("Head")
        if v826 and v826.Character:FindFirstChild("Head") then
            vu811(v826.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132100", function()
    local vu827 = 100
    local vu828 = game:GetService("RunService")
    local v829 = game:GetService("UserInputService")
    local vu830 = game:GetService("Players")
    local vu831 = game.Workspace.CurrentCamera
    local vu832 = Drawing.new("Circle")
    vu832.Visible = true
    vu832.Thickness = 2
    vu832.Color = Color3.fromRGB(231, 231, 236)
    vu832.Filled = false
    vu832.Radius = vu827
    vu832.Position = vu831.ViewportSize / 2
    local function vu833()
        vu832.Position = vu831.ViewportSize / 2
    end
    local function v835(p834)
        if p834.KeyCode == Enum.KeyCode.Delete then
            vu828:UnbindFromRenderStep("FOVUpdate")
            vu832:Remove()
        end
    end
    v829.InputBegan:Connect(v835)
    local function vu838(p836)
        local v837 = (p836 - vu831.CFrame.Position).unit
        vu831.CFrame = CFrame.new(vu831.CFrame.Position, vu831.CFrame.Position + v837)
    end
    local function vu852(p839)
        local v840 = math.huge
        local v841 = vu831.ViewportSize / 2
        local v842 = vu830
        local v843, v844, v845 = ipairs(v842:GetPlayers())
        local v846 = nil
        while true do
            local v847
            v845, v847 = v843(v844, v845)
            if v845 == nil then
                break
            end
            if v847 ~= vu830.LocalPlayer then
                local v848 = v847.Character
                if v848 then
                    v848 = v847.Character:FindFirstChild(p839)
                end
                if v848 then
                    local v849, v850 = vu831:WorldToViewportPoint(v848.Position)
                    local v851 = (Vector2.new(v849.x, v849.y) - v841).Magnitude
                    if v851 < v840 and v850 then
                        if v851 < vu827 then
                            v846 = v847
                            v840 = v851
                        end
                    end
                end
            end
        end
        return v846
    end
    vu828.RenderStepped:Connect(function()
        vu833()
        local v853 = vu852("Head")
        if v853 and v853.Character:FindFirstChild("Head") then
            vu838(v853.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132110", function()
    local vu854 = 110
    local vu855 = game:GetService("RunService")
    local v856 = game:GetService("UserInputService")
    local vu857 = game:GetService("Players")
    local vu858 = game.Workspace.CurrentCamera
    local vu859 = Drawing.new("Circle")
    vu859.Visible = true
    vu859.Thickness = 2
    vu859.Color = Color3.fromRGB(231, 231, 236)
    vu859.Filled = false
    vu859.Radius = vu854
    vu859.Position = vu858.ViewportSize / 2
    local function vu860()
        vu859.Position = vu858.ViewportSize / 2
    end
    local function v862(p861)
        if p861.KeyCode == Enum.KeyCode.Delete then
            vu855:UnbindFromRenderStep("FOVUpdate")
            vu859:Remove()
        end
    end
    v856.InputBegan:Connect(v862)
    local function vu865(p863)
        local v864 = (p863 - vu858.CFrame.Position).unit
        vu858.CFrame = CFrame.new(vu858.CFrame.Position, vu858.CFrame.Position + v864)
    end
    local function vu879(p866)
        local v867 = math.huge
        local v868 = vu858.ViewportSize / 2
        local v869 = vu857
        local v870, v871, v872 = ipairs(v869:GetPlayers())
        local v873 = nil
        while true do
            local v874
            v872, v874 = v870(v871, v872)
            if v872 == nil then
                break
            end
            if v874 ~= vu857.LocalPlayer then
                local v875 = v874.Character
                if v875 then
                    v875 = v874.Character:FindFirstChild(p866)
                end
                if v875 then
                    local v876, v877 = vu858:WorldToViewportPoint(v875.Position)
                    local v878 = (Vector2.new(v876.x, v876.y) - v868).Magnitude
                    if v878 < v867 and v877 then
                        if v878 < vu854 then
                            v873 = v874
                            v867 = v878
                        end
                    end
                end
            end
        end
        return v873
    end
    vu855.RenderStepped:Connect(function()
        vu860()
        local v880 = vu879("Head")
        if v880 and v880.Character:FindFirstChild("Head") then
            vu865(v880.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132120", function()
    local vu881 = 120
    local vu882 = game:GetService("RunService")
    local v883 = game:GetService("UserInputService")
    local vu884 = game:GetService("Players")
    local vu885 = game.Workspace.CurrentCamera
    local vu886 = Drawing.new("Circle")
    vu886.Visible = true
    vu886.Thickness = 2
    vu886.Color = Color3.fromRGB(231, 231, 236)
    vu886.Filled = false
    vu886.Radius = vu881
    vu886.Position = vu885.ViewportSize / 2
    local function vu887()
        vu886.Position = vu885.ViewportSize / 2
    end
    local function v889(p888)
        if p888.KeyCode == Enum.KeyCode.Delete then
            vu882:UnbindFromRenderStep("FOVUpdate")
            vu886:Remove()
        end
    end
    v883.InputBegan:Connect(v889)
    local function vu892(p890)
        local v891 = (p890 - vu885.CFrame.Position).unit
        vu885.CFrame = CFrame.new(vu885.CFrame.Position, vu885.CFrame.Position + v891)
    end
    local function vu906(p893)
        local v894 = math.huge
        local v895 = vu885.ViewportSize / 2
        local v896 = vu884
        local v897, v898, v899 = ipairs(v896:GetPlayers())
        local v900 = nil
        while true do
            local v901
            v899, v901 = v897(v898, v899)
            if v899 == nil then
                break
            end
            if v901 ~= vu884.LocalPlayer then
                local v902 = v901.Character
                if v902 then
                    v902 = v901.Character:FindFirstChild(p893)
                end
                if v902 then
                    local v903, v904 = vu885:WorldToViewportPoint(v902.Position)
                    local v905 = (Vector2.new(v903.x, v903.y) - v895).Magnitude
                    if v905 < v894 and v904 then
                        if v905 < vu881 then
                            v900 = v901
                            v894 = v905
                        end
                    end
                end
            end
        end
        return v900
    end
    vu882.RenderStepped:Connect(function()
        vu887()
        local v907 = vu906("Head")
        if v907 and v907.Character:FindFirstChild("Head") then
            vu892(v907.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132130", function()
    local vu908 = 130
    local vu909 = game:GetService("RunService")
    local v910 = game:GetService("UserInputService")
    local vu911 = game:GetService("Players")
    local vu912 = game.Workspace.CurrentCamera
    local vu913 = Drawing.new("Circle")
    vu913.Visible = true
    vu913.Thickness = 2
    vu913.Color = Color3.fromRGB(231, 231, 236)
    vu913.Filled = false
    vu913.Radius = vu908
    vu913.Position = vu912.ViewportSize / 2
    local function vu914()
        vu913.Position = vu912.ViewportSize / 2
    end
    local function v916(p915)
        if p915.KeyCode == Enum.KeyCode.Delete then
            vu909:UnbindFromRenderStep("FOVUpdate")
            vu913:Remove()
        end
    end
    v910.InputBegan:Connect(v916)
    local function vu919(p917)
        local v918 = (p917 - vu912.CFrame.Position).unit
        vu912.CFrame = CFrame.new(vu912.CFrame.Position, vu912.CFrame.Position + v918)
    end
    local function vu933(p920)
        local v921 = math.huge
        local v922 = vu912.ViewportSize / 2
        local v923 = vu911
        local v924, v925, v926 = ipairs(v923:GetPlayers())
        local v927 = nil
        while true do
            local v928
            v926, v928 = v924(v925, v926)
            if v926 == nil then
                break
            end
            if v928 ~= vu911.LocalPlayer then
                local v929 = v928.Character
                if v929 then
                    v929 = v928.Character:FindFirstChild(p920)
                end
                if v929 then
                    local v930, v931 = vu912:WorldToViewportPoint(v929.Position)
                    local v932 = (Vector2.new(v930.x, v930.y) - v922).Magnitude
                    if v932 < v921 and v931 then
                        if v932 < vu908 then
                            v927 = v928
                            v921 = v932
                        end
                    end
                end
            end
        end
        return v927
    end
    vu909.RenderStepped:Connect(function()
        vu914()
        local v934 = vu933("Head")
        if v934 and v934.Character:FindFirstChild("Head") then
            vu919(v934.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132200", function()
    local vu935 = 200
    local vu936 = game:GetService("RunService")
    local v937 = game:GetService("UserInputService")
    local vu938 = game:GetService("Players")
    local vu939 = game.Workspace.CurrentCamera
    local vu940 = Drawing.new("Circle")
    vu940.Visible = true
    vu940.Thickness = 2
    vu940.Color = Color3.fromRGB(231, 231, 236)
    vu940.Filled = false
    vu940.Radius = vu935
    vu940.Position = vu939.ViewportSize / 2
    local function vu941()
        vu940.Position = vu939.ViewportSize / 2
    end
    local function v943(p942)
        if p942.KeyCode == Enum.KeyCode.Delete then
            vu936:UnbindFromRenderStep("FOVUpdate")
            vu940:Remove()
        end
    end
    v937.InputBegan:Connect(v943)
    local function vu946(p944)
        local v945 = (p944 - vu939.CFrame.Position).unit
        vu939.CFrame = CFrame.new(vu939.CFrame.Position, vu939.CFrame.Position + v945)
    end
    local function vu960(p947)
        local v948 = math.huge
        local v949 = vu939.ViewportSize / 2
        local v950 = vu938
        local v951, v952, v953 = ipairs(v950:GetPlayers())
        local v954 = nil
        while true do
            local v955
            v953, v955 = v951(v952, v953)
            if v953 == nil then
                break
            end
            if v955 ~= vu938.LocalPlayer then
                local v956 = v955.Character
                if v956 then
                    v956 = v955.Character:FindFirstChild(p947)
                end
                if v956 then
                    local v957, v958 = vu939:WorldToViewportPoint(v956.Position)
                    local v959 = (Vector2.new(v957.x, v957.y) - v949).Magnitude
                    if v959 < v948 and v958 then
                        if v959 < vu935 then
                            v954 = v955
                            v948 = v959
                        end
                    end
                end
            end
        end
        return v954
    end
    vu936.RenderStepped:Connect(function()
        vu941()
        local v961 = vu960("Head")
        if v961 and v961.Character:FindFirstChild("Head") then
            vu946(v961.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132250", function()
    local vu962 = 250
    local vu963 = game:GetService("RunService")
    local v964 = game:GetService("UserInputService")
    local vu965 = game:GetService("Players")
    local vu966 = game.Workspace.CurrentCamera
    local vu967 = Drawing.new("Circle")
    vu967.Visible = true
    vu967.Thickness = 2
    vu967.Color = Color3.fromRGB(231, 231, 236)
    vu967.Filled = false
    vu967.Radius = vu962
    vu967.Position = vu966.ViewportSize / 2
    local function vu968()
        vu967.Position = vu966.ViewportSize / 2
    end
    local function v970(p969)
        if p969.KeyCode == Enum.KeyCode.Delete then
            vu963:UnbindFromRenderStep("FOVUpdate")
            vu967:Remove()
        end
    end
    v964.InputBegan:Connect(v970)
    local function vu973(p971)
        local v972 = (p971 - vu966.CFrame.Position).unit
        vu966.CFrame = CFrame.new(vu966.CFrame.Position, vu966.CFrame.Position + v972)
    end
    local function vu987(p974)
        local v975 = math.huge
        local v976 = vu966.ViewportSize / 2
        local v977 = vu965
        local v978, v979, v980 = ipairs(v977:GetPlayers())
        local v981 = nil
        while true do
            local v982
            v980, v982 = v978(v979, v980)
            if v980 == nil then
                break
            end
            if v982 ~= vu965.LocalPlayer then
                local v983 = v982.Character
                if v983 then
                    v983 = v982.Character:FindFirstChild(p974)
                end
                if v983 then
                    local v984, v985 = vu966:WorldToViewportPoint(v983.Position)
                    local v986 = (Vector2.new(v984.x, v984.y) - v976).Magnitude
                    if v986 < v975 and v985 then
                        if v986 < vu962 then
                            v981 = v982
                            v975 = v986
                        end
                    end
                end
            end
        end
        return v981
    end
    vu963.RenderStepped:Connect(function()
        vu968()
        local v988 = vu987("Head")
        if v988 and v988.Character:FindFirstChild("Head") then
            vu973(v988.Character.Head.Position)
        end
    end)
end)
v720:Button("\232\135\170\231\158\132300", function()
    local vu989 = 300
    local vu990 = game:GetService("RunService")
    local v991 = game:GetService("UserInputService")
    local vu992 = game:GetService("Players")
    local vu993 = game.Workspace.CurrentCamera
    local vu994 = Drawing.new("Circle")
    vu994.Visible = true
    vu994.Thickness = 2
    vu994.Color = Color3.fromRGB(231, 231, 236)
    vu994.Filled = false
    vu994.Radius = vu989
    vu994.Position = vu993.ViewportSize / 2
    local function vu995()
        vu994.Position = vu993.ViewportSize / 2
    end
    local function v997(p996)
        if p996.KeyCode == Enum.KeyCode.Delete then
            vu990:UnbindFromRenderStep("FOVUpdate")
            vu994:Remove()
        end
    end
    v991.InputBegan:Connect(v997)
    local function vu1000(p998)
        local v999 = (p998 - vu993.CFrame.Position).unit
        vu993.CFrame = CFrame.new(vu993.CFrame.Position, vu993.CFrame.Position + v999)
    end
    local function vu1014(p1001)
        local v1002 = math.huge
        local v1003 = vu993.ViewportSize / 2
        local v1004 = vu992
        local v1005, v1006, v1007 = ipairs(v1004:GetPlayers())
        local v1008 = nil
        while true do
            local v1009
            v1007, v1009 = v1005(v1006, v1007)
            if v1007 == nil then
                break
            end
            if v1009 ~= vu992.LocalPlayer then
                local v1010 = v1009.Character
                if v1010 then
                    v1010 = v1009.Character:FindFirstChild(p1001)
                end
                if v1010 then
                    local v1011, v1012 = vu993:WorldToViewportPoint(v1010.Position)
                    local v1013 = (Vector2.new(v1011.x, v1011.y) - v1003).Magnitude
                    if v1013 < v1002 and v1012 then
                        if v1013 < vu989 then
                            v1008 = v1009
                            v1002 = v1013
                        end
                    end
                end
            end
        end
        return v1008
    end
    vu990.RenderStepped:Connect(function()
        vu995()
        local v1015 = vu1014("Head")
        if v1015 and v1015.Character:FindFirstChild("Head") then
            vu1000(v1015.Character.Head.Position)
        end
    end)
end)
local v1016 = v31:Tab("\232\140\131\229\155\180", "7733770689"):section("\229\134\133\229\174\185", true)
v1016:Textbox("\232\140\131\229\155\180\232\174\190\231\189\174", "HitBox", "\232\190\147\229\133\165", function(p1017)
    _G.HeadSize = p1017
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1018 = next
            local v1019, v1020 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1021
                v1020, vu1021 = v1018(v1019, v1020)
                if v1020 == nil then
                    break
                end
                if vu1021.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1021.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1021.Character.HumanoidRootPart.Transparency = 0.7
                        vu1021.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                        vu1021.Character.HumanoidRootPart.Material = "Neon"
                        vu1021.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18010", function()
    _G.HeadSize = 10
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1022 = next
            local v1023, v1024 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1025
                v1024, vu1025 = v1022(v1023, v1024)
                if v1024 == nil then
                    break
                end
                if vu1025.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1025.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1025.Character.HumanoidRootPart.Transparency = 0.7
                        vu1025.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1025.Character.HumanoidRootPart.Material = "Neon"
                        vu1025.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18020", function()
    _G.HeadSize = 20
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1026 = next
            local v1027, v1028 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1029
                v1028, vu1029 = v1026(v1027, v1028)
                if v1028 == nil then
                    break
                end
                if vu1029.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1029.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1029.Character.HumanoidRootPart.Transparency = 0.7
                        vu1029.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1029.Character.HumanoidRootPart.Material = "Neon"
                        vu1029.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18030", function()
    _G.HeadSize = 30
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1030 = next
            local v1031, v1032 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1033
                v1032, vu1033 = v1030(v1031, v1032)
                if v1032 == nil then
                    break
                end
                if vu1033.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1033.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1033.Character.HumanoidRootPart.Transparency = 0.7
                        vu1033.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1033.Character.HumanoidRootPart.Material = "Neon"
                        vu1033.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18040", function()
    _G.HeadSize = 40
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1034 = next
            local v1035, v1036 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1037
                v1036, vu1037 = v1034(v1035, v1036)
                if v1036 == nil then
                    break
                end
                if vu1037.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1037.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1037.Character.HumanoidRootPart.Transparency = 0.7
                        vu1037.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1037.Character.HumanoidRootPart.Material = "Neon"
                        vu1037.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18050", function()
    _G.HeadSize = 50
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1038 = next
            local v1039, v1040 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1041
                v1040, vu1041 = v1038(v1039, v1040)
                if v1040 == nil then
                    break
                end
                if vu1041.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1041.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1041.Character.HumanoidRootPart.Transparency = 0.7
                        vu1041.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1041.Character.HumanoidRootPart.Material = "Neon"
                        vu1041.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18060", function()
    _G.HeadSize = 60
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1042 = next
            local v1043, v1044 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1045
                v1044, vu1045 = v1042(v1043, v1044)
                if v1044 == nil then
                    break
                end
                if vu1045.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1045.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1045.Character.HumanoidRootPart.Transparency = 0.7
                        vu1045.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1045.Character.HumanoidRootPart.Material = "Neon"
                        vu1045.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18070", function()
    _G.HeadSize = 70
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1046 = next
            local v1047, v1048 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1049
                v1048, vu1049 = v1046(v1047, v1048)
                if v1048 == nil then
                    break
                end
                if vu1049.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1049.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1049.Character.HumanoidRootPart.Transparency = 0.7
                        vu1049.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1049.Character.HumanoidRootPart.Material = "Neon"
                        vu1049.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18080", function()
    _G.HeadSize = 80
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1050 = next
            local v1051, v1052 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1053
                v1052, vu1053 = v1050(v1051, v1052)
                if v1052 == nil then
                    break
                end
                if vu1053.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1053.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1053.Character.HumanoidRootPart.Transparency = 0.7
                        vu1053.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1053.Character.HumanoidRootPart.Material = "Neon"
                        vu1053.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\18090", function()
    _G.HeadSize = 90
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1054 = next
            local v1055, v1056 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1057
                v1056, vu1057 = v1054(v1055, v1056)
                if v1056 == nil then
                    break
                end
                if vu1057.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1057.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1057.Character.HumanoidRootPart.Transparency = 0.7
                        vu1057.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1057.Character.HumanoidRootPart.Material = "Neon"
                        vu1057.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\180100", function()
    _G.HeadSize = 100
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1058 = next
            local v1059, v1060 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1061
                v1060, vu1061 = v1058(v1059, v1060)
                if v1060 == nil then
                    break
                end
                if vu1061.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1061.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1061.Character.HumanoidRootPart.Transparency = 0.7
                        vu1061.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1061.Character.HumanoidRootPart.Material = "Neon"
                        vu1061.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\180150", function()
    _G.HeadSize = 150
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1062 = next
            local v1063, v1064 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1065
                v1064, vu1065 = v1062(v1063, v1064)
                if v1064 == nil then
                    break
                end
                if vu1065.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1065.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1065.Character.HumanoidRootPart.Transparency = 0.7
                        vu1065.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1065.Character.HumanoidRootPart.Material = "Neon"
                        vu1065.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\180200", function()
    _G.HeadSize = 200
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1066 = next
            local v1067, v1068 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1069
                v1068, vu1069 = v1066(v1067, v1068)
                if v1068 == nil then
                    break
                end
                if vu1069.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1069.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1069.Character.HumanoidRootPart.Transparency = 0.7
                        vu1069.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1069.Character.HumanoidRootPart.Material = "Neon"
                        vu1069.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\180250", function()
    _G.HeadSize = 250
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1070 = next
            local v1071, v1072 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1073
                v1072, vu1073 = v1070(v1071, v1072)
                if v1072 == nil then
                    break
                end
                if vu1073.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1073.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1073.Character.HumanoidRootPart.Transparency = 0.7
                        vu1073.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1073.Character.HumanoidRootPart.Material = "Neon"
                        vu1073.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v1016:Button("\232\140\131\229\155\180300", function()
    _G.HeadSize = 300
    _G.Disabled = true
    game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            local v1074 = next
            local v1075, v1076 = game:GetService("Players"):GetPlayers()
            while true do
                local vu1077
                v1076, vu1077 = v1074(v1075, v1076)
                if v1076 == nil then
                    break
                end
                if vu1077.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(function()
                        vu1077.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        vu1077.Character.HumanoidRootPart.Transparency = 0.7
                        vu1077.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        vu1077.Character.HumanoidRootPart.Material = "Neon"
                        vu1077.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
local v1078 = v31:Tab("\233\128\143\232\167\134\229\138\159\232\131\189", "6035145364")
local v1079 = v1078:section("\229\134\133\229\174\185", true)
v1079:Button("\233\128\154\231\148\168ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
end)
v1079:Button("\231\142\169\229\174\182\229\146\140\232\161\128\233\135\143", function()
    print("\229\138\160\232\189\189\229\174\140\230\136\144")
    local v1080 = game:GetService("Players")
    local vu1081 = v1080.LocalPlayer
    local v1082, v1083, v1084 = ipairs(v1080:GetPlayers())
    local function vu1091(pu1085)
        local vu1086 = Drawing.new("Circle")
        vu1086.Radius = 5
        vu1086.Color = Color3.fromRGB(255, 0, 0)
        vu1086.Thickness = 2
        vu1086.Transparency = 0.5
        vu1086.Visible = false
        local vu1087 = Drawing.new("Text")
        vu1087.Size = 10
        vu1087.Color = Color3.fromRGB(255, 255, 255)
        vu1087.Visible = false
        local function v1090()
            if pu1085.Character and pu1085.Character:FindFirstChild("HumanoidRootPart") then
                local v1088, v1089 = workspace.CurrentCamera:WorldToViewportPoint(pu1085.Character.HumanoidRootPart.Position)
                vu1086.Position = Vector2.new(v1088.X, v1088.Y)
                vu1086.Visible = v1089
                vu1087.Position = Vector2.new(v1088.X, v1088.Y + 50)
                vu1087.Visible = v1089
                vu1087.Text = pu1085.Name
            else
                vu1086.Visible = false
                vu1087.Visible = false
            end
        end
        game:GetService("RunService").RenderStepped:Connect(v1090)
    end
    while true do
        local v1092
        v1084, v1092 = v1082(v1083, v1084)
        if v1084 == nil then
            break
        end
        if v1092 ~= vu1081 then
            vu1091(v1092)
        end
    end
    v1080.PlayerAdded:Connect(function(p1093)
        if p1093 ~= vu1081 then
            vu1091(p1093)
        end
    end)
    v1080.PlayerRemoving:Connect(function(_)
    end)
end)
v1079:Button("\231\142\169\229\174\182\229\144\141\229\173\151\229\146\140\228\189\141\231\189\174", function()
    local v1094, v1095, v1096 = pairs(game.Players:GetPlayers())
    local function vu1098(p1097)
        if p1097.Character and p1097.Character:FindFirstChildOfClass("Humanoid") then
            p1097.Character.Humanoid.NameDisplayDistance = 9000000000
            p1097.Character.Humanoid.NameOcclusion = "NoOcclusion"
            p1097.Character.Humanoid.HealthDisplayDistance = 9000000000
            p1097.Character.Humanoid.HealthDisplayType = "AlwaysOn"
            p1097.Character.Humanoid.Health = p1097.Character.Humanoid.Health
        end
    end
    while true do
        local vu1099
        v1096, vu1099 = v1094(v1095, v1096)
        if v1096 == nil then
            break
        end
        vu1098(vu1099)
        vu1099.CharacterAdded:Connect(function()
            task.wait(0.33)
            vu1098(vu1099)
        end)
    end
    game.Players.PlayerAdded:Connect(function(pu1100)
        vu1098(pu1100)
        pu1100.CharacterAdded:Connect(function()
            task.wait(0.33)
            vu1098(pu1100)
        end)
    end)
end)
v1079:Button("AI Esp", function()
    local vu1101 = game:GetService("Players")
    local vu1102 = game:GetService("RunService")
    local function vu1113(pu1103)
        pu1103.CharacterAdded:Connect(function(pu1104)
            local v1105 = pu1104:WaitForChild("Head")
            local v1106 = Instance.new("BillboardGui")
            v1106.Name = "NameTag"
            v1106.Adornee = v1105
            v1106.Size = UDim2.new(0, 100, 0, 40)
            v1106.StudsOffset = Vector3.new(0, 2, 0)
            v1106.AlwaysOnTop = true
            local vu1107 = Instance.new("TextLabel")
            vu1107.Size = UDim2.new(1, 0, 1, 0)
            vu1107.Text = pu1103.Name
            vu1107.BackgroundTransparency = 1
            vu1107.TextScaled = true
            vu1107.Font = Enum.Font.SourceSansBold
            vu1107.TextStrokeTransparency = 0.5
            vu1107.TextColor3 = pu1103.Team and pu1103.Team.TeamColor.Color or Color3.new(1, 1, 1)
            vu1107.Parent = v1106
            v1106.Parent = v1105
            pu1103:GetPropertyChangedSignal("Team"):Connect(function()
                vu1107.TextColor3 = pu1103.Team and pu1103.Team.TeamColor.Color or Color3.new(1, 1, 1)
            end)
            local vu1108 = Drawing.new("Line")
            vu1108.Thickness = 1
            vu1108.Color = vu1107.TextColor3
            vu1108.Visible = false
            local vu1112 = vu1102.RenderStepped:Connect(function()
                if pu1104 and pu1104:FindFirstChild("HumanoidRootPart") then
                    local v1109 = pu1104.HumanoidRootPart
                    local v1110, v1111 = workspace.CurrentCamera:WorldToViewportPoint(v1109.Position)
                    if v1111 then
                        vu1108.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
                        vu1108.To = Vector2.new(v1110.X, v1110.Y)
                        vu1108.Visible = true
                        vu1108.Color = pu1103.Team and pu1103.Team.TeamColor.Color or Color3.new(1, 1, 1)
                    else
                        vu1108.Visible = false
                    end
                else
                    vu1108.Visible = false
                end
            end)
            pu1104:WaitForChild("Humanoid").Died:Connect(function()
                vu1108.Visible = false
                if vu1112 then
                    vu1112:Disconnect()
                end
            end)
        end)
    end
    local v1114, v1115, v1116 = ipairs(vu1101:GetPlayers())
    while true do
        local v1117
        v1116, v1117 = v1114(v1115, v1116)
        if v1116 == nil then
            break
        end
        if v1117 ~= vu1101.LocalPlayer then
            vu1113(v1117)
        end
    end
    vu1101.PlayerAdded:Connect(function(p1118)
        if p1118 ~= vu1101.LocalPlayer then
            vu1113(p1118)
        end
    end)
end)
local vu1119 = game:GetService("RunService")
local vu1120 = game:GetService("Players")
local vu1121 = vu1120.LocalPlayer
local vu1122 = false
local vu1123 = false
local vu1124 = false
local vu1125 = false
local vu1126 = false
local function vu1133(pu1127)
    local vu1128 = Instance.new("BillboardGui")
    local v1129 = Instance.new("TextLabel")
    vu1128.Name = "NameESP"
    vu1128.Adornee = pu1127.Character:WaitForChild("Head")
    vu1128.Size = UDim2.new(0, 100, 0, 50)
    vu1128.StudsOffset = Vector3.new(0, 3, 0)
    vu1128.AlwaysOnTop = true
    v1129.Parent = vu1128
    v1129.BackgroundTransparency = 1
    v1129.Text = pu1127.Name
    v1129.Size = UDim2.new(1, 0, 1, 0)
    v1129.TextColor3 = Color3.new(1, 1, 1)
    v1129.TextScaled = true
    local vu1130 = Instance.new("TextLabel")
    vu1130.Parent = vu1128
    vu1130.BackgroundTransparency = 1
    vu1130.Position = UDim2.new(0, 0, 0, 30)
    vu1130.Size = UDim2.new(1, 0, 0.5, 0)
    vu1130.TextColor3 = Color3.new(1, 1, 1)
    vu1130.TextScaled = true
    local function vu1132()
        if vu1128.Parent then
            local v1131 = (vu1121.Character.HumanoidRootPart.Position - pu1127.Character.HumanoidRootPart.Position).Magnitude
            vu1130.Text = string.format("%.2f studs", v1131)
        end
    end
    spawn(function()
        while vu1128.Parent do
            vu1132()
            wait(0.1)
        end
    end)
    vu1128.Parent = pu1127.Character:WaitForChild("Head")
end
local function vu1135(p1134)
    if p1134.Character and (p1134.Character:FindFirstChild("Head") and p1134.Character.Head:FindFirstChild("NameESP")) then
        p1134.Character.Head.NameESP:Destroy()
    end
end
local function vu1139(pu1136)
    local vu1137 = Instance.new("Highlight")
    vu1137.Name = "HighlightESP"
    vu1137.Adornee = pu1136.Character
    vu1137.FillTransparency = 0.5
    vu1137.OutlineColor = Color3.new(1, 1, 1)
    vu1137.OutlineTransparency = 0
    vu1137.Parent = pu1136.Character
    local function v1138()
        if pu1136.Team and pu1136.Team.TeamColor then
            vu1137.FillColor = pu1136.Team.TeamColor.Color
        else
            vu1137.FillColor = Color3.new(1, 1, 1)
        end
    end
    v1138()
    pu1136:GetPropertyChangedSignal("Team"):Connect(v1138)
end
local function vu1141(p1140)
    if p1140.Character and (p1140.Character:FindFirstChild("Head") and p1140.Character:FindFirstChild("HighlightESP")) then
        p1140.Character.HighlightESP:Destroy()
    end
end
local function vu1148(pu1142)
    local vu1143 = Drawing.new("Line")
    vu1143.Visible = false
    vu1143.Color = Color3.new(1, 1, 1)
    vu1143.Thickness = 1
    vu1143.Transparency = 1
    local function v1147()
        if vu1124 and pu1142.Character and (pu1142.Character:FindFirstChild("HumanoidRootPart") and vu1121.Character and vu1121.Character:FindFirstChild("HumanoidRootPart")) then
            vu1143.Visible = true
            local v1144 = pu1142.Character.HumanoidRootPart
            local v1145, v1146 = workspace.CurrentCamera:WorldToViewportPoint(v1144.Position)
            if v1146 then
                vu1143.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
                vu1143.To = Vector2.new(v1145.X, v1145.Y)
            else
                vu1143.Visible = false
            end
        else
            vu1143.Visible = false
        end
    end
    vu1119.RenderStepped:Connect(v1147)
    pu1142.CharacterRemoving:Connect(function()
        vu1143:Remove()
    end)
end
local function vu1150(p1149)
    if p1149:FindFirstChild("TracerESP") then
        p1149.TracerESP:Destroy()
    end
end
local function vu1153(p1151)
    local v1152 = Instance.new("BoxHandleAdornment")
    v1152.Name = "BoxESP"
    v1152.Size = p1151.Character:GetExtentsSize() * 1.1
    v1152.Adornee = p1151.Character
    v1152.AlwaysOnTop = true
    v1152.ZIndex = 5
    v1152.Transparency = 0.5
    v1152.Color3 = Color3.new(1, 0, 0)
    v1152.Parent = p1151.Character
end
local function vu1162(pu1154)
    local vu1155 = Drawing.new("Square")
    vu1155.Visible = false
    vu1155.Transparency = 0.5
    vu1155.Color = Color3.new(1, 0, 0)
    vu1155.Thickness = 2
    local function v1161()
        if vu1126 and pu1154.Character and (pu1154.Character:FindFirstChild("HumanoidRootPart") and vu1121.Character and vu1121.Character:FindFirstChild("HumanoidRootPart")) then
            vu1155.Visible = true
            local v1156 = pu1154.Character.HumanoidRootPart
            local _, v1157 = workspace.CurrentCamera:WorldToViewportPoint(v1156.Position)
            if v1157 then
                local v1158 = pu1154.Character:GetExtentsSize()
                local v1159 = workspace.CurrentCamera:WorldToViewportPoint((v1156.CFrame * CFrame.new(v1158.X / - 2, v1158.Y / 2, 0)).p)
                local v1160 = workspace.CurrentCamera:WorldToViewportPoint((v1156.CFrame * CFrame.new(v1158.X / 2, - v1158.Y / 2, 0)).p)
                vu1155.Size = Vector2.new(v1160.X - v1159.X, v1160.Y - v1159.Y)
                vu1155.Position = Vector2.new(v1159.X, v1159.Y)
            else
                vu1155.Visible = false
            end
        else
            vu1155.Visible = false
        end
    end
    vu1119.RenderStepped:Connect(v1161)
    pu1154.CharacterRemoving:Connect(function()
        vu1155:Remove()
    end)
end
local function vu1164(pu1163)
    pu1163.CharacterAdded:Connect(function(_)
        wait(1)
        if vu1122 then
            vu1133(pu1163)
        end
        if vu1123 then
            vu1139(pu1163)
        end
        if vu1124 then
            vu1148(pu1163)
        end
        if vu1125 then
            vu1153(pu1163)
        end
        if vu1126 then
            vu1162(pu1163)
        end
    end)
end
local function vu1171(p1165)
    vu1122 = p1165
    local v1166 = vu1120
    local v1167, v1168, v1169 = pairs(v1166:GetPlayers())
    while true do
        local v1170
        v1169, v1170 = v1167(v1168, v1169)
        if v1169 == nil then
            break
        end
        if v1170 ~= vu1121 then
            if vu1122 then
                if v1170.Character and v1170.Character:FindFirstChild("Head") then
                    vu1133(v1170)
                end
            else
                vu1135(v1170)
            end
        end
    end
end
local function vu1178(p1172)
    vu1123 = p1172
    local v1173 = vu1120
    local v1174, v1175, v1176 = pairs(v1173:GetChildren())
    while true do
        local v1177
        v1176, v1177 = v1174(v1175, v1176)
        if v1176 == nil then
            break
        end
        if v1177 ~= vu1121 then
            if vu1123 then
                if v1177.Character or v1177.TeamColor then
                    vu1139(v1177)
                end
            else
                vu1141(v1177)
            end
        end
    end
end
local function vu1185(p1179)
    vu1124 = p1179
    local v1180 = vu1120
    local v1181, v1182, v1183 = pairs(v1180:GetPlayers())
    while true do
        local v1184
        v1183, v1184 = v1181(v1182, v1183)
        if v1183 == nil then
            break
        end
        if v1184 ~= vu1121 then
            if vu1124 then
                vu1148(v1184)
            else
                vu1150(v1184)
            end
        end
    end
end
local v1186 = vu1120
local v1187, v1188, v1189 = pairs(vu1120.GetPlayers(v1186))
local vu1190 = vu671
local v1191 = vu1120
local vu1192 = vu1119
local vu1193 = vu616
local vu1194 = vu1121
while true do
    local v1195, v1196 = v1187(v1188, v1189)
    if v1195 == nil then
        break
    end
    v1189 = v1195
    if v1196 ~= vu1194 then
        vu1164(v1196)
    end
end
v1191.PlayerAdded:Connect(function(p1197)
    if p1197 ~= vu1194 then
        vu1164(p1197)
    end
end)
v1191.PlayerRemoving:Connect(onPlayerRemoving)
local v1198 = v1078:section("\231\187\152\229\136\182\229\138\159\232\131\189", true)
v1198:Toggle("\231\187\152\229\136\182 \228\189\141\231\189\174", "", false, function(_)
    local v1199, v1200, v1201 = pairs(game.Players:GetPlayers())
    local function vu1203(p1202)
        if p1202.Character and p1202.Character:FindFirstChildOfClass("Humanoid") then
            p1202.Character.Humanoid.NameDisplayDistance = 9000000000
            p1202.Character.Humanoid.NameOcclusion = "NoOcclusion"
            p1202.Character.Humanoid.HealthDisplayDistance = 9000000000
            p1202.Character.Humanoid.HealthDisplayType = "AlwaysOn"
            p1202.Character.Humanoid.Health = p1202.Character.Humanoid.Health
        end
    end
    while true do
        local vu1204
        v1201, vu1204 = v1199(v1200, v1201)
        if v1201 == nil then
            break
        end
        vu1203(vu1204)
        vu1204.CharacterAdded:Connect(function()
            task.wait(0.33)
            vu1203(vu1204)
        end)
    end
    game.Players.PlayerAdded:Connect(function(pu1205)
        vu1203(pu1205)
        pu1205.CharacterAdded:Connect(function()
            task.wait(0.33)
            vu1203(pu1205)
        end)
    end)
end)
v1198:Toggle("\231\187\152\229\136\182\229\144\141\229\173\151", "", false, function(p1206)
    vu1171(p1206)
end)
v1198:Toggle("\231\187\152\229\136\182\233\171\152\228\186\174", "", false, function(p1207)
    vu1178(p1207)
end)
v1198:Toggle("\231\187\152\229\136\182\229\176\132\231\186\191", "", false, function(p1208)
    vu1185(p1208)
end)
local vu1209 = v31:Tab("\230\151\139\232\189\172", "7743873633"):section("\230\151\139\232\189\172", true)
vu1209:Textbox("\230\151\139\232\189\172\233\128\159\229\186\166", "TextBoxFlag", "\232\190\147\229\133\165", function(p1210)
    vu1193.speed = tonumber(p1210) or 100
end)
vu1209:Toggle("\229\188\128\229\144\175/\229\133\179\233\151\173\230\151\139\232\189\172", "Spinbot", false, function(p1211)
    local v1212 = game:GetService("Players").LocalPlayer
    repeat
        task.wait()
    until v1212.Character
    local v1213 = v1212.Character:WaitForChild("HumanoidRootPart")
    v1212.Character:WaitForChild("Humanoid").AutoRotate = false
    if p1211 then
        local v1214 = Instance.new("AngularVelocity")
        v1214.Attachment0 = v1213:WaitForChild("RootAttachment")
        v1214.MaxTorque = math.huge
        v1214.AngularVelocity = Vector3.new(0, vu1193.speed, 0)
        v1214.Parent = v1213
        v1214.Name = "Spinbot"
    else
        local v1215 = v1213:FindFirstChild("Spinbot")
        if v1215 then
            v1215:Destroy()
        end
    end
end)
vu1209:Textbox("\232\135\170\229\174\154\228\185\137\230\151\139\232\189\172\233\128\159\229\186\166", "TextBoxFlag", "\232\190\147\229\133\165", function(p1216)
    local v1217 = game:GetService("Players").LocalPlayer
    repeat
        task.wait()
    until v1217.Character
    local v1218 = v1217.Character:WaitForChild("HumanoidRootPart")
    v1217.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1219 = Instance.new("AngularVelocity")
    v1219.Attachment0 = v1218:WaitForChild("RootAttachment")
    v1219.MaxTorque = math.huge
    v1219.AngularVelocity = Vector3.new(0, p1216, 0)
    v1219.Parent = v1218
    v1219.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\1720", function()
    local v1220 = game:GetService("Players").LocalPlayer
    local v1221 = 0
    repeat
        task.wait()
    until v1220.Character
    local v1222 = v1220.Character:WaitForChild("HumanoidRootPart")
    v1220.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1223 = Instance.new("AngularVelocity")
    v1223.Attachment0 = v1222:WaitForChild("RootAttachment")
    v1223.MaxTorque = math.huge
    v1223.AngularVelocity = Vector3.new(0, v1221, 0)
    v1223.Parent = v1222
    v1223.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17210", function()
    local v1224 = game:GetService("Players").LocalPlayer
    local v1225 = 10
    repeat
        task.wait()
    until v1224.Character
    local v1226 = v1224.Character:WaitForChild("HumanoidRootPart")
    v1224.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1227 = Instance.new("AngularVelocity")
    v1227.Attachment0 = v1226:WaitForChild("RootAttachment")
    v1227.MaxTorque = math.huge
    v1227.AngularVelocity = Vector3.new(0, v1225, 0)
    v1227.Parent = v1226
    v1227.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17230", function()
    local v1228 = game:GetService("Players").LocalPlayer
    local v1229 = 30
    repeat
        task.wait()
    until v1228.Character
    local v1230 = v1228.Character:WaitForChild("HumanoidRootPart")
    v1228.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1231 = Instance.new("AngularVelocity")
    v1231.Attachment0 = v1230:WaitForChild("RootAttachment")
    v1231.MaxTorque = math.huge
    v1231.AngularVelocity = Vector3.new(0, v1229, 0)
    v1231.Parent = v1230
    v1231.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17240", function()
    local v1232 = game:GetService("Players").LocalPlayer
    local v1233 = 40
    repeat
        task.wait()
    until v1232.Character
    local v1234 = v1232.Character:WaitForChild("HumanoidRootPart")
    v1232.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1235 = Instance.new("AngularVelocity")
    v1235.Attachment0 = v1234:WaitForChild("RootAttachment")
    v1235.MaxTorque = math.huge
    v1235.AngularVelocity = Vector3.new(0, v1233, 0)
    v1235.Parent = v1234
    v1235.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17250", function()
    local v1236 = game:GetService("Players").LocalPlayer
    local v1237 = 50
    repeat
        task.wait()
    until v1236.Character
    local v1238 = v1236.Character:WaitForChild("HumanoidRootPart")
    v1236.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1239 = Instance.new("AngularVelocity")
    v1239.Attachment0 = v1238:WaitForChild("RootAttachment")
    v1239.MaxTorque = math.huge
    v1239.AngularVelocity = Vector3.new(0, v1237, 0)
    v1239.Parent = v1238
    v1239.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17260", function()
    local v1240 = game:GetService("Players").LocalPlayer
    local v1241 = 60
    repeat
        task.wait()
    until v1240.Character
    local v1242 = v1240.Character:WaitForChild("HumanoidRootPart")
    v1240.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1243 = Instance.new("AngularVelocity")
    v1243.Attachment0 = v1242:WaitForChild("RootAttachment")
    v1243.MaxTorque = math.huge
    v1243.AngularVelocity = Vector3.new(0, v1241, 0)
    v1243.Parent = v1242
    v1243.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17270", function()
    local v1244 = game:GetService("Players").LocalPlayer
    local v1245 = 70
    repeat
        task.wait()
    until v1244.Character
    local v1246 = v1244.Character:WaitForChild("HumanoidRootPart")
    v1244.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1247 = Instance.new("AngularVelocity")
    v1247.Attachment0 = v1246:WaitForChild("RootAttachment")
    v1247.MaxTorque = math.huge
    v1247.AngularVelocity = Vector3.new(0, v1245, 0)
    v1247.Parent = v1246
    v1247.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17280", function()
    local v1248 = game:GetService("Players").LocalPlayer
    local v1249 = 80
    repeat
        task.wait()
    until v1248.Character
    local v1250 = v1248.Character:WaitForChild("HumanoidRootPart")
    v1248.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1251 = Instance.new("AngularVelocity")
    v1251.Attachment0 = v1250:WaitForChild("RootAttachment")
    v1251.MaxTorque = math.huge
    v1251.AngularVelocity = Vector3.new(0, v1249, 0)
    v1251.Parent = v1250
    v1251.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\17290", function()
    local v1252 = game:GetService("Players").LocalPlayer
    local v1253 = 90
    repeat
        task.wait()
    until v1252.Character
    local v1254 = v1252.Character:WaitForChild("HumanoidRootPart")
    v1252.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1255 = Instance.new("AngularVelocity")
    v1255.Attachment0 = v1254:WaitForChild("RootAttachment")
    v1255.MaxTorque = math.huge
    v1255.AngularVelocity = Vector3.new(0, v1253, 0)
    v1255.Parent = v1254
    v1255.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172100", function()
    local v1256 = game:GetService("Players").LocalPlayer
    local v1257 = 100
    repeat
        task.wait()
    until v1256.Character
    local v1258 = v1256.Character:WaitForChild("HumanoidRootPart")
    v1256.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1259 = Instance.new("AngularVelocity")
    v1259.Attachment0 = v1258:WaitForChild("RootAttachment")
    v1259.MaxTorque = math.huge
    v1259.AngularVelocity = Vector3.new(0, v1257, 0)
    v1259.Parent = v1258
    v1259.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172150", function()
    local v1260 = game:GetService("Players").LocalPlayer
    local v1261 = 150
    repeat
        task.wait()
    until v1260.Character
    local v1262 = v1260.Character:WaitForChild("HumanoidRootPart")
    v1260.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1263 = Instance.new("AngularVelocity")
    v1263.Attachment0 = v1262:WaitForChild("RootAttachment")
    v1263.MaxTorque = math.huge
    v1263.AngularVelocity = Vector3.new(0, v1261, 0)
    v1263.Parent = v1262
    v1263.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172200", function()
    local v1264 = game:GetService("Players").LocalPlayer
    local v1265 = 200
    repeat
        task.wait()
    until v1264.Character
    local v1266 = v1264.Character:WaitForChild("HumanoidRootPart")
    v1264.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1267 = Instance.new("AngularVelocity")
    v1267.Attachment0 = v1266:WaitForChild("RootAttachment")
    v1267.MaxTorque = math.huge
    v1267.AngularVelocity = Vector3.new(0, v1265, 0)
    v1267.Parent = v1266
    v1267.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172250", function()
    local v1268 = game:GetService("Players").LocalPlayer
    local v1269 = 250
    repeat
        task.wait()
    until v1268.Character
    local v1270 = v1268.Character:WaitForChild("HumanoidRootPart")
    v1268.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1271 = Instance.new("AngularVelocity")
    v1271.Attachment0 = v1270:WaitForChild("RootAttachment")
    v1271.MaxTorque = math.huge
    v1271.AngularVelocity = Vector3.new(0, v1269, 0)
    v1271.Parent = v1270
    v1271.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172300", function()
    local v1272 = game:GetService("Players").LocalPlayer
    local v1273 = 300
    repeat
        task.wait()
    until v1272.Character
    local v1274 = v1272.Character:WaitForChild("HumanoidRootPart")
    v1272.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1275 = Instance.new("AngularVelocity")
    v1275.Attachment0 = v1274:WaitForChild("RootAttachment")
    v1275.MaxTorque = math.huge
    v1275.AngularVelocity = Vector3.new(0, v1273, 0)
    v1275.Parent = v1274
    v1275.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172350", function()
    local v1276 = game:GetService("Players").LocalPlayer
    local v1277 = 350
    repeat
        task.wait()
    until v1276.Character
    local v1278 = v1276.Character:WaitForChild("HumanoidRootPart")
    v1276.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1279 = Instance.new("AngularVelocity")
    v1279.Attachment0 = v1278:WaitForChild("RootAttachment")
    v1279.MaxTorque = math.huge
    v1279.AngularVelocity = Vector3.new(0, v1277, 0)
    v1279.Parent = v1278
    v1279.Name = "Spinbot"
end)
vu1209:Button("\230\151\139\232\189\172400", function()
    local v1280 = game:GetService("Players").LocalPlayer
    local v1281 = 400
    repeat
        task.wait()
    until v1280.Character
    local v1282 = v1280.Character:WaitForChild("HumanoidRootPart")
    v1280.Character:WaitForChild("Humanoid").AutoRotate = false
    local v1283 = Instance.new("AngularVelocity")
    v1283.Attachment0 = v1282:WaitForChild("RootAttachment")
    v1283.MaxTorque = math.huge
    v1283.AngularVelocity = Vector3.new(0, v1281, 0)
    v1283.Parent = v1282
    v1283.Name = "Spinbot"
end)
local v1284 = v31:Tab("fisch(\233\177\188)", "7733993211")
local v1285 = v1284:section("\228\184\187\232\166\129\229\138\159\232\131\189", true)
v1285:Button("\233\152\178\230\140\130\230\156\186", function()
    wait(2)
    print("Anti Afk On")
    local vu1286 = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu1286:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu1286:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "\229\143\182\232\132\154\230\156\172\230\143\144\231\164\186",
        Text = "\233\152\178\230\140\130\230\156\186\229\183\178\229\188\128\229\144\175",
        Duration = 2
    })
end)
v1285:Button("\229\133\136\230\137\167\232\161\140\232\191\153\228\184\170", function()
    local v1287 = {
        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flimsy Rod")
    }
    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.events.equip:FireServer(unpack(v1287))
end)
v1285:Toggle("\232\135\170\229\138\168\233\146\147\233\177\188", "", false, function(p1288)
    autoFishingEnabled = p1288
    local vu1289 = {
        fpsCap = 9999,
        enableBigButton = true,
        bigButtonScaleFactor = 0.7,
        shakeSpeed = 0.01,
        FreezeWhileFishing = true
    }
    setfpscap(vu1289.fpsCap)
    local v1290 = game:GetService("Players")
    local vu1291 = game:GetService("VirtualInputManager")
    game:GetService("RunService")
    local vu1292 = game:GetService("ReplicatedStorage")
    local vu1293 = v1290.LocalPlayer
    local vu1294 = vu1293.PlayerGui
    local vu1303 = {
        blacklisted_attachments = {
            "bob",
            "bodyweld"
        },
        simulate_click = function(p1295, p1296, p1297)
            vu1291:SendMouseButtonEvent(p1295, p1296, p1297 - 1, true, game, 1)
            vu1291:SendMouseButtonEvent(p1295, p1296, p1297 - 1, false, game, 1)
        end,
        move_fix = function(p1298)
            local v1299, v1300, v1301 = p1298:GetDescendants()
            while true do
                local v1302
                v1301, v1302 = v1299(v1300, v1301)
                if v1301 == nil then
                    break
                end
                if v1302.ClassName == "Attachment" and table.find(vu1303.blacklisted_attachments, v1302.Name) then
                    v1302:Destroy()
                end
            end
        end
    }
    local vu1319 = {
        reel_tick = nil,
        cast_tick = nil,
        find_rod = function()
            local v1304 = vu1293.Character
            if not v1304 then
                return nil
            end
            local v1305, v1306, v1307 = ipairs(v1304:GetChildren())
            while true do
                local v1308
                v1307, v1308 = v1305(v1306, v1307)
                if v1307 == nil then
                    break
                end
                if v1308:IsA("Tool") and (v1308.Name:find("rod") or v1308.Name:find("Rod")) then
                    return v1308
                end
            end
            return nil
        end,
        freeze_character = function(p1309)
            local v1310 = vu1293.Character
            local v1311 = v1310 and v1310:FindFirstChildOfClass("Humanoid")
            if v1311 then
                if p1309 then
                    v1311.WalkSpeed = 0
                    v1311.JumpPower = 0
                else
                    v1311.WalkSpeed = 16
                    v1311.JumpPower = 50
                end
            end
        end,
        cast = function()
            if vu1293.Character then
                local v1312 = vu1319.find_rod()
                if v1312 then
                    v1312.events.cast:FireServer(unpack({
                        100,
                        1
                    }))
                    vu1319.cast_tick = 0
                end
            else
                return
            end
        end,
        shake = function()
            local v1313 = vu1294:FindFirstChild("shakeui")
            if v1313 then
                local v1314 = v1313:FindFirstChild("safezone")
                if v1314 then
                    v1314 = v1314:FindFirstChild("button")
                end
                if v1314 then
                    if vu1289.enableBigButton then
                        v1314.Size = UDim2.new(vu1289.bigButtonScaleFactor, 0, vu1289.bigButtonScaleFactor, 0)
                    else
                        v1314.Size = UDim2.new(1, 0, 1, 0)
                    end
                    if v1314.Visible then
                        vu1303.simulate_click(v1314.AbsolutePosition.X + v1314.AbsoluteSize.X / 2, v1314.AbsolutePosition.Y + v1314.AbsoluteSize.Y / 2, 1)
                    end
                end
            end
        end,
        reel = function()
            local v1315 = vu1294:FindFirstChild("reel")
            if v1315 then
                local v1316 = v1315:FindFirstChild("bar")
                if v1316 then
                    local v1317 = v1316:FindFirstChild("reel")
                    if v1317 then
                        if v1317.Disabled == true then
                            v1317.Disabled = false
                        end
                        local v1318 = getsenv(v1317).UpdateColors
                        if v1318 then
                            setupvalue(v1318, 1, 100)
                            vu1292.events.reelfinished:FireServer(getupvalue(v1318, 1), true)
                        end
                    end
                else
                    return
                end
            else
                return
            end
        end
    }
    local vu1320 = spawn(function()
        while autoFishingEnabled do
            if not autoFishingEnabled then
                return
            end
            if vu1319.find_rod() then
                if vu1289.FreezeWhileFishing then
                    vu1319.freeze_character(true)
                end
                vu1319.cast()
                vu1319.shake()
                vu1319.reel()
            else
                vu1319.freeze_character(false)
            end
            task.wait(vu1289.shakeSpeed)
        end
        vu1319.freeze_character(false)
    end)
    local function v1321()
        if vu1320 then
            task.cancel(vu1320)
            vu1320 = nil
        end
        vu1319.freeze_character(false)
    end
    if not autoFishingEnabled then
        v1321()
    end
end)
v1285:Toggle("\231\167\146\233\146\147", "", false, function(p1322)
    local vu1323 = game:GetService("Players")
    local vu1324 = game:GetService("ReplicatedStorage")
    local vu1325 = false
    local vu1326 = nil
    local function vu1327()
        if not vu1325 then
            vu1325 = true
            for _ = 1, 256 do
                vu1324.events.reelfinished:FireServer(1000, true)
            end
        end
    end
    local function v1330()
        vu1326 = vu1323.LocalPlayer:WaitForChild("PlayerGui").DescendantAdded:Connect(function(p1328)
            if p1328:IsA("Sound") and p1328.Name == "popup" then
                vu1327()
                p1328.AncestryChanged:Connect(function(_, p1329)
                    if not p1329 then
                        vu1325 = false
                        vu1327()
                    end
                end)
            end
        end)
    end
    local function v1331()
        if vu1326 then
            vu1326:Disconnect()
            vu1326 = nil
        end
        vu1325 = false
    end
    if p1322 then
        print("\229\138\159\232\131\189\229\183\178\229\144\175\231\148\168")
        v1330()
    else
        print("\229\138\159\232\131\189\229\183\178\231\166\129\231\148\168")
        v1331()
    end
end)
v1285:Toggle("\229\157\144\230\160\135", "\229\188\128\229\133\179", false, function(p1332)
    if p1332 then
        local vu1333 = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
        vu1333.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
        local v1334 = GetPosition()
        local vu1335 = string.format("%s,%s,%s", ExportValue(v1334[1]), ExportValue(v1334[2]), ExportValue(v1334[3]))
        vu1333.Text = "<font color=\'#ff4949\'>X</font><font color = \'#a3ff81\'>Y</font><font color = \'#626aff\'>Z</font>: " .. vu1335
        BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(function()
            local v1336 = GetPosition()
            vu1335 = string.format("%s,%s,%s", ExportValue(v1336[1]), ExportValue(v1336[2]), ExportValue(v1336[3]))
            vu1333.Text = "<font color=\'#ff4949\'>X</font><font color = \'#a3ff81\'>Y</font><font color = \'#626aff\'>Z</font>: " .. vu1335
        end)
    else
        if PlayerGui.hud.safezone.backpack:FindFirstChild("xyz") then
            PlayerGui.hud.safezone.backpack:FindFirstChild("xyz"):Destroy()
        end
        if BypassGpsLoop then
            BypassGpsLoop:Disconnect()
            BypassGpsLoop = nil
        end
    end
end)
v1285:Button("fisch(\233\177\188)1", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/cba17b913ee63c7bfdbb9301e2d87c8b.lua"))()
end)
v1285:Button("fisch(\233\177\188)2", function()
    loadstring(game:HttpGet("https://bonkhubloader.netlify.app", true))()
end)
v1285:Button("fisch(\233\177\188)3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHubz/Scripts/refs/heads/main/Fisch/Neox_Keyless"))()
end)
v1285:Button("\232\135\170\229\138\168\233\146\147\233\177\188", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/miIfhunter/Sandra/refs/heads/main/Key"))()
end)
v1285:Button("fisch(\233\177\188)4", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHubz/Scripts/refs/heads/main/Fisch/SpaceHub.lua"))()
end)
local v1337 = v1284:section("\228\188\160\233\128\129\229\138\159\232\131\189", true)
v1337:Button("\233\152\179\229\133\137\231\159\179\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 913.630615234375, 137.29348754882812, - 1129.8995361328125)
end)
v1337:Button("\231\189\151\230\150\175\229\136\169\231\137\185\230\185\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1501.675537109375, 133, 416.2070007324219)
end)
v1337:Button("Mo\230\156\168", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(382.6944580078125, 134.34976196289062, 245.10342407226562)
end)
v1337:Button("\231\129\175\229\161\148", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 36.46199035644531, - 246.55001831054688, 205.77120971679688)
end)
v1337:Button("\233\173\133\230\131\145\231\165\173\229\157\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1310.048095703125, - 805.292236328125, - 162.34507751464844)
end)
v1337:Button("\228\184\187\230\157\131\233\155\149\229\131\143", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.098665237426758, 159.01470947265625, - 1039.8543701171875)
end)
v1337:Button("\232\152\145\232\143\135\230\178\188\230\179\189", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2442.805908203125, 130.904052734375, - 686.1648559570312)
end)
v1337:Button("\233\155\170\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2601.7, 135.7, 2413.7)
end)
v1337:Button("\231\137\185\230\139\137\229\185\179\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(152.3716278076172, 154.91015625, 2000.9171142578125)
end)
v1337:Button("\230\161\166\230\160\145\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1757.7, 142.7, - 2518.7)
end)
v1337:Button("\232\162\171\233\129\151\229\188\131\231\154\132\230\181\183\229\178\184", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2487.7, 133.7, 1553.7)
end)
v1337:Button("\229\164\167\231\143\138\231\145\154\231\164\129", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 3524.77587890625, 133.16741943359375, 518.6779174804688)
end)
v1337:Button("\230\148\182\229\137\178\232\128\133\229\176\150\229\136\186", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1352.7, 400.7, 1579.7)
end)
v1337:Button("\232\141\146\229\135\137\230\183\177\230\184\138", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 997.7, - 244.7, - 2718.7)
end)
v1337:Button("\231\155\144\230\176\180\230\177\160", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1793.7, - 142.7, - 3411.7)
end)
v1337:Button("\231\129\171\229\177\177", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1891.7, 167.7, 329.7)
end)
v1337:Button("\233\146\165\229\140\153\233\151\168", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1.7, - 703.7, 1229.7)
end)
v1337:Button("75\228\184\135\233\177\188\231\171\191", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1703.7, - 902.7, 1433.7)
end)
v1337:Button("\230\183\177\229\186\166", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(976.7, - 697.7, 1274.7)
end)
v1337:Button("\229\164\180\230\153\149", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 118.7, - 513.7, 1086.7)
end)
v1337:Button("\230\139\177\233\151\168", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999.7, 131.7, - 1237.7)
end)
v1337:Button("\233\163\142\230\154\180\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.2, 132.7, 1940.7)
end)
v1337:Button("\230\151\182\233\151\180\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1146.7, 134.7, - 1073.7)
end)
v1337:Button("\232\181\183\233\163\142\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2846.7, 178.7, 2702.7)
end)
v1337:Button("\232\181\183\233\155\190\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2793.7, 139.7, - 629.7)
end)
v1337:Button("\230\158\129\229\133\137\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1812.4, - 136.9, - 3282.1)
end)
v1337:Button("\230\151\165\232\154\128\229\155\190\232\133\190", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5964.4, 269.9, 848.1)
end)
v1337:Button("\230\169\153\232\137\178\231\162\142\231\137\135(\233\156\128\232\166\129\229\188\128\230\151\165\232\154\128\229\155\190\232\133\190)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6068.4, 443.9, 685.1)
end)
v1337:Button("\233\157\146\232\137\178\231\159\179\229\164\180", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5969.4, 274.9, 845.1)
end)
v1337:Button("\233\154\144\232\151\143\229\164\180\232\161\148", function()
    local v1338 = vu1194.Name
    game:GetService("ReplicatedStorage").playerstats:FindFirstChild(v1338).Settings.nametag.Value = false
end)
v1337:Toggle("\233\169\177\233\155\190", "\229\188\128\229\133\179", false, function(p1339)
    if p1339 then
        if game:GetService("Lighting"):FindFirstChild("Sky") then
            game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
        end
    elseif game:GetService("Lighting").bloom:FindFirstChild("Sky") then
        game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
    end
end)
v1337:Toggle("\231\153\189\229\164\169", "\229\188\128\229\133\179", false, function(p1340)
    if p1340 then
        DayOnlyLoop = vu1192.Heartbeat:Connect(function()
            game:GetService("Lighting").TimeOfDay = "12:00:00"
        end)
    elseif DayOnlyLoop then
        DayOnlyLoop:Disconnect()
        DayOnlyLoop = nil
    end
end)
local v1341 = v31:Tab("\229\142\139\229\138\155", "7733993211"):section("\232\132\154\230\156\172\229\134\133\229\174\185", true)
v1341:Button("\229\142\139\229\138\1551", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Ej3U4LbA"))()
end)
v1341:Button("\229\142\139\229\138\1552", function()
    loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure"))()
end)
v1341:Toggle("\230\128\170\231\137\169\233\128\154\231\159\165", function(p1342)
    Jump = p1342
    local v1343 = game:GetService("ReplicatedStorage")
    local vu1344 = game:GetService("Players")
    local vu1345 = game:GetService("TweenService")
    local v1346 = v1343:WaitForChild("DeathFolder")
    local v1347, v1348, v1349 = ipairs(v1346:GetChildren())
    local vu1350 = {}
    while true do
        local v1351
        v1349, v1351 = v1347(v1348, v1349)
        if v1349 == nil then
            break
        end
        if v1351:IsA("Folder") then
            table.insert(vu1350, v1351.Name)
        end
    end
    local function vu1359(p1352, p1353)
        local v1354 = p1352:WaitForChild("PlayerGui")
        local vu1355 = Instance.new("ScreenGui")
        vu1355.Name = "MonsterNotification"
        vu1355.Parent = v1354
        local vu1356 = Instance.new("Frame")
        vu1356.Size = UDim2.new(0, 200, 0, 50)
        vu1356.Position = UDim2.new(1, 20, 1, - 70)
        vu1356.BackgroundColor3 = Color3.new(0, 0, 0)
        vu1356.BackgroundTransparency = 0.5
        vu1356.BorderSizePixel = 0
        vu1356.Parent = vu1355
        local v1357 = Instance.new("TextLabel")
        v1357.Size = UDim2.new(1, - 10, 1, - 10)
        v1357.Position = UDim2.new(0, 5, 0, 5)
        v1357.BackgroundTransparency = 1
        v1357.TextColor3 = Color3.new(1, 1, 1)
        v1357.TextScaled = true
        v1357.Font = Enum.Font.GothamBold
        v1357.Text = p1353
        v1357.Parent = vu1356
        vu1345:Create(vu1356, TweenInfo.new(0.5), {
            Position = UDim2.new(1, - 220, 1, - 70)
        }):Play()
        task.delay(2, function()
            local v1358 = vu1345:Create(vu1356, TweenInfo.new(0.5), {
                Position = UDim2.new(1, 20, 1, - 70)
            })
            v1358:Play()
            v1358.Completed:Connect(function()
                vu1355:Destroy()
            end)
        end)
    end
    local function vu1366(p1360)
        local v1361 = vu1344
        local v1362, v1363, v1364 = ipairs(v1361:GetPlayers())
        while true do
            local v1365
            v1364, v1365 = v1362(v1363, v1364)
            if v1364 == nil then
                break
            end
            vu1359(v1365, p1360)
        end
    end
    game.Workspace.ChildAdded:Connect(function(pu1367)
        if table.find(vu1350, pu1367.Name) then
            vu1366(pu1367.Name .. "\230\128\170\231\137\169\229\135\186\231\142\176")
            pu1367.AncestryChanged:Connect(function(_, p1368)
                if not p1368 then
                    vu1366(pu1367.Name .. " \230\182\136\229\164\177")
                end
            end)
        end
    end)
end)
v1341:Button("\232\135\170\229\138\168\228\191\174\231\148\181\231\174\177", function()
    local v1369 = game.Players.LocalPlayer
    local vu1370 = v1369.Character or v1369.CharacterAdded:Wait()
    local function vu1382(p1371)
        local v1372, v1373, v1374 = pairs(workspace.Rooms:GetChildren())
        while true do
            local v1375
            v1374, v1375 = v1372(v1373, v1374)
            if v1374 == nil then
                break
            end
            local v1376 = v1375:FindFirstChild("Interactables")
            if v1376 then
                local v1377, v1378, v1379 = pairs(v1376:GetChildren())
                while true do
                    local vu1380
                    v1379, vu1380 = v1377(v1378, v1379)
                    if v1379 == nil then
                        break
                    end
                    if vu1380.Name == p1371 and (vu1380:FindFirstChild("Fixed") and (vu1380:FindFirstChild("RemoteFunction") and vu1380:FindFirstChild("RemoteEvent"))) then
                        local vu1381 = vu1380.ProxyPart:FindFirstChild("ProximityPrompt")
                        vu1380.RemoteFunction:InvokeServer()
                        spawn(function()
                            while true do
                                if (vu1370.PrimaryPart.Position - vu1380.ProxyPart.Position).Magnitude <= vu1381.MaxActivationDistance and vu1380.Fixed.Value < 100 then
                                    vu1380.RemoteEvent:FireServer(unpack({
                                        true
                                    }))
                                end
                                wait(0)
                            end
                        end)
                    end
                end
            end
        end
    end
    vu1382("Generator")
    vu1382("EncounterGenerator")
    workspace.Rooms.ChildAdded:Connect(function()
        vu1382("Generator")
        vu1382("EncounterGenerator")
    end)
end)
v1341:Button("\229\133\141\231\150\171", function()
    local v1383, v1384, v1385 = pairs(workspace.Rooms:GetChildren())
    while true do
        local v1386
        v1385, v1386 = v1383(v1384, v1385)
        if v1385 == nil then
            break
        end
        v1386.Locker.Folder.Enter:InvokeServer()
    end
end)
v1341:Button("\230\151\160\230\149\140 ", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Pressure-*-Mode-15992"))()
end)
v1341:Button("DX", function()
    loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure"))()
end)
v1341:Button("\229\142\139\229\138\1553", function()
    loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
end)
local v1387 = v31:Tab("\233\128\160\232\136\185\229\175\187\229\174\157", "7733765398"):section("\229\138\159\232\131\189", true)
v1387:Button("\232\135\170\229\138\168\229\136\183\233\135\145\230\157\161", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr", true))()
end)
v1387:Toggle("\232\135\170\229\138\168\229\136\183\233\146\177", "", false, function(p1388)
    getgenv().TreasureAutoFarm = {
        Enabled = p1388,
        Teleport = 2,
        TimeBetweenRuns = 5
    }
    local v1389 = game:GetService("Players")
    local vu1390 = game:GetService("Workspace")
    local vu1391 = game:GetService("Lighting")
    local vu1392 = v1389.LocalPlayer
    local function v1402(p1393)
        local v1394 = vu1392.Character
        local v1395 = vu1390.BoatStages.NormalStages
        for v1396 = 1, 10 do
            local v1397 = v1396
            local v1398 = v1395["CaveStage" .. v1397]:FindFirstChild("DarknessPart")
            if v1398 then
                print("Teleporting to next stage: Stage " .. v1397)
                v1394.HumanoidRootPart.CFrame = v1398.CFrame
                local v1399 = Instance.new("Part", vu1392.Character)
                v1399.Anchored = true
                v1399.Position = vu1392.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
                wait(getgenv().TreasureAutoFarm.Teleport)
                v1399:Destroy()
            end
        end
        print("Teleporting to the end")
        repeat
            wait()
            v1394.HumanoidRootPart.CFrame = v1395.TheEnd.GoldenChest.Trigger.CFrame
        until vu1391.ClockTime ~= 14
        local vu1400 = false
        local vu1401 = nil
        vu1401 = vu1392.CharacterAdded:Connect(function()
            vu1400 = true
            vu1401:Disconnect()
        end)
        repeat
            wait()
        until vu1400
        wait(getgenv().TreasureAutoFarm.TimeBetweenRuns)
        print("Auto Farm: Run " .. p1393 .. " finished")
    end
    local v1403 = 1
    while wait() do
        if getgenv().TreasureAutoFarm.Enabled then
            print("Initialising Auto Farm: Run " .. v1403)
            v1402(v1403)
            v1403 = v1403 + 1
        end
    end
end)
v1387:Toggle("\232\135\170\229\138\168\229\136\183\233\135\145\229\184\129", "text", false, function(p1404)
    _G.FARMs = p1404
    while _G.FARMs do
        wait()
        pcall(function()
            game.Workspace.Gravity = 0
            wait(0.5)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 51.05019, 43.5682182, 702.193481, - 0.999886811, - 0.000135422233, 0.0150433034, 8.65181704e-9, 0.999959469, 0.00900237076, - 0.0150439134, 0.00900135189, - 0.999846339)
            }):Play()
            wait(1)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 50.4467354, 34.108551, 8676.95117, - 0.999937415, - 0.000405743311, 0.0111814411, - 6.1212857e-9, 0.999342263, 0.0362627953, - 0.0111888004, 0.0362605266, - 0.999279737)
            }):Play()
            wait(30)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 54.1517258, - 359.077667, 9497.03418, - 0.99982208, 0.00359633542, - 0.0185163822, - 7.16419102e-9, 0.981655717, 0.190661997, 0.0188623965, 0.190628082, - 0.981481075)
            }):Play()
            wait(5)
            game.Workspace.Gravity = 200
            wait(20)
        end)
    end
end)
v1387:Toggle("\229\191\171\233\128\159\229\136\183\233\135\145\229\184\129", "text", false, function(p1405)
    _G.FARM2s = p1405
    while _G.FARM2s do
        wait()
        pcall(function()
            game.Workspace.Gravity = 0
            wait(0.5)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 51.05019, 43.5682182, 702.193481, - 0.999886811, - 0.000135422233, 0.0150433034, 8.65181704e-9, 0.999959469, 0.00900237076, - 0.0150439134, 0.00900135189, - 0.999846339)
            }):Play()
            wait(1)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 50.4467354, 34.108551, 8676.95117, - 0.999937415, - 0.000405743311, 0.0111814411, - 6.1212857e-9, 0.999342263, 0.0362627953, - 0.0111888004, 0.0362605266, - 0.999279737)
            }):Play()
            wait(5)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(- 51.05019, 43.5682182, 702.193481, - 0.999886811, - 0.000135422233, 0.0150433034, 8.65181704e-9, 0.999959469, 0.00900237076, - 0.0150439134, 0.00900135189, - 0.999846339)
            }):Play()
            wait(5)
            game:GetService("Workspace").ClaimRiverResultsGold:FireServer()
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = - 1000
            wait(0.1)
            game.Workspace.Gravity = 200
            wait(7)
        end)
    end
end)
v1387:Toggle("\232\135\170\229\138\168\231\180\162\232\181\148\233\135\145\229\184\129", "text", false, function(_)
    _G.ClaimGolds = ClaimGold
    while _G.ClaimGolds do
        wait()
        pcall(function()
            game:GetService("Workspace").ClaimRiverResultsGold:FireServer()
        end)
    end
    MainSection:Button("ClearAllBoatParts", function()
        game:GetService("Workspace").ClearAllPlayersBoatParts:FireServer()
    end)
    wait(0.5)
    local v1406 = Instance.new("ScreenGui")
    local v1407 = Instance.new("TextLabel")
    local v1408 = Instance.new("Frame")
    local v1409 = Instance.new("TextLabel")
    local vu1410 = Instance.new("TextLabel")
    v1406.Parent = game.CoreGui
    v1406.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v1407.Parent = v1406
    v1407.Active = true
    v1407.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    v1407.Draggable = true
    v1407.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
    v1407.Size = UDim2.new(0, 370, 0, 52)
    v1407.Font = Enum.Font.SourceSansSemibold
    v1407.Text = "Anti AFK Script"
    v1407.TextColor3 = Color3.new(0, 1, 1)
    v1407.TextSize = 22
    v1408.Parent = v1407
    v1408.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
    v1408.Position = UDim2.new(0, 0, 1.0192306, 0)
    v1408.Size = UDim2.new(0, 370, 0, 107)
    v1409.Parent = v1408
    v1409.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    v1409.Position = UDim2.new(0, 0, 0.800455689, 0)
    v1409.Size = UDim2.new(0, 370, 0, 21)
    v1409.Font = Enum.Font.Arial
    v1409.Text = "made by simon"
    v1409.TextColor3 = Color3.new(0, 1, 1)
    v1409.TextSize = 20
    vu1410.Parent = v1408
    vu1410.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    vu1410.Position = UDim2.new(0, 0, 0.158377, 0)
    vu1410.Size = UDim2.new(0, 370, 0, 44)
    vu1410.Font = Enum.Font.ArialBold
    vu1410.Text = "Status: Active"
    vu1410.TextColor3 = Color3.new(0, 1, 1)
    vu1410.TextSize = 20
    local vu1411 = game:service("VirtualUser")
    game:service("Players").LocalPlayer.Idled:connect(function()
        vu1411:CaptureController()
        vu1411:ClickButton2(Vector2.new())
        vu1410.Text = ""
        wait(2)
        vu1410.Text = ""
    end)
end)
v1387:Button("\229\183\165\229\133\183\229\140\133", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)
local v1412 = v31:Tab("doors", "7733779610")
local v1413 = v1412:section("doors2", true)
v1413:Button("\228\186\186\230\156\186DOORS2", function()
    loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/DF2RW.lua"))()
end)
v1413:Button("ZS\232\132\154\230\156\172\226\128\156\229\141\161\229\175\134nrty\226\128\157", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/ZS%20III", true))()
end)
local v1414 = v1412:section("doors1", true)
v1414:Button("MS\229\183\178\230\177\137\229\140\150", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/MS-Chinese-XXZ/refs/heads/main/rename.txt"))()
end)
v1414:Button("MS\230\156\170\230\177\137\229\140\150", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end)
v1414:Button("\232\135\170\229\138\168\232\161\140\232\181\176", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
end)
v1414:Toggle("\229\136\183\230\150\176\230\151\182\233\128\154\231\159\165", "TZ", false, function(p1415)
    _G.IE = p1415 and true or false
    LatestRoom.Changed:Connect(function()
        if _G.IE == true then
            local v1416 = ChaseStart.Value - LatestRoom.Value
            if 0 < v1416 and v1416 < 4 then
                Notification:Notify("\232\175\183\230\179\168\230\132\143", "\228\186\139\228\187\182\229\143\175\232\131\189\229\136\183\230\150\176\228\186\142" .. tostring(v1416) .. " \230\136\191\233\151\180", "rbxassetid://17360377302", 3)
            end
        end
    end)
    workspace.ChildAdded:Connect(function(p1417)
        if p1417.Name ~= "RushMoving" or _G.IE ~= true then
            if p1417.Name == "AmbushMoving" and _G.IE == true then
                Notify("\232\175\183\230\179\168\230\132\143", "Ambush \229\183\178\229\136\183\230\150\176", "rbxassetid://17360377302", 3)
            end
        else
            Notify("\232\175\183\230\179\168\230\132\143", "Rush \229\183\178\229\136\183\230\150\176", "rbxassetid://17360377302", 3)
        end
    end)
end)
v1414:Toggle("\232\135\170\229\138\168\232\186\178\233\129\191Rush/Ambush", "ADB", false, function(p1418)
    _G.Avoid = p1418 and true or false
    workspace.ChildAdded:Connect(function(p1419)
        if p1419.Name ~= "RushMoving" or _G.Avoid ~= true then
            if p1419.Name == "AmbushMoving" and _G.Avoid == true then
                Notify("\230\179\168\230\132\143!", "\230\173\163\229\156\168\232\186\178\233\129\191 Ambush.", "rbxassetid://17360377302", 3)
                local vu1420 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local v1421 = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(vu1420 + Vector3.new(0, 20, 0))
                end)
                p1419.Destroying:Wait()
                v1421:Disconnect()
                game.Players.LocalPlayer.Character:MoveTo(vu1420)
            end
        else
            Notify("\232\175\183\230\179\168\230\132\143!", "\230\173\163\229\156\168\232\186\178\233\129\191 Rush.", "rbxassetid://17360377302", 3)
            local vu1422 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local v1423 = game:GetService("RunService").Heartbeat:Connect(function()
                game.Players.LocalPlayer.Character:MoveTo(vu1422 + Vector3.new(0, 20, 0))
            end)
            p1419.Destroying:Wait()
            v1423:Disconnect()
            game.Players.LocalPlayer.Character:MoveTo(vu1422)
        end
    end)
end)
v1414:Toggle("\230\151\160 Screech", "NCH", false, function(p1424)
    _G.NS = p1424 and true or false
    workspace.CurrentCamera.ChildAdded:Connect(function(p1425)
        if p1425.Name == "Screech" and _G.NS == true then
            p1425:Destroy()
        end
    end)
end)
v1414:Toggle("\233\128\143\232\167\134\233\146\165\229\140\153", "GTQR15", false, function(p1426)
    if p1426 then
        _G.GTQR15ESPInstances = {}
        local function vu1433(p1427, p1428, p1429)
            local vu1430 = Instance.new("BillboardGui", game.CoreGui)
            vu1430.AlwaysOnTop = true
            vu1430.Size = UDim2.new(0, 100, 0, 50)
            vu1430.Adornee = p1427
            vu1430.MaxDistance = 2000
            local v1431 = Instance.new("Frame", vu1430)
            v1431.AnchorPoint = Vector2.new(0.5, 0.5)
            v1431.BackgroundColor3 = p1429
            v1431.Size = UDim2.new(0, 8, 0, 8)
            v1431.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v1431).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v1431)
            local v1432 = Instance.new("TextLabel", vu1430)
            v1432.AnchorPoint = Vector2.new(0.5, 0.5)
            v1432.BackgroundTransparency = 1
            v1432.TextColor3 = p1429
            v1432.Size = UDim2.new(1, 0, 0, 20)
            v1432.Position = UDim2.new(0.5, 0, 0.7, 0)
            v1432.Text = p1428
            Instance.new("UIStroke", v1432)
            task.spawn(function()
                while vu1430 do
                    if vu1430.Adornee == nil or not vu1430.Adornee:IsDescendantOf(workspace) then
                        vu1430.Enabled = false
                        vu1430.Adornee = nil
                        vu1430:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v1434, v1435, v1436 = pairs(workspace:GetDescendants())
            while true do
                local v1437
                v1436, v1437 = v1434(v1435, v1436)
                if v1436 == nil then
                    break
                end
                if v1437:IsA("Model") and v1437.Name == "KeyObtain" then
                    vu1433(v1437, "\233\146\165\229\140\153", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p1438)
                if p1438:IsA("Model") and p1438.Name == "KeyObtain" then
                    vu1433(p1438, "\233\146\165\229\140\153", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v1439, v1440, v1441 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v1442
            v1441, v1442 = v1439(v1440, v1441)
            if v1441 == nil then
                break
            end
            local v1443, v1444, v1445 = pairs(v1442.doors)
            while true do
                local v1446
                v1445, v1446 = v1443(v1444, v1445)
                if v1445 == nil then
                    break
                end
                v1446.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
v1414:Toggle("\233\151\168\233\128\143\232\167\134", "GTQR15", false, function(p1447)
    if p1447 then
        _G.GTQR15ESPInstances = {}
        local function vu1454(p1448, p1449, p1450)
            local vu1451 = Instance.new("BillboardGui", game.CoreGui)
            vu1451.AlwaysOnTop = true
            vu1451.Size = UDim2.new(0, 100, 0, 50)
            vu1451.Adornee = p1448
            vu1451.MaxDistance = 2000
            local v1452 = Instance.new("Frame", vu1451)
            v1452.AnchorPoint = Vector2.new(0.5, 0.5)
            v1452.BackgroundColor3 = p1450
            v1452.Size = UDim2.new(0, 8, 0, 8)
            v1452.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v1452).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v1452)
            local v1453 = Instance.new("TextLabel", vu1451)
            v1453.AnchorPoint = Vector2.new(0.5, 0.5)
            v1453.BackgroundTransparency = 1
            v1453.TextColor3 = p1450
            v1453.Size = UDim2.new(1, 0, 0, 20)
            v1453.Position = UDim2.new(0.5, 0, 0.7, 0)
            v1453.Text = p1449
            Instance.new("UIStroke", v1453)
            task.spawn(function()
                while vu1451 do
                    if vu1451.Adornee == nil or not vu1451.Adornee:IsDescendantOf(workspace) then
                        vu1451.Enabled = false
                        vu1451.Adornee = nil
                        vu1451:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v1455, v1456, v1457 = pairs(workspace:GetDescendants())
            while true do
                local v1458
                v1457, v1458 = v1455(v1456, v1457)
                if v1457 == nil then
                    break
                end
                if v1458:IsA("Model") and v1458.Name == "Door" then
                    vu1454(v1458, "\233\151\168", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p1459)
                if p1459:IsA("Model") and p1459.Name == "Door" then
                    vu1454(p1459, "\233\151\168", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v1460, v1461, v1462 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v1463
            v1462, v1463 = v1460(v1461, v1462)
            if v1462 == nil then
                break
            end
            local v1464, v1465, v1466 = pairs(v1463.doors)
            while true do
                local v1467
                v1466, v1467 = v1464(v1465, v1466)
                if v1466 == nil then
                    break
                end
                v1467.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
v1414:Toggle("\233\135\145\229\184\129\233\128\143\232\167\134", "GTQR15", false, function(p1468)
    if p1468 then
        _G.GTQR15ESPInstances = {}
        local function vu1475(p1469, p1470, p1471)
            local vu1472 = Instance.new("BillboardGui", game.CoreGui)
            vu1472.AlwaysOnTop = true
            vu1472.Size = UDim2.new(0, 100, 0, 50)
            vu1472.Adornee = p1469
            vu1472.MaxDistance = 2000
            local v1473 = Instance.new("Frame", vu1472)
            v1473.AnchorPoint = Vector2.new(0.5, 0.5)
            v1473.BackgroundColor3 = p1471
            v1473.Size = UDim2.new(0, 8, 0, 8)
            v1473.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v1473).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v1473)
            local v1474 = Instance.new("TextLabel", vu1472)
            v1474.AnchorPoint = Vector2.new(0.5, 0.5)
            v1474.BackgroundTransparency = 1
            v1474.TextColor3 = p1471
            v1474.Size = UDim2.new(1, 0, 0, 20)
            v1474.Position = UDim2.new(0.5, 0, 0.7, 0)
            v1474.Text = p1470
            Instance.new("UIStroke", v1474)
            task.spawn(function()
                while vu1472 do
                    if vu1472.Adornee == nil or not vu1472.Adornee:IsDescendantOf(workspace) then
                        vu1472.Enabled = false
                        vu1472.Adornee = nil
                        vu1472:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v1476, v1477, v1478 = pairs(workspace:GetDescendants())
            while true do
                local v1479
                v1478, v1479 = v1476(v1477, v1478)
                if v1478 == nil then
                    break
                end
                if v1479:IsA("Model") and v1479.Name == "GoldPile" then
                    vu1475(v1479, "\233\135\145\229\184\129", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p1480)
                if p1480:IsA("Model") and p1480.Name == "GoldPile" then
                    vu1475(p1480, "\233\135\145\229\184\129", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v1481, v1482, v1483 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v1484
            v1483, v1484 = v1481(v1482, v1483)
            if v1483 == nil then
                break
            end
            local v1485, v1486, v1487 = pairs(v1484.doors)
            while true do
                local v1488
                v1487, v1488 = v1485(v1486, v1487)
                if v1487 == nil then
                    break
                end
                v1488.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
v1414:Toggle("\230\159\156\229\173\144\233\128\143\232\167\134", "GTQR15", false, function(p1489)
    if p1489 then
        _G.GTQR15ESPInstances = {}
        local function vu1496(p1490, p1491, p1492)
            local vu1493 = Instance.new("BillboardGui", game.CoreGui)
            vu1493.AlwaysOnTop = true
            vu1493.Size = UDim2.new(0, 100, 0, 50)
            vu1493.Adornee = p1490
            vu1493.MaxDistance = 2000
            local v1494 = Instance.new("Frame", vu1493)
            v1494.AnchorPoint = Vector2.new(0.5, 0.5)
            v1494.BackgroundColor3 = p1492
            v1494.Size = UDim2.new(0, 8, 0, 8)
            v1494.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v1494).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v1494)
            local v1495 = Instance.new("TextLabel", vu1493)
            v1495.AnchorPoint = Vector2.new(0.5, 0.5)
            v1495.BackgroundTransparency = 1
            v1495.TextColor3 = p1492
            v1495.Size = UDim2.new(1, 0, 0, 20)
            v1495.Position = UDim2.new(0.5, 0, 0.7, 0)
            v1495.Text = p1491
            Instance.new("UIStroke", v1495)
            task.spawn(function()
                while vu1493 do
                    if vu1493.Adornee == nil or not vu1493.Adornee:IsDescendantOf(workspace) then
                        vu1493.Enabled = false
                        vu1493.Adornee = nil
                        vu1493:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v1497, v1498, v1499 = pairs(workspace:GetDescendants())
            while true do
                local v1500
                v1499, v1500 = v1497(v1498, v1499)
                if v1499 == nil then
                    break
                end
                if v1500:IsA("Model") and v1500.Name == "Model" then
                    vu1496(v1500, "\230\159\156\229\173\144", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p1501)
                if p1501:IsA("Model") and p1501.Name == "Model" then
                    vu1496(p1501, "\230\159\156\229\173\144", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v1502, v1503, v1504 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v1505
            v1504, v1505 = v1502(v1503, v1504)
            if v1504 == nil then
                break
            end
            local v1506, v1507, v1508 = pairs(v1505.doors)
            while true do
                local v1509
                v1508, v1509 = v1506(v1507, v1508)
                if v1508 == nil then
                    break
                end
                v1509.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
v1414:Button("\229\176\143\228\186\145\230\177\137\229\140\150", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()
end)
v1414:Button("\229\137\170\229\136\128", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
end)
v1414:Button("\229\141\129\229\173\151\230\158\182", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)
v1414:Button("\229\164\156\232\167\134\228\187\170", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
end)
v1414:Button("\231\165\158\229\156\163\231\130\184\229\188\185", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)
v1414:Button("\229\144\184\233\147\129\231\159\179", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)
v1414:Button("\229\136\183\230\128\170\229\143\152\230\128\170", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
end)
v1414:Button("\229\143\152\232\186\171", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()
end)
local v1510 = v31:Tab("\228\184\128\230\172\161\229\176\152\229\156\159\233\163\158\230\137\172\231\154\132\230\151\133\232\161\140", "7733674153")
local v1511 = v1510:section("\229\136\176\232\190\19020000\232\191\135\231\168\139", true)
v1511:Button("\229\176\152\229\156\159\233\163\158\230\137\172\231\154\132\230\151\133\232\161\1401", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip"))()
end)
v1511:Button("\232\135\170\229\138\168\229\136\176\232\190\19020000", function()
    local v1512 = game:GetService("Players").LocalPlayer
    local vu1513 = (v1512.Character or v1512.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local vu1514 = {
        CFrame.new(- 20.408166885375977, - 11.34829044342041, 1809.8782958984375),
        CFrame.new(257.45782470703125, 58.954708099365234, - 4186.28955078125),
        CFrame.new(515.4042358398438, 72.82687377929688, - 10186.2861328125),
        CFrame.new(123.37289428710938, - 66.69212341308594, - 16188.0537109375),
        CFrame.new(232.33438110351562, 147.98423767089844, - 22189.32421875),
        CFrame.new(713.6531982421875, 102.16617584228516, - 28190.58984375),
        CFrame.new(910.4205322265625, - 137.20584106445312, - 34189.23046875),
        CFrame.new(1141.0308837890625, 148.53587341308594, - 40185.35546875),
        CFrame.new(1357.2171630859375, 87.61758422851562, - 46190.3125),
        CFrame.new(1606.8338623046875, - 174.83712768554688, - 52188.765625),
        CFrame.new(1503.0009765625, 210.8280792236328, - 82185.9140625),
        CFrame.new(734.9932861328125, - 117.6973876953125, - 112190.21875)
    }
    local vu1515 = 0.5;
    (function()
        local v1516, v1517, v1518 = ipairs(vu1514)
        while true do
            local v1519
            v1518, v1519 = v1516(v1517, v1518)
            if v1518 == nil then
                break
            end
            vu1513.CFrame = v1519
            print("\230\173\163\229\156\168\232\191\155\232\161\140\228\189\160\231\154\132\230\140\135\228\187\164" .. tostring(v1519))
            wait(vu1515)
        end
        print("\229\183\178\231\187\143\229\136\176\232\190\190\230\140\135\228\187\164\229\176\189\229\164\180")
    end)()
end)
local v1520 = v1510:section("\228\188\160\233\128\129", true)
v1520:Button("\232\183\157\231\166\1871000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 20.408166885375977, - 11.34829044342041, 1809.8782958984375)
end)
v1520:Button("\232\183\157\231\166\1872000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.45782470703125, 58.954708099365234, - 4186.28955078125)
end)
v1520:Button("\232\183\157\231\166\1873000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(515.4042358398438, 72.82687377929688, - 10186.2861328125)
end)
v1520:Button("\232\183\157\231\166\1874000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123.37289428710938, - 66.69212341308594, - 16188.0537109375)
end)
v1520:Button("\232\183\157\231\166\1875000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232.33438110351562, 147.98423767089844, - 22189.32421875)
end)
v1520:Button("\232\183\157\231\166\1876000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(713.6531982421875, 102.16617584228516, - 28190.58984375)
end)
v1520:Button("\232\183\157\231\166\1877000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910.4205322265625, - 137.20584106445312, - 34189.23046875)
end)
v1520:Button("\232\183\157\231\166\1878000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.0308837890625, 148.53587341308594, - 40185.35546875)
end)
v1520:Button("\232\183\157\231\166\1879000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1357.2171630859375, 87.61758422851562, - 46190.3125)
end)
v1520:Button("\232\183\157\231\166\18710000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1606.8338623046875, - 174.83712768554688, - 52188.765625)
end)
v1520:Button("\232\183\157\231\166\18715000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1503.0009765625, 210.8280792236328, - 82185.9140625)
end)
v1520:Button("\232\183\157\231\166\18720000", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(734.9932861328125, - 117.6973876953125, - 112190.21875)
end)
local v1521 = v31:Tab("\229\191\141\232\128\133\228\188\160\229\165\135", "7733798747")
local v1522 = v1521:section("\229\138\159\232\131\189", true)
autoswing = false
function swinging()
    spawn(function()
        while autoswing == true do
            task.wait()
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
            if not autoswing then
                break
            end
        end
    end)
end
autosell = false
function selling()
    spawn(function()
        while autosell == true do
            task.wait(0.01)
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                game.workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                wait(0.1)
                game.workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
                if not autosell then
                    break
                end
            end
        end
    end)
end
autosellmax = false
function maxsell()
    spawn(function()
        while autosellmax == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and game.Players.LocalPlayer.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                game.workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                task.wait()
                game.workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
            end
            if not autosellmax then
                break
            end
        end
    end)
end
autobuyswords = false
function buyswords()
    spawn(function()
        while autobuyswords == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                local v1523 = {
                    "Ground",
                    "Astral Island",
                    "Space Island",
                    "Tundra Island",
                    "Eternal Island",
                    "Sandstorm",
                    "Thunderstorm",
                    "Ancient Inferno Island",
                    "Midnight Shadow Island",
                    "Mythical Souls Island",
                    "Winter Wonder Island"
                }
                local v1524 = "buyAllSwords"
                for v1525 = 1, # v1523 do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1524, v1523[v1525])
                end
            end
            if not autobuyswords then
                break
            end
        end
    end)
end
autobuybelts = false
function buybelts()
    spawn(function()
        while autobuybelts == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                local v1526 = {
                    "Ground",
                    "Astral Island",
                    "Space Island",
                    "Tundra Island",
                    "Eternal Island",
                    "Sandstorm",
                    "Thunderstorm",
                    "Ancient Inferno Island",
                    "Midnight Shadow Island",
                    "Mythical Souls Island",
                    "Winter Wonder Island"
                }
                local v1527 = "buyAllBelts"
                for v1528 = 1, # v1526 do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1527, v1526[v1528])
                end
            end
            if not autobuybelts then
                break
            end
        end
    end)
end
autobuyranks = false
function buyranks()
    spawn(function()
        while autobuyranks == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                local v1529 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
                local v1530 = "buyRank"
                for v1531 = 1, # v1529 do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1530, v1529[v1531].Name)
                end
            end
            if not autobuyranks then
                break
            end
        end
    end)
end
autobuyskill = false
function buyskill()
    spawn(function()
        while autobuyskill == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                local v1532 = {
                    "Ground",
                    "Astral Island",
                    "Space Island",
                    "Tundra Island",
                    "Eternal Island",
                    "Sandstorm",
                    "Thunderstorm",
                    "Ancient Inferno Island",
                    "Midnight Shadow Island",
                    "Mythical Souls Island",
                    "Winter Wonder Island"
                }
                local v1533 = "buyAllSkills"
                for v1534 = 1, # v1532 do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1533, v1532[v1534])
                end
            end
            if not autobuyskill then
                break
            end
        end
    end)
end
autobuyshurikens = false
function buyshurikens()
    spawn(function()
        while autobuyshurikens == true do
            task.wait()
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                local v1535 = {
                    "Ground",
                    "Astral Island",
                    "Space Island",
                    "Tundra Island",
                    "Eternal Island",
                    "Sandstorm",
                    "Thunderstorm",
                    "Ancient Inferno Island",
                    "Midnight Shadow Island",
                    "Mythical Souls Island",
                    "Winter Wonder Island"
                }
                local v1536 = "buyAllShurikens"
                for v1537 = 1, # v1535 do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1536, v1535[v1537])
                end
            end
            if not autobuyshurikens then
                break
            end
        end
    end)
end
v1522:Toggle("\232\135\170\229\138\168\230\140\165\232\136\158", "", false, function(p1538)
    if not p1538 and p1538 then
        return
    end
    getgenv().autoswing = p1538
    while true do
        if not getgenv().autoswing then
            return
        end
        local v1539, v1540, v1541 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
        local v1542
        v1541, v1542 = v1539(v1540, v1541)
        if v1541 ~= nil then
            if v1542:FindFirstChild("ninjitsuGain") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1542)
                break
            end
        end
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
        wait()
    end
end)
v1522:Toggle("\232\135\170\229\138\168\229\148\174\229\141\150", "ATSELL", false, function(p1543)
    getgenv().autosell = p1543
    while getgenv().autosell do
        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = CFrame.new(0, 0, 0)
        wait(0.1)
    end
end)
v1522:Toggle("\232\180\173\228\185\176\230\142\146\229\144\141", "ATBP", false, function(p1544)
    getgenv().autobuyranks = p1544
    while getgenv().autobuyranks do
        local v1545 = "buyRank"
        for v1546 = 1, # ranks do
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(v1545, ranks[v1546])
        end
        wait(0.1)
    end
end)
v1522:Toggle("\232\180\173\228\185\176\232\133\176\229\184\166", "ATBYD", false, function(p1547)
    getgenv().autobuybelts = p1547
    while getgenv().autobuybelts do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllBelts", "Inner Peace Island")
        wait(0.5)
    end
end)
v1522:Toggle("\232\180\173\228\185\176\230\138\128\232\131\189", "ATB", false, function(p1548)
    getgenv().autobuyskills = p1548
    while getgenv().autobuyskills do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllSkills", "Inner Peace Island")
        wait(0.5)
    end
end)
v1522:Toggle("\232\135\170\229\138\168\232\180\173\228\185\176\229\137\145", "ATBS", false, function(p1549)
    getgenv().autobuy = p1549
    while getgenv().autobuy do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllSwords", "Inner Peace Island")
        wait(0.5)
    end
end)
v1522:Button("\232\167\163\233\148\129\230\137\128\230\156\137\229\178\155", function()
    local v1550 = next
    local v1551, v1552 = game.workspace.islandUnlockParts:GetChildren()
    while true do
        local v1553
        v1552, v1553 = v1550(v1551, v1552)
        if v1552 == nil then
            break
        end
        if v1553 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1553.islandSignPart.CFrame
            wait(0.5)
        end
    end
end)
v1522:Button("\232\167\163\233\148\129\230\137\128\230\156\137\233\128\154\232\161\140\232\175\129", function()
    game:GetService("ReplicatedStorage").gamepassIds["+2 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+3 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+4 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+100 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+200 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+20 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["+60 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["Infinite Ammo"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["Infinite Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["Permanent Islands Unlock"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x2 Coins"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x2 Damage"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x2 Health"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x2 Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x2 Speed"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["Faster Sword"].Parent = game.Players.LocalPlayer.ownedGamepasses
    game:GetService("ReplicatedStorage").gamepassIds["x3 Pet Clones"].Parent = game.Players.LocalPlayer.ownedGamepasses
end)
local v1554 = v1521:section("\228\188\160\233\128\129\229\138\159\232\131\189", true)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\135\186\231\148\159\231\130\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\233\153\132\233\173\148\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, - 138.44842529296875)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\231\165\158\231\167\152\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\164\170\231\169\186\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\134\187\229\156\159\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\230\176\184\230\129\146\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\230\178\153\230\154\180\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\233\155\183\230\154\180\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\232\191\156\229\143\164\231\130\188\231\139\177\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\141\136\229\164\156\230\154\151\229\189\177\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\231\165\158\231\167\152\231\129\181\233\173\130\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\134\172\229\173\163\229\165\135\232\191\185\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\233\187\132\233\135\145\229\164\167\229\184\136\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\233\190\153\228\188\160\229\165\135\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\232\181\155\229\141\154\228\188\160\229\165\135\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\164\169\229\178\154\232\182\133\232\131\189\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\230\183\183\230\178\140\228\188\160\229\165\135\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\231\129\181\233\173\130\232\158\141\229\144\136\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\233\187\145\230\154\151\229\133\131\231\180\160\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\229\134\133\229\191\131\229\146\140\229\185\179\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\231\130\189\231\131\136\230\188\169\230\182\161\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
end)
v1554:Button("\228\188\160\233\128\129\229\136\17635\229\128\141\233\135\145\229\184\129\229\140\186\229\159\159", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
end)
v1554:Button("\228\188\160\233\128\129\229\136\176\230\173\187\228\186\161\229\174\160\231\137\169", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
end)
local v1555 = v31:Tab("\228\184\190\233\135\141\230\168\161\230\139\159\229\153\168", "7733674153"):section("\228\184\187\232\166\129\229\138\159\232\131\189", true)
v1555:Toggle("\232\135\170\229\138\168\228\184\190\233\135\141", "text", false, function(_)
    toggle = Value
    while toggle do
        wait()
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
            "GainMuscle"
        })
    end
end)
v1555:Toggle("\232\135\170\229\138\168\229\141\150", "text", false, function(_)
    tog = Value
    while tog do
        wait()
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
            "SellMuscle"
        })
    end
end)
v1555:Button("\230\137\147\229\188\128\229\149\134\229\186\151", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main_Gui.UpgradeMenu_Frame.Visible = true
end)
local v1556 = v31:Tab("\233\146\147\233\177\188\230\168\161\230\139\159\229\153\168", "7733674153"):section("\228\184\187\232\166\129\229\138\159\232\131\189", true)
v1556:Toggle("\232\183\179\232\183\131", "text", false, function(_)
    shared.toggle = State
    if shared.toggle then
        fuckMonster = vu1192.Stepped:Connect(function()
            local v1557, v1558, v1559 = pairs(game.Workspace:GetChildren())
            while true do
                local v1560
                v1559, v1560 = v1557(v1558, v1559)
                if v1559 == nil then
                    break
                end
                if v1560:FindFirstChild("Health") and v1560:FindFirstChild("IsSeaMonster") then
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        local v1561, v1562, v1563 = pairs(vu3.Character:GetChildren())
                        while true do
                            local v1564
                            v1563, v1564 = v1561(v1562, v1563)
                            if v1563 == nil then
                                break
                            end
                            if v1564:IsA("Tool") and v1564:FindFirstChild("GripC1") then
                                plrTools = v1564.Name
                            end
                        end
                        teleport(v1560.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                        wait(1)
                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v1560.Name], tostring(plrTools), true)
                        break
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        EquipTool()
                        break
                    end
                end
            end
        end)
    else
        fuckMonster:Disconnect()
        teleport(CFrame.new(1.8703980445862, 53.57190322876, - 188.37982177734))
    end
end)
v1556:Toggle("\232\135\170\229\138\168\230\157\128\233\178\168\233\177\188", "text", false, function(p1565)
    shared.toggle = p1565
    if shared.toggle then
        fuckMonster = vu1192.Stepped:Connect(function()
            local v1566, v1567, v1568 = pairs(game.Workspace:GetChildren())
            while true do
                local v1569
                v1568, v1569 = v1566(v1567, v1568)
                if v1568 == nil then
                    break
                end
                if v1569:FindFirstChild("Health") and v1569:FindFirstChild("IsSeaMonster") then
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        local v1570, v1571, v1572 = pairs(vu3.Character:GetChildren())
                        while true do
                            local v1573
                            v1572, v1573 = v1570(v1571, v1572)
                            if v1572 == nil then
                                break
                            end
                            if v1573:IsA("Tool") and v1573:FindFirstChild("GripC1") then
                                plrTools = v1573.Name
                            end
                        end
                        teleport(v1569.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                        wait(1)
                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v1569.Name], tostring(plrTools), true)
                        break
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        EquipTool()
                        break
                    end
                end
            end
        end)
    else
        fuckMonster:Disconnect()
        teleport(CFrame.new(1.8703980445862, 53.57190322876, - 188.37982177734))
    end
end)
v1556:Toggle("\232\135\170\229\138\168\233\146\147\233\177\188", "text", false, function(p1574)
    if p1574 then
        local vu1575 = false
        while not vu1575 do
            local v1576, v1577, v1578 = pairs(game.Players.LocalPlayer.Character:GetChildren())
            while true do
                local v1579
                v1578, v1579 = v1576(v1577, v1578)
                if v1578 == nil then
                    break
                end
                if v1579:FindFirstChild("FishingRodScript") then
                    vu1575 = v1579.Name
                    break
                end
            end
            wait()
        end
        bBobber = game.Players.LocalPlayer.Character:WaitForChild(vu1575).Bobbers.Bobber.Fish.Changed:Connect(function(p1580)
            if p1580 ~= nil then
                game.Workspace:WaitForChild(tostring(p1580))
                wait()
                game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                wait()
                game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                wait()
            end
            if game.Players.LocalPlayer.Character:WaitForChild(vu1575).Bobbers.Bobber:FindFirstChild("FishWeld") then
                local v1581, v1582, v1583 = pairs(game.Players.LocalPlayer.Character:WaitForChild(vu1575).Bobbers.Bobber:GetChildren())
                while true do
                    local v1584
                    v1583, v1584 = v1581(v1582, v1583)
                    if v1583 == nil then
                        break
                    end
                    if v1584.Name == "FishWeld" then
                        v1584:Destroy()
                    end
                end
            end
        end)
    else
        bBobber:Disconnect()
    end
end)
v1556:Toggle("\232\135\170\229\138\168\230\157\128boss", "text", false, function(p1585)
    shared.toggle = p1585
    if shared.toggle then
        fuckMobby = vu1192.Stepped:Connect(function()
            local v1586, v1587, v1588 = pairs(game.Workspace:GetChildren())
            while true do
                local v1589
                v1588, v1589 = v1586(v1587, v1588)
                if v1588 == nil then
                    break
                end
                if v1589:FindFirstChild("Health") and (v1589:FindFirstChild("IsSeaMonster") and v1589.Name == "MobbyWood") then
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        local v1590, v1591, v1592 = pairs(vu3.Character:GetChildren())
                        while true do
                            local v1593
                            v1592, v1593 = v1590(v1591, v1592)
                            if v1592 == nil then
                                break
                            end
                            if v1593:IsA("Tool") and v1593:FindFirstChild("GripC1") then
                                plrTools = v1593.Name
                            end
                        end
                        teleport(v1589.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                        wait(1)
                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v1589.Name], tostring(plrTools), true)
                        break
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        EquipTool()
                        break
                    end
                end
            end
        end)
    else
        fuckMobby:Disconnect()
        teleport(CFrame.new(1.8703980445862, 53.57190322876, - 188.37982177734))
    end
end)
v1556:Toggle("\229\135\143\229\176\145\229\187\182\232\191\159", "text", false, function(p1594)
    toggle = p1594
    if toggle then
        while toggle do
            wait(30)
            local v1595, v1596, v1597 = pairs(game.Workspace.DroppedItems:GetChildren())
            while true do
                local v1598
                v1597, v1598 = v1595(v1596, v1597)
                if v1597 == nil then
                    break
                end
                if v1598:IsA("Model") then
                    v1598:Destroy()
                end
            end
        end
    end
end)
v1556:Toggle("\232\135\170\229\138\168\233\148\129\229\174\154\231\168\128\230\156\137\231\137\169\229\147\129", "text", false, function(p1599)
    toggle = p1599
    if toggle then
        while toggle do
            wait(0.1)
            local v1600, v1601, v1602 = pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren())
            while true do
                local v1603
                v1602, v1603 = v1600(v1601, v1602)
                if v1602 == nil then
                    break
                end
                if string.match(v1603.Name, "key") then
                    local v1604, v1605, v1606 = pairs(v1603:GetDescendants())
                    while true do
                        local v1607
                        v1606, v1607 = v1604(v1605, v1606)
                        if v1606 == nil then
                            break
                        end
                        if v1607:IsA("Tool") and (v1607.RarityLevel.Value >= 5 and v1603.DraggableComponent.Contents.LockIcon.Visible == false) then
                            print(v1603.Name, v1607.Name, v1607.RarityLevel.Value)
                            local v1608 = {
                                "Tools",
                                v1603.Name,
                                true
                            }
                            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(v1608))
                        end
                    end
                end
            end
        end
    end
end)
v1556:Toggle("\232\135\170\229\138\168\230\138\147\230\141\149", "text", false, function(p1609)
    toggle = p1609
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end
end)
v1556:Toggle("\232\135\170\229\138\168\229\148\174\229\141\150", "text", false, function(p1610)
    toggle = p1610
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end)
v1556:Toggle("\230\175\143\230\151\165\229\174\157\231\174\177", "text", false, function(p1611)
    toggle = p1611
    while toggle do
        local v1612, v1613, v1614 = pairs(game.Workspace.Islands:GetDescendants())
        while true do
            local v1615
            v1614, v1615 = v1612(v1613, v1614)
            if v1614 == nil then
                break
            end
            if v1615:IsA("Model") and string.match(v1615.Name, "Chest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1615.HumanoidRootPart.CFrame
                wait(1)
                fireproximityprompt(v1615.HumanoidRootPart.ProximityPrompt)
            end
        end
    end
end)
v1556:Toggle("\233\154\143\230\156\186\229\174\157\231\174\177", "text", false, function(p1616)
    toggle = p1616
    while toggle do
        local v1617, v1618, v1619 = pairs(game.Workspace.RandomChests:GetDescendants())
        while true do
            local v1620
            v1619, v1620 = v1617(v1618, v1619)
            if v1619 == nil then
                break
            end
            if v1620:IsA("Model") and string.match(v1620.Name, "Chest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1620.HumanoidRootPart.CFrame
                wait(1)
                fireproximityprompt(v1620.HumanoidRootPart.ProximityPrompt)
            end
        end
    end
end)
if not game.workspace:FindFirstChild("PFA") then
    local v1621 = Instance.new("Part")
    v1621.Name = "PFA"
    v1621.Parent = game.workspace
    v1621.CFrame = CFrame.new(- 1087, - 40, 1670)
    v1621.Size = Vector3.new(50, 0, 50)
    v1621.Anchored = true
    v1621.Reflectance = 1
end
function C()
    spawn(function()
        while getgenv().C do
            local v1622, v1623, v1624 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
            while true do
                local v1625
                v1624, v1625 = v1622(v1623, v1624)
                if v1624 == nil then
                    break
                end
                TPCFrame(CFrame.new(- 1087, - 35, 1670))
                if v1625.ToolTip == "Weight" then
                    v1625.Parent = game.Players.LocalPlayer.Character
                end
                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                end
            end
            wait()
        end
    end)
end
function U()
    spawn(function()
        while getgenv().U do
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Damage_Multiplier"
                }
            }))
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Health_Multiplier"
                }
            }))
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Jump_Power"
                }
            }))
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Walk_Speed"
                }
            }))
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Pet_Space"
                }
            }))
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Upgrades_Upgrade",
                {
                    "Pet_Inventory"
                }
            }))
            wait()
        end
    end)
end
function R()
    spawn(function()
        while getgenv().R do
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack({
                "S_Controller_Rebirth_Rebirth",
                {}
            }))
            wait()
        end
    end)
end
function H(pu1626)
    spawn(function()
        while getgenv().H do
            local v1627 = {
                "S_Controller_Eggs_Buy",
                {
                    pu1626
                }
            }
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteFunction:InvokeServer(unpack(v1627))
            wait()
        end
    end)
end
local v1628 = v31:Tab("\230\132\159\230\159\147\230\128\167\229\190\174\231\172\145", "7733955969"):section("\229\138\159\232\131\189", true)
v1628:Button("\233\152\178\230\173\162\229\190\174\231\172\145\230\132\159\230\159\147", function()
    local v1629, v1630, v1631 = pairs(game.workspace:GetDescendants())
    while true do
        local v1632
        v1631, v1632 = v1629(v1630, v1631)
        if v1631 == nil then
            break
        end
        if string.find(v1632.Name, "Infector") then
            v1632:Destroy()
        end
    end
end)
v1628:Button("\229\143\150\230\182\136\233\151\168", function()
    local v1633, v1634, v1635 = pairs(game.workspace:GetDescendants())
    while true do
        local v1636
        v1635, v1636 = v1633(v1634, v1635)
        if v1635 == nil then
            break
        end
        if string.find(v1636.Name, "AntiSmiler") then
            v1636:Destroy()
        end
    end
end)
v1628:Button("\229\188\128\229\144\175\229\143\141\229\164\150\230\140\130", function()
    workspace.Map.AntiHack:Destroy()
    game.Players.LocalPlayer.Character.AntiFly:Destroy()
end)
v1628:Toggle("\233\128\159\229\186\166-\229\190\174\231\172\145\230\132\159\230\159\147", "text", false, function(_)
    getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
    getgenv().NoSlowDown = Value
    if getgenv().NoSlowDown then
        SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
            end)
        end)
    else
        if SteppedConnection then
            SteppedConnection:Disconnect()
            SteppedConnection = nil
        end
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)
v1628:Toggle("\230\137\147\229\135\187\229\190\174\231\172\145\230\132\159\230\159\147", "text", false, function(_)
    getgenv().InfectAura = Value
    if getgenv().InfectAura then
        getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
            end)
        end)
    elseif getgenv().InfectAuraConnection then
        getgenv().InfectAuraConnection:Disconnect()
        getgenv().InfectAuraConnection = nil
    end
end)
v1628:Toggle("\230\137\147\229\135\187", "text", false, function(p1637)
    getgenv().HitAura = p1637
    if getgenv().HitAura then
        getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                local v1638 = game:GetService("Players").LocalPlayer.Character
                if v1638 then
                    local v1639 = v1638:FindFirstChildOfClass("Tool")
                    if v1639 and (v1639.Name == "Bat" and v1639:FindFirstChild("SwingEvent")) then
                        v1639.SwingEvent:FireServer()
                    end
                    if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                        packedice.SwingEvent:FireServer()
                    end
                end
            end)
        end)
    elseif getgenv().HitAuraConnection then
        getgenv().HitAuraConnection:Disconnect()
        getgenv().HitAuraConnection = nil
    end
end)
v1628:Toggle("\231\147\182\229\173\144\230\137\147\229\135\187", "text", false, function(p1640)
    getgenv().HitAura = p1640
    if getgenv().HitAura then
        getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                local v1641 = game:GetService("Players").LocalPlayer.Character
                if v1641 then
                    local v1642 = v1641:FindFirstChildOfClass("Tool")
                    if v1642 and (v1642.Name == "Bottle" and v1642:FindFirstChild("SwingEvent")) then
                        v1642.SwingEvent:FireServer()
                    end
                    if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                        packedice.SwingEvent:FireServer()
                    end
                end
            end)
        end)
    elseif getgenv().HitAuraConnection then
        getgenv().HitAuraConnection:Disconnect()
        getgenv().HitAuraConnection = nil
    end
end)
local v1643 = v31:Tab("\232\135\170\231\132\182\231\129\190\229\174\179", "7733920226"):section("\229\138\159\232\131\189", true)
v1643:Toggle("\232\135\170\229\138\168\232\181\162", "", false, function(p1644)
    _G.autowinfarm = p1644
    while wait(0.1) do
        if _G.autowinfarm == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
    end
end)
v1643:Button("\233\187\145\230\180\158\232\132\154\230\156\172", function()
    local v1645 = game:GetService("UserInputService")
    local vu1646 = game:GetService("Players").LocalPlayer:GetMouse()
    local v1647 = Instance.new("Folder", game:GetService("Workspace"))
    local v1648 = Instance.new("Part", v1647)
    local vu1649 = Instance.new("Attachment", v1648)
    v1648.Anchored = true
    v1648.CanCollide = false
    v1648.Transparency = 1
    local vu1650 = vu1646.Hit + Vector3.new(0, 5, 0)
    local v1655 = coroutine.create(function()
        settings().Physics.AllowSleep = false
        while game:GetService("RunService").RenderStepped:Wait() do
            local v1651 = next
            local v1652, v1653 = game:GetService("Players"):GetPlayers()
            while true do
                local v1654
                v1653, v1654 = v1651(v1652, v1653)
                if v1653 == nil then
                    break
                end
                if v1654 ~= game:GetService("Players").LocalPlayer then
                    v1654.MaximumSimulationRadius = 0
                    sethiddenproperty(v1654, "SimulationRadius", 0)
                end
            end
            game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
            setsimulationradius(math.huge)
        end
    end)
    coroutine.resume(v1655)
    local function vu1664(p1656)
        if p1656:IsA("Part") and p1656.Anchored == false and (p1656.Parent:FindFirstChild("Humanoid") == nil and (p1656.Parent:FindFirstChild("Head") == nil and p1656.Name ~= "Handle")) then
            vu1646.TargetFilter = p1656
            local v1657 = next
            local v1658, v1659 = p1656:GetChildren()
            while true do
                local v1660
                v1659, v1660 = v1657(v1658, v1659)
                if v1659 == nil then
                    break
                end
                if v1660:IsA("BodyAngularVelocity") or (v1660:IsA("BodyForce") or (v1660:IsA("BodyGyro") or (v1660:IsA("BodyPosition") or (v1660:IsA("BodyThrust") or (v1660:IsA("BodyVelocity") or v1660:IsA("RocketPropulsion")))))) then
                    v1660:Destroy()
                end
            end
            if p1656:FindFirstChild("Attachment") then
                p1656:FindFirstChild("Attachment"):Destroy()
            end
            if p1656:FindFirstChild("AlignPosition") then
                p1656:FindFirstChild("AlignPosition"):Destroy()
            end
            if p1656:FindFirstChild("Torque") then
                p1656:FindFirstChild("Torque"):Destroy()
            end
            p1656.CanCollide = false
            local v1661 = Instance.new("Torque", p1656)
            v1661.Torque = Vector3.new(100000, 100000, 100000)
            local v1662 = Instance.new("AlignPosition", p1656)
            local v1663 = Instance.new("Attachment", p1656)
            v1661.Attachment0 = v1663
            v1662.MaxForce = 9999999999999998
            v1662.MaxVelocity = math.huge
            v1662.Responsiveness = 200
            v1662.Attachment0 = v1663
            v1662.Attachment1 = vu1649
        end
    end
    local v1665 = next
    local v1666, v1667 = game:GetService("Workspace"):GetDescendants()
    local vu1668 = vu1649
    local vu1669 = vu1646
    while true do
        local v1670
        v1667, v1670 = v1665(v1666, v1667)
        if v1667 == nil then
            break
        end
        vu1664(v1670)
    end
    game:GetService("Workspace").DescendantAdded:Connect(function(p1671)
        vu1664(p1671)
    end)
    v1645.InputBegan:Connect(function(p1672, p1673)
        if p1672.KeyCode == Enum.KeyCode.E and not p1673 then
            vu1650 = vu1669.Hit + Vector3.new(0, 5, 0)
        end
    end)
    spawn(function()
        while game:GetService("RunService").RenderStepped:Wait() do
            vu1668.WorldCFrame = vu1650
        end
    end)
end)
local vu1674 = v1643:Label("\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175:")
v1643:Toggle("\233\162\132\230\181\139\231\129\190\229\174\1792", "", false, function(p1675)
    nextdis = p1675
    while wait(1) and nextdis do
        local v1676 = vu1190.Character:FindFirstChild("SurvivalTag")
        if v1676 then
            if v1676.Value ~= "Blizzard" or not nextdis then
                if v1676.Value ~= "Sandstorm" or not nextdis then
                    if v1676.Value ~= "Tornado" or not nextdis then
                        if v1676.Value ~= "Volcanic Eruption" or not nextdis then
                            if v1676.Value ~= "Flash Flood" or not nextdis then
                                if v1676.Value ~= "Deadly Virus" or not nextdis then
                                    if v1676.Value ~= "Tsunami" or not nextdis then
                                        if v1676.Value ~= "Acid Rain" or not nextdis then
                                            if v1676.Value ~= "Fire" or not nextdis then
                                                if v1676.Value ~= "Meteor Shower" or not nextdis then
                                                    if v1676.Value ~= "Earthquake" or not nextdis then
                                                        if v1676.Value ~= "Thunder Storm" or not nextdis then
                                                            Message.Visible = false
                                                        else
                                                            vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\233\155\183\230\154\180"
                                                        end
                                                    else
                                                        vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\229\156\176\233\156\135"
                                                    end
                                                else
                                                    vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\230\181\129\230\152\159\233\155\168"
                                                end
                                            else
                                                vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\231\129\171\231\129\190"
                                            end
                                        else
                                            vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\233\133\184\233\155\168"
                                        end
                                    else
                                        vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\230\181\183\229\149\184"
                                    end
                                else
                                    vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\231\151\133\230\175\146"
                                end
                            else
                                vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\230\180\170\230\176\180"
                            end
                        else
                            vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\231\129\171\229\177\177"
                        end
                    else
                        vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\233\190\153\229\141\183\233\163\142"
                    end
                else
                    vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\230\178\153\229\176\152\230\154\180"
                end
            else
                vu1674.Text = "\228\184\139\228\184\128\228\184\170\231\129\190\229\174\179\230\152\175\239\188\154\230\154\180\233\163\142\233\155\168"
            end
        end
    end
end)
v1643:Toggle("\233\162\132\230\181\139\231\129\190\229\174\179", "", false, function(p1677)
    nextdis = p1677
    while wait(5) and nextdis do
        local v1678 = vu1190.Character:FindFirstChild("SurvivalTag")
        if v1678 then
            if v1678.Value ~= "Blizzard" or not nextdis then
                if v1678.Value ~= "Sandstorm" or not nextdis then
                    if v1678.Value ~= "Tornado" or not nextdis then
                        if v1678.Value ~= "Volcanic Eruption" or not nextdis then
                            if v1678.Value ~= "Flash Flood" or not nextdis then
                                if v1678.Value ~= "Deadly Virus" or not nextdis then
                                    if v1678.Value ~= "Tsunami" or not nextdis then
                                        if v1678.Value ~= "Acid Rain" or not nextdis then
                                            if v1678.Value ~= "Fire" or not nextdis then
                                                if v1678.Value ~= "Meteor Shower" or not nextdis then
                                                    if v1678.Value ~= "Earthquake" or not nextdis then
                                                        if v1678.Value ~= "Thunder Storm" or not nextdis then
                                                            Message.Visible = false
                                                        else
                                                            Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\233\155\183\230\154\180", "rbxassetid://", 1)
                                                            wait(10)
                                                        end
                                                    else
                                                        Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\229\156\176\233\156\135", "rbxassetid://", 1)
                                                    end
                                                else
                                                    Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\230\181\129\230\152\159\233\155\168", "rbxassetid://", 1)
                                                end
                                            else
                                                Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\231\129\171\231\132\176", "rbxassetid://", 1)
                                            end
                                        else
                                            Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\233\133\184\233\155\168", "rbxassetid://", 1)
                                        end
                                    else
                                        Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\230\181\183\229\149\184", "rbxassetid://", 1)
                                    end
                                else
                                    Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\231\151\133\230\175\146", "rbxassetid://", 1)
                                end
                            else
                                Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\230\180\170\230\176\180", "rbxassetid://", 1)
                            end
                        else
                            Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\231\129\171\229\177\177", "rbxassetid://", 1)
                        end
                    else
                        Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\233\190\153\229\141\183\233\163\142", "rbxassetid://", 1)
                    end
                else
                    Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\230\178\153\229\176\152\230\154\180", "rbxassetid://", 1)
                end
            else
                Notify("\229\143\182\232\132\154\230\156\172", "\228\184\139\228\184\128\228\184\170\231\129\190\233\154\190\230\152\175\230\154\180\233\163\142\233\155\170", "rbxassetid://", 1)
            end
        end
    end
end)
v1643:Toggle("\229\156\176\229\155\190\230\138\149\231\165\168\231\149\140\233\157\162", "Map Voting UI", false, function(p1679)
    if p1679 == false then
        game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
    end
    if p1679 == true then
        game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
    end
end)
v1643:Toggle("\230\184\184\230\136\143\229\178\155\230\130\172\229\180\150\231\162\176\230\146\158", "Togglelnfo", false, function(p1680)
    local v1681, v1682, v1683 = pairs(game.workspace:GetDescendants())
    while true do
        local v1684
        v1683, v1684 = v1681(v1682, v1683)
        if v1683 == nil then
            break
        end
        if v1684.Name == "LowerRocks" then
            v1684.CanCollide = p1680
        end
    end
end)
v1643:Button("\231\166\129\231\148\168\229\157\160\232\144\189\230\141\159\229\157\143", function()
    local v1685
    if game.Players.LocalPlayer.Character == nil then
        v1685 = nil
    else
        v1685 = game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
    end
    if v1685 then
        v1685:Destroy()
    end
end)
v1643:Toggle("\232\135\170\229\138\168\231\166\129\231\148\168\229\157\160\232\144\189\228\188\164\229\174\179", "Toggleelnfo", false, function(p1686)
    _G.NoFallDamage = p1686
    while wait(0.5) do
        if _G.NoFallDamage == true then
            local v1687
            if game.Players.LocalPlayer.Character == nil then
                v1687 = nil
            else
                v1687 = game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
            end
            if v1687 then
                v1687:Destroy()
            end
        end
    end
end)
v1643:Button("\231\167\187\233\153\164\231\129\190\233\154\190\231\149\140\233\157\162(\230\154\180\233\163\142\233\155\170\229\146\140\230\178\153\229\176\152\230\154\180)", function()
    game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
    game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
end)
v1643:Button("\229\143\182\232\132\154\230\156\172-\233\187\145\230\180\158\232\132\154\230\156\172", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/%E5%8F%B6%E8%84%9A%E6%9C%AC%E9%BB%91%E6%B4%9E.lua"))()
end)
v1643:Button("\233\187\145\230\180\158\232\132\154\230\156\1722", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua", true))()
end)
v1643:Button("\233\187\145\230\180\158\232\132\154\230\156\1723", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GoofyBlox/GoofyZ/refs/heads/main/Best/Vortex.lua", true))()
end)
v1643:Button("\233\187\145\230\180\158\232\132\154\230\156\172\231\142\175\231\187\149V2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/666/refs/heads/main/656"))()
end)
v1643:Button("\232\142\183\229\143\150\230\176\148\231\144\131", function()
    plyr = game.Players.LocalPlayer
    char = plyr.Character
    torso = char.Torso
    mouse = plyr:GetMouse()
    Run = game:service("RunService")
    deb = game:service("Debris")
    ra = char["Right Arm"]
    la = char["Left Arm"]
    rs = char.Torso["Right Shoulder"]
    ls = char.Torso["Left Shoulder"]
    local vu1688 = true
    iliketrains = {}
    part1 = Instance.new("Part", char)
    part1.FormFactor = "Symmetric"
    part1.Size = Vector3.new(1, 3, 1)
    part1.TopSurface = 0
    part1.BottomSurface = 0
    part1:BreakJoints()
    special = Instance.new("SpecialMesh", part1)
    special.MeshId = "http://www.roblox.com/asset/?id=25498565"
    special.TextureId = "http://www.roblox.com/asset/?id=26725707"
    special.Scale = Vector3.new(2, 2, 2)
    w = Instance.new("Weld", char)
    w.Part0 = part1
    w.Part1 = torso
    w.C0 = CFrame.new(- 0.4, - 1.4, - 0.5) * CFrame.Angles(- 0.5, 0, 0.2)
    part2 = Instance.new("Part", char)
    part2.FormFactor = "Symmetric"
    part2.Size = Vector3.new(1, 3, 1)
    part2.TopSurface = 0
    part2.BottomSurface = 0
    part2:BreakJoints()
    special2 = Instance.new("SpecialMesh", part2)
    special2.MeshId = "http://www.roblox.com/asset/?id=25498565"
    special2.TextureId = "http://www.roblox.com/asset/?id=26725707"
    special2.Scale = Vector3.new(2, 2, 2)
    w2 = Instance.new("Weld", char)
    w2.Part0 = part2
    w2.Part1 = torso
    w2.C0 = CFrame.new(0.4, - 1.4, - 0.5) * CFrame.Angles(- 0.5, 0, - 0.2)
    tool = Instance.new("HopperBin", plyr.Backpack)
    tool.Name = " "
    tool.TextureId = "http://www.roblox.com/asset/?id=27471616"
    tool.Selected:connect(function(p1689)
        p1689.Button1Down:connect(function(_)
            if not equipped then
                equipped = true
                coroutine.wrap(function()
                    while equipped do
                        rs.DesiredAngle = 0
                        rs.CurrentAngle = 0
                        ls.DesiredAngle = 0
                        ls.CurrentAngle = 0
                        Run.Stepped:wait()
                    end
                end)()
                coroutine.wrap(function()
                    vu1688 = false
                    coroutine.wrap(function()
                        for _ = 0, 3 do
                            w.C0 = w.C0 * CFrame.new(0, 0.05, 0)
                            w2.C0 = w2.C0 * CFrame.new(0, 0.05, 0)
                            Run.Stepped:wait()
                        end
                        wait(0.147)
                        for _ = 0, 3 do
                            w.C0 = w.C0 * CFrame.new(0, - 0.05, 0)
                            w2.C0 = w2.C0 * CFrame.new(0, - 0.05, 0)
                            Run.Stepped:wait()
                        end
                    end)()
                    local vu1690 = Instance.new("Part", char)
                    vu1690.FormFactor = "Custom"
                    vu1690.Name = "Platform"
                    vu1690.Transparency = 1
                    vu1690.Size = Vector3.new(4, 1, 4)
                    vu1690.Anchored = true
                    for v1691 = 2.5, 6, 0.05 do
                        vu1690.CFrame = CFrame.new(torso.CFrame.x, torso.CFrame.y - v1691, torso.CFrame.z)
                        Run.Stepped:wait()
                    end
                    coroutine.wrap(function()
                        vu1690:Destroy()
                    end)()
                end)()
                for _ = 0, 4 do
                    ls.C0 = ls.C0 * CFrame.Angles(- 0.25, 0, 0)
                    rs.C0 = rs.C0 * CFrame.Angles(- 0.25, 0, 0)
                    Run.Stepped:wait()
                end
                wait(0.02)
                for _ = 0, 4 do
                    ls.C0 = ls.C0 * CFrame.Angles(0.25, 0, 0)
                    rs.C0 = rs.C0 * CFrame.Angles(0.25, 0, 0)
                    Run.Stepped:wait()
                end
                vu1688 = true
                equipped = false
            end
        end)
    end)
    while vu1688 do
        for v1692 = 0, 3 do
            w.C0 = w.C0 * CFrame.Angles(0, 0.002 * v1692, 0)
            w2.C0 = w2.C0 * CFrame.Angles(0, - 0.002 * v1692, 0)
            Run.Stepped:wait()
        end
        wait(0.112687)
        for v1693 = 0, 3 do
            w.C0 = w.C0 * CFrame.Angles(0, - 0.002 * v1693, 0)
            w2.C0 = w2.C0 * CFrame.Angles(0, 0.002 * v1693, 0)
            Run.Stepped:wait()
        end
        wait(0.312687)
    end
end)
v1643:Toggle("\229\188\128\229\144\175\230\184\184\230\136\143\229\178\155\230\130\172\229\180\150\231\162\176\230\146\158\228\189\147\231\167\175", "Togglelnfo", false, function(p1694)
    local v1695, v1696, v1697 = pairs(game.workspace:GetDescendants())
    while true do
        local v1698
        v1697, v1698 = v1695(v1696, v1697)
        if v1697 == nil then
            break
        end
        if v1698.Name == "LowerRocks" then
            v1698.CanCollide = p1694
        end
    end
end)
v1643:Toggle("\229\156\168\230\176\180\228\184\138\232\161\140\232\181\176", "ToggleInfo", false, function(p1699)
    if p1699 == false then
        game.Workspace.WaterLevel.CanCollide = false
        game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
    end
    if p1699 == true then
        game.Workspace.WaterLevel.CanCollide = true
        game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
    end
end)
v1643:Toggle("\232\135\170\229\138\168\229\173\152\230\180\187", "ToggleInfo", false, function(p1700)
    _G.autowinfarm = p1700
    while wait(0.1) do
        if _G.autowinfarm == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
    end
end)
v1643:Button("\230\137\147\229\141\176\228\184\139\228\184\128\230\172\161\231\129\190\233\154\190", function()
    warn(game.Players.LocalPlayer.Character.SurvivalTag.Value)
end)
local v1701 = v31:Tab("FE\232\132\154\230\156\172", "7733993211"):section("\229\134\133\229\174\185", true)
v1701:Button("FE C00lgui", function()
    loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
end)
v1701:Button("FE 1x1x1x1", function()
    loadstring(gameHttpGet("https://pastebin.com/raw/JipYNCht", true))()
end)
v1701:Button("\230\151\160\232\133\191(R15)", function()
    vu5 = game:GetService("Players").LocalPlayer.Character
    leftUpperLeg = vu5:FindFirstChild("LeftUpperLeg")
    if leftUpperLeg then
        leftUpperLeg:Destroy()
    end
    leftLowerLeg = vu5:FindFirstChild("LeftLowerLeg")
    if leftLowerLeg then
        leftLowerLeg:Destroy()
    end
    leftFoot = vu5:FindFirstChild("LeftFoot")
    if leftFoot then
        leftFoot:Destroy()
    end
    rightUpperLeg = vu5:FindFirstChild("RightUpperLeg")
    if rightUpperLeg then
        rightUpperLeg:Destroy()
    end
    rightLowerLeg = vu5:FindFirstChild("RightLowerLeg")
    if rightLowerLeg then
        rightLowerLeg:Destroy()
    end
    rightFoot = vu5:FindFirstChild("RightFoot")
    if rightFoot then
        rightFoot:Destroy()
    end
end)
v1701:Button("\230\151\160\232\133\191(R6)", function()
    vu5 = game:GetService("Players").LocalPlayer.Character
    leftLeg = vu5:FindFirstChild("Left Leg")
    if leftLeg then
        leftLeg:Destroy()
    end
    rightLeg = vu5:FindFirstChild("Right Leg")
    if rightLeg then
        rightLeg:Destroy()
    end
end)
v1701:Button("\230\151\160\230\137\139(R15)", function()
    vu5 = game:GetService("Players").LocalPlayer.Character
    leftUpperArm = vu5:FindFirstChild("LeftUpperArm")
    if leftUpperArm then
        leftUpperArm:Destroy()
    end
    leftLowerArm = vu5:FindFirstChild("LeftLowerArm")
    if leftLowerArm then
        leftLowerArm:Destroy()
    end
    leftFoot = vu5:FindFirstChild("LeftFoot")
    if leftFoot then
        leftFoot:Destroy()
    end
    rightUpperArm = vu5:FindFirstChild("RightUpperArm")
    if rightUpperArm then
        rightUpperArm:Destroy()
    end
    rightLowerArm = vu5:FindFirstChild("RightLowerArm")
    if rightLowerArm then
        rightLowerArm:Destroy()
    end
    rightFoot = vu5:FindFirstChild("RightFoot")
    if rightFoot then
        rightFoot:Destroy()
    end
end)
v1701:Button("\230\151\160\230\137\139(R6)", function()
    vu5 = game:GetService("Players").LocalPlayer.Character
    leftArm = vu5:FindFirstChild("Left Arm")
    if leftArm then
        leftArm:Destroy()
    end
    rightArm = vu5:FindFirstChild("Right Arm")
    if rightArm then
        rightArm:Destroy()
    end
end)
v1701:Button("FE\229\164\167\233\149\191\232\133\191", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets"))()
end)
v1701:Button("FE\231\148\168\229\164\180", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BK4Q0DfU"))()
end)
v1701:Button("\229\164\141\228\187\135\232\128\133", function()
    loadstring(game:HttpGet("https://pastefy.ga/iGyVaTvs/raw", true))()
end)
v1701:Button("\233\188\160\230\160\135", function()
    loadstring(game:HttpGet("https://pastefy.ga/V75mqzaz/raw", true))()
end)
v1701:Button("\229\143\152\230\128\170\231\137\169", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/jfryBKds"))()
end)
v1701:Button("\233\166\153\232\149\137\230\158\170", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
end)
v1701:Button("\232\182\133\233\149\191\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\229\183\180", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end)
v1701:Button("\230\147\141\228\186\186", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end)
v1701:Button("\230\147\141b\232\132\154\230\156\172", function()
    local v1702 = Instance.new("ScreenGui")
    local v1703 = Instance.new("Frame")
    Instance.new("TextButton")
    local v1704 = Instance.new("TextButton")
    local vu1705 = Instance.new("TextBox")
    local v1706 = Instance.new("TextLabel")
    local v1707 = Instance.new("ImageLabel")
    local v1708 = Instance.new("TextLabel")
    Instance.new("TextLabel")
    v1702.Name = "SimpleSexGUI"
    v1702.Parent = game.CoreGui
    v1703.Name = "FGUI"
    v1703.Parent = v1702
    v1703.BackgroundColor3 = Color3.new(255, 255, 255)
    v1703.BorderSizePixel = 1
    v1703.Position = UDim2.new(0, 0, 0.667, 0)
    v1703.Size = UDim2.new(0, 317, 0, 271)
    v1703.Draggable = true
    v1708.Name = "Title"
    v1708.Parent = v1703
    v1708.BackgroundColor3 = Color3.new(255, 255, 255)
    v1708.BorderSizePixel = 1
    v1708.Position = UDim2.new(0, 0, - 0.122, 0)
    v1708.Size = UDim2.new(0, 317, 0, 33)
    v1708.Visible = true
    v1708.Active = true
    v1708.Draggable = false
    v1708.Selectable = true
    v1708.Font = Enum.Font.SourceSansBold
    v1708.Text = "\230\147\141\232\155\139\232\132\154\230\156\172"
    v1708.TextColor3 = Color3.new(0, 0, 0)
    v1708.TextSize = 20
    v1704.Name = "Sex"
    v1704.Parent = v1703
    v1704.BackgroundColor3 = Color3.new(255, 255, 255)
    v1704.BorderSizePixel = 1
    v1704.Position = UDim2.new(0.044, 0, 0.229, 0)
    v1704.Size = UDim2.new(0, 99, 0, 31)
    v1704.Visible = true
    v1704.Active = true
    v1704.Draggable = false
    v1704.Selectable = true
    v1704.Font = Enum.Font.SourceSansBold
    v1704.Text = "\232\174\169\230\136\145\228\187\172\230\147\141\232\155\139\229\144\167"
    v1704.TextColor3 = Color3.new(0, 0, 0)
    v1704.TextSize = 20
    vu1705.Name = "VictimTEXT"
    vu1705.Parent = v1703
    vu1705.BackgroundColor3 = Color3.new(255, 255, 255)
    vu1705.BorderSizePixel = 1
    vu1705.Position = UDim2.new(0.533, 0, 0.229, 0)
    vu1705.Size = UDim2.new(0, 133, 0, 27)
    vu1705.Visible = true
    vu1705.Active = true
    vu1705.Draggable = false
    vu1705.Selectable = true
    vu1705.Font = Enum.Font.SourceSansBold
    vu1705.Text = "\229\144\141\229\173\151"
    vu1705.TextColor3 = Color3.new(0, 0, 0)
    vu1705.TextSize = 20
    v1706.Name = "FUCKEMALL"
    v1706.Parent = v1703
    v1706.BackgroundColor3 = Color3.new(255, 255, 255)
    v1706.BorderSizePixel = 1
    v1706.Position = UDim2.new(0.025, 0, 0.856, 0)
    v1706.Size = UDim2.new(0, 301, 0, 27)
    v1706.Visible = true
    v1706.Font = Enum.Font.SourceSansBold
    v1706.Text = "\230\147\141\232\155\139\229\146\140\230\147\141\232\155\139"
    v1706.TextColor3 = Color3.new(0, 0, 0)
    v1706.TextSize = 20
    v1707.Name = "ImageLabel"
    v1707.Parent = v1703
    v1707.Image = "http://www.roblox.com/asset/?id=42837..."
    v1707.BorderSizePixel = 1
    v1707.Position = UDim2.new(0.274, 0, 0.358, 0)
    v1707.Size = UDim2.new(0, 106, 0, 121)
    v1704.MouseButton1Click:Connect(function()
        local _ = vu1705.Text
        local v1709 = Instance.new("Animation")
        v1709.AnimationId = "rbxassetid://148840371"
        hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
        pcall(function()
            hummy.Parent.Pants:Destroy()
        end)
        pcall(function()
            hummy.Parent.Shirt:Destroy()
        end)
        local v1710 = hummy:LoadAnimation(v1709)
        v1710:Play()
        v1710:AdjustSpeed(10)
        while hummy.Parent.Parent ~= nil do
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[vu1705.Text].Character.HumanoidRootPart.CFrame
        end
    end)
end)
v1701:Button("FE\229\138\168\231\148\187\228\184\173\229\191\131", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)
v1701:Button("FE\229\143\152\231\142\169\229\174\182", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)
v1701:Button("FE\231\140\171\229\168\152R63", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
v1701:Button("FE", function()
    oadstring(game:HttpGet("https://pastefy.ga/a7RTi4un/raw", true))()
end)
local v1711 = v31:Tab("\228\188\144\230\156\168\229\164\167\228\186\168", "7733993211")
local v1712 = v1711:section("\228\184\187\232\166\129\229\138\159\232\131\189", true)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1681", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1682", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GreyCaat/LT2KillPlayers/main/LT2KillPlayers.lua", true))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1683", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf", true))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1684", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/p9mEnV28"))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1685", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0x37Dev/Cool-Solo-Dupe-Thing/main/script.lua"))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1686", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx"))()
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1687", function()
    loadstring(game:HttpGetAsync("https://cdn.applebee1558.com/bark/bark.lua"))("2022 more like twenty-twenty-too")
end)
v1712:Button("\228\188\144\230\156\168\229\164\167\228\186\1688", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/hnVtRcyb"))()
end)
local v1714 = v31:Tab("\232\156\130\231\190\164\230\168\161\230\139\159\229\153\168", "7733993211"):section("\232\156\130\231\190\164\230\168\161\230\139\159\229\153\168", true)
v1714:Button("\230\156\128\229\188\186", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/rhnrn/main/%E8%9C%82%E7%BE%A4%E8%84%9A%E6%9C%ACato%E6%B1%89%E5%8C%96.txt"))()
end)
v1714:Toggle("\232\135\170\229\138\168\230\148\182\233\155\134\232\138\177\231\178\137", "", false, function(p1715)
    getgenv().turnoff4 = p1715
    while turnoff4 == true do
        wait(0.1)
        local function v1720()
            local v1716, v1717, v1718 = pairs(game.Players:GetChildren())
            while true do
                local v1719
                v1718, v1719 = v1716(v1717, v1718)
                if v1718 == nil then
                    break
                end
                if v1719.Name ~= game.Players.LocalPlayer.Name and (v1719 and v1719.Character) and (v1719.Character:FindFirstChildWhichIsA("Tool") and v1719.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("ClickEvent")) then
                    v1719.Character:FindFirstChildWhichIsA("Tool").ClickEvent:FireServer()
                end
            end
        end
        if game.Players.LocalPlayer then
            if game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("ClickEvent", true)) then
                tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or nil
            end
            if tool then
                getsenv(tool.ClientScriptMouse).collectStart(game:GetService("Players").LocalPlayer:GetMouse())
            end
            v1720()
            workspace.NPCs.Onett.Onett["Porcelain Dipper"].ClickEvent:FireServer()
        end
    end
end)
local v1721 = v31:Tab("\230\179\149\229\174\157\230\168\161\230\139\159\229\153\168", "7733993211"):section("\230\179\149\229\174\157\230\168\161\230\139\159\229\153\168", true)
v1721:Toggle("\232\135\170\229\138\168\230\137\147\230\128\170", "", false, function(p1722)
    _G.farmNearest = p1722
    spawn(function()
        while task.wait() and _G.farmNearest do
            pcall(function()
                local v1723 = getNear()
                vu1190.CFrame = v1723.Root.CFrame * CFrame.new(0, 0, 10)
                wait(0.2)
                workspace.Fight.Events.FightAttack:InvokeServer(0, v1723.Name)
                repeat
                    task.wait()
                    vu1190.CFrame = v1723.Root.CFrame * CFrame.new(0, 0, 10)
                until v1723.Root == nil or not _G.farmNearest
            end)
        end
    end)
end)
v1721:Toggle("\232\135\170\229\138\168\230\148\182\233\155\134", "", false, function(p1724)
    _G.autoCollect = p1724
    spawn(function()
        while task.wait() and _G.autoCollect do
            local v1725, v1726, v1727 = pairs(game:GetService("Workspace").Rewards:GetChildren())
            while true do
                local v1728
                v1727, v1728 = v1725(v1726, v1727)
                if v1727 == nil then
                    break
                end
                if v1728 ~= nil then
                    v1728.CFrame = vu1190.CFrame
                end
            end
        end
    end)
end)
v1721:Button("\230\179\149\229\174\157\230\168\161\230\139\159\229\153\168\230\177\137\229\140\150", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zhanghuihuihuil/Script/main/%E6%B3%95%E5%AE%9D%E6%A8%A1%E6%8B%9F%E5%99%A8%E6%B1%89%E5%8C%96"))()
end)
v1721:Button("\230\179\149\229\174\157\230\168\161\230\139\159\229\153\168", function()
    loadstring(game:HttpGet("https://pastefy.app/9bGpv4H3/raw"))()
end)
local v1729 = v31:Tab("\228\184\128\232\183\175\229\144\145\232\165\191", "7733993211"):section("\228\184\128\232\183\175\229\144\145\232\165\191", true)
v1729:Button("\228\184\128\232\183\175\229\144\145\232\165\1911", function()
    loadstring(game:HttpGet("https://pastefy.app/q08owYGG/raw"))()
end)
v1729:Button("\228\184\128\232\183\175\229\144\145\232\165\1912", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drifter0507/scripts/main/westbound", true))()
end)
v1729:Button("\229\133\168\229\155\190\230\157\128\228\186\186", function()
    local vu1730 = true
    local vu1731 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vu1732 = vu1731.Position - Vector3.new(5, 0, 0)
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(p1733)
        if p1733 == "f" then
            vu1730 = not vu1730
        end
        if p1733 == "r" then
            vu1731 = game.Players.LocalPlayer.Character.HumanoidRootPart
            vu1732 = vu1731.Position - Vector3.new(5, 0, 0)
        end
    end)
    local v1734, v1735, v1736 = pairs(game.Players:GetPlayers())
    local vu1737 = vu1732
    local vu1738 = vu1730
    while true do
        local vu1739
        v1736, vu1739 = v1734(v1735, v1736)
        if v1736 == nil then
            break
        end
        if vu1739 ~= game.Players.LocalPlayer then
            local v1747 = coroutine.create(function()
                game:GetService("RunService").RenderStepped:Connect(function()
                    local v1745, v1746 = pcall(function()
                        local v1740 = vu1739.Character
                        if v1740 and (v1740:FindFirstChild("HumanoidRootPart") and vu1738) then
                            vu1739.Backpack:ClearAllChildren()
                            local v1741, v1742, v1743 = pairs(v1740:GetChildren())
                            while true do
                                local v1744
                                v1743, v1744 = v1741(v1742, v1743)
                                if v1743 == nil then
                                    break
                                end
                                if v1744:IsA("Tool") then
                                    v1744:Destroy()
                                end
                            end
                            v1740.HumanoidRootPart.CFrame = CFrame.new(vu1737)
                        end
                    end)
                    if not v1745 then
                        warn("Unnormal error: " .. v1746)
                    end
                end)
            end)
            coroutine.resume(v1747)
        end
    end
    game.Players.PlayerAdded:Connect(function(pu1748)
        if pu1748 ~= game.Players.LocalPlayer then
            local v1756 = coroutine.create(function()
                game:GetService("RunService").RenderStepped:Connect(function()
                    local v1754, v1755 = pcall(function()
                        local v1749 = pu1748.Character
                        if v1749 and (v1749:FindFirstChild("HumanoidRootPart") and vu1738) then
                            pu1748.Backpack:ClearAllChildren()
                            local v1750, v1751, v1752 = pairs(v1749:GetChildren())
                            while true do
                                local v1753
                                v1752, v1753 = v1750(v1751, v1752)
                                if v1752 == nil then
                                    break
                                end
                                if v1753:IsA("Tool") then
                                    v1753:Destroy()
                                end
                            end
                            v1749.HumanoidRootPart.CFrame = CFrame.new(vu1737)
                        end
                    end)
                    if not v1754 then
                        warn("Unnormal error: " .. v1755)
                    end
                end)
            end)
            coroutine.resume(v1756)
        end
    end)
end)
v1729:Button("\230\151\160\232\183\140\232\144\189\228\188\164\229\174\179", function()
    local v1757 = getrawmetatable(game)
    local vu1758 = v1757.__namecall
    setreadonly(v1757, false)
    v1757.__namecall = newcclosure(function(p1759, ...)
        if getnamecallmethod() == "FireServer" and p1759.Name == "ChangeCharacter" then
            local v1760 = {
                ...
            }
            if v1760[1] and v1760[1] == "Damage" then
                return nil
            end
        end
        return vu1758(p1759, ...)
    end)
end)
v1729:Button("\229\191\171\233\128\159\230\139\190\229\143\150", function()
    require(game:GetService("Workspace")[game.Players.LocalPlayer.Name].ContextActions.ContextMain):New({
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
        "You\'re an outlaw! We don\'t serve your type here!"
    }, {
        "This here\'s a bandit camp! Get out!",
        "Get lost, cowboy!",
        "Are you an outlaw? Didn\'t think so! Scram!"
    })
end)
v1729:Button("\232\140\131\229\155\180\228\188\164\229\174\179", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/rLGRxq0W"))()
end)
v1729:Button("\230\151\160\229\144\142\229\186\167\229\138\155", function()
    local v1761, v1762, v1763 = pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats))
    local v1764 = {
        FanFire = true,
        camShakeResist = 0,
        prepTime = 0,
        equipTime = 0,
        Spread = 0,
        InstantFireAnimation = true
    }
    while true do
        local v1765
        v1763, v1765 = v1761(v1762, v1763)
        if v1763 == nil then
            break
        end
        local v1766, v1767, v1768 = pairs(v1764)
        while true do
            local v1769
            v1768, v1769 = v1766(v1767, v1768)
            if v1768 == nil then
                break
            end
            if v1765[v1768] then
                v1765[v1768] = v1769
            end
        end
    end
end)
v1729:Button("\228\184\128\231\167\146\230\141\162\229\188\185", function()
    local v1770, v1771, v1772 = pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats))
    local v1773 = {
        FanFire = true,
        prepTime = 0,
        equipTime = 0,
        camShakeResist = 0,
        ReloadAnimationSpeed = 10,
        ReloadSpeed = 0,
        Spread = 0,
        InstantFireAnimation = true
    }
    while true do
        local v1774
        v1772, v1774 = v1770(v1771, v1772)
        if v1772 == nil then
            break
        end
        local v1775, v1776, v1777 = pairs(v1773)
        while true do
            local v1778
            v1777, v1778 = v1775(v1776, v1777)
            if v1777 == nil then
                break
            end
            if v1774[v1777] then
                v1774[v1777] = v1778
            end
        end
    end
end)
v1729:Button("\229\173\144\229\188\185\230\177\135\232\129\154", function()
    local v1779, v1780, v1781 = pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats))
    local v1782 = {
        FanFire = true,
        prepTime = 0,
        equipTime = 0,
        camShakeResist = 0,
        ReloadAnimationSpeed = 10,
        ReloadSpeed = 0,
        Spread = 0,
        HipFireAccuracy = 0,
        ZoomAccuracy = 0,
        InstantFireAnimation = true
    }
    while true do
        local v1783
        v1781, v1783 = v1779(v1780, v1781)
        if v1781 == nil then
            break
        end
        local v1784, v1785, v1786 = pairs(v1782)
        while true do
            local v1787
            v1786, v1787 = v1784(v1785, v1786)
            if v1786 == nil then
                break
            end
            if v1783[v1786] then
                v1783[v1786] = v1787
            end
        end
    end
end)
v1729:Button("\230\151\160\233\153\144\229\164\135\229\188\185", function()
    local v1788 = {
        FanFire = true,
        prepTime = 0,
        equipTime = 0,
        MaxShots = math.huge,
        camShakeResist = 0,
        ReloadAnimationSpeed = 10,
        ReloadSpeed = 0,
        Spread = 0,
        InstantFireAnimation = true
    }
    local v1789, v1790, v1791 = pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats))
    while true do
        local v1792
        v1791, v1792 = v1789(v1790, v1791)
        if v1791 == nil then
            break
        end
        local v1793, v1794, v1795 = pairs(v1788)
        while true do
            local v1796
            v1795, v1796 = v1793(v1794, v1795)
            if v1795 == nil then
                break
            end
            if v1792[v1795] then
                v1792[v1795] = v1796
            end
        end
    end
end)
v1729:Button("\230\187\154\231\173\146", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "StoneCreek",
        false
    }))
end)
v1729:Button("\229\178\169\231\159\179\230\186\170", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "StoneCreek",
        false
    }))
end)
v1729:Button("\231\129\176\232\137\178\229\177\177\232\132\138", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "Grayridge",
        false
    }))
end)
v1729:Button("\229\164\167\231\159\191\230\180\158", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "Quarry",
        false
    }))
end)
v1729:Button("\229\160\161\229\158\146", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "FortCassidy",
        true
    }))
end)
v1729:Button("\233\152\191\231\145\159\229\160\161", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "FortArthur",
        true
    }))
end)
v1729:Button("\231\186\162\232\137\178\229\178\169\231\159\179\232\144\165\229\156\176", function()
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack({
        "RedRocks",
        true
    }))
end)
v1729:Toggle("\232\135\170\229\138\168\229\135\186\229\148\174", "\229\188\128\229\133\179", false, function(p1797)
    getgenv().sell = p1797
    sell()
end)
v1729:Toggle("\230\137\139\230\158\170\229\173\144\229\188\185", "\229\188\128\229\133\179", false, function(p1798)
    getgenv().buyammo1 = p1798
    buyammo1()
end)
v1729:Toggle("\230\173\165\230\158\170\229\173\144\229\188\185", "\229\188\128\229\133\179", false, function(p1799)
    getgenv().buyammo2 = p1799
    buyammo2()
end)
v1729:Toggle("\232\180\173\228\185\176\231\174\173\231\159\162", "\229\188\128\229\133\179", false, function(p1800)
    getgenv().buyammo3 = p1800
    buyammo3()
end)
v1729:Toggle("\233\156\176\229\188\185\229\173\144\229\188\185", "\229\188\128\229\133\179", false, function(p1801)
    getgenv().buyammo4 = p1801
    buyammo4()
end)
v1729:Toggle("\231\139\153\229\135\187\229\173\144\229\188\185", "\229\188\128\229\133\179", false, function(p1802)
    getgenv().buyammo5 = p1802
    buyammo5()
end)
v1729:Toggle("\229\176\143\229\158\139\231\130\184\232\141\175", "\229\188\128\229\133\179", false, function(p1803)
    getgenv().buyammo6 = p1803
    buyammo6()
end)
v1729:Toggle("\229\164\167\229\158\139\231\130\184\232\141\175", "\229\188\128\229\133\179", false, function(p1804)
    getgenv().buyammo7 = p1804
    buyammo7()
end)
v1729:Toggle("\231\153\189\229\164\169", "\229\188\128\229\133\179", false, function()
    if not _G.FullBrightExecuted then
        _G.FullBrightEnabled = false
        local v1805 = _G
        local v1806 = {
            Brightness = game:GetService("Lighting").Brightness,
            ClockTime = game:GetService("Lighting").ClockTime,
            FogEnd = game:GetService("Lighting").FogEnd,
            GlobalShadows = game:GetService("Lighting").GlobalShadows,
            Ambient = game:GetService("Lighting").Ambient
        }
        v1805.NormalLightingSettings = v1806
        game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
            if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Brightness = 1
            end
        end)
        game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
            if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").ClockTime = 12
            end
        end)
        game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
            if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").FogEnd = 786543
            end
        end)
        game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
            if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").GlobalShadows = false
            end
        end)
        game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
            if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            end
        end)
        game:GetService("Lighting").Brightness = 1
        game:GetService("Lighting").ClockTime = 12
        game:GetService("Lighting").FogEnd = 786543
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
        local vu1807 = true
        spawn(function()
            repeat
                wait()
            until _G.FullBrightEnabled
            while wait() do
                if _G.FullBrightEnabled ~= vu1807 then
                    if _G.FullBrightEnabled then
                        game:GetService("Lighting").Brightness = 1
                        game:GetService("Lighting").ClockTime = 12
                        game:GetService("Lighting").FogEnd = 786543
                        game:GetService("Lighting").GlobalShadows = false
                        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                    else
                        game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                        game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                        game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                        game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                        game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                    end
                    vu1807 = not vu1807
                end
            end
        end)
    end
    _G.FullBrightExecuted = true
    _G.FullBrightEnabled = not _G.FullBrightEnabled
end)
v1729:Button("\230\137\139\230\140\129\232\191\145\230\136\152", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CX5200/Sword-Guest/main/killQWQ"))()
end)
local v1808 = v31:Tab("\229\136\128\229\136\131\231\144\131", "7733993211"):section("\229\136\128\229\136\131\231\144\131", true)
v1808:Toggle("\232\135\170\229\138\168\229\135\187\231\144\1311", "\229\188\128\229\133\179", false, function(p1809)
    if p1809 then
        local function vu1814()
            local v1810, v1811, v1812 = ipairs(workspace.Ball:GetChildren())
            while true do
                local v1813
                v1812, v1813 = v1810(v1811, v1812)
                if v1812 == nil then
                    break
                end
                if v1813:GetAttribute("realBall") and v1813:IsA("BasePart") then
                    return v1813
                end
            end
        end
        game:GetService("RunService").Heartbeat:Connect(function()
            local v1815 = vu1814()
            if v1815 then
                local v1816 = v1815.zoomies.VectorVelocity.Magnitude
                local v1817 = v1815.Position
                if (game:GetService("Players").LocalPlayer:DistanceFromCharacter(v1817) - 12) / v1816 <= 0.7 then
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                end
            end
        end)
    end
end)
v1808:Button("\232\135\170\229\138\168\229\135\187\231\144\1312", function()
    if game.Name ~= "Blade Ball Game" then
        notifications:notify({
            Title = "\232\132\154\230\156\172\228\184\173\229\191\131",
            Description = "",
            Icon = 17493876383,
            Accept = {
                Text = "\229\165\189\231\154\132",
                Callback = function()
                    print(":D")
                end
            },
            Length = 5
        })
        return
    else
        while true do
            game.ParryBladeBall()
            wait(0.5)
        end
    end
end)
v1808:Button("\232\135\170\229\138\168\230\139\155\230\158\182", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SPHubReal/SP_Hub/refs/heads/main/BladeBall"))()
end)
v1808:Button("\229\136\128\229\136\131\231\144\1311", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()
end)
v1808:Button("\229\136\128\229\136\131\231\144\1312", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
end)
v1808:Button("\229\136\128\229\136\131\231\144\1313", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
end)
v1808:Button("\229\136\128\229\136\131\231\144\1314", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MagoKazinn/Makzinn_hub/main/makzinn_Hub"))()
end)
v1808:Button("\229\136\128\229\136\131\231\144\1315", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/Flux-Z-Beta/refs/heads/main/Flux-Z-Beta-Blade-Ball.lua"))()
end)
local v1818 = v31:Tab("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\186", "7733993211"):section("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\186", true)
v1818:Button("\229\158\131\229\156\190\230\161\182\229\164\167\231\142\139", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1861", function()
    loadstring(game:HttpGet("https://freenote.biz/raw/xkcdkgyhkx", true))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1862", function()
    loadstring(game:HttpGet("https://pastefy.app/HxjXAU2d/raw"))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1863", function()
    loadstring(Game:HttpGet("https://pastefy.app/oKLqVHKF/raw"))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1864", function()
    loadstring(game:HttpGet("https://pastefy.app/REPoaFWC/raw", true))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1865", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1866", function()
    loadstring(Game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tsbscripts/main/Main"))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1867", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RealOfficialSkully/Smm/main/Smm"))()
end)
v1818:Button("\230\156\128\229\157\154\229\188\186\231\154\132\230\136\152\229\156\1868", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-JJS-GOJO-22766"))()
end)
local v1819 = v31:Tab("\231\160\180\229\157\143\232\128\133\232\176\156\229\155\162", "7733993211"):section("\231\160\180\229\157\143\232\128\133\232\176\156\229\155\162", true)
v1819:Button("\231\160\180\229\157\143\232\128\133\232\176\156\229\155\1621", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script", true))()
end)
v1819:Button("\231\160\180\229\157\143\232\128\133\232\176\156\229\155\1622", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
end)
v1819:Button("YARHM", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
end)
v1819:Toggle("\231\142\169\229\174\182\233\128\143\232\167\134", "", false, function(p1820)
    getgenv().AllEsp = p1820
    local v1821, v1822, v1823 = ipairs(ESPFolder:GetChildren())
    while true do
        local v1824
        v1823, v1824 = v1821(v1822, v1823)
        if v1823 == nil then
            break
        end
        if v1824:IsA("BillboardGui") then
            local v1825 = v1824.Name:sub(1, - 10)
            local v1826 = game.Players:FindFirstChild(v1825)
            if v1826 and v1826.Character and not (v1826.Character:FindFirstChild("Knife") or v1826.Backpack:FindFirstChild("Knife") or (v1826.Character:FindFirstChild("Gun") or v1826.Backpack:FindFirstChild("Gun"))) then
                v1824.Enabled = p1820
            end
        end
    end
end)
v1819:Toggle("\232\173\166\233\149\191\233\128\143\232\167\134", "", false, function(p1827)
    getgenv().SheriffEsp = p1827
    local v1828, v1829, v1830 = ipairs(ESPFolder:GetChildren())
    while true do
        local v1831
        v1830, v1831 = v1828(v1829, v1830)
        if v1830 == nil then
            break
        end
        if v1831:IsA("BillboardGui") then
            local v1832 = v1831.Name:sub(1, - 10)
            local v1833 = game.Players:FindFirstChild(v1832)
            if v1833 and (v1833.Character:FindFirstChild("Gun") or v1833.Backpack:FindFirstChild("Gun")) then
                v1831.Enabled = p1827
            end
        end
    end
end)
v1819:Toggle("\230\157\128\230\137\139\233\128\143\232\167\134", "", false, function(p1834)
    getgenv().MurderEsp = p1834
    local v1835, v1836, v1837 = ipairs(ESPFolder:GetChildren())
    while true do
        local v1838
        v1837, v1838 = v1835(v1836, v1837)
        if v1837 == nil then
            break
        end
        if v1838:IsA("BillboardGui") then
            local v1839 = v1838.Name:sub(1, - 10)
            local v1840 = game.Players:FindFirstChild(v1839)
            if v1840 and (v1840.Character:FindFirstChild("Knife") or v1840.Backpack:FindFirstChild("Knife")) then
                v1838.Enabled = p1834
            end
        end
    end
end)
v1819:Toggle("\229\173\144\229\188\185\232\140\131\229\155\180", "", false, function(_)
    local vu1841 = nil
    local _ = hookmetamethod(game, "__namecall", function(p1842, ...)
        local v1843 = getnamecallmethod()
        local v1844 = {
            ...
        }
        if not checkcaller() and (typeof(p1842) == "Instance" and (p1842.Name == "ShootGun" and (v1843 == "InvokeServer" and Toggles.SilentAim.Value))) and (Options.SilentAim:GetState() and murderer) then
            local v1845 = murderer.Character.PrimaryPart
            local v1846 = v1845.AssemblyLinearVelocity
            v1844[2] = v1845.Position + v1846 * Vector3.new(Options.Prediction.Value / 200, 0, Options.Prediction.Value / 200)
        end
        return vu1841(p1842, unpack(v1844))
    end)
end)
local v1847 = v31:Tab("\231\155\145\231\139\177\228\186\186\231\148\159", "7733993211")
local v1848 = v1847:section("\232\132\154\230\156\172", true)
v1848:Button("\230\151\160\230\149\140\230\168\161\229\188\143", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)
v1848:Button("\230\157\128\230\173\187\230\137\128\230\156\137\228\186\186", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
end)
v1848:Toggle("\232\135\170\229\138\168\230\157\128\230\137\128\230\156\137\228\186\186", "text", false, function(p1849)
    if p1849 then
        print("Toggle On")
        isAutoKillRunning = true
        spawn(AutoKillLoop)
        spawn(AutoJump)
    else
        print("Toggle Off")
        isAutoKillRunning = false
    end
end)
v1848:Toggle("\229\136\160\233\153\164\233\151\168", "text", false, function(p1850)
    if p1850 then
        print("Toggle On")
        local v1851, v1852, v1853 = pairs(workspace.Doors:GetChildren())
        while true do
            local v1854
            v1853, v1854 = v1851(v1852, v1853)
            if v1853 == nil then
                break
            end
            v1854.Parent = game:service("ReplicatedStorage").nikodoors
        end
    else
        print("Toggle Off")
        local v1855, v1856, v1857 = pairs(game:service("ReplicatedStorage").nikodoors:GetChildren())
        while true do
            local v1858
            v1857, v1858 = v1855(v1856, v1857)
            if v1857 == nil then
                break
            end
            v1858.Parent = workspace.Doors
        end
    end
end)
v1848:Button("\233\128\174\230\141\149\230\137\128\230\156\137\231\189\170\231\138\175", function()
    wait(0.1)
    vu1209 = game.Players.LocalPlayer
    Pcf = vu1209.Character.HumanoidRootPart.CFrame
    local v1859, v1860, v1861 = pairs(game.Teams.Criminals:GetPlayers())
    while true do
        local v1862
        v1861, v1862 = v1859(v1860, v1861)
        if v1861 == nil then
            break
        end
        if v1862.Name ~= vu1209.Name then
            local v1863 = 10
            repeat
                wait()
                v1863 = v1863 - 1
                game.Workspace.Remote.arrest:InvokeServer(v1862.Character.HumanoidRootPart)
                vu1209.Character.HumanoidRootPart.CFrame = v1862.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until v1863 == 0
        end
    end
end)
v1848:Button("\229\143\152\233\146\162\233\147\129\228\190\160", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
end)
v1848:Button("\229\143\152\230\173\187\231\165\158", function()
    loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
end)
v1848:Button("\229\143\152\232\189\166\230\168\161\229\158\139", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
end)
v1848:Button("\229\143\152\230\136\144\232\173\166\229\175\159", function()
    workspace.Remote.TeamEvent:FireServer("Bright blue")
end)
v1848:Button("\229\143\152\230\136\144\229\155\154\231\138\175", function()
    workspace.Remote.TeamEvent:FireServer("Bright orange")
end)
v1848:Button("\230\137\139\233\135\140\229\137\145\231\167\146\230\157\128", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/jian"))()
end)
v1848:Button("\231\155\145\231\139\177\228\186\186\231\148\1591", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua"))()
end)
v1848:Button("\231\155\145\231\139\177\228\186\186\231\148\1592", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
end)
v1848:Button("\231\155\145\231\139\177\228\186\186\231\148\159\230\177\137\229\140\150", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/fYMnAEeJ"))()
end)
v1848:Button("\231\155\145\231\139\177\228\186\186\231\148\1593", function()
    loadstring("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/g00lXploiter/g00lXploiter/main/Fe%20bypass\", true))()\n")()
end)
v1848:Button("\231\155\145\231\139\177\228\186\186\231\148\1594", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie"))()
end)
local v1864 = v1847:section("\228\188\160\233\128\129\229\138\159\232\131\189", true)
v1864:Button("\232\173\166\229\141\171\229\174\164", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
end)
v1864:Button("\231\155\145\231\139\177\229\174\164\229\134\133", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
end)
v1864:Button("\231\155\145\231\139\177\229\174\164\229\164\150", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end)
v1864:Button("\231\138\175\231\189\170\229\164\141\230\180\187\231\130\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 937.5891723632812, 93.09876251220703, 2063.031982421875)
end)
v1864:Button("\228\188\160\233\128\129\233\153\162\229\173\144", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
end)
v1864:Button("\228\188\160\233\128\129\232\173\166\232\189\166\229\186\147", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
end)
v1864:Button("\228\188\160\233\128\129\230\173\187\228\186\186\228\184\139\230\176\180\233\129\147", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.4256591796875, 78.69828033447266, 2416.18359375)
end)
v1864:Button("\228\188\160\233\128\129\233\163\159\229\160\130", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.0059204101562, 99.98993682861328, 2289.23095703125)
end)
local v1865 = v31:Tab("\230\157\128\230\137\139\228\184\142\232\173\166\233\149\191", "7733993211"):section("\230\157\128\230\137\139\228\184\142\232\173\166\233\149\191", true)
v1865:Button("\230\157\128\230\137\139\228\184\142\232\173\166\233\149\1911", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yadbPQUm", true))()
end)
v1865:Button("\230\157\128\230\137\139\228\184\142\232\173\166\233\149\191\231\167\146\230\157\128", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
end)
v1865:Button("\233\128\143\232\167\134", function(_)
    while wait(1) do
        local v1866, v1867, v1868 = pairs(game.Players:GetPlayers())
        local function vu1870(p1869)
            if p1869.Character and p1869.Character:FindFirstChildOfClass("Humanoid") then
                p1869.Character.Humanoid.NameDisplayDistance = 9000000000
                p1869.Character.Humanoid.NameOcclusion = "NoOcclusion"
                p1869.Character.Humanoid.HealthDisplayDistance = 9000000000
                p1869.Character.Humanoid.HealthDisplayType = "AlwaysOn"
                p1869.Character.Humanoid.Health = p1869.Character.Humanoid.Health
            end
        end
        while true do
            local vu1871
            v1868, vu1871 = v1866(v1867, v1868)
            if v1868 == nil then
                break
            end
            vu1870(vu1871)
            vu1871.CharacterAdded:Connect(function()
                task.wait(0.33)
                vu1870(vu1871)
            end)
        end
        game.Players.PlayerAdded:Connect(function(pu1872)
            vu1870(pu1872)
            pu1872.CharacterAdded:Connect(function()
                task.wait(0.33)
                vu1870(pu1872)
            end)
        end)
    end
end)
local v1873 = v31:Tab("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\168", "7733993211"):section("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\168", true)
v1873:Toggle("\230\151\160CD", "Toggle", false, function(p1874)
    local v1875 = game.Players.LocalPlayer
    local v1876 = (v1875.Character or v1875.CharacterAdded:Wait()):FindFirstChildOfClass("Tool") or v1875.Backpack:FindFirstChildOfClass("Tool")
    bazhangmnq = p1874
    while bazhangmnq do
        local v1877 = v1876:FindFirstChildOfClass("LocalScript")
        v1877:Clone()
        local v1878 = v1877:Clone()
        v1878:Clone()
        v1877:Destroy()
        v1878.Parent = v1876
        wait(0.1)
    end
end)
v1873:Button("\229\183\180\230\142\140\229\133\137\231\142\175", function(p1879)
    getgenv().SlapAura = p1879
    if p1879 == true then
        while getgenv().SlapAura do
            task.wait(0.005)
            pcall(function()
                local v1880 = next
                local v1881, v1882 = game.Players:GetPlayers()
                while true do
                    local v1883
                    v1882, v1883 = v1880(v1881, v1882)
                    if v1882 == nil then
                        break
                    end
                    if v1883 ~= game.Players.LocalPlayer and v1883.Character and (v1883.Character:FindFirstChild("entered") and (v1883.Character:FindFirstChild("Head") and (v1883.Character.Head:FindFirstChild("UnoReverseCard") == nil and (v1883.Character:FindFirstChild("rock") == nil and (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1883.Character.HumanoidRootPart.Position).Magnitude <= 25))))) then
                        shared.gloveHits[getGlove()]:FireServer(v1883.Character:WaitForChild("Head"))
                    end
                end
            end)
        end
    end
end)
v1873:Button("\232\142\183\229\143\150\232\174\161\230\149\176\229\153\168\230\137\139\229\165\151", function()
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(121)
    local v1884, v1885, v1886 = pairs(workspace.Maze:GetDescendants())
    while true do
        local v1887
        v1886, v1887 = v1884(v1885, v1886)
        if v1886 == nil then
            break
        end
        if v1887:IsA("ClickDetector") then
            fireclickdetector(v1887)
        end
    end
end)
v1873:Toggle("\229\156\176\231\137\162\228\186\174\229\186\166", "Toggle", false, function(p1888)
    Light = p1888
    if not Light then
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

v1873:Toggle("\232\142\183\229\143\150\231\130\188\233\135\145\230\156\175\229\184\136\230\157\144\230\150\153", "Toggle", false, function(p1897)
    AlchemistIngredients = p1897
    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
        while AlchemistIngredients do
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Mushroom")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Glowing Mushroom")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Fire Flower")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Winter Rose")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Dark Root")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Dire Flower")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Autumn Sprout")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Elder Wood")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Hazel Lily")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Wild Vine")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Jade Stone")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Lamp Grass")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Plane Flower")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Blood Rose")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Red Crystal")
            game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Blue Crystal")
            task.wait()
        end
    end
end)
v1873:Toggle("\232\135\170\229\138\168\229\138\160\229\133\165\231\171\158\230\138\128\229\156\186", "Toggle", false, function(p1898)
    AutoEnterArena = p1898
    while AutoEnterArena do
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
        end
        task.wait()
    end
end)
v1873:Toggle("\232\135\170\229\138\168\229\133\137\230\179\162\231\144\131", "Toggle", false, function(p1899)
    if Person == nil then
        Person = game.Players.LocalPlayer.Name
    end
    _G.RojoSpam = p1899
    while _G.RojoSpam do
        game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {
            game.Players[Person].Character.HumanoidRootPart.CFrame
        })
        task.wait()
    end
end)
v1873:Button("Rojo\230\138\128\232\131\189", function(p1900)
    _G.RojoSpam = p1900
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
    wait(6)
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    })
    task.wait()
end)
v1873:Toggle("\233\159\179\231\172\166\230\138\128\232\131\189", "Toggle", false, function(p1901)
    _G.RhythmSpam = p1901
    while _G.RhythmSpam do
        game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion", 0)
        task.wait()
    end
end)
v1873:Toggle("Null\230\138\128\232\131\189", "Toggle", false, function(p1902)
    NullSpam = p1902
    while NullSpam do
        game:GetService("ReplicatedStorage").NullAbility:FireServer()
        task.wait()
    end
end)
v1873:Toggle("\232\135\170\229\138\168\230\139\190\229\143\150\233\187\132\233\135\145\230\158\156\229\174\158", "Toggle", false, function(p1903)
    SlappleFarm = p1903
    while SlappleFarm do
        local v1904, v1905, v1906 = ipairs(workspace.Arena.island5.Slapples:GetDescendants())
        while true do
            local v1907
            v1906, v1907 = v1904(v1905, v1906)
            if v1906 == nil then
                break
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character:FindFirstChild("entered") and (v1907.Name == "Glove" and v1907:FindFirstChildWhichIsA("TouchTransmitter"))) then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1907, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1907, 1)
            end
        end
        task.wait()
    end
end)
v1873:Toggle("\232\135\170\229\138\168\230\141\161\233\163\158\232\161\140\229\174\157\231\143\160", "Toggle", false, function(p1908)
    Jetfarm = p1908
    while Jetfarm do
        local v1909, v1910, v1911 = pairs(game.Workspace:GetChildren())
        while true do
            local v1912
            v1911, v1912 = v1909(v1910, v1911)
            if v1911 == nil then
                break
            end
            if v1912.Name == "JetOrb" and v1912:FindFirstChild("TouchInterest") then
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v1912, 0)
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v1912, 1)
            end
        end
        task.wait()
    end
end)
v1873:Toggle("\232\135\170\229\138\168\230\141\161\231\155\184\228\189\141\231\144\131", "Toggle", false, function(p1913)
    Phasefarm = p1913
    while Phasefarm do
        local v1914, v1915, v1916 = pairs(game.Workspace:GetChildren())
        while true do
            local v1917
            v1916, v1917 = v1914(v1915, v1916)
            if v1916 == nil then
                break
            end
            if v1917.Name == "PhaseOrb" and v1917:FindFirstChild("TouchInterest") then
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v1917, 0)
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v1917, 1)
            end
        end
        task.wait()
    end
end)
v1873:Toggle("\232\135\170\229\138\168\229\136\183bob", "Toggle", false, function(p1918)
    ReplicaFarm = p1918
    while ReplicaFarm do
        local v1919, v1920, v1921 = pairs(workspace:GetChildren())
        while true do
            local v1922
            v1921, v1922 = v1919(v1920, v1921)
            if v1921 == nil then
                break
            end
            if v1922.Name:match(game.Players.LocalPlayer.Name) and v1922:FindFirstChild("HumanoidRootPart") then
                game.ReplicatedStorage.b:FireServer(v1922:WaitForChild("HumanoidRootPart"))
            end
        end
        task.wait()
        game:GetService("ReplicatedStorage").Duplicate:FireServer()
        task.wait(7)
    end
end)
v1873:Toggle("\230\151\160\233\153\144\229\143\141\232\189\172", "Toggle", false, function(p1923)
    _G.InfReverse = p1923
    while _G.InfReverse do
        game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
        wait(6)
    end
end)
v1873:Toggle("\229\189\169\232\153\185\232\167\146\232\137\178(\232\163\133\229\164\135\233\187\132\233\135\145\230\137\139\229\165\151)", "Toggle", false, function(p1924)
    _G.Rainbow = p1924
    while _G.Rainbow do
        for v1925 = 0, 1, 0.025 do
            game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(v1925, 1, 1)))
            task.wait()
        end
    end
end)
v1873:Toggle("\233\152\178\229\135\187\233\163\158", "Toggle", false, function(p1926)
    AntiRagdoll = p1926
    if AntiRagdoll then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
                if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.Torso.Anchored = true
                    until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                    game.Players.LocalPlayer.Character.Torso.Anchored = false
                end
            end)
        end)
    end
end)
v1873:Toggle("\229\143\141\232\153\154\231\169\186(\233\148\166\230\160\135\232\181\155\228\185\159\230\156\137\230\149\136\230\158\156)", "Toggle", false, function(p1927)
    game.Workspace.dedBarrier.CanCollide = p1927
    game.Workspace.TAntiVoid.CanCollide = p1927
end)
v1873:Toggle("\233\152\178\230\173\187\228\186\161\229\177\143\233\154\156", "Toggle", false, function(p1928)
    if p1928 == true then
        local v1929, v1930, v1931 = pairs(game.Workspace.DEATHBARRIER:GetChildren())
        while true do
            local v1932
            v1931, v1932 = v1929(v1930, v1931)
            if v1931 == nil then
                break
            end
            if v1932.ClassName == "Part" and v1932.Name == "BLOCK" then
                v1932.CanTouch = false
            end
        end
        workspace.DEATHBARRIER.CanTouch = false
        workspace.DEATHBARRIER2.CanTouch = false
        workspace.dedBarrier.CanTouch = false
        workspace.ArenaBarrier.CanTouch = false
        workspace.AntiDefaultArena.CanTouch = false
    else
        local v1933, v1934, v1935 = pairs(game.Workspace.DEATHBARRIER:GetChildren())
        while true do
            local v1936
            v1935, v1936 = v1933(v1934, v1935)
            if v1935 == nil then
                break
            end
            if v1936.ClassName == "Part" and v1936.Name == "BLOCK" then
                v1936.CanTouch = true
            end
        end
        workspace.DEATHBARRIER.CanTouch = true
        workspace.DEATHBARRIER2.CanTouch = true
        workspace.dedBarrier.CanTouch = true
        workspace.ArenaBarrier.CanTouch = true
        workspace.AntiDefaultArena.CanTouch = true
    end
end)
v1873:Toggle("\229\143\141\229\183\180\232\165\191", "Toggle", false, function(p1937)
    if p1937 == true then
        local v1938, v1939, v1940 = pairs(game.Workspace.Lobby.brazil:GetChildren())
        while true do
            local v1941
            v1940, v1941 = v1938(v1939, v1940)
            if v1940 == nil then
                break
            end
            v1941.CanTouch = false
        end
    else
        local v1942, v1943, v1944 = pairs(game.Workspace.Lobby.brazil:GetChildren())
        while true do
            local v1945
            v1944, v1945 = v1942(v1943, v1944)
            if v1944 == nil then
                break
            end
            v1945.CanTouch = true
        end
    end
end)
v1873:Toggle("\229\143\141\230\173\187\228\186\161\230\150\185\229\157\151", "Toggle", false, function(p1946)
    if p1946 == true then
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
    else
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
    end
end)
v1873:Toggle("\229\143\141\228\184\138\229\184\157\230\138\128\232\131\189", "Toggle", false, function(p1947)
    AntiTimestop = p1947
    while AntiTimestop do
        local v1948, v1949, v1950 = pairs(game.Players.LocalPlayer.Character:GetChildren())
        while true do
            local v1951
            v1950, v1951 = v1948(v1949, v1950)
            if v1950 == nil then
                break
            end
            if v1951.ClassName == "Part" then
                v1951.Anchored = false
            end
        end
        task.wait()
    end
end)
v1873:Toggle("\229\143\141\233\177\191\233\177\188", "Toggle", false, function(p1952)
    AntiSquid = p1952
    if AntiSquid == false then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
    end
    while AntiSquid do
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
        end
        task.wait()
    end
end)
v1873:Toggle("\229\143\141\231\165\158\229\156\163\230\157\176\229\133\139", "Toggle", false, function(p1953)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = p1953
end)
v1873:Toggle("\229\143\141\228\188\160\233\128\129\229\184\166", "Toggle", false, function(p1954)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = p1954
end)
v1873:Toggle("\229\143\141\230\157\191\231\160\150", "Toggle", false, function(p1955)
    AntiBrick = p1955
    while AntiBrick do
        local v1956, v1957, v1958 = pairs(game.Workspace:GetChildren())
        while true do
            local v1959
            v1958, v1959 = v1956(v1957, v1958)
            if v1958 == nil then
                break
            end
            if v1959.Name == "Union" then
                v1959.CanTouch = false
            end
        end
        task.wait()
    end
end)
v1873:Toggle("\229\143\141Null", "Toggle", false, function(p1960)
    AntiNull = p1960
    while AntiNull do
        local v1961, v1962, v1963 = pairs(game.Workspace:GetChildren())
        while true do
            local v1964
            v1963, v1964 = v1961(v1962, v1963)
            if v1963 == nil then
                break
            end
            if v1964.Name == "Imp" and v1964:FindFirstChild("Body") then
                shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v1964.Body, true)
            end
        end
        task.wait()
    end
end)
v1873:Button("\232\135\170\229\138\168\229\136\183\229\183\180\230\142\140", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1681", function()
    loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1682", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1683", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1684", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Ab-admin-glove-badge/main/Ab%20glovr%20badge%20admin"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1685", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/SlapBattle_Scripts/main/God_Mode_V2"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1686", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1687", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1688", function()
    loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
end)
v1873:Button("\229\183\180\230\142\140\230\168\161\230\139\159\229\153\1689", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))()
end)
local v1965 = v31:Tab("\229\133\181\229\183\165\229\142\130", "7733993211"):section("\229\133\181\229\183\165\229\142\130", true)
v1965:Button("\230\151\160\233\153\144\229\173\144\229\188\185", function()
    while wait(0.5) do
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 100
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 100
    end
end)
v1965:Button("\229\191\171\233\128\159\229\176\132\229\135\187", function()
    local v1966 = game.ReplicatedStorage
    local v1967, v1968, v1969 = pairs(v1966.Weapons:GetDescendants())
    while true do
        local v1970
        v1969, v1970 = v1967(v1968, v1969)
        if v1969 == nil then
            break
        end
        if v1970.Name == "Auto" then
            v1970.Value = true
        end
        if v1970.Name == "RecoilControl" then
            v1970.Value = 0
        end
        if v1970.Name == "MaxSpread" then
            v1970.Value = 0
        end
        if v1970.Name == "ReloadTime" then
            v1970.Value = 0
        end
        if v1970.Name == "FireRate" then
            v1970.Value = 0.05
        end
        if v1970.Name == "Crit" then
            v1970.Value = 20
        end
    end
end)
v1965:Button("\229\188\128\229\144\175\233\128\143\232\167\134", function()
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
    _G.EnemyColor = Color3.fromRGB(255, 0, 0)
    _G.UseTeamColor = true
    local vu1971 = Instance.new("Folder", game.CoreGui)
    vu1971.Name = "ESP"
    local vu1972 = Instance.new("BoxHandleAdornment")
    vu1972.Name = "nilBox"
    vu1972.Size = Vector3.new(1, 2, 1)
    vu1972.Color3 = Color3.new(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
    vu1972.Transparency = 0.7
    vu1972.ZIndex = 0
    vu1972.AlwaysOnTop = false
    vu1972.Visible = false
    local vu1973 = Instance.new("BillboardGui")
    vu1973.Name = "nilNameTag"
    vu1973.Enabled = false
    vu1973.Size = UDim2.new(0, 200, 0, 50)
    vu1973.AlwaysOnTop = true
    vu1973.StudsOffset = Vector3.new(0, 1.8, 0)
    local v1974 = Instance.new("TextLabel", vu1973)
    v1974.Name = "Tag"
    v1974.BackgroundTransparency = 1
    v1974.Position = UDim2.new(0, - 50, 0, 0)
    v1974.Size = UDim2.new(0, 300, 0, 20)
    v1974.TextSize = 15
    v1974.TextColor3 = Color3.new(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
    v1974.TextStrokeColor3 = Color3.new(0, 0, 0)
    v1974.TextStrokeTransparency = 0.4
    v1974.Text = "nil"
    v1974.Font = Enum.Font.SourceSansBold
    v1974.TextScaled = false
    local function vu1981(pu1975)
        repeat
            wait()
        until pu1975.Character ~= nil
        pu1975.Character:WaitForChild("Humanoid")
        local v1976 = vu1971:FindFirstChild(pu1975.Name)
        v1976:ClearAllChildren()
        local v1977 = vu1972:Clone()
        v1977.Name = pu1975.Name .. "Box"
        v1977.Adornee = pu1975.Character
        v1977.Parent = v1976
        local v1978 = vu1973:Clone()
        v1978.Name = pu1975.Name .. "NameTag"
        v1978.Enabled = true
        v1978.Parent = v1976
        v1978.Adornee = pu1975.Character:WaitForChild("Head", 5)
        if not v1978.Adornee then
            return UnloadCharacter(pu1975)
        end
        v1978.Tag.Text = pu1975.Name
        v1977.Color3 = Color3.new(pu1975.TeamColor.r, pu1975.TeamColor.g, pu1975.TeamColor.b)
        v1978.Tag.TextColor3 = Color3.new(pu1975.TeamColor.r, pu1975.TeamColor.g, pu1975.TeamColor.b)
        local vu1979 = nil
        local function v1980()
            if not pcall(function()
                pu1975.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                math.floor(pu1975.Character.Humanoid.MaxHealth)
                math.floor(pu1975.Character.Humanoid.Health)
            end) then
                vu1979:Disconnect()
            end
        end
        v1980()
        vu1979 = pu1975.Character.Humanoid.Changed:Connect(v1980)
    end
    local function vu1984(p1982)
        local v1983 = vu1971:FindFirstChild(p1982.Name)
        if v1983 and (v1983:FindFirstChild(p1982.Name .. "Box") ~= nil or v1983:FindFirstChild(p1982.Name .. "NameTag") ~= nil) then
            v1983:ClearAllChildren()
        end
    end
    local function vu1987(pu1985)
        Instance.new("Folder", vu1971).Name = pu1985.Name
        pu1985.CharacterAdded:Connect(function()
            pcall(vu1981, pu1985)
        end)
        pu1985.CharacterRemoving:Connect(function()
            pcall(vu1984, pu1985)
        end)
        pu1985.Changed:Connect(function(p1986)
            if p1986 == "TeamColor" then
                vu1984(pu1985)
                wait()
                vu1981(pu1985)
            end
        end)
        vu1981(pu1985)
    end
    local function vu1990(p1988)
        vu1984(p1988)
        local v1989 = vu1971:FindFirstChild(p1988.Name)
        if v1989 then
            v1989:Destroy()
        end
    end
    local v1991, v1992, v1993 = pairs(game:GetService("Players"):GetPlayers())
    while true do
        local vu1994
        v1993, vu1994 = v1991(v1992, v1993)
        if v1993 == nil then
            break
        end
        spawn(function()
            pcall(vu1987, vu1994)
        end)
    end
    game:GetService("Players").PlayerAdded:Connect(function(p1995)
        pcall(vu1987, p1995)
    end)
    game:GetService("Players").PlayerRemoving:Connect(function(p1996)
        pcall(vu1990, p1996)
    end)
    game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
    if not _G.Reantheajfdfjdgs then
        _G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"
        local v1997 = game:GetService("Players")
        local v1998 = v1997.LocalPlayer
        function esp(p1999, p2000)
            if p1999.Character then
                if p1999.Character:FindFirstChild("GetReal") then
                    p1999.Character.GetReal.FillColor = p2000
                else
                    local v2001 = Instance.new("Highlight")
                    v2001.RobloxLocked = true
                    v2001.Name = "GetReal"
                    v2001.Adornee = p1999.Character
                    v2001.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v2001.FillColor = p2000
                    v2001.Parent = p1999.Character
                end
            end
        end
        while task.wait() do
            local v2002, v2003, v2004 = pairs(v1997:GetPlayers())
            while true do
                local v2005, v2006 = v2002(v2003, v2004)
                if v2005 == nil then
                    break
                end
                v2004 = v2005
                if v2006 ~= v1998 then
                    esp(v2006, _G.UseTeamColor and v2006.TeamColor.Color or (v1998.TeamColor == v2006.TeamColor and _G.FriendColor or _G.EnemyColor))
                end
            end
        end
    end
end)
v1965:Toggle("\233\128\159\229\186\166", "\229\188\128\229\133\179", false, function(p2007)
    if p2007 == true then
        sudu = game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character and (game:GetService("Players").LocalPlayer.Character.Humanoid and (game:GetService("Players").LocalPlayer.Character.Humanoid.Parent and game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0)) then
                game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
            end
        end)
    elseif not p2007 and sudu then
        sudu:Disconnect()
        sudu = nil
    end
end)
v1965:Slider("\233\128\159\229\186\166\232\174\190\231\189\174", "", 1, 1, 1000, false, function(p2008)
    Speed = p2008
end)
v1965:Button("\230\151\160\233\153\144\232\183\179\232\183\131", function()
    game:GetService("UserInputService").JumpRequest:connect(function()
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)
v1965:Button("\229\133\181\229\183\165\229\142\1301", function()
    loadstring(game:HttpGet("https://pastefy.app/2YdrWHxV/raw"))()
end)
v1965:Button("\229\133\181\229\183\165\229\142\1302", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Arsenal/MainFile"))()
end)
v1965:Button("\229\133\181\229\183\165\229\142\1303", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
end)
v1965:Button("\229\133\181\229\183\165\229\142\1304", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
end)
local v2009 = v31:Tab("\233\169\190\233\169\182\229\184\157\229\155\189", "7733993211"):section("\233\169\190\233\169\182\229\184\157\229\155\189", true)
v2009:Button("\233\169\190\233\169\182\229\184\157\229\155\189", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
end)
vu1121 = game:GetService("Players").LocalPlayer
Camera = workspace.CurrentCamera
VirtualUser = game:GetService("VirtualUser")
MarketplaceService = game:GetService("MarketplaceService")
function GetCurrentVehicle()
    local v2010 = vu1121.Character and (vu1121.Character:FindFirstChild("Humanoid") and vu1121.Character.Humanoid.SeatPart)
    if v2010 then
        v2010 = vu1121.Character.Humanoid.SeatPart.Parent
    end
    return v2010
end
function TP(p2011)
    local v2012 = p2011 * CFrame.Angles(0, math.rad(179), 0)
    GetCurrentVehicle():SetPrimaryPartCFrame(v2012)
end
function VelocityTP(p2013)
    TeleportSpeed = math.random(200, 600)
    Car = GetCurrentVehicle()
    local v2014 = Instance.new("BodyGyro", Car.PrimaryPart)
    v2014.P = 5000
    v2014.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
    local v2015 = p2013 * CFrame.Angles(0, math.rad(179), 0)
    v2014.CFrame = v2015
    local v2016 = Instance.new("BodyVelocity", Car.PrimaryPart)
    v2016.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
    v2016.Velocity = CFrame.new(Car.PrimaryPart.Position, v2015.p).LookVector * TeleportSpeed
    wait((Car.PrimaryPart.Position - v2015.p).Magnitude / TeleportSpeed)
    v2016.Velocity = Vector3.new()
    wait(0.1)
    v2016:Destroy()
    v2014:Destroy()
end
StartPosition = CFrame.new(Vector3.new(- 266.9512634277344, 13.399009704589844, 2988.3271484375), Vector3.new(0, 0, 0))
EndPosition = CFrame.new(Vector3.new(- 674.181640625, 13.415157318115234, 5011.521484375), Vector3.new(0, 0, 0))
AutoFarmFunc = coroutine.create(function()
    while wait() do
        if not AutoFarm then
            AutoFarmRunning = false
            coroutine.yield()
        end
        AutoFarmRunning = true
        pcall(function()
            if GetCurrentVehicle() or tick() - (LastNotif or 0) <= 5 then
                TP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 0.8, 0)))
                VelocityTP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 0.8, 0)))
                TP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 0.8, 0)))
                VelocityTP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 0.8, 0)))
            else
                LastNotif = tick()
                SendNotification("Aloha Scripts", "Please Enter A Vehicle!")
            end
        end)
    end
end)
v2009:Toggle("\232\135\170\229\138\168\233\169\190\233\169\182(\229\136\183\233\146\177)", "", false, function(p2017)
    AutoFarm = p2017
    if p2017 and not AutoFarmRunning then
        coroutine.resume(AutoFarmFunc)
    end
end)
v2009:Toggle("\232\167\166\230\145\184\229\156\176\233\157\162", "", false, function(p2018)
    TouchTheRoad = p2018
end)
local v2019 = v31:Tab("\233\147\178\233\155\170\230\168\161\230\139\159\229\153\168", "7733993211")
local v2020 = v2019:section("\233\147\178\233\155\170\230\168\161\230\139\159\229\153\168", true)
v2020:Toggle("\232\135\170\229\138\168\230\148\182\233\155\134\233\155\170", "", false, function(p2021)
    toggle = p2021
    while toggle do
        wait()
        local v2022 = {
            workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
            "Snow1",
            "MagicWand"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(v2022))
    end
end)
v2020:Toggle("\232\135\170\229\138\168\229\135\186\229\148\174\233\155\170\239\188\136\232\166\129\228\188\160\233\128\129\229\136\176\230\140\135\229\174\154\229\156\176\230\150\185\239\188\137", "", false, function(p2023)
    toggle = p2023
    while toggle do
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack({
            "SellSnow",
            "Frosty"
        }))
    end
end)
local v2024 = v2019:section("\228\188\160\233\128\129\229\138\159\232\131\189", true)
v2024:Button("\228\188\160\233\128\129\229\135\186\229\148\174\233\155\170\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, - 66.55204010009766)
end)
v2024:Button("\228\188\160\233\128\129\228\185\176\232\189\166\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, - 141.703125)
end)
v2024:Button("\228\188\160\233\128\129\228\185\176\229\183\165\229\133\183\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, - 12.935890197753906)
end)
v2024:Button("\228\188\160\233\128\129\228\185\176\232\131\140\229\140\133\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, - 16.793842315673828)
end)
v2024:Button("\228\188\160\233\128\129\228\185\176\229\129\135\230\151\165\231\164\188\231\137\169\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)
end)
v2024:Button("\228\188\160\233\128\129\228\185\176\229\174\160\231\137\169\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)
end)
v2024:Button("\228\188\160\233\128\129\232\182\133\229\164\167\233\147\178\233\155\170\231\154\132\229\156\176\230\150\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 391.4309997558594, 15.84949016571045, 150.15187072753906)
end)
local v2025 = v31:Tab("\229\189\169\232\153\185\230\156\139\229\143\139", "7733993211"):section("\229\189\169\232\153\185\230\156\139\229\143\139", true)
v2025:Button("\229\189\169\232\153\185\230\156\139\229\143\1391", function()
    loadstring(game:HttpGet("https://pastefy.app/XoNv04vR/raw"))()
end)
v2025:Button("\232\135\170\229\138\168\230\148\182\233\155\134", function()
    attempts = 0
    local v2026, v2027, v2028 = pairs(game:GetService("Workspace"):GetChildren())
    while true do
        local v2029
        v2028, v2029 = v2026(v2027, v2028)
        if v2028 == nil then
            break
        end
        if v2029:FindFirstChild("TouchTrigger") and attempts < 10 then
            attempts = attempts + 1
            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v2029.TouchTrigger, 0)
        end
    end
end)
v2025:Button("\232\135\170\229\138\168\230\148\190\231\189\174", function()
    game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true)
    firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
    task.wait()
    firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
end)
v2025:Toggle("\230\128\170\231\137\169\233\128\143\232\167\134", "", false, function(p2030)
    if p2030 then
        event = game:GetService("RunService").RenderStepped:Connect(function()
            local v2031, v2032, v2033 = pairs(game:GetService("Workspace").Monsters:GetChildren())
            while true do
                local v2034
                v2033, v2034 = v2031(v2032, v2033)
                if v2033 == nil then
                    break
                end
                if not v2034:FindFirstChild("Lol") then
                    local v2035 = Instance.new("Highlight", v2034)
                    v2035.Name = "Lol"
                    v2035.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v2035.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not p2030 then
        event:Disconnect()
        local v2036, v2037, v2038 = pairs(game:GetService("Workspace").Monsters:GetChildren())
        while true do
            local v2039
            v2038, v2039 = v2036(v2037, v2038)
            if v2038 == nil then
                break
            end
            v2039:FindFirstChild("Lol"):Destroy()
        end
    end
end)
v2025:Toggle("\231\137\169\229\147\129\233\128\143\232\167\134", "", false, function(p2040)
    if p2040 then
        event = game:GetService("RunService").RenderStepped:Connect(function()
            local v2041, v2042, v2043 = pairs(game:GetService("Workspace"):GetChildren())
            while true do
                local v2044
                v2043, v2044 = v2041(v2042, v2043)
                if v2043 == nil then
                    break
                end
                if v2044:FindFirstChild("TouchTrigger") and not v2044:FindFirstChild("Lol") then
                    local v2045 = Instance.new("Highlight", v2044)
                    v2045.Name = "Lol"
                    v2045.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v2045.FillColor = Color3.new(0, 255, 0)
                end
            end
        end)
    end
    if not p2040 then
        event:Disconnect()
        local v2046, v2047, v2048 = pairs(game:GetService("Workspace"):GetChildren())
        while true do
            local v2049
            v2048, v2049 = v2046(v2047, v2048)
            if v2048 == nil then
                break
            end
            if v2049:FindFirstChild("TouchTrigger") then
                v2049:FindFirstChild("Lol"):Destroy()
            end
        end
    end
end)
local v2050 = v31:Tab("\233\178\168\229\143\163\230\177\130\231\148\159", "7733993211")
local v2052 = v2050:section("\228\188\160\233\128\129\229\138\159\232\131\189", true)
v2052:Button("\228\188\160\233\128\129\229\134\178\230\180\151\229\149\134\229\186\151", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.23574829101562, 95.87848663330078, 1.860785722732544)
end)
v2052:Button("\228\188\160\233\128\129\229\176\143\229\178\155", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1403.75732421875, 17.07505226135254, - 779.7035522460938)
end)
v2052:Button("\232\191\148\229\155\158\229\135\186\231\148\159\231\130\185", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 161.43846130371094, 99.27043914794922, - 8.31688117980957)
end)
v2050:section("\233\128\143\232\167\134\229\138\159\232\131\189", true)
v2052:Toggle("\233\128\143\232\167\134\233\178\168\233\177\188", "GTQR15", false, function(p2053)
    if p2053 then
        _G.GTQR15ESPInstances = {}
        local function vu2060(p2054, p2055, p2056)
            local vu2057 = Instance.new("BillboardGui", game.CoreGui)
            vu2057.AlwaysOnTop = true
            vu2057.Size = UDim2.new(0, 100, 0, 50)
            vu2057.Adornee = p2054
            vu2057.MaxDistance = 2000
            local v2058 = Instance.new("Frame", vu2057)
            v2058.AnchorPoint = Vector2.new(0.5, 0.5)
            v2058.BackgroundColor3 = p2056
            v2058.Size = UDim2.new(0, 8, 0, 8)
            v2058.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v2058).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v2058)
            local v2059 = Instance.new("TextLabel", vu2057)
            v2059.AnchorPoint = Vector2.new(0.5, 0.5)
            v2059.BackgroundTransparency = 1
            v2059.TextColor3 = p2056
            v2059.Size = UDim2.new(1, 0, 0, 20)
            v2059.Position = UDim2.new(0.5, 0, 0.7, 0)
            v2059.Text = p2055
            Instance.new("UIStroke", v2059)
            task.spawn(function()
                while vu2057 do
                    if vu2057.Adornee == nil or not vu2057.Adornee:IsDescendantOf(workspace) then
                        vu2057.Enabled = false
                        vu2057.Adornee = nil
                        vu2057:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v2061, v2062, v2063 = pairs(workspace:GetDescendants())
            while true do
                local v2064
                v2063, v2064 = v2061(v2062, v2063)
                if v2063 == nil then
                    break
                end
                if v2064:IsA("Model") and v2064.Name == "Mesh" then
                    vu2060(v2064, "\233\178\168\233\177\188", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p2065)
                if p2065:IsA("Model") and p2065.Name == "Mesh" then
                    vu2060(p2065, "\233\178\168\233\177\188", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v2066, v2067, v2068 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v2069
            v2068, v2069 = v2066(v2067, v2068)
            if v2068 == nil then
                break
            end
            local v2070, v2071, v2072 = pairs(v2069.doors)
            while true do
                local v2073
                v2072, v2073 = v2070(v2071, v2072)
                if v2072 == nil then
                    break
                end
                v2073.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
v2052:Toggle("\233\128\143\232\167\134\230\176\148\231\144\131\231\164\188\231\137\169", "GTQR15", false, function(p2074)
    if p2074 then
        _G.GTQR15ESPInstances = {}
        local function vu2081(p2075, p2076, p2077)
            local vu2078 = Instance.new("BillboardGui", game.CoreGui)
            vu2078.AlwaysOnTop = true
            vu2078.Size = UDim2.new(0, 100, 0, 50)
            vu2078.Adornee = p2075
            vu2078.MaxDistance = 2000
            local v2079 = Instance.new("Frame", vu2078)
            v2079.AnchorPoint = Vector2.new(0.5, 0.5)
            v2079.BackgroundColor3 = p2077
            v2079.Size = UDim2.new(0, 8, 0, 8)
            v2079.Position = UDim2.new(0.5, 0, 0.5, 0)
            Instance.new("UICorner", v2079).CornerRadius = UDim.new(1, 0)
            Instance.new("UIStroke", v2079)
            local v2080 = Instance.new("TextLabel", vu2078)
            v2080.AnchorPoint = Vector2.new(0.5, 0.5)
            v2080.BackgroundTransparency = 1
            v2080.TextColor3 = p2077
            v2080.Size = UDim2.new(1, 0, 0, 20)
            v2080.Position = UDim2.new(0.5, 0, 0.7, 0)
            v2080.Text = p2076
            Instance.new("UIStroke", v2080)
            task.spawn(function()
                while vu2078 do
                    if vu2078.Adornee == nil or not vu2078.Adornee:IsDescendantOf(workspace) then
                        vu2078.Enabled = false
                        vu2078.Adornee = nil
                        vu2078:Destroy()
                    end
                    task.wait()
                end
            end)
        end;
        (function()
            local v2082, v2083, v2084 = pairs(workspace:GetDescendants())
            while true do
                local v2085
                v2084, v2085 = v2082(v2083, v2084)
                if v2084 == nil then
                    break
                end
                if v2085:IsA("Model") and v2085.Name == "GiftBalloon" then
                    vu2081(v2085, "\230\176\148\231\144\131\231\164\188\231\137\169", Color3.new(255, 0, 0))
                end
            end
            workspace.DescendantAdded:Connect(function(p2086)
                if p2086:IsA("Model") and p2086.Name == "GiftBalloon" then
                    vu2081(p2086, "\230\176\148\231\144\131\231\164\188\231\137\169", Color3.new(255, 0, 0))
                end
            end)
        end)()
        table.insert(_G.GTQR15ESPInstances, {
            doors = {}
        })
    elseif _G.GTQR15ESPInstances then
        local v2087, v2088, v2089 = pairs(_G.GTQR15ESPInstances)
        while true do
            local v2090
            v2089, v2090 = v2087(v2088, v2089)
            if v2089 == nil then
                break
            end
            local v2091, v2092, v2093 = pairs(v2090.doors)
            while true do
                local v2094
                v2093, v2094 = v2091(v2092, v2093)
                if v2093 == nil then
                    break
                end
                v2094.delete()
            end
        end
        _G.GTQR15ESPInstances = nil
    end
end)
local v2095 = v2050:section("\232\132\154\230\156\172", true)
v2095:Button("\232\135\170\229\138\168\230\157\128\233\178\168\233\177\188", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua", true))()
end)
v2095:Button("\233\178\168\229\143\163\230\177\130\231\148\1591", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
end)
v2095:Button("\233\178\168\229\143\163\230\177\130\231\148\1592", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/SharkBite.lua", true))()
end)
v2095:Button("\233\178\168\229\143\163\230\177\130\231\148\1593", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lolboxo/SharkBiteV3/main/SharkBiteV3.1"))()
end)
v2095:Button("\233\178\168\229\143\163\230\177\130\231\148\159\229\136\183\232\136\185", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostapustaja/legionhub/main/sharkbite2", true))()
end)
local v2096 = v31:Tab("\230\177\189\232\189\166\231\187\143\233\148\128\229\149\134\229\164\167\228\186\168", "7733993211"):section("\230\177\189\232\189\166\231\187\143\233\148\128\229\149\134\229\164\167\228\186\168", true)
v2096:Button("\230\177\189\232\189\166\231\187\143\233\148\128\229\149\134\229\164\167\228\186\1681", function()
    loadstring(game:HttpGet("https\239\188\154//raw.githubusercontent.com/weiny-ez/Weinz_Car-Dealership/main/weinz_cars.lua"))()
end)
v2096:Toggle("\232\135\170\229\138\168\233\169\190\233\169\182", "", false, function(p2097)
    getfenv().auto = p2097 and true or false
    while getfenv().auto do
        local v2098 = game.Players.LocalPlayer.Character
        local vu2099 = v2098.Humanoid.SeatPart.Parent.Parent
        dist = (v2098.HumanoidRootPart.Position - vu2099.Engine.CFrame.LookVector * 1000).Magnitude
        local v2100 = game:GetService("TweenService")
        local v2101 = TweenInfo.new(dist / 1000, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0)
        local vu2102 = Instance.new("CFrameValue")
        local v2103 = vu2099
        vu2102.Value = vu2099.GetPrimaryPartCFrame(v2103)
        vu2102.Changed:Connect(function()
            vu2099:SetPrimaryPartCFrame(vu2102.Value)
        end)
        local v2104 = v2100:Create(vu2102, v2101, {
            Value = vu2099.Engine.CFrame + vu2099.Engine.CFrame.LookVector * 1000
        })
        v2104:Play()
        v2104.Completed:Wait()
    end
end)
v2096:Toggle("\232\135\170\229\138\168\230\148\182\233\155\134\233\155\182\228\187\182", "", false, function(p2105)
    getfenv().test = p2105 and true or false
    while getfenv().test do
        wait()
        local v2106, v2107, v2108 = pairs(workspace:GetChildren())
        local function v2110()
            local v2109 = game:GetService("Players").LocalPlayer.PlayerGui.Menu.Event.Frame.PrizeFrame.ProgressBar.Count.Text:split("/")
            return tonumber(v2109[1])
        end
        while true do
            local v2111
            v2108, v2111 = v2106(v2107, v2108)
            if v2108 == nil then
                break
            end
            if v2111.ClassName == "Model" and (not v2111:FindFirstChild("Part") and (v2111:FindFirstChild("Owned") and (v2110() ~= 12 and getfenv().test == true))) then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character:PivotTo(v2111.WorldPivot)
                until v2111:FindFirstChild("Part") or getfenv().test == false
            end
        end
        local v2112, v2113, v2114 = pairs(workspace:GetChildren())
        while true do
            local v2115
            v2114, v2115 = v2112(v2113, v2114)
            if v2114 == nil then
                break
            end
            if v2115.ClassName == "Model" and (v2115:FindFirstChild("Part") and (v2115:FindFirstChild("Owned") and (v2110() ~= 12 and getfenv().test == true))) then
                game.Players.LocalPlayer.Character:PivotTo(v2115.WorldPivot)
                local v2116 = v2110()
                local v2117, v2118, v2119 = pairs(v2115:GetChildren())
                local v2120 = nil
                while true do
                    local v2121
                    v2119, v2121 = v2117(v2118, v2119)
                    if v2119 == nil then
                        break
                    end
                    if v2121.ClassName == "MeshPart" then
                        if v2121.Transparency < 0.5 then
                            v2120 = v2121
                        end
                    end
                end
                if v2120 ~= nil then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character:PivotTo(v2115.WorldPivot)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    until v2120.Transparency > 0.5 or getfenv().test == false
                    repeat
                        task.wait()
                        game:GetService("ReplicatedStorage").Remotes.EventController.PerformAction:FireServer("AssembleCarPart", {})
                    until v2116 ~= v2110()
                end
            end
        end
    end
end)
v2096:Toggle("\232\135\170\229\138\168\233\128\129\232\180\167", "", false, function(p2122)
    getfenv().deliver = p2122 and true or false
    spawn(function()
        while getfenv().deliver do
            task.wait()
            pcall(function()
                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                    wait(5)
                    getfenv().spawned = false
                end
            end)
        end
    end)
    while getfenv().deliver do
        wait()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.Sit ~= true then
                if game.Players.LocalPlayer.Character.Humanoid.Sit == false and getfenv().spawned ~= true then
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
                    getfenv().spawned = true
                    wait(0.1)
                end
            else
                task.wait(0.1)
                local v2123, v2124, v2125 = pairs(workspace.ActionTasksGames.Jobs:GetDescendants())
                while true do
                    local v2126
                    v2125, v2126 = v2123(v2124, v2125)
                    if v2125 == nil then
                        break
                    end
                    if v2126.Name == "DeliveryPart" and v2126.Transparency ~= 1 then
                        getfenv().spawned = false
                        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2126.CFrame)
                        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2126.CFrame * CFrame.new(- 30, 20, - 10))
                        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2126.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local v2127, v2128, v2129 = pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren())
                        while true do
                            local v2130
                            v2129, v2130 = v2127(v2128, v2129)
                            if v2129 == nil then
                                break
                            end
                            if v2130.ClassName == "Model" and v2130:GetAttribute("StockTurbo") then
                                local v2131, v2132, v2133 = pairs(workspace.ActionTasksGames.Jobs:GetChildren())
                                while true do
                                    local v2134
                                    v2133, v2134 = v2131(v2132, v2133)
                                    if v2133 == nil then
                                        break
                                    end
                                    if v2134.ClassName == "Model" and v2134:GetAttribute("JobId") then
                                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({
                                            Action = "TryToCompleteJob",
                                            JobId = v2134:GetAttribute("JobId")
                                        })
                                        local v2135 = game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler
                                        local v2136 = v2135.FireServer
                                        local v2137 = {
                                            JobId = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),
                                            Action = "CollectReward"
                                        }
                                        v2136(v2135, v2137)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
v2096:Toggle("\232\135\170\229\138\168\229\148\174\229\141\150\230\177\189\232\189\166", "", false, function(p2138)
    getfenv().Customer = p2138 and true or false
    while getfenv().Customer do
        task.wait()
        pcall(function()
            _G.rat = nil
            local v2143, v2144, v2145 = pairs((function()
                local v2139, v2140, v2141 = pairs(workspace.Tycoons:GetDescendants())
                while true do
                    local v2142
                    v2141, v2142 = v2139(v2140, v2141)
                    if v2141 == nil then
                        break
                    end
                    if v2142.Name == "Owner" and (v2142.ClassName == "StringValue" and (string.find(v2142.Parent.Name, "Plot") and v2142.Value == game.Players.LocalPlayer.Name)) or v2142.Name == "Owner" and (v2142.ClassName == "StringValue" and (string.find(v2142.Parent.Name, "Slot") and v2142.Value == game.Players.LocalPlayer.Name)) then
                        tycoon = v2142.Parent
                    end
                end
                return tycoon
            end)().Dealership:GetChildren())
            local v2146 = nil
            while true do
                local v2147
                v2145, v2147 = v2143(v2144, v2145)
                if v2145 == nil then
                    break
                end
                if v2147.ClassName == "Model" and v2147.PrimaryPart ~= nil then
                    if v2147.PrimaryPart.Name == "HumanoidRootPart" then
                        v2146 = v2147
                    end
                end
            end
            local v2148 = v2146:GetAttribute("OrderSpecBudget"):split(";")
            local v2149 = tonumber(v2148[2])
            local v2150 = game.Players.LocalPlayer.PlayerGui
            local v2151 = v2150.Menu
            local _ = v2150.Dialogue.CarSpec.Frame.Frame
            local v2152, v2153, v2154 = pairs(v2151.Shop.Cars.Frame.Frame:GetDescendants())
            while true do
                local v2155
                v2154, v2155 = v2152(v2153, v2154)
                if v2154 == nil then
                    break
                end
                if v2155.Name == "PriceValue" and (tonumber(string.gsub(v2155.Value, ",", ""):split("$")[2]) > tonumber(v2148[1]) and tonumber(string.gsub(v2155.Value, ",", ""):split("$")[2]) < tonumber(v2148[2])) then
                    local v2156 = tonumber(string.gsub(v2155.Value, ",", ""):split("$")[2])
                    if v2156 < v2149 then
                        _G.rat = v2155
                        v2149 = v2156
                    end
                end
            end
            textn = 1
            repeat
                wait()
                local v2157 = _G.rat.Parent.Name:split("")[textn]
                textn = textn + 1
                warn(v2157, textn)
            until tonumber(v2157) == nil
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({
                Action = "AcceptOrder",
                OrderId = v2146:GetAttribute("OrderId")
            })
            wait()
            local v2158 = game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler
            local v2159 = v2158.FireServer
            local v2160 = {}
            local v2161 = {
                Springs = v2146:GetAttribute("OrderSpecSprings"),
                Color = v2146:GetAttribute("OrderSpecColor"),
                Rims = v2146:GetAttribute("OrderSpecRims"),
                Car = v2157 .. _G.rat.Parent.Name:split(tostring(_G.rat.Parent.Name:split("")[textn - 1]))[2],
                RimColor = v2146:GetAttribute("OrderSpecRimColor")
            }
            v2160.Specs = v2161
            v2160.Action = "CompleteOrder"
            v2160.OrderId = v2146:GetAttribute("OrderId")
            v2159(v2158, v2160)
            wait()
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({
                Action = "CollectReward",
                OrderId = v2146:GetAttribute("OrderId")
            })
            repeat
                wait()
            until v2146.Parent == nil or getfenv().Customer == false
        end)
    end
end)
v2096:Toggle("\232\135\170\229\138\168\229\141\135\231\186\167", "", false, function(p2162)
    getfenv().buyer = p2162 and true or false
    while getfenv().buyer do
        task.wait()
        local function vu2167()
            local v2163, v2164, v2165 = pairs(workspace.Tycoons:GetDescendants())
            while true do
                local v2166
                v2165, v2166 = v2163(v2164, v2165)
                if v2165 == nil then
                    break
                end
                if v2166.Name == "Owner" and (v2166.ClassName == "StringValue" and v2166.Value == game.Players.LocalPlayer.Name) then
                    tycoon = v2166.Parent
                end
            end
            return tycoon
        end
        pcall(function()
            local v2168, v2169, v2170 = pairs(vu2167().Dealership.Purchases:GetChildren())
            while true do
                local v2171
                v2170, v2171 = v2168(v2169, v2170)
                if v2170 == nil then
                    break
                end
                if getfenv().buyer == true and v2171.TycoonButton.Button.Transparency == 0 then
                    game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v2171.Name)
                    wait(0.3)
                end
            end
        end)
    end
end)
v2096:Toggle("\229\136\160\233\153\164\229\188\185\229\135\186\231\170\151\229\143\163", "", false, function(p2172)
    getfenv().annoy = p2172 and true or false
    if getfenv().annoy ~= true then
        if getfenv().annoy == false then
            getfenv().fun:Disconnect()
        end
    else
        getfenv().fun = game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(p2173)
            if p2173.Name == "Popup2" then
                p2173:Destroy()
            end
        end)
    end
end)
v2096:Toggle("\232\135\170\229\138\168\233\128\129\232\180\1672", "", false, function(p2174)
    getfenv().deliver2 = p2174 and true or false
    game.Players.LocalPlayer.Character.Head.Anchored = false
    spawn(function()
        while getfenv().deliver2 do
            task.wait()
            pcall(function()
                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                    wait(5)
                    getfenv().spawned = false
                end
            end)
        end
    end)
    local function vu2180()
        local v2175, v2176, v2177 = pairs(workspace.Cars:GetChildren())
        local v2178 = nil
        while true do
            local v2179
            v2177, v2179 = v2175(v2176, v2177)
            if v2177 == nil then
                break
            end
            if v2179.Name == "DeliveryTruck" then
                if v2179:GetAttribute("JobId") == _G.remotetable.Jobs[1].Id then
                    v2178 = v2179
                end
            end
        end
        return v2178 or "no truck found"
    end
    print(vu2180())
    spawn(function()
        timeout = 0
        while getfenv().deliver2 do
            task.wait()
            if vu2180() == "no truck found" or (game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil or timeout >= 10) then
                if vu2180() == "no truck found" or (game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil or timeout < 10) then
                    if vu2180() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
                        timeout = 0
                        print("timeout reset")
                        wait(1)
                    end
                else
                    timeout = 0
                    warn("truck bugged and got destroyed")
                    vu2180():Destroy()
                    wait(1)
                end
            else
                timeout = timeout + 1
                wait(1)
            end
        end
    end)
    spawn(function()
        print("bro spawned in")
        while getfenv().deliver2 do
            task.wait()
            if getfenv().checkif ~= nil then
                wait(40)
                getfenv().checkif = nil
            end
        end
    end)
    getfenv().checkif = nil
    while getfenv().deliver2 do
        wait()
        if game.Players.LocalPlayer.Character.Humanoid.Sit ~= true then
            if game.Players.LocalPlayer.Character.Humanoid.Sit == false and vu2180() == "no truck found" then
                print(vu2180())
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                    pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tppart.CFrame
                        game.Players.LocalPlayer.Character.Head.Anchored = true
                    end)
                    wait(1)
                end
                whate = nil
                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
                local v2181 = 0
                repeat
                    wait()
                    v2181 = v2181 + 1
                until vu2180() ~= "no truck found" or (getfenv().deliver2 == false or 100 < v2181)
                game.Players.LocalPlayer.Character.Head.Anchored = false
            end
        else
            task.wait(0.1)
            local v2182, v2183, v2184 = pairs(workspace.ActionTasksGames.Jobs:GetDescendants())
            while true do
                local v2185
                v2184, v2185 = v2182(v2183, v2184)
                if v2184 == nil then
                    break
                end
                if v2185.Name == "DeliveryPart" and (v2185.Transparency ~= 1 and game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil) then
                    game.Players.LocalPlayer.Character.Head.Anchored = false
                    tppart = v2185
                    getfenv().spawned = false
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2185.CFrame)
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2185.CFrame * CFrame.new(- 30, 30, - 10))
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v2185.CFrame * CFrame.Angles(0, math.rad(90), 0))
                    local v2186, v2187, v2188 = pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren())
                    while true do
                        local v2189
                        v2188, v2189 = v2186(v2187, v2188)
                        if v2188 == nil then
                            break
                        end
                        if v2189.ClassName == "Model" and v2189:GetAttribute("StockTurbo") then
                            repeat
                                wait(0.1)
                                pcall(function()
                                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame)
                                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame * CFrame.new(- 30, 30, - 10))
                                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                                end)
                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({
                                    Action = "TryToCompleteJob",
                                    JobId = v2189.Name
                                })
                            until game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true or (game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil or getfenv().deliver2 == false)
                            game.Players.LocalPlayer.Character.Head.Anchored = false
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            local function v2195()
                                local v2190, v2191, v2192 = pairs(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Frame.Stars:GetChildren())
                                local v2193 = 0
                                while true do
                                    local v2194
                                    v2192, v2194 = v2190(v2191, v2192)
                                    if v2192 == nil then
                                        break
                                    end
                                    if string.find(v2194.Name, "Star") and v2194.ImageColor3 == Color3.fromRGB(255, 189, 34) then
                                        v2193 = v2193 + 1
                                    end
                                end
                                return v2193
                            end
                            local function v2201(p2196)
                                yeno = nil
                                local v2197, v2198, v2199 = pairs(_G.usedids)
                                while true do
                                    local v2200
                                    v2199, v2200 = v2197(v2198, v2199)
                                    if v2199 == nil then
                                        break
                                    end
                                    if v2200 == p2196 then
                                        yeno = "Vehicle was already used"
                                    end
                                end
                                return yeno
                            end
                            print(tonumber(v2195()) .. " Stars bonus")
                            if tonumber(v2195()) < getfenv().stars and (game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true and getfenv().checkif == nil) then
                                whate = nil
                                if type(_G.usedids) ~= "table" then
                                    _G.usedids = {}
                                end
                                local v2202, v2203, v2204 = pairs(getgc(true))
                                while true do
                                    local v2205
                                    v2204, v2205 = v2202(v2203, v2204)
                                    if v2204 == nil then
                                        break
                                    end
                                    if type(v2205) == "table" and (rawget(v2205, "MoneyReward") ~= nil and (whate == nil and getfenv().checkif == nil)) then
                                        task.wait()
                                        if tonumber(v2205.MoneyReward) > getfenv().smaller and (tonumber(v2205.MoneyReward) < getfenv().bigger and (whate == nil and (getfenv().checkif == nil and v2201(v2205.Id) ~= "Vehicle was already used"))) then
                                            task.wait()
                                            table.insert(_G.usedids, v2205.Id)
                                            whate = v2205
                                            print("Vehicle has been changed", v2205)
                                            _G.remotetable = {
                                                Truck = "DeliveryTruck",
                                                Action = "StartDeliveryJob",
                                                Jobs = {
                                                    {
                                                        Id = whate.Id,
                                                        Image = "http://www.roblox.com/asset/?id=7962599980",
                                                        CFrame = CFrame.new(- 1476.16199, 601.700134, 3489.31299, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
                                                        JobData = whate
                                                    }
                                                }
                                            }
                                            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                                                wait(0.5)
                                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({
                                                    JobId = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),
                                                    Action = "CollectReward"
                                                })
                                                wait(0.5)
                                                game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                                            end
                                            getfenv().checkif = true
                                        end
                                    end
                                end
                            end
                            wait()
                            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                                game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({
                                    JobId = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),
                                    Action = "CollectReward"
                                })
                            end
                        end
                    end
                end
            end
        end
    end
end)
v2096:Toggle("\232\135\170\229\138\168\229\156\163\232\175\158\232\138\130\230\188\130\231\167\187", "", false, function(p2206)
    _G.oh = p2206 and true or false
    local v2207, v2208, v2209 = pairs(workspace:GetDescendants())
    while true do
        local v2210
        v2209, v2210 = v2207(v2208, v2209)
        if v2209 == nil then
            break
        end
        if v2210.Name == "DriftAsphalt" then
            v2210.Velocity = v2210.CFrame.LookVector * 0
        end
    end
    while _G.oh do
        task.wait()
        if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible ~= true then
            if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(CFrame.new(- 2068.947021484375, 656.533447265625, 7767.55810546875))
                wait(0.1)
                workspace.Races.RaceHandler.StartLobby:FireServer("Xmas")
                wait(1)
            end
        else
            if _G.velo ~= true then
                local v2211, v2212, v2213 = pairs(workspace:GetDescendants())
                while true do
                    local v2214
                    v2213, v2214 = v2211(v2212, v2213)
                    if v2213 == nil then
                        break
                    end
                    if v2214.Name == "DriftAsphalt" then
                        v2214.Velocity = v2214.CFrame.LookVector * 1000
                    end
                end
                _G.velo = true
            end
            if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(- 2055.981689453125, 654.3567504882812, 7831.22900390625)) > 20 then
                game:GetService("Players").LocalPlayer.PlayerGui.Animation.DriftPoints.Position = UDim2.new(0.5, 0, 1, - 130)
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(CFrame.new(- 2055.981689453125, 654.3567504882812, 7831.22900390625))
            end
        end
    end
end)
local v2215 = v31:Tab("\233\177\191\233\177\188\230\184\184\230\136\143\231\142\187\231\146\131\230\161\165", "7733993211"):section("\233\177\191\233\177\188\230\184\184\230\136\143\231\142\187\231\146\131\230\161\165", true)
v2215:Toggle("\232\135\170\229\138\168\229\136\183\233\146\177", "", false, function(p2216)
    if p2216 then
        _G.TD = true
        wait(0.001)
        while _G.TD == true do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 746.2877197265625, - 0.10679015517234802, - 534.8348388671875)
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 749.1660766601562, - 1.1000086069107056, - 529.3400268554688)
            wait(0.001)
        end
    else
        _G.TD = false
    end
end)
v2215:Slider("\228\191\174\230\148\185\233\128\159\229\186\166", "WalkspeedSlider", 16, 16, 99999, false, function(p2217)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = p2217
end)
v2215:Button("\230\151\160\230\179\149\229\157\160\232\144\189", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
end)
v2215:Textbox("\228\191\174\230\148\185\233\135\145\233\146\177", "arg", "\232\190\147\229\133\165", function(p2218)
    game:GetService("Players").LocalPlayer.leaderstats.Cash.Value = p2218
end)
v31:Tab("\229\135\186\231\167\159\232\189\166\229\164\167\228\186\168", "7733993211"):section("\229\135\186\231\167\159\232\189\166\229\164\167\228\186\168", true):Button("\229\135\186\231\167\159\232\189\166\229\164\167\228\186\168", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss"))()
end)
local v2219 = v31:Tab("\229\165\142\229\176\148\230\185\150", "7733993211"):section("\229\165\142\229\176\148\230\185\150", true)
v2219:Button("\229\165\142\229\176\148\230\185\1501", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Solx69/Shit-Boy-Hub-Main/main/Master.lua"))()
end)
v2219:Toggle("\230\151\160\230\149\140\230\168\161\229\188\143", "", false, function(_)
    game.ReplicatedStorage.DamageHumanoid:FireServer(- 2000000000)
end)
v2219:Button("\230\151\160\233\153\144\233\135\145\233\146\177", function()
    game:GetService("ReplicatedStorage").Pay:FireServer(unpack({
        - 9999,
        "Buy"
    }))
end)
v2219:Button("\230\151\160\233\153\144\233\135\145\229\184\129", function()
    local v2220 = {
        game:GetService("Players").LocalPlayer.GoldCoins,
        99999
    }
    game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(v2220))
end)
v2219:Button("\231\187\153\230\137\128\230\156\137\231\137\169\229\147\129", function()
    game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
    game.ReplicatedStorage.GiveTool:FireServer("Lantern")
    game.ReplicatedStorage.GiveTool:FireServer("Compass")
    game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
    game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
end)
v2219:Button("\231\186\162\232\137\178\229\165\151\232\163\133", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit")
end)
v2219:Button("\233\187\132\232\137\178\229\165\151\232\163\133", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit")
end)
v2219:Button("\230\181\183\231\155\151\229\165\151\232\163\133", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume")
end)
v2219:Button("\229\138\168\229\138\155\229\165\151\232\163\133", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba")
end)
local v2221 = v31:Tab("\233\164\144\229\142\133\229\164\167\228\186\1682", "6035145364"):section("\229\134\133\229\174\185", true)
v2221:Toggle("\229\141\179\230\151\182\231\131\185\233\165\170", "", false, function(_)
    local v2222 = game.Players.LocalPlayer.PlayerScripts.CookingNew
    local v2223 = require(v2222.CookProgress)
    local v2224 = require(v2222.InputDetectors.MultiClick)
    local v2225 = require(v2222.InputDetectors.MouseMovement)
    local v2226 = require(v2222.InputDetectors.MouseSpin)
    local vu2227 = v2223.run
    function v2223.run(...)
        return vu2227(unpack({
            ...,
            [3] = 0
        }))
    end
    function v2224.start(...)
        ({
            ...
        })[3]()
    end
    function v2225.start(...)
        ({
            ...
        })[3]()
    end
    function v2226.start(...)
        ({
            ...
        })[3]()
    end
end)
v2221:Toggle("\232\135\170\229\138\168\230\148\182\230\172\190", "", false, function(_)
    warn("Requiring API")
    loadstring(game:HttpGet("https://pastebin.com/raw/KMc6aBky"))()
    warn("API Loaded")
    local _ = object.child
    local v2228 = object.descendant
    local vu2229 = object.check
    local vu2230 = game.Players.LocalPlayer.Tycoon.Value
    v2228.foreach(vu2230.Items.OftenFiltered.Surface, "Bill", function(p2231)
        local v2232 = {
            name = "CollectBill",
            model = p2231.Parent
        }
        game.ReplicatedStorage.Events.ClientTycoonInput:FireServer(vu2230, v2232)
    end)
    local _, _ = v2228.on_add(vu2230.Items.OftenFiltered.Surface, function(pu2233)
        vu2229.it(pu2233.Name == "Bill", function()
            local v2234 = {
                name = "CollectBill",
                model = pu2233.Parent
            }
            game.ReplicatedStorage.Events.ClientTycoonInput:FireServer(vu2230, v2234)
        end)
    end)
end)
v2221:Toggle("NPC\231\131\185\233\165\170\229\185\182\233\128\129\232\190\190", "", false, function(_)
    local v2235 = true
    local v2236 = game.Players.LocalPlayer.PlayerScripts
    local v2237 = require(v2236.ClientMain.Replications.Workers.WalkDummy)
    local v2238 = require(v2236.CookingNew.WorkerComponents.WorkerDefault)
    local vu2239 = require(v2236.ClientMain.Replications.Customers.GetNPCFolder)
    if true then
        hookfunction(v2237, function()
            return task.wait()
        end)
    end
    if v2235 then
        function v2238.event(...)
            local v2240 = {
                ...
            }
            local v2241 = vu2239.GetNPCFolder(v2240[1]).ClientWorkers:FindFirstChild(v2240[2])
            local v2242 = game.ReplicatedStorage.MiscModules.CookingSharedCharacter:FindFirstChild(v2240[4])
            if v2242 then
                require(v2242).finishInteract(v2241, v2240[3], v2240[4])
            end
        end
    end
end)