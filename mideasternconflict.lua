
-- Mid eastern conflict sim menu incoming
--MEDAL GITHUB: https://github.com/shrimp-nz/medal
--Give them a star!
--[[
game:GetService("TweenService")
local v1 = {
	["SlideEx"] = CFrame.new(0, 0, -0.3),
	["SlideLock"] = false,
	["canAim"] = true,
	["Zoom"] = 60,
	["Zoom2"] = 60,
	["ZoomType"] = 1,
	["gunName"] = script.Parent.Name,
	["Type"] = "Gun",
	["WeaponType"] = "AR",
	["EnableHUD"] = true,
	["IncludeChamberedBullet"] = true,
	["Ammo"] = 30,
	["StoredAmmo"] = 180
}
v1.AmmoInGun = v1.Ammo
v1.MaxStoredAmmo = 180
v1.CanCheckMag = true
v1.MagCount = true
v1.ShellInsert = false
v1.ShootRate = 635
v1.Bullets = 1
v1.BurstShot = 3
v1.ShootType = 3
v1.FireModes = {
	["ChangeFiremode"] = true,
	["Semi"] = true,
	["Burst"] = false,
	["Auto"] = true
}
v1.LimbDamage = { 16, 30 }
v1.TorsoDamage = { 24, 37 }
v1.HeadDamage = { 47, 110 }
v1.DropOffStart = 75
v1.DropOffEnd = 525
v1.IgnoreProtection = false
v1.BulletPenetration = 62.5
v1.WalkSpeed = 1
v1.WalkSpeed = 0.975
v1.CrossHair = false
v1.CenterDot = false
v1.CrosshairOffset = 0
v1.CanBreachDoor = false
v1.SightAtt = ""
v1.BarrelAtt = ""
v1.UnderBarrelAtt = ""
v1.OtherAtt = ""
v1.camRecoil = {
	["camRecoilUp"] = { 29, 32 },
	["camRecoilTilt"] = { 8, 8 },
	["camRecoilLeft"] = { 5, 6 },
	["camRecoilRight"] = { 8, 9 }
}
v1.gunRecoil = {
	["gunRecoilUp"] = { 9, 12 },
	["gunRecoilTilt"] = { 0, 0 },
	["gunRecoilLeft"] = { 2, 4 },
	["gunRecoilRight"] = { 2, 4 }
}
v1.AimRecoilReduction = 1
v1.AimSpreadReduction = 1.2
v1.MinRecoilPower = 0.5
v1.MaxRecoilPower = 1.5
v1.RecoilPowerStepAmount = 0.105
v1.MinSpread = 0.5
v1.MaxSpread = 25
v1.AimInaccuracyStepAmount = 0.4
v1.AimInaccuracyDecrease = 0.375
v1.WalkMult = 0
v1.MoveSwayDamper = 1.05
v1.EnableZeroing = true
v1.MaxZero = 2000
v1.ZeroIncrement = 100
v1.CurrentZero = 0
v1.BulletType = "5.56x45mm"
v1.MuzzleVelocity = 1150
v1.BulletDrop = 0.2
v1.Tracer = true
v1.BulletFlare = false
v1.TracerColor = Color3.fromRGB(255, 255, 255)
v1.RandomTracer = {
	["Enabled"] = false,
	["Chance"] = 25
}
v1.TracerEveryXShots = 3
v1.RainbowMode = false
v1.InfraRed = false
v1.CanBreak = false
v1.Jammed = false
return v1
]]




--[[
local MuzzleVelocitySlider = GunTab:CreateSlider({
	Name = "Muzzle Velocity",
	Range = {0, 3000},
	Increment = 100,
	Suffix = "Feet Per Second",
	CurrentValue = 1000,
	Flag = "MuzzleVelocitySlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		MuzzleVelocityValue = Value
	end,
})


local FireRateButton = GunTab:CreateButton({
	Name = "Set FireRate",
	Callback = function()
			if gunmodule2 ~= nil then

				gunmodule2.ShootRate = fireratemodvalue
			else
				remindertoassign()

			end
	end,
})

local RecoilButton = GunTab:CreateButton({
	Name = "No Recoil",
	Callback = function()
			if gunmodule2 ~= nil then

				gunmodule2.camRecoil = camRecoilTable
				gunmodule2.gunRecoil = gunRecoilTable
			else
				remindertoassign()

			end
	end,
})
warn("Done x9")
local SpreadButton = GunTab:CreateButton({
	Name = "No Spread",
	Callback = function()
			if gunmodule2 ~= nil then

				gunmodule2.MinSpread = 0
				gunmodule2.MaxSpread = 0
			else
				remindertoassign()

			end
	end,
})
warn("Done x7")

local VelocityButton = GunTab:CreateButton({
	Name = "Set Muzzle Velocity",
	Callback = function()
			if gunmodule2 ~= nil then

				gunmodule2.MuzzleVelocity = MuzzleVelocityValue
				gunmodule2.BulletDrop = 0
			else
				remindertoassign()

			end
	end,
})
]]



--[[v1.FireModes = {
	["ChangeFiremode"] = true,
	["Semi"] = true,
	["Burst"] = false,
	["Auto"] = true
}]]




local eventbypass

eventbypass = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

   if not checkcaller() and method == "Kick" then
        return false
end
    return eventbypass(self, ...)
end)


--put script after all this

local camRecoilTable = {
	["camRecoilUp"] = { 0, 0 },
	["camRecoilTilt"] = { 0, 0 },
	["camRecoilLeft"] = { 0, 0 },
	["camRecoilRight"] = { 0, 0 }
}
local gunRecoilTable = {
	["gunRecoilUp"] = { 0, 0 },
	["gunRecoilTilt"] = { 0, 0 },
	["gunRecoilLeft"] = { 0, 0 },
	["gunRecoilRight"] = { 0, 0 }
}
local HeadDamageTable = {100,100}
local TorsoDamageTable = {100,100}
local LimbDamageTable = {100,100}
local firemodestable = {
	["ChangeFiremode"] = true,
	["Semi"] = false,
	["Burst"] = false,
	["Auto"] = true
}
local gunmodule

local gunmodule2
local AutoAssign
local MuzzlVelocityMod
local MuzzleVelocityValue
local tracercolorvalue
local nobulletdrop
local autogunmod
local godbulletmod
local godbulletvalue
local autofire
local automuzzle
local autofirerate
local spreadvalue

local ammovalue
local antistaff
local ammomod
local autorecoil
local walkspeedgun = 1
local walkspeedmod
local autospread
local fireratemod
local players = game:GetService("Players")
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local boxcolor = Color3.fromRGB(255,0,0)
local boxcolorteam = Color3.fromRGB(255,0,0)
local runservice = game:GetService("RunService")
local esptogglevalue
local CurrentCamera = workspace.CurrentCamera
local wtvpp = CurrentCamera.WorldToViewportPoint
local headoffset = Vector3.new(0,0.5,0)
local legoffset = Vector3.new(0,3,0)
local fireratemodvalue = 700

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()



local Window = Rayfield:CreateWindow({
	Name = "Mid Eastern Conflict Sim 1.0.4",
	Icon = "app-window-mac", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Thanks to Sirius",
	LoadingSubtitle = "Made by montell, UILIB by Sirius",
	Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
	ConfigurationSaving = {
	   Enabled = true,
	   FolderName = nil, -- Create a custom folder for your hub/game
	   FileName = "montello hub"
	},
 
	Discord = {
	   Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
	   Invite = "MXmtarPy", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
	   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
 
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
	   Title = "Montellos | mid eastern conflict sim",
	   Subtitle = "Get Key From Discord",
	   Note = "https://discord.gg/hzXFkN2ZQ9", -- Use this to tell the user how to get a key
	   FileName = "MontelloKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
	   SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
	   GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
	   Key = {"GodIsGreat"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
 })






---  esp here [[


-- 1. Load the library
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

-- 2. Change the configuration.
Sense.sharedSettings.limitDistance = true
Sense.sharedSettings.maxDistance = 3000
Sense.teamSettings.enemy.enabled = true
Sense.teamSettings.enemy.tracerOutline = false
Sense.teamSettings.enemy.nameOutline = false
Sense.teamSettings.enemy.boxOutline = false
Sense.teamSettings.enemy.distanceOutline = false
Sense.teamSettings.enemy.boxColor[1] = Color3.new(0, 0.25, 0.75)

-- 3. Load the esp. It doesn't really matter where you put this, but it's recommended you put it at the end of your script.
--Sense.Load()

-- 4. Unload the esp. When you unload Sense, it will clean up every drawing object and instance it has made.
--Sense.Unload()

-- ]] esp ends

local GunTab = Window:CreateTab("Gun Mods", "swords") -- Title, Image
local EspTab = Window:CreateTab("Esp wip", "scan-eye") -- Title, Image
local EspSection = EspTab:CreateSection("Esp Modification")
local Section = GunTab:CreateSection("All Available GunMods")
local UsabilityTab = Window:CreateTab("Usability", "swords")
local UsabilitySection = GunTab:CreateSection("QOL Features")


local function remindertoassign()
 Rayfield:Notify({
	Title = "Alert",
	Content = "Make sure to hold your gun before modding it",
	Duration = 6.5,
	Image = "x",
 })
end

local function autogunmods()
	if gunmodule2 ~= nil then
		if MuzzlVelocityMod == true then
			gunmodule2.MuzzleVelocity = 300000
		end
		if nobulletdrop == true then
			gunmodule2.BulletDrop = 0
		end
		if godbulletmod == true then
			gunmodule2.Bullets = godbulletvalue
		end
		if walkspeedmod == true then
			gunmodule2.WalkSpeed = walkspeedgun
		end
		if autofirerate == true then
			gunmodule2.ShootRate = fireratemodvalue
		
		end
		if autorecoil == true then
			gunmodule2.camRecoil = camRecoilTable
			gunmodule2.gunRecoil = gunRecoilTable
			
		end
		if autospread == true then
			gunmodule2.MinSpread = spreadvalue
			gunmodule2.MaxSpread = spreadvalue
			
		end	
		if autofire == true then
			gunmodule2.FireModes = firemodestable
			
		end


		if ammomod == true then
			gunmodule2.AmmoInGun = ammovalue
			gunmodule2.StoredAmmo = ammovalue
			gunmodule2.MaxStoredAmmo = ammovalue
		end
	else

	end
end


local Keybind = UsabilityTab:CreateKeybind({
	Name = "Apply Gun Mods",
	CurrentKeybind = "L",
	HoldToInteract = false,
	Flag = "GunModKeybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
-----------------
		if gunmodule2 ~= nil then
			if nobulletdrop == true then
				gunmodule2.BulletDrop = 0
			end
			if autofirerate == true then
				gunmodule2.ShootRate = fireratemodvalue
			end
			if godbulletmod == true then
				gunmodule2.Bullets = godbulletvalue
			end
			if walkspeedmod == true then
				gunmodule2.WalkSpeed = walkspeedgun
			end
			if autorecoil == true then
				gunmodule2.camRecoil = camRecoilTable
				gunmodule2.gunRecoil = gunRecoilTable
			end
			if autospread == true then
				gunmodule2.MinSpread = 0
				gunmodule2.MaxSpread = spreadvalue

			end	

			if autofire == true then
				gunmodule2.FireModes = firemodestable
			end


			if ammomod == true then
				gunmodule2.AmmoInGun = ammovalue
				gunmodule2.StoredAmmo = ammovalue
				gunmodule2.MaxStoredAmmo = ammovalue
			end

		else
			remindertoassign()

		end
-------------------
	end,
 })

 local StaffDetectToggle = UsabilityTab:CreateToggle({
	Name = "Anti Admin",
	CurrentValue = true,
	Flag = "StaffToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			Rayfield:Notify({
				Title = "Alert",
				Content = "Anti Admin Toggled!",
				Duration = 6.5,
				Image = "shield-alert",
			 })
		end

		antistaff = Value
	end,
 })


 local AutoGunModToggle = UsabilityTab:CreateToggle({
	Name = "Auto Gun Mod",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autogunmod = Value
	end,
 })



local function notification(title, desc, time)
	Rayfield:Notify({
	   Title = title,
	   Content = desc,
	   Duration = time,
	   Image = "bell-ring",
	})

end

remindertoassign()


local function AutoAssignGun()
	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Tool") then 
			if v:FindFirstChild("ACS_Settings") then
				gunmodule = v:FindFirstChild("ACS_Settings")
				
			end
		end
end
if gunmodule ~= nil then gunmodule2 = require(gunmodule)
	
end
end



local function AssignGun()
	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Tool") then 
			if v:FindFirstChild("ACS_Settings") then		
				gunmodule = v:FindFirstChild("ACS_Settings")
				
			end
		end
end
if gunmodule ~= nil then gunmodule2 = require(gunmodule)
	notification("Done", "Done Assigning gun.", 5)
end

end

--[[
local EspColorPicker = EspTab:CreateColorPicker({
    Name = "Esp Color Picker",
    Color = Color3.fromRGB(255,0,0),
    Flag = "EspColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		
        boxcolor = Value



    end
})
]]

local EspToggle = EspTab:CreateToggle({
    Name = "Toggle Esp",
    CurrentValue = false,
    Flag = "EspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
          if Value == true then
			Sense.Load()

		  elseif Value == false then
			Sense.Unload()

		  end
    end,
 })

 local TracerEspToggle = EspTab:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Flag = "TracerEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.tracer = Value
    end,
 })

 local BoxEspToggle = EspTab:CreateToggle({
    Name = "Boxe",
    CurrentValue = false,
    Flag = "BoxEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.box3d = Value
    end,
 })


 local NameEspToggle = EspTab:CreateToggle({
    Name = "Show Names",
    CurrentValue = false,
    Flag = "NameEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.name = Value
    end,
 })

 
 local DistanceEspToggle = EspTab:CreateToggle({
    Name = "Show Distance",
    CurrentValue = false,
    Flag = "DistanceEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.distance = Value
    end,
 })

 local ChamsEspToggle = EspTab:CreateToggle({
    Name = "Show Chams",
    CurrentValue = false,
    Flag = "ChamsEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.chams = Value
    end,
 })

 local HealthEspToggle = EspTab:CreateToggle({
    Name = "Show Healthbar",
    CurrentValue = false,
    Flag = "HealthEspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
		Sense.teamSettings.enemy.healthBar = Value
    end,
 })




 local AssignToggle = GunTab:CreateToggle({
    Name = "Toggle Auto Assign",
    CurrentValue = false,
    Flag = "AutoAssign1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        AutoAssign = Value
    end,
 })


local AssignButton = GunTab:CreateButton({
	Name = "Assign Gun",
	Callback = function()
	-- The function that takes place when the button is pressed

		AssignGun()
	end,
})

local FireRateSlider = GunTab:CreateSlider({
	Name = "FireRate",
	Range = {0, 1300},
	Increment = 1,
	Suffix = "Bullets Per Minute",
	CurrentValue = 700,
	Flag = "FireRateSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		fireratemodvalue = Value
	end,
})



local FireRateToggle = GunTab:CreateToggle({
	Name = "Set FireRate",
	CurrentValue = false,
	Flag = "FireRateToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autofirerate = Value
	end,
 })




local WalkSpeedSlider = GunTab:CreateSlider({
	Name = "Walk Speed",
	Range = {0.1, 2},
	Increment = 0.01,
	Suffix = "WalkSpeed",
	CurrentValue = 1,
	Flag = "WalkSpeedSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		walkspeedgun = Value
	end,
})



 local WalkspeedToggle = GunTab:CreateToggle({
	Name = "Walkspeed",
	CurrentValue = false,
	Flag = "WalkspeedToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		walkspeedmod = Value
	end,
 })



local AmmoSlider = GunTab:CreateSlider({
	Name = "Ammo Slider",
	Range = {5, 1000},
	Increment = 1,
	Suffix = "Max Ammo",
	CurrentValue = 30,
	Flag = "AmmoSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ammovalue = Value
	end,
})
 


 local AmmoToggle = GunTab:CreateToggle({
	Name = "Modify Ammo",
	CurrentValue = false,
	Flag = "AmmoToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		ammomod = Value
	end,
 })



