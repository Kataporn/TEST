repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

local Window = WindUI:CreateWindow({
    Title = 'Editer.<font color="rgb(54, 58, 245)">.editer</font>',
    Icon = "door-open",
    Author = "SRC",
    Folder = "editer",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = false,
    KeySystem = { 
        Key = { "SRC" },
        Note = "SRC",
        URL = "https://github.com/Footagesus/WindUI", 
        SaveKey = true,
    },
})

Window:EditOpenButton({
    Title = "Open Example UI",
    Icon = "monitor",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new(             
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Enabled = true,
    Draggable = true,
})

local Tabs = {
    MainTab = Window:Tab({ Title = "Main", Icon = "house", Desc = "Auto Farm." }),
    UpgradeStatsTab = Window:Tab({ Title = "Upgrade Stats", Icon = "arrow-up", Desc = "Upgrade Stats." }),
}

local Sections = {
    MainSection = Tabs.MainTab:Section({ Title = "Auto Farm" }),
}

-- auto farm
local HPE = false

Tabs.MainTab:Toggle({
    Title = "Train Health",
    Default = false,
    Callback = function(state)
        HPE = state

        if HPE then
            task.spawn(function()
                while HPE do
                    local args = { [1] = 0 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Train"):WaitForChild("TrainHealth"):FireServer(unpack(args))
                    task.wait(0.9)
                end
            end)
        end
    end
})

local Power = false

Tabs.MainTab:Toggle({
    Title = "Train Power",
    Default = false,
    Callback = function(state)
        Power = state

        if Power then
            task.spawn(function()
                while Power do
                    local args = { [1] = 0 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Train"):WaitForChild("TrainPower"):FireServer(unpack(args))
                    task.wait(0.9)
                end
            end)
        end
    end
})

local MD = false

Tabs.MainTab:Toggle({
    Title = "Train Meditate",
    Default = false,
    Callback = function(state)
        MD = state

        if MD then
            task.spawn(function()
                while MD do
                    local args = { [1] = 0 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Train"):WaitForChild("TrainPsychics"):FireServer(unpack(args))
                    task.wait(1)
                end
            end)
        end
    end
})

local TD = false

Tabs.MainTab:Toggle({
    Title = "Train Defense",
    Default = false,
    Callback = function(state)
        TD = state

        if TD then
            task.spawn(function()
                while TD do
                    local args = { [1] = 1 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Train"):WaitForChild("TrainDefense"):FireServer(unpack(args))
                    task.wait(1)
                end
            end)
        end
    end
})

local MET = false

Tabs.MainTab:Toggle({
    Title = "Train Mobility",
    Default = false,
    Callback = function(state)
        mobilityEnabled = state

        if mobilityEnabled then
            task.spawn(function()
                while mobilityEnabled do
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Train"):WaitForChild("TrainMobility"):FireServer()
                    task.wait(1)
                end
            end)
        end
    end
})


--quest
local posquest = CFrame.new(-209, 99, 217)

local function teleportToQuest()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = posquest
    end
end

local qe = false
Tabs.MainTab:Toggle({
    Title = "Auto Quest",
    Default = false,
    Callback = function(state)
        qe = state
        task.spawn(function()
            while qe do
                teleportToQuest()
                task.wait(1)
                local args = { [1] = "MainTask" }
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Other"):WaitForChild("StartMainTask"):FireServer(unpack(args))
                task.wait(1.5)
            end
        end)
    end
})


local cm = false
Tabs.MainTab:Toggle({
    Title = "Auto Claim Quest",
    Default = false,
    Callback = function(state)
        cm = state
        task.spawn(function()
            while cm do
                teleportToQuest()
                task.wait(1)
                local args = { [1] = 1 }
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Other"):WaitForChild("ClaimMainTask"):FireServer(unpack(args))
                task.wait(1.5)
            end
        end)
    end
})

-- up st
local S = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Strength",
    Default = false,
    Callback = function(state)
        S = state

        if S then
            task.spawn(function()
                while S do
                    local args = { [1] = 1 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local H = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Health",
    Default = false,
    Callback = function(state)
        H = state

        if H then
            task.spawn(function()
                while H do
                    local args = { [1] = 2 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local IM = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Immunity",
    Default = false,
    Callback = function(state)
        IM = state

        if IM then
            task.spawn(function()
                while IM do
                    local args = { [1] = 3 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local PS = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Psychics",
    Default = false,
    Callback = function(state)
        PS = state

        if PS then
            task.spawn(function()
                while PS do
                    local args = { [1] = 4 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local MA = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Magic",
    Default = false,
    Callback = function(state)
        MA = state

        if MA then
            task.spawn(function()
                while MA do
                    local args = { [1] = 5 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local MO = false

Tabs.UpgradeStatsTab:Toggle({
    Title = "Auto Upgrade Mobility",
    Default = false,
    Callback = function(state)
        MO = state

        if MO then
            task.spawn(function()
                while MO do
                    local args = { [1] = 6 }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spent"):WaitForChild("UpgradeStat"):FireServer(unpack(args))
                    task.wait(0.5)
                end
            end)
        end
    end
})
