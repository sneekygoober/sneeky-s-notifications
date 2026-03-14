local cloneref = cloneref or function(i: Instance) return i; end;
local getgenv = getgenv or getfenv;

local SG: StarterGui = cloneref(game:GetService("StarterGui"));
local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;

local notifs = {
    ["success"] = function(msg: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "SUCCESS - READ BELOW",
            ["Text"] = msg,
            ["Duration"] = 60
        });
    end,
    ["info"] = function(info: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "INFO - READ BELOW",
            ["Text"] = info,
            ["Duration"] = 20,
            ["Button1"] = "Close"
        });
    end,
    ["error"] = function(err: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "ERROR - READ BELOW",
            ["Text"] = err,
            ["Duration"] = 60,
            ["Button1"] = "Close"
        });
    end
};

if getgenv()["SNEEKY'S SCRIPT RUNNING"] then
    notifs["error"]("DO NOT EXECUTE THIS SCRIPT MORE THAN ONCE!");
    task.wait(1);
    coroutine.yield();
    --plr:Kick("DO NOT EXECUTE THIS SCRIPT MORE THAN ONCE!");
end;

getgenv()["SNEEKY'S SCRIPT RUNNING"] = true;

local c; c = Players.PlayerRemoving:Connect(function(player)
    if player == plr then getgenv()["SNEEKY'S SCRIPT RUNNING"] = nil; c:Disconnect(); c = nil; end;
end);

return notifs;
