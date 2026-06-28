local utils = require 'mp.utils'

function restart_mpv()
    -- 1. Grab the path of the currently playing video
    local path = mp.get_property("path")
    
    local args = { args = { "mpv" } }
    
    -- 2. If a video is actually playing, save progress and queue it up
    if path then
        mp.command("write-watch-later")
        table.insert(args.args, path)
    end
    
    -- 3. Launch the new mpv instance and close the current one
    utils.subprocess_detached(args)
    mp.command_native({"quit"})
end

mp.add_key_binding("", "restart-mpv", restart_mpv)