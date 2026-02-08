
local playTime = 0

CreateThread(function()
    while true do
        Wait(1000)
        playTime = playTime + 1
        TriggerServerEvent('playtime:update', playTime)
    end
end)
