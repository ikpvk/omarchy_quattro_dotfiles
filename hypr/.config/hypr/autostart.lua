-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Re-apply laptop display/backlight state after login.
-- If Omarchy's internal-monitor-disable toggle is active, this turns the
-- internal panel backlight off after Hyprland has finished restoring monitors.
o.exec_on_start("sleep 3 && /home/nausica/.local/bin/omarchy-internal-display-backlight recover")

-- Restore the laptop panel/backlight if the last external display disappears.
o.exec_on_start("/home/nausica/.local/bin/omarchy-internal-display-backlight watch")
