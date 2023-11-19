local wezterm = require "wezterm"
local userPath = os.getenv("HOME")
local mux = wezterm.mux
local baseWorkSpace = userPath .. "/Workspace"
local workSpace = baseWorkSpace .. "/code"
local G = {}

G.setup = function()
  wezterm.on(
    "gui-startup",
    function(cmd)
      local tab, pane, window = mux.spawn_window(cmd or {})
      local new_pane = pane:split {cwd = baseWorkSpace, size = 0.7}
      new_pane:split {direction = "Bottom", size = 0.9, cwd = workSpace}
      window:gui_window():maximize()
    end
  )
end

return G
