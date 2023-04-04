--[[
	                                                                                                                            
                                                                                                        bbbbbbbb            
                    lllllll         tttt                           hhhhhhh                              b::::::b            
                    l:::::l      ttt:::t                           h:::::h                              b::::::b            
                    l:::::l      t:::::t                           h:::::h                              b::::::b            
                    l:::::l      t:::::t                           h:::::h                               b:::::b            
    cccccccccccccccc l::::lttttttt:::::ttttttt                      h::::h hhhhh       uuuuuu    uuuuuu  b:::::bbbbbbbbb    
  cc:::::::::::::::c l::::lt:::::::::::::::::t                      h::::hh:::::hhh    u::::u    u::::u  b::::::::::::::bb  
 c:::::::::::::::::c l::::lt:::::::::::::::::t                      h::::::::::::::hh  u::::u    u::::u  b::::::::::::::::b 
c:::::::cccccc:::::c l::::ltttttt:::::::tttttt     ---------------  h:::::::hhh::::::h u::::u    u::::u  b:::::bbbbb:::::::b
c::::::c     ccccccc l::::l      t:::::t           -:::::::::::::-  h::::::h   h::::::hu::::u    u::::u  b:::::b    b::::::b
c:::::c              l::::l      t:::::t           ---------------  h:::::h     h:::::hu::::u    u::::u  b:::::b     b:::::b
c:::::c              l::::l      t:::::t                            h:::::h     h:::::hu::::u    u::::u  b:::::b     b:::::b
c::::::c     ccccccc l::::l      t:::::t    tttttt                  h:::::h     h:::::hu:::::uuuu:::::u  b:::::b     b:::::b
c:::::::cccccc:::::cl::::::l     t::::::tttt:::::t                  h:::::h     h:::::hu:::::::::::::::uub:::::bbbbbb::::::b
 c:::::::::::::::::cl::::::l     tt::::::::::::::t                  h:::::h     h:::::h u:::::::::::::::ub::::::::::::::::b 
  cc:::::::::::::::cl::::::l       tt:::::::::::tt                  h:::::h     h:::::h  uu::::::::uu:::ub:::::::::::::::b  
    ccccccccccccccccllllllll         ttttttttttt                    hhhhhhh     hhhhhhh    uuuuuuuu  uuuubbbbbbbbbbbbbbbb   

Executable on:
Tower of Hell
THE Tower of Hell


]]--


if game.PlaceId == 1962086868 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "clt-hub | Tower of Hell", IntroText = "clt-hub is loading", HidePremium = false, SaveConfig = true, ConfigFolder = "clt-con"})
    local LocalPlayer = game:GetService("Players").LocalPlayer
    _G.invi = false
    _G.time = false
    _G.sect = ""

    local function Invincibility()
        if LocalPlayer.Character then
            while _G.invi == true do
            wait(.5)
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "hitbox" then
                    v:Clone().Parent = game.Lighting
                            v:Destroy()
                    end
            end
        end
        if _G.invi == false then
            for i, v in pairs(game.Lighting:GetChildren()) do
                    if v.Name == "hitbox" then
                    v.Parent = game.Players.LocalPlayer.Character
                    end
            end
        end
        end
    end

    local function Item()
        for _,v in pairs(game.ReplicatedStorage:FindFirstChild("Gear"):GetChildren()) do
            v:Clone().Parent = LocalPlayer.Backpack
        end
    end

    local function Freeze()
        if LocalPlayer then
            LocalPlayer.PlayerScripts:FindFirstChild("timefreeze").Value = _G.time
        end
    end

    local TowerTab = Window:MakeTab({
        Name = "Tower",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local Section = Tab:AddSection({
	Name = "Teleport"
    })
    TowerTab:AddButton({
        Name = "Win",
        Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.tower.sections.finish.start.Position.X, workspace.tower.sections.finish.start.Position.Y + 10, workspace.tower.sections.finish.start.Position.Z)
        end    
    })

    TowerTab:AddButton({
        Name = "Speed",
        Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.tower.sections.finish.FinishGlow.CFrame
            wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.tower.sections.finish.FinishGlow.CFrame
        end    
    })

    local Section = Tab:AddSection({
	Name = "Other"
    })

    TowerTab:AddToggle({
        Name = "Time Freeze",
        Default = false,
        Callback = function(tof)
            _G.time = tof
            Freeze()
        end    
    })

    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local Section = Tab:AddSection({
	Name = "Hitbox"
    })

    PlayerTab:AddToggle({
        Name = "Invincible",
        Default = false,
        Callback = function(tof)
            _G.invi = tof
            Invincibility()
        end    
    })

    local Section = Tab:AddSection({
	Name = "Humanoid"
    })

    PlayerTab:AddSlider({
        Name = "Walkspeed",
        Min = 1,
        Max = 500,
        Default = 16,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = "SPS",
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end    
    })

    PlayerTab:AddSlider({
        Name = "Jump Power",
        Min = 1,
        Max = 500,
        Default = 50,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = "POW",
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end    
    })

    PlayerTab:AddButton({
        Name = "Reset Speed & Jump Power",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end    
    })

    PlayerTab:AddButton({
        Name = "Give All Items",
        Callback = function()
                Item()
        end    
    })

    local CreditsTab = Window:MakeTab({
        Name = "Credits",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    CreditsTab:AddLabel("shlexware - Orion Library")
    CreditsTab:AddLabel("Moon and Courtney - dark dex v4")
    CreditsTab:AddLabel("you - using this script")

    OrionLib:Init()
end