
-- Load the custom GUI library
local TokyoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/weakhoes/Roblox-UI-Libs/refs/heads/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))()

-- Setup GUI using TokyoLib
local Window = TokyoLib:Window("Gaze Bypass", "Bypass Tutorial Required", Enum.KeyCode.RightShift)

local Tab = Window:Tab("Main")
local Section = Tab:Section("Bypass Section")

Section:TextBox("Enter Message", "Type your message here", function(input)
    bypass(input) -- Use your bypass function here
end)

Section:Button("Copy Tutorial", function()
    local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    if everyClipboard then
        everyClipboard([[
Setup Bypass Tutorial:
"https://youtube.com/shorts/z1yCdkbXTi4?si=f1ol4wCL4jxW3jtP"]])
    end
end)

-- Your existing bypass function
function bypass(input)
    local NUMBER, LOWER, A_1, A_2, TextChatService
    NUMBER = { ["0"] = "\xEF\xBC\x90", ["1"] = "\xEF\xBC\x91", ["2"] = "\xEF\xBC\x92", ["3"] = "\xEF\xBC\x93", ["4"] = "\xEF\xBC\x94", ["5"] = "\xEF\xBC\x95", ["6"] = "\xEF\xBC\x96", ["7"] = "\xEF\xBC\x97", ["8"] = "\xEF\xBC\x98", ["9"] = "\xEF\xBC\x99" }
    LOWER = input:lower()
    local result = LOWER:gsub("%d", function(digit) return NUMBER[digit] or digit end)
    TextChatService = game:GetService("TextChatService"):FindFirstChild("TextChannels")

    if game.PlaceId == 4483381587 then
        result = result:gsub("i", "\u{0131}\u{030A}")
    else
        result = result:gsub("i", "\u{0131}\u{0307}")
    end

    result = result:gsub(" ", "\b"):gsub("|", "\r")
    A_1 = "\u{0358}\b" .. result
    A_2 = "All"
    if TextChatService then
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(A_1)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(A_1, A_2)
    end
end
