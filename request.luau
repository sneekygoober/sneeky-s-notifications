local request = request or http_request or syn.request;
if not request then return; end;

request({
    Url = 'http://127.0.0.1:6463/rpc?v=1',
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json',
        ['Origin'] = 'https://discord.com'
    },
    Body = game:GetService('HttpService'):JSONEncode({
        ['cmd'] = 'INVITE_BROWSER',
        ['args'] = {
            ["code"] = 'B2tznpnRvy'
        },
        ['nonce'] = game:GetService('HttpService'):GenerateGUID(true)
    })
});
