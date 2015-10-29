local icon = awful.util.getdir("config") .. "/icons/my-menu.png"
local title = "My menu"

local menu = {
    {"Hipchat", "hipchat"},
    {"Skype", "skype"},
    {"Google chrome", "google-chrome"},
    {"Firefox", "firefox"},
    {"Monitors", "xrandr --auto --output VGA1 --left-of HDMI1"},
    {"Network manager", "nm-applet"}
}

myMenu = {
    title, 
    menu,
    icon
}

return myMenu
