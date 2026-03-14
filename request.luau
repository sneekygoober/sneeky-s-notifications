local http_request = http_request or request or syn.request;
if not http_request then return; end;

pcall(http_request, {
    Url = 'http://127.0.0.1:6463/rpc?v=1',
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json',
        ['Origin'] = 'https://discord.com'
    },
    Body = game:GetService('HttpService'):JSONEncode({
        ['cmd'] = 'INVITE_BROWSER',
        ['args'] = {
            ["code"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/info.luau"))().discord_link
        },
        ['nonce'] = game:GetService('HttpService'):GenerateGUID(true)
    })
});
