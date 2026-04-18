local cloneref = cloneref or function(i: Instance) return i; end;
local getgenv = getgenv or getfenv;

local SG: StarterGui = cloneref(game:GetService("StarterGui"));
local Players: Players = cloneref(game:GetService("Players"));

local get_id = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/get_id.luau"))();

local plr = Players.LocalPlayer;

local notifs = {
    ["success"] = function(msg: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "SUCCESS - READ BELOW",
            ["Text"] = msg,
            ["Icon"] = get_id("logo");
            ["Duration"] = 60
        });
    end,
    ["info"] = function(info: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "INFO - READ BELOW",
            ["Text"] = info,
            ["Icon"] = get_id("logo");
            ["Duration"] = 20,
            ["Button1"] = "Close"
        });
    end,
    ["warning"] = function(w: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "WARNING - READ BELOW",
            ["Text"] = w,
            ["Icon"] = get_id("logo");
            ["Duration"] = 30,
            ["Button1"] = "Close"
        });
    end,
    ["error"] = function(err: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "ERROR - READ BELOW",
            ["Text"] = err,
            ["Icon"] = get_id("logo");
            ["Duration"] = 60,
            ["Button1"] = "Close"
        });
    end
};

if getgenv()["SNEEKY'S SCRIPT RUNNING"] then
    notifs["error"]("DO NOT EXECUTE THIS SCRIPT MORE THAN ONCE!");
    --task.wait(1);
    coroutine.yield();
    --plr:Kick("DO NOT EXECUTE THIS SCRIPT MORE THAN ONCE!");
    return;
end;

getgenv()["SNEEKY'S SCRIPT RUNNING"] = true;

local c; c = Players.PlayerRemoving:Connect(function(player)
    if player == plr then getgenv()["SNEEKY'S SCRIPT RUNNING"] = nil; c:Disconnect(); c = nil; end;
end);

loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/request.luau"))();

notifs["info"]("Executing...");

return notifs;
