ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- المدة بين كل سجن وسجن (بالثواني)
local JAIL_COOLDOWN = 30

-- نخزن آخر وقت سجن فيه كل سجّان
local jailerCooldown = {}

RegisterServerEvent('esx_jail:sendToJail')
AddEventHandler('esx_jail:sendToJail', function(target, jailTime)
    local jailer = source -- الشخص اللي يسجّن
    local now = os.time()

    if jailerCooldown[jailer] then
        local diff = now - jailerCooldown[jailer]

        if diff < JAIL_COOLDOWN then
            local remaining = JAIL_COOLDOWN - diff

            TriggerClientEvent('esx:showNotification', jailer,
                '⏳ انتظر ' .. remaining .. ' ثانية قبل سجن شخص آخر')

            return
        end
    end

    -- نسجل وقت السجن
    jailerCooldown[jailer] = now

    -- نكمل السجن الطبيعي
    TriggerEvent('esx_jail:sendToJailInternal', target, jailTime)
end)


