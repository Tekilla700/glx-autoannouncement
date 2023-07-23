local announcementActive = false
local announcementText = ""
local announcementColor = {255, 255, 255, 255}

RegisterNetEvent('showAnnouncement')
AddEventHandler('showAnnouncement', function(message, color)
    announcementActive = true
    announcementText = message
    announcementColor = color

    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        announcementActive = false
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        
        if announcementActive then
            SetTextFont(0)
            SetTextScale(0.3, 0.3)
            SetTextCentre(true)
            SetTextColour(table.unpack(announcementColor))
            SetTextDropShadow(0, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextEntry("STRING")
            AddTextComponentString(announcementText)
            DrawText(0.5, 0.02)
        end
    end
end)
