if not syn and not PROTOSMASHER_LOADED then print'Unnamed ESP only officially supports Synapse and Protosmasher! If you\'re an exploit developer and have added drawing API to your exploit, try setting syn as true then checking if that works, otherwise, DM me on discord @ cppbook.org#1968 or add an issue to the Unnamed ESP Github Repository and I\'ll see it through email!' end

local UserInputService		= game:GetService'UserInputService';
local UserInputService	= game:GetService'UserInputService';
local HttpService		= game:GetService'HttpService';
local GUIService		= game:GetService'GuiService';
local TweenService		= game:GetService'TweenService';
local RunService		= game:GetService'RunService';
local Players			= game:GetService'Players';
local LocalPlayer		= Players.LocalPlayer;
local Camera			= workspace.CurrentCamera;
local Mouse			= LocalPlayer:GetMouse();
local V2New			= Vector2.new;
local V3New			= Vector3.new;
local WTVP			= Camera.WorldToViewportPoint;
local WorldToViewport		= function(...) return WTVP(Camera, ...) end;
local Menu			= {};
local Mouse				= LocalPlayer:GetMouse();
local V2New				= Vector2.new;
local V3New				= Vector3.new;
local WTVP				= Camera.WorldToViewportPoint;
local WorldToViewport	= function(...) return WTVP(Camera, ...) end;
local Menu				= {};
local MouseHeld			= false;
local LastRefresh		= 0;
local OptionsFile		= 'IC3_ESP_SETTINGS.dat';
@@ -37,8 +37,8 @@ local EnemyColor		= Color3.new(1, 0, 0);
local TeamColor			= Color3.new(0, 1, 0);
local MenuLoaded		= false;
local ErrorLogging		= false;
local TracerPosition		= V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
local DragTracerPosition	= false;
local TracerPosition	= V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
local DragTracerPosition= false;
local SubMenu 			= {};
local IsSynapse 		= syn and not PROTOSMASHER_LOADED;
local Connections 		= { Active = {} };
@@ -49,7 +49,7 @@ local Spectating;

-- if not PROTOSMASHER_LOADED then Drawing.UseCompatTransparency = true; end -- For Elysian

shared.MenuDrawingData		= shared.MenuDrawingData or { Instances = {} };
shared.MenuDrawingData	= shared.MenuDrawingData or { Instances = {} };
shared.InstanceData		= shared.InstanceData or {};
shared.RSName			= shared.RSName or ('UnnamedESP_by_ic3-' .. HttpService:GenerateGUID(false));

@@ -232,7 +232,22 @@ local Modules = {
			end
		end;
	};
	[3016661674] = {
	[2555873122] = {
		CustomESP = function()
			if workspace:FindFirstChild'WoodPlanks' then
				for i, v in pairs(workspace:GetChildren()) do
					if v.Name == 'WoodPlanks' then
						local Main = v:FindFirstChild'Wood';

						if Main then
							pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, 'Wood Planks', Color3.fromRGB(13, 255, 227));
						end
					end
				end
			end
		end;
	};
	[5208655184] = {
		CustomPlayerTag = function(Player)
			local Name = '';

@@ -355,8 +370,6 @@ local Modules = {
	};
};

Modules[5208655184] = Modules[3016661674]; -- rogue gaia

if Modules[game.PlaceId] ~= nil then
	local Module = Modules[game.PlaceId];
	CustomPlayerTag = Module.CustomPlayerTag or nil;
@@ -1687,6 +1700,7 @@ end)

function ToggleMenu()
	if Options.MenuOpen.Value then
		-- GUIService:SetMenuIsOpen(true);
		GetTableData(shared.MenuDrawingData.Instances)(function(i, v)
			if OldData[v] then
				pcall(Set, v, 'Visible', true);