local GodBulletSlider = GunTab:CreateSlider({
	Name = "Bullet Strength",
	Range = {2, 15},
	Increment = 1,
	Suffix = "Strength",
	CurrentValue = 2,
	Flag = "GodBulletSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		godbulletvalue = Value
	end,
})


local GodbulletToggle = GunTab:CreateToggle({
	Name = "Bullet Strength",
	CurrentValue = false,
	Flag = "GodToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		godbulletmod = Value
	end,
 })


 local Spreadslider = GunTab:CreateSlider({
	Name = "Spread, Good For Shotguns",
	Range = {0, 45},
	Increment = 1,
	Suffix = "Spread",
	CurrentValue = 0,
	Flag = "SpreadSlider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		spreadvalue = Value
	end,
})

local SpreadToggle = GunTab:CreateToggle({
	Name = "No Bullet Spread",
	CurrentValue = false,
	Flag = "SpreadToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autospread = Value
	end,
 })

 
local RecoilToggle = GunTab:CreateToggle({
	Name = "No Recoil",
	CurrentValue = false,
	Flag = "RecoilToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autorecoil = Value
	end,
 })

 local MuzzleVelocityToggle = GunTab:CreateToggle({
	Name = "Muzzle Velocity",
	CurrentValue = false,
	Flag = "MuzzleVelocityToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		MuzzlVelocityMod = Value
	end,
 })

 local NoBulletDropToggle = GunTab:CreateToggle({
	Name = "No Bullet Drop",
	CurrentValue = false,
	Flag = "NoBulletDropToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		nobulletdrop = Value
	end,
 })

 
 
 local AutofireToggle = GunTab:CreateToggle({
	Name = "Autofire",
	CurrentValue = false,
	Flag = "AutoFireToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autofire = Value
	end,
 })


--[[
 local LegitModButton = GunTab:CreateButton({
	Name = "Legit Gun Settings",
	Callback = function()
		fireratemodvalue = 800
		godbulletvalue = 2
		walkspeedgun = 1.05
		ammovalue = 60
		Rayfield:Notify({
			Title = "Done",
			Content = "Successfully Set Gun Config, apply & re-equip your gun",
			Duration = 6.5,
			Image = "circle-check-big",
		 })
	end,

})
]]


 local ApplyMods = GunTab:CreateButton({
	Name = "Apply All Mods",
	Callback = function()
			if gunmodule2 ~= nil then
				if autofirerate == true then
					gunmodule2.ShootRate = fireratemodvalue
				end
				if autorecoil == true then
					gunmodule2.camRecoil = camRecoilTable
					gunmodule2.gunRecoil = gunRecoilTable
				end
				if autospread == true then
					gunmodule2.MinSpread = 0
					gunmodule2.MaxSpread = 0

				end	

			else
				remindertoassign()

			end
	end,

})

--warn("Done x5")



player.CharacterRemoving:Connect(function()
	gunmodule2 = nil
	
end)

--esp ------------------------------------------------------



--warn("Done x1")


