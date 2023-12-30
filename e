local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Ganteng Hub [HP]", HidePremium = false, SaveConfig = true, ConfigFolder = "Ganteng Hub [HP]", IntroText = "Ganteng Hub [HP]"})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
_G.SelectWeapon = "Melee"
Main:AddDropdown({
	Name = "Select Mode",
	Default = "Melee",
	Options = {"Melee", "Sword"},
	Callback = function(Value)
		_G.SelectWeapon = Value
	end    
})

function equip(tooltip)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == tooltip then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid:IsDescendantOf(item) then
                humanoid:UnequipTools()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                return true
            end
        end
    end
    return false
end

getgenv().ToTarget = function(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function()
        tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 650, Enum.EasingStyle.Linear), { CFrame = Pos })
    end)
    tween:Play()
    if Distance <= 10 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end
function checklevel()
    local levelText = game.Players.LocalPlayer.PlayerGui.HUD.MainFrame.Main.Holder.NumberStats.Level.Stat.Text
    local level = tonumber(string.match(levelText, "%d+"))

    if level >= 1 and level <= 10 then
        Mon = "Thief"
        questlv = "Level 1"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-2415.621337890625, 44.74401092529297, -3266.807373046875)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 10 and level <= 40 then
        Mon = "Bandit"
        questlv = "Level 10"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1970.1953125, 44.74400329589844, -3218.418212890625)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 25 and level <= 40 then
        Mon = "Bandit Boss"
        questlv = "Level 25"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Starter Island"
        CFrameMon = CFrame.new(-1943.2662353515625, 66.89073181152344, -3394.779052734375)
        CFrameQuest = CFrame.new(-2146.869384765625, 44.50993347167969, -3200.476806640625)
    elseif level >= 40 and level <= 90 then
        Mon = "Pirate Clown"
        questlv = "Level 40"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Clown Island"
        CFrameMon = CFrame.new(-2351.299560546875, 14.052057266235352, -327.3381652832031)
        CFrameQuest = CFrame.new(-2275.45849609375, 13.928051948547363, -187.22216796875)
    elseif level >= 90 and level <= 160 then
        Mon = "Fishman"
        questlv = "Level 90"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Shark Park"
        CFrameMon = CFrame.new(-4889.72802734375, 12.14794921875, -3352.36376953125)
        CFrameQuest = CFrame.new(-4819.4365234375, 11.811530113220215, -3186.21630859375)
    elseif level >= 160 and level <= 250 then
        Mon = "Desert Thief"
        questlv = "Level 160"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert Ruins"
        CFrameMon = CFrame.new(-4930.26123046875, 14.233585357666016, -206.42727661132812)
        CFrameQuest = CFrame.new(-4943.4287109375, 13.90863037109375, -331.6298828125)
    elseif level >= 250 and level <= 350 then
        Mon = "Krieg Pirate"
        questlv = "Level 250"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("5")
        islandName = "Sea Restaurant"
        CFrameMon = CFrame.new(-5960.5546875, 7.21144437789917, 2305.033447265625)
        CFrameQuest = CFrame.new(-6002.30419921875, 54.453330993652344, 2418.816650390625)
    elseif level >= 350 and level <= 450 then
        Mon = "Marine Recruit"
        questlv = "Level 350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("6")
        islandName = "Logue Town"
        CFrameMon = CFrame.new(-2878.84619140625, 21.4951171875, 2050.003173828125)
        CFrameQuest = CFrame.new(-2985.597900390625, 21.29482078552246, 2175.296875)
    elseif level >= 450 and level <= 500 then
        Mon = "Monkey"
        questlv = "Level 450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7")
        islandName = "Tall Woods"
        CFrameMon = CFrame.new(-221.78125, 9.39697265625, 2382.0712890625)
        CFrameQuest = CFrame.new(-58.68986511230469, 10.858784675598145, 2301.73876953125)
    elseif level >= 500 and level <= 600 then
        Mon = "Gorilla"
        questlv = "Level 500"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("7")
        islandName = "Tall Woods"
        CFrameMon = CFrame.new(507.75439453125, 10.72802734375, 2259.437744140625)
        CFrameQuest = CFrame.new(-58.68986511230469, 10.858784675598145, 2301.73876953125)
    elseif level >= 600 and level <= 700 then
        Mon = "Marine Grunt"
        questlv = "Level 600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("8")
        islandName = "Marine Base Town"
        CFrameMon = CFrame.new(226.05148315429688, 12.4345703125, 5619.0439453125)
        CFrameQuest = CFrame.new(212.7763671875, 68.31398010253906, 5945.423828125)
    elseif level >= 700 and level <= 800 then
        Mon = "Satyr"
        questlv = "Level 700"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("9")
        islandName = "Three Islands"
        CFrameMon = CFrame.new(-2469.349609375, 855.4013671875, 5938.0400390625)
        CFrameQuest = CFrame.new(-2479.5302734375, 855.3377075195312, 5694.59716796875)
    elseif level >= 800 and level <= 900 then
        Mon = "Elite Marine"
        questlv = "Level 800"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10")
        islandName = "Marine HQ"
        CFrameMon = CFrame.new(-6146.212890625, 19.97900390625, 6742.90380859375)
        CFrameQuest = CFrame.new(-6244.291015625, 20.89983558654785, 6498.083984375)
    elseif level >= 900 and level <= 950 then
        Mon = "Ice Admiral"
        questlv = "Level 900"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("10")
        islandName = "Marine HQ"
        CFrameMon = CFrame.new(-6770.556640625, 206.6758575439453, 6890.5458984375)
        CFrameQuest = CFrame.new(-6244.291015625, 20.89983558654785, 6498.083984375)
    elseif level >= 950 and level <= 1000 then
        Mon = "Sandorian Warrior"
        questlv = "Level 950"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11")
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(2844.99072265625, 1099.0625, 317.13885498046875)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1000 and level <= 1050 then
        Mon = "Divine Soldier"
        questlv = "Level 1000"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("11")
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(3037.369384765625, 1158.702880859375, 735.570068359375)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1050 and level <= 1050 then
        Mon = "Holy Soldier"
        questlv = "Level 1050"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("12") --11
        islandName = "Sky Islands"
        CFrameMon = CFrame.new(3081.501953125, 2030.39892578125, 1307.1292724609375)
        CFrameQuest = CFrame.new(2787.238037109375, 1098.5052490234375, 251.38818359375)
    elseif level >= 1150 and level <= 1200 then
        Mon = "Revolutionary"
        questlv = "Level 1150"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("13")
        islandName = "Revolutionary Base"
        CFrameMon = CFrame.new(3488.315673828125, 35.53047561645508, 3925.003173828125)
        CFrameQuest = CFrame.new(3666.80078125, 35.52538299560547, 3742.72216796875)
    elseif level >= 1200 and level <= 1300 then
        Mon = "Revolutionary Elite"
        questlv = "Level 1200"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("13")
        islandName = "Revolutionary Base"
        CFrameMon = CFrame.new(3604.13671875, 35.37158203125, 3698.8837890625)
        CFrameQuest = CFrame.new(3666.80078125, 35.52538299560547, 3742.72216796875)
    elseif level >= 1300 and level <= 1350 then
        Mon = "Impel Guard"
        questlv = "Level 1300"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("14")
        islandName = "Impel Jail"
        CFrameMon = CFrame.new(3719.19140625, 10.333984375, 6907.6962890625)
        CFrameQuest = CFrame.new(3591.172607421875, 16.74056625366211, 6755.71630859375)
    elseif level >= 1350 and level <= 1450 then
        Mon = "Impel Elite"
        questlv = "Level 1350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("14") --
        islandName = "Impel Jail"
        CFrameMon = CFrame.new(3776.63916015625, 10.171875, 7050.05322265625)
        CFrameQuest = CFrame.new(3591.172607421875, 16.74056625366211, 6755.71630859375)
    elseif level >= 1450 and level <= 1600 then
        Mon = "Corrupt Marine"
        questlv = "Level 1450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("15")
        islandName = "Cold Island"
        CFrameMon = CFrame.new(2682.24609375, 17.068359375, -2455.902587890625)
        CFrameQuest = CFrame.new(2841.9619140625, 17.068359375, -2447.498046875)
    elseif level >= 1600 and level <= 1650 then
        Mon = "Island Fishman"
        questlv = "Level 1600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("16")
        islandName = "Fishman Island"
        CFrameMon = CFrame.new(6853.779296875, 47.6552734375, -3163.587158203125)
        CFrameQuest = CFrame.new(6896.49755859375, 11.743340492248535, -2831.961669921875)
    elseif level >= 1650 and level <= 1750 then
        Mon = "Fishman Elite"
        questlv = "Level 1650"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("16")
        islandName = "Fishman Island"
        CFrameMon = CFrame.new(7014.7138671875, 12.642110824584961, -2803.061767578125)
        CFrameQuest = CFrame.new(6896.49755859375, 11.743340492248535, -2831.961669921875)
    elseif level >= 1750 and level <= 1800 then
        Mon = "Skull Pirate"
        questlv = "Level 1750"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("17")
        islandName = "Skull Island"
        CFrameMon = CFrame.new(6771.54296875, 15.010252952575684, 333.9873046875)
        CFrameQuest = CFrame.new(6806.11865234375, 14.699026107788086, 68.90123748779297)
    elseif level >= 1800 and level <= 1900 then
        Mon = "Pirate Elite"
        questlv = "Level 1800"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("17")
        islandName = "Skull Island"
        CFrameMon = CFrame.new(7211.31884765625, 50.2275390625, 160.16848754882812)
        CFrameQuest = CFrame.new(6806.11865234375, 14.699026107788086, 68.90123748779297)
    elseif level >= 1900 and level <= 1950 then
        Mon = "Pirate"
        questlv = "Level 1900"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("18")
        islandName = "Bubble Island"
        CFrameMon = CFrame.new(7087.83251953125, 15.541773796081543, 3019.6650390625)
        CFrameQuest = CFrame.new(7148.8916015625, 15.03661823272705, 2796.40869140625)
    elseif level >= 1950 and level <= 2050 then
        Mon = "Armored Marine"
        questlv = "Level 1950"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("18")
        islandName = "Bubble Island"
        CFrameMon = CFrame.new(7065.09326171875, 15.39603328704834, 2572.124755859375)
        CFrameQuest = CFrame.new(7148.8916015625, 15.03661823272705, 2796.40869140625)
    elseif level >= 2050 and level <= 2100 then
        Mon = "Skeleton"
        questlv = "Level 2050"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("19")
        islandName = "Thriller Boat"
        CFrameMon = CFrame.new(7474.28759765625, 12.1201171875, 6661.0654296875)
        CFrameQuest = CFrame.new(7318.49512, 13.4426918, 6796.65039, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291,
            0, 0.707134247)
    elseif level >= 2100 and level <= 2200 then
        Mon = "Mummy"
        questlv = "Level 2100"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("19")
        islandName = "Thriller Boat"
        CFrameMon = CFrame.new(7662.3408203125, 12.01318359375, 6854.0029296875)
        CFrameQuest = CFrame.new(7318.49512, 13.4426918, 6796.65039, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291,
            0, 0.707134247)
        --[[Sea2]]
    elseif level >= 2200 and level <= 2250 then
        Mon = "Samurai"
        questlv = "Level 2200"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(2585.486328125, 35.242000579833984, 16508.53515625)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2250 and level <= 2300 then
        Mon = "Strong Samurai"
        questlv = "Level 2250"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(2585.486328125, 35.242000579833984, 16508.53515625)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2300 and level <= 2350 then
        Mon = "Shinobi"
        questlv = "Level 2300"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(1849.009521484375, 25.292816162109375, 16038.0498046875)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2350 and level <= 2400 then
        Mon = "Shinobi Elite"
        questlv = "Level 2350"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("1")
        islandName = "Flower Capital"
        CFrameMon = CFrame.new(1849.009521484375, 25.292816162109375, 16038.0498046875)
        CFrameQuest = CFrame.new(2390.447021484375, 25.089000701904297, 16091.56640625)
    elseif level >= 2400 and level <= 2450 then
        Mon = "Officer Guard"
        questlv = "Level 2400"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Udon Prison"
        CFrameMon = CFrame.new(2265.251953125, 9.229000091552734, 11661.501953125)
        CFrameQuest = CFrame.new(2130.406005859375, 9.07800006866455, 11481.5087890625)
    elseif level >= 2450 and level <= 2550 then
        Mon = "Sergeant Guard"
        questlv = "Level 2450"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("2")
        islandName = "Udon Prison"
        CFrameMon = CFrame.new(2184.52099609375, 102.20899963378906, 11302.3154296875)
        CFrameQuest = CFrame.new(2130.406005859375, 9.07800006866455, 11481.5087890625)
    elseif level >= 2550 and level <= 2600 then
        Mon = "Graverobber"
        questlv = "Level 2550"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Snowy Graveyard"
        CFrameMon = CFrame.new(6880.1904296875, 14.87802505493164, 15826.48046875)
        CFrameQuest = CFrame.new(7243.8427734375, 50.86800003051758, 15919.2685546875)
    elseif level >= 2600 and level <= 2700 then
        Mon = "Elite Graverobber"
        questlv = "Level 2600"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("3")
        islandName = "Snowy Graveyard"
        CFrameMon = CFrame.new(7411.84765625, 14.597492218017578, 16390.7109375)
        CFrameQuest = CFrame.new(7243.8427734375, 50.86800003051758, 15919.2685546875)
    elseif level >= 2700 and level <= 2750 then
        Mon = "Desert Pirate"
        questlv = "Level 2700"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert City"
        CFrameMon = CFrame.new(7391.14794921875, 19.74783706665039, 11600.1650390625)
        CFrameQuest = CFrame.new(7297.27099609375, 19.702999114990234, 11858.0615234375)
    elseif level >= 2750 and level <= 2850 then
        Mon = "Desert Captain"
        questlv = "Level 2750"
        islandlv = workspace.Npc_Workspace.QuestGivers:FindFirstChild("4")
        islandName = "Desert City"
        CFrameMon = CFrame.new(6757.4892578125, 19.72783660888672, 12002.7294921875)
        CFrameQuest = CFrame.new(7297.27099609375, 19.702999114990234, 11858.0615234375)
    end
