function conky_mouse_handler(event)
    local button_map = {
        left = 1,
        right = 2,
        middle = 3,
        scroll_up = 4,
        scroll_down = 5
    }

    local button_value = button_map[event.button] or -1

    if event.type == "button_down" then
        print(string.format("Mouse button %d down at: %d, %d", button_value, event.x, event.y)) --debugging

        if button_value == 1 then
            -- Play/Pause
            if event.x >= 165 and event.x <= 180 and event.y >= 292 and event.y <= 305 then
                os.execute("playerctl play-pause &")
                
            end

            -- Previous Track 
            if event.x >= 122 and event.x <= 133 and event.y >= 292 and event.y <= 310 then
                os.execute("playerctl previous &")
            end

            -- Next Track 
            if event.x >= 220 and event.x <= 232 and event.y >= 292 and event.y <= 310 then
               os.execute("playerctl next &")
               
            end
             -- Spotify
            if event.x >= 10 and event.x <= 100 and event.y >= 225 and event.y <= 310 then
                os.execute("flatpak run com.spotify.Client &") --spotify flatpak, comment it if using deb
                --os.execute("spotify &") --spotify deb, comment it if using flatpak
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &") --there's no better debugging tool than a sound
            end
             --Google Calendar--
            if event.x >= 27 and event.x <= 80 and event.y >= 370 and event.y <= 420 then
                os.execute("firefox https://calendar.google.com/calendar/ &") --[[
                i use a CalDAV script to sync calcurse to google calendar, but since it's a pain in the ass to set it up,
                i'll just link it to Google Calendar, most people wont bother with setting CalDAV up.
                Contact me if you want help on setting up CalDAV --]]
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
                
            end
            --Trash--
            if event.x >= 115 and event.x <= 165 and event.y >= 370 and event.y <= 420 then
                os.execute("trash-empty &")
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
                os.execute("notify-send -u normal -a 'nautilus' -i '~/.config/conky/Obsidian/res/trashindicator.svg' 'Trash deleted' 'All files cleared' &")
            end
            --Files--
            if event.x >= 185 and event.x <= 235 and event.y >= 370 and event.y <= 420 then
                os.execute("nautilus ~/.config/conky/ &") --change to preferred directory
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
            end
            --YouTube--
            if event.x >= 30 and event.x <= 80 and event.y >= 462 and event.y <= 515 then
                os.execute("firefox https://www.youtube.com/ &")
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
            end
	    --Reddit--
            if event.x >= 110 and event.x <= 160 and event.y >= 462 and event.y <= 515 then
                os.execute("firefox https://www.reddit.com/ &")
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
            end
            --Instagram--
            if event.x >= 185 and event.x <= 240 and event.y >= 462 and event.y <= 515 then
                os.execute("firefox https://www.instagram.com/ &")
                os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
            end
            
        end

        if event.mods then
            for k, v in pairs(event.mods) do
                if v then print("Modifier held:\t" .. k) end
            end
        end
    elseif event.type == "button_up" then
        print(string.format("Mouse button released at: %d, %d", event.x, event.y))
    elseif event.type == "mouse_move" then
        print(string.format("Mouse moved to: %d, %d (abs: %d, %d) at time %d",
            event.x, event.y, event.x_abs, event.y_abs, event.time))
    end
end
