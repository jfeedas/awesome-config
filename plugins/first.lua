local icon = awful.util.getdir("config") .. "/spotify-icon.jpg"

function notify ()
    naughty.notify({
        title = 'Vienetukai????!!',
        text = 'Is kur sitie vienetukai Tatai?!!!!',
        screen = mouse.screen,
        timeout = 5,
        icon = icon,
        icon_size = 40
    })
end

firstWidget = widget({ type = "imagebox" })
firstWidget.image = image(icon)
firstWidget:buttons(awful.util.table.join(
    awful.button({}, 1, notify)
))

return firstWidget
