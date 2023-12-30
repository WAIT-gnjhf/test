
local game = game.PlaceId
if game == 6918802270 then
    World1 = true;
elseif game == 14979402479 then
    World2 = true;
else
    game:Shutdown()
end; 

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



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Ganteng Hub [Haze Piece]", HidePremium = false, SaveConfig = true, ConfigFolder = "Ganteng - HP", IntroText="Ganteng Hub - HP"})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Main:AddDropdown({
	Name = "Select Weapon",
	Default = "...",
	Options = {"Melee", "Sword", "Gun"},
	Callback = function(Value)
		SelectWeapon = Value
	end    
})


task.spawn(function()
    while wait() do
        pcall(function()
            if SelectWeapon == "Melee" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(MeleeWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            elseif SelectWeapon == "Sword" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(swordWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            elseif SelectWeapon == "Fruit" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(FruitWeaponNames, v.Name) then
                        _G.Select_Weapon = v.Name
                    end
                end
            else
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.Select_Weapon = v.Name
                        end
                    end
                end
            end
        end)
    end
end)


function EquipWeapon(Tool)
    pcall(function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) then
            local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(Tool)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid)
        end
    end)
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
                                                -- game:GetService("Players").LocalPlayer.Character.Buso_Server.Comunication:FireServer()
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.J,
                                                    false, game)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode
                                                    .J, false, game)
                                            end
                                        end
                                    end

                                    getgenv().ToTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, _G.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0))

                                    EquipWeapon(_G.Select_Weapon)
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

Main:AddToggle({
	Name = "Auto Set Spawn Point",
	Default = false,
	Callback = function(Value)
		_G.AutoSetSpawnPoint = Value
	end    
})

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSetSpawnPoint then
                local clown = Vector3.new(-2297.43115234375, 68.3956069946289, -254.5489959716797)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - clown).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Clown Island")
                end

                local Fishman = Vector3.new(7532.01513671875, -1.0822196006774902, -2977.40576171875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Fishman).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Fishman Island")
                end

                local HalfHot = Vector3.new(3088.55078125, 205.62106323242188, -2676.47412109375)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - HalfHot).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Half Hot Half Cold")
                end


                local Marine = Vector3.new(467.18402099609375, 100.61599731445312, 5504.99560546875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Marine).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Marine Base Town")
                end

                local Impel = Vector3.new(3749.59619140625, 95.50956726074219, 7003.53759765625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Impel).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Impel Jail")
                end

                local MarineHQ = Vector3.new(-6398.89453125, 224.10000610351562, 6473.53857421875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - MarineHQ).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Marine HQ")
                end

                local Revolutionary = Vector3.new(3546.29833984375, 97.4886703491211, 3844.509033203125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Revolutionary).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Revolutionary Base")
                end

                local SeaR = Vector3.new(-5979.048828125, 9.873251914978027, 2477.521484375)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - SeaR).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Sea Resturant")
                end

                local Skull = Vector3.new(7035.6826171875, 91.79483032226562, 178.0691375732422)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Skull).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Skull Island")
                end

                local Skypiea = Vector3.new(3044.330810546875, 1007.5880126953125, 605.1170654296875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Skypiea).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Skypiea Island")
                end

                local TallW = Vector3.new(39.4341087, 16.7828388, 2297.73755, -1.1920929e-07, -0, -1.00000012, 0,
                    -1.00000024, 0, -1.00000012, 0, -1.1920929e-07)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - TallW).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Tall Woods")
                end

                local Desert = Vector3.new(-5092.19921875, 129.68508911132812, -313.27325439453125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Desert).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Desert Ruins")
                end

                local Logue = Vector3.new(-2877.0322265625, -9.251429557800293, 1803.997314453125)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Logue).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Logue Town")
                end

                local Rocky = Vector3.new(-98.78933715820312, 225.37521362304688, -2916.687744140625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Rocky).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Rocky Pillars")
                end


                local Shark = Vector3.new(-4948.091796875, 55.05535125732422, -2763.64697265625)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Shark).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("Shark Park")
                end

                local Starter = Vector3.new(-2209.9765625, 74.17393493652344, -3377.793701171875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Starter).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Starter Island")
                end

                local Thriller = Vector3.new(7462.18457, 18.2402382, 6558.23242, 0, 0, 1, 0, -1, 0, 1, 0, -0)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - Thriller).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Thriller Boat")
                end

                local WaterAssets = Vector3.new(2319.9208984375, -76.742431640625, 3913.479248046875)
                local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                if (characterPosition - WaterAssets).Magnitude < 900 then
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer("WaterAssets")

                    local Udon = Vector3.new(1992.2822265625, 15.569685935974121, 11978.8203125)
                    local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                    if (characterPosition - Udon).Magnitude < 900 then
                        game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                        "Udon Prison")

                        local Snowy = Vector3.new(6926.8505859375, 48.688419342041016, 16136.0947265625)
                        local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        .Position
                        if (characterPosition - Snowy).Magnitude < 900 then
                            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                            "Snowy Graveyard")

                            local Desert = Vector3.new(7688.09130859375, 26.273921966552734, 11608.1826171875)
                            local characterPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            .Position
                            if (characterPosition - Desert).Magnitude < 900 then
                                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(
                                "Desert City")

                                local Flower = Vector3.new(2605.515380859375, 47.066383361816406, 15894.533203125)
                                local characterPosition = game:GetService("Players").LocalPlayer.Character
                                .HumanoidRootPart.Position
                                if (characterPosition - Flower).Magnitude < 900 then
                                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint
                                        :FireServer("Flower Capital")
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoRedeemcode then
            function UseCode(Text)
                game:GetService("ReplicatedStorage").Replication.ClientEvents.ClaimCode:InvokeServer(Text)
            end

            UseCode("THANKSFOR70K2023")
            UseCode("FREEX2EXP")
            UseCode("GROUPONLY")
            UseCode("160KLIKESFORNEXT")
            UseCode("WOW190KFORNEXT")
            UseCode("220KLIKES4CODE")
            UseCode("DRAGONUPDATE23")
            UseCode("220KLIKES4CODE")
            UseCode("SHUTDOWN4")
            UseCode("250KLETSGO")
        end
    end
end)



spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoSea2 then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Poneglyph Scroll" and v:IsA("Tool") then
                        getgenv().ToTarget(CFrame.new(-2117.498046875, 46.2481575012207, -2940.043701171875))
                        EquipWeapon("Poneglyph Scroll")
                        workspace.Npc_Workspace["Sea Teleporter"]["Sea 2"].UnlockSea:InvokeServer()
                        workspace.Npc_Workspace["Sea Teleporter"]["Sea 2"].Teleport:InvokeServer()
                    else
                        workspace.Logic.PointsOfInterest:FindFirstChild("Poneglyph Scroll").Pick:InvokeServer()
                    end
                end
            end
        end
    end)
end)

_G.DistanceMob = 5

Weapon = {
    "Melee",
    "Sword",
    "Fruit"
}

local MeleeWeaponNames = {
    "Black Leg", "Electro", "dragon's breath", "Combat title", "Combat"
}


local swordWeaponNames = {
    "Katana", "Shark Blade", "3 Sword Style", "Shusui", "Yoru (Dark Blade)",
    "Fishman Trident", "Operation Blade", "Raiu Sword", "Bisento V2", "Golden Staff", "Mace", "Pipe",
    "Soul Cane", "Yoru", "Two Sword Style", "Two Sword Style V2", "Sea Beast Hammer"
}

local FruitWeaponNames = {
    "Dragon", "Darkness", "Magma", "Phoenix", "Magnet",
    "Rubber", "Electricity", "Ice", "Tremor", "Operation", "Gas", "Flame",
    "Mammoth", "Snow", "Gravity", "Light", "Sand", "String", "Rubber", "Kilo", "Paw", "Smoke", "Sand",
    "Buddha", "Clear", "Spin", "Spike", "Bomb", "Chop", "Barrier"
}


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

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

local function toTarget(...)
    local RealtargetPos = { ... }
    local targetPos = RealtargetPos[1]
    local RealTarget
    if type(targetPos) == "vector" then
        RealTarget = CFrame.new(targetPos)
    elseif type(targetPos) == "userdata" then
        RealTarget = targetPos
    elseif type(targetPos) == "number" then
        RealTarget = CFrame.new(unpack(RealtargetPos))
    end

    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
        if tween then tween:Cancel() end
        repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2)
    end

    local tweenfunc = {}
    local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
        .Magnitude
    if Distance < 1000 then
        Speed = 500
    elseif Distance >= 1000 then
        Speed = 500
    end

    if _G.BypassTP then
        if Distance > 3000 and not Material and not _G.Settings.FightingStyle["Auto God Human"] and not _G.Settings.Raids["Auto Raids"] and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") then
            pcall(function()
                tween:Cancel()
                fkwarp = false

                if game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("SpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
                    wait(.1)
                    Com("F_", "TeleportToSpawn")
                elseif game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                    wait(0.1)
                    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                else
                    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                        if fkwarp == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
                        end
                        fkwarp = true
                    end
                    wait(.08)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                    wait(.1)
                    Com("F_", "SetSpawnPoint")
                end
                wait(0.2)

                return
            end)
        end
    end



    local tween_s = game:service "TweenService"
    local info = TweenInfo.new(
        (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
        .Magnitude / Speed, Enum.EasingStyle.Linear)
    local tweenw, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, { CFrame = RealTarget })
        tween:Play()
    end)

    function tweenfunc:Stop()
        tween:Cancel()
    end

    function tweenfunc:Wait()
        tween.Completed:Wait()
    end

    return tweenfunc
end

function two(gotoCFrame) --- Tween
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end)
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 10 then
        pcall(function()
            tweenz:Cancel()
        end)
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
    else
        local tween_s = game:service "TweenService"
        local info = TweenInfo.new(
            (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position)
            .Magnitude /
            650, Enum.EasingStyle.Linear)
        tween, err = pcall(function()
            tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, { CFrame = gotoCFrame })
            tweenz:Play()
        end)
        if not tween then return err end
    end
    function _TweenCanCle()
        tweenz:Cancel()
    end
end

function Noclip()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- ทำให้ตัวละครลอยตัว
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false -- ทำให้วัตถุทั้งหมดในตัวละครทะลุผ่านกำแพง
        end
    end
end

Noclip()

-- [Body Gyro]
task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            --[World 1]
            if _G.AutoFarm or _G.TeleportIsland
            then
                if syn then
                    setfflag("HumanoidParallelRemoveNoPhysics", "False")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                    end
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                            end
                            local BodyVelocity = Instance.new("BodyVelocity")
                            BodyVelocity.Name = "BodyVelocity1"
                            BodyVelocity.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
                end
            end
        end)
    end)
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.AutoFarm or _G.TeleportIsland
            then
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
                    wait(5)
                end
                PIO = false
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local L_1 = Instance.new("BodyVelocity")
                    L_1.Name = "BodyGyrozz"
                    L_1.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    L_1.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                    L_1.Velocity = Vector3.new(0, 0, 0)
                end
            elseif PIO == false then
                for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
                    if v.Name == "BodyGyrozz" then
                        v:Destroy()
                        PIO = true
                    end
                end
            end
        end)
    end
end)

function changestate()
    game.Workspace["Part"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.TeleportIsland
            then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
