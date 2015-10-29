function getDataNewTumblrPhoto()
    local command =  "php " .. awful.util.getdir("config") .. "/plugins/tumblr/tumblr_php/index.php"

    local data = awful.util.pread(command)
    return data
end

local mytimer = timer({ timeout = 300 })
mytimer:add_signal("timeout", function()
    local data = getDataNewTumblrPhoto()

    if (data ~= "FALSE") then
        data = JSON:decode(data)
    
        naughty.notify({
            title = "New post in Tumblr",
            text = "By: " .. data['blog_name'],
            screen = mouse.screen,
            timeout = 0,
            icon_size = 75,
            icon = data['image']
        })
    end
end)
mytimer:start()

return mytimer
