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
        print(string.format("Mouse button %d down at: %d, %d", button_value, event.x, event.y))

        if button_value == 1 then
            -- Play/Pause button
            if event.x >= 30 and event.x <= 75 and event.y >= 30 and event.y <= 70 then
                os.execute("geary &")
		os.execute("paplay ~/.config/conky/Obsidian/scripts/notification.oga &")
            end
            -- Play/Pause button
            if event.x >= 25 and event.x <= 75 and event.y >= 320 and event.y <= 380 then
                os.execute("gnome-terminal -- bash -c 'calcurse; exec bash' &") --defaults to gnome-terminal since i'm using gnome, change to your preferred terminal
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

