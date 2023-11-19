local platform = require("utils.platform")()

local options = {
   default_prog = {},
   launch_menu = {}
}

if platform.is_mac then
   options.default_prog = {"/bin/zsh"}
   options.launch_menu = {
      {label = "Bash", args = {"bash"}},
--      {label = "Zsh", args = {"zsh"}}
   }
elseif platform.is_win then
   options.default_prog = {"pwsh"}
   options.launch_menu = {
      {label = "PowerShell Core", args = {"pwsh"}},
      {label = "PowerShell Desktop", args = {"powershell"}},
      {label = "Command Prompt", args = {"cmd"}},
      {label = "Nushell", args = {"nu"}},
      {
         label = "Git Bash",
         args = {""}
      }
   }
end

return options