end

Main:AddToggle({
	Name = "Auto Farm Level",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
	end    
})

local questMain = game.Players.LocalPlayer.PlayerGui.QuestGui
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                checklevel()
                local starterIsland = workspace["NPC Zones"][islandName]
                for _, v in pairs(starterIsland.NPCS:GetChildren()) do
                    local name = v.Name
                    if not (string.find(name, "King") or string.find(name, "Boss")) then
                        if (level >= 2200 and level <= 2249) then
                            if (level >= 2300 and level <= 2350) then
                                if not (string.find(name, "Strong") or string.find(name, "Elite")) then
                                end
                            end
                        end
                        if string.find(name, Mon) then
                            if v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    if questMain.Enabled == false then
                                        repeat
                                            task.wait()
                                            checklevel()
                                            getgenv().ToTarget(CFrameQuest)
                                        until (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 2 or questMain.Enabled == true
                                        checklevel()
                                        local args = {
                                            [1] = islandlv,
                                            [2] = questlv
                                        }
                                        game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction
                                            :InvokeServer(unpack(args))
                                    end
                                    if _G.AutoObservationHaki then
                                        if game.Players.LocalPlayer.PlayerGui.ObsHakiEffect.Circle.Visible == false then
                                            game:GetService("Players").LocalPlayer.PlayerGui.ObservationHaki_Server
                                                .Comunication:FireServer()
                                            game:GetService("Players").LocalPlayer.PlayerGui.ObservationHaki_Server
                                                .Comunication:FireServer()
                                        end
                                    end

                                    if _G.AutoBuso then
                                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                            local BusoEnabled = game:GetService("Players").LocalPlayer.Character
                                                :WaitForChild("BusoEnabled")
                                            local function IsBusoEnabled()
                                                return BusoEnabled.Value
                                            end

                                            if IsBusoEnabled() then
                                                local BBBB = 2
                                            else
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.J,
                                                    false, game)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode
                                                    .J, false, game)
                                            end
                                        end
                                    end

                                    equip(_G.SelectWeapon)
                                    game:GetService('VirtualUser'):CaptureController()
                                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                                until not _G.AutoFarm or v.Humanoid.Health <= 0
                                getgenv().ToTarget(CFrameMon)
                            end
                        end
                    end
                end
            end
        end)
    end
end)