--[[

for i,v in pairs(players:GetChildren()) do
    local box = Drawing.new("Square")
    
    box.Visible = false
    box.Color = boxcolor
    box.Thickness = 1
    box.Transparency = 1
    box.Filled = false
    
    function boxesp()
        runservice.RenderStepped:Connect(function()  
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                local rootpart = v.Character:FindFirstChild("HumanoidRootPart")
                local head = v.Character:FindFirstChild("Head")
                local rootposition, rootvis = wtvpp(CurrentCamera, rootpart.Position)
                local headposition = wtvpp(CurrentCamera, head.Position + headoffset)
                local legposition = wtvpp(CurrentCamera, rootpart.Position - legoffset)
    
                if onScreen and esptogglevalue == true then
                    box.Size = Vector2.new(1000 / rootposition.Z, headposition.Y - legposition.Y)
                    box.Position = Vector2.new(rootposition.X - box.Size.X / 2, rootposition.Y - box.Size.Y / 2)
                    box.Color = boxcolor
                    box.Visible = true
                
                    if v.TeamColor == player.TeamColor then
                    
                    box.Visible = false
                    end
    
                else
                box.Visible = false
    
                end
                else
                box.Visible = false
            end
        end)
    
    end
    coroutine.wrap(boxesp)()
    end
    
    game.Players.PlayerAdded:Connect(function(v)
    local box = Drawing.new("Square")
    
    box.Visible = false
    box.Color = boxcolor
    box.Thickness = 1
    box.Transparency = 1
    box.Filled = false
    
    function boxesp()
        runservice.RenderStepped:Connect(function()  
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                local rootpart = v.Character:FindFirstChild("HumanoidRootPart")
                local head = v.Character:FindFirstChild("Head")
                local rootposition, rootvis = wtvpp(CurrentCamera, rootpart.Position)
                local headposition = wtvpp(CurrentCamera, head.Position + headoffset)
                local legposition = wtvpp(CurrentCamera, rootpart.Position - legoffset)
    
                if onScreen and esptogglevalue == true then
                    box.Size = Vector2.new(1000 / rootposition.Z, headposition.Y - legposition.Y)
                    box.Position = Vector2.new(rootposition.X - box.Size.X / 2, rootposition.Y - box.Size.Y / 2)
                    box.Color = boxcolor
                    box.Visible = true
    
                    if v.TeamColor == player.TeamColor then
                    
                    box.Visible = false
                    end
    
                else
                box.Visible = false
    
                end
                else
                box.Visible = false
            end
        end)
    
    end
    coroutine.wrap(boxesp)()
    end)




]]


-----------------------------------------------------------
local function autoassignthing()

    runservice.RenderStepped:Connect(function()
        if player.Character:FindFirstChildWhichIsA("Tool") ~= nil then
        local tool = player.Character:FindFirstChildWhichIsA("Tool")
            if tool:IsA("Tool") then
                if tool:FindFirstChild("ACS_Settings") ~= nil and AutoAssign == true then
                    AutoAssignGun()
                    --warn("Assigned")
                    else warn("Not Assigned")
                end
        
            end
        
        end

    end)

end

coroutine.wrap(autoassignthing)()


local function autogunmodfunction()
runservice.RenderStepped:Connect(function()
		autogunmods()
end)

end



coroutine.wrap(autogunmodfunction)()
Rayfield:LoadConfiguration()

local function notifyadmin()
	Rayfield:Notify({
		Title = "Warning!",
		Content = "Staff Detected in the server, act legit!",
		Duration = 6.5,
		Image = "shield-alert",
	 })
end

for i,PlayerJoined in pairs(game.Players:GetPlayers()) do	
	if PlayerJoined:IsInGroup(15469685) then
		local role = PlayerJoined:GetRoleInGroup(15469685)
		if role == "Moderator" then
			if antistaff == true then
				game.Players.LocalPlayer:Kick("Staff Detected")
			
			end
			notifyadmin()
		end
		if role == "Admin" then
			if antistaff == true then
				game.Players.LocalPlayer:Kick("Staff Detected")
			
			end
			notifyadmin()
		end
		if role == "Weare" then
			if antistaff == true then
				game.Players.LocalPlayer:Kick("Staff Detected")
			
			end
			notifyadmin()
		end

	end	
	
end




game.Players.PlayerAdded:connect(function(PlayerJoined)
		if PlayerJoined:IsInGroup(15469685) then
			local role = PlayerJoined:GetRoleInGroup(15469685)
			if role == "Moderator" then
				if antistaff == true then
					game.Players.LocalPlayer:Kick("Staff Detected")
				
				end
				notifyadmin()
			end
			if role == "Admin" then
				if antistaff == true then
					game.Players.LocalPlayer:Kick("Staff Detected")
				
				end
				notifyadmin()
			end
			if role == "Weare" then
				if antistaff == true then
					game.Players.LocalPlayer:Kick("Staff Detected")
				
				end
				notifyadmin()
			end

		end	

	print(PlayerJoined.Name)


end)



warn("AntiDetect Version 2")



warn("Executing...")
print("NewUpdate")