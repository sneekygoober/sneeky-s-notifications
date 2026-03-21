local http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
if not http_request then return; end;

local cloneref = cloneref or function(i: Instance) return i; end;

local HTTP = cloneref(game:GetService("HttpService"));
local discord_link = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/info.luau"))().discord_link;

for i = 6463, 6472, 1 do
    pcall(http_request, {
        Url = "http://127.0.0.1:" .. tostring(i) .. "/rpc?v=1",
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
end;
