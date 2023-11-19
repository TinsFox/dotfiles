local wezterm = require "wezterm"

local Grey = "#0f1419"
local LightGrey = "#191f26"
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
local TAB_BAR_BG = "Black"
local ACTIVE_TAB_BG = "Yellow"
local ACTIVE_TAB_FG = "Black"
local HOVER_TAB_BG = Grey
local HOVER_TAB_FG = "White"
local NORMAL_TAB_BG = LightGrey
local NORMAL_TAB_FG = "White"
wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    panes = panes
    config = config
    max_width = max_width

    local background = NORMAL_TAB_BG
    local foreground = NORMAL_TAB_FG

    local is_first = tab.tab_id == tabs[1].tab_id
    local is_last = tab.tab_id == tabs[#tabs].tab_id

    if tab.is_active then
      background = ACTIVE_TAB_BG
      foreground = ACTIVE_TAB_FG
    elseif hover then
      background = HOVER_TAB_BG
      foreground = HOVER_TAB_FG
    end

    local leading_fg = NORMAL_TAB_FG
    local leading_bg = background

    local trailing_fg = background
    local trailing_bg = NORMAL_TAB_BG

    if is_first then
      leading_fg = TAB_BAR_BG
    else
      leading_fg = NORMAL_TAB_BG
    end

    if is_last then
      trailing_bg = TAB_BAR_BG
    else
      trailing_bg = NORMAL_TAB_BG
    end

    local title = tab.active_pane.title
    -- broken?
    -- local title = " " .. wezterm.truncate_to_width(tab.active_pane.title, 30) .. " "

    return {
      {Attribute = {Italic = false}},
      {Attribute = {Intensity = hover and "Bold" or "Normal"}},
      {Background = {Color = leading_bg}},
      {Foreground = {Color = leading_fg}},
      {Text = SOLID_RIGHT_ARROW},
      {Background = {Color = background}},
      {Foreground = {Color = foreground}},
      {Text = " " .. title .. " "},
      {Background = {Color = trailing_bg}},
      {Foreground = {Color = trailing_fg}},
      {Text = SOLID_RIGHT_ARROW}
    }
  end
)
