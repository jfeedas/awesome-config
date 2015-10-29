function explodeActiveUsers(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      l=string.find(p,d,ll,true) -- find the next d in the string
      if l~=nil then -- if "not not" found then..
        table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
        ll=l+1 -- save just after where we found it for searching next time.
      else
        table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
        break -- Break at end, as it should be, according to the lua manual.
      end
    end
  return t
end

function getDataActiveUsers()
    local command =  "php " .. awful.util.getdir("config") .. "/plugins/active-users/get-users.php"
    local data = awful.util.pread(command)
    data = JSON:decode(data)
    
    return data
end

local plugin = widget({ type = "textbox" })
awful.widget.layout.margins[plugin] = {left = 20, right = 20}
plugin.text = "Initializing..."

local mytimer = timer({ timeout = 10 })
mytimer:add_signal("timeout", function()
    local data = getDataActiveUsers()
    plugin.text = "WWW: " .. data['www'] .. " MOBILE: " .. data['mobile'] .. " ALL: " .. data['all'] .. " MAX: " .. data['max']

    if (data['report'] == "1") then
        naughty.notify({
            title = 'Active users',
            text = "New active user record reached!!!!!! " .. data[4],
            screen = mouse.screen,
            timeout = 10
        })
    end
end)
mytimer:start()

return plugin
