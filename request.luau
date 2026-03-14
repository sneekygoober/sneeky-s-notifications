local http_request = http_request or request;--[[ or syn.request;]]
if not http_request then return; end;

local cloneref = cloneref or function(i: Instance) return i; end;

local HTTP = cloneref(game:GetService("HttpService"));
local discord_link = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/info.luau"))().discord_link;

pcall(http_request, {
    Url = "http://127.0.0.1:6463/rpc?v=1",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    Body = HTTP:JSONEncode({
        ["cmd"] = "INVITE_BROWSER",
        ["args"] = {
            ["code"] = discord_link
        },
        ["nonce"] = HTTP:GenerateGUID(true)
    })
});
