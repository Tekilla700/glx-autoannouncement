local announcementBreak = Config.announcementBreak
local announcementMessages = Config.announcementMessages

Citizen.CreateThread(function()
    while true do
        local randomIndex = math.random(1, #announcementMessages)
        local announcement = announcementMessages[randomIndex]
        local message = announcement.message
        local color = announcement.color
        
        TriggerClientEvent('showAnnouncement', -1, message, color)
        
        Citizen.Wait(announcementBreak * 1000)
    end
end)
