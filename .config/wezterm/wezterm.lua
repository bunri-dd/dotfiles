-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
  -- The filled in variant of the > symbol
  local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
  local LEFT_HALF_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
  local RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

  local title = tab.active_pane.title
  if tab.tab_title and #tab.tab_title > 0 then
    title = tab.tab_title
  end
  if tab.is_active then
    return {
      { Background = { Color = "rgba(0,0,0, 80%)" } },
      { Foreground = { Color = "rgba(201, 84, 93, 100%)" } },
      -- { Text = SOLID_LEFT_ARROW },
      -- { Text = LEFT_HALF_CIRCLE },
      { Text = "|" },
      { Background = { Color = "rgba(0, 0, 0, 80%)" } },
      { Foreground = { Color = "rgba( 201, 84, 93 , 100%)" } },
      { Text = (tab.tab_index + 1) .. ": " .. title .. " " },
      { Background = { Color = "rgba(0,0,0, 80%)" } },
      { Foreground = { Color = "rgba(255,255,255, 100%)" } },
      -- { Text = SOLID_RIGHT_ARROW },
      -- { Text = RIGHT_HALF_CIRCLE },
    }
  else
    return {
      -- { Background = { Color = "rgba(0,0,0, 80%)" } },
      -- { Foreground = { Color = "#000" } },
      -- { Text = SOLID_LEFT_ARROW },
      { Background = { Color = "rgba(0,0,0, 80%)" } },
      { Foreground = { Color = "#fff" } },
      { Text = (tab.tab_index + 1) .. ": " .. title .. " " },
      -- { Background = { Color = "#000" } },
      -- { Foreground = { Color = "#000" } },
      -- { Text = SOLID_RIGHT_ARROW },
    }
  end
end)

config = {
  -- use_ime = false,
  font = wezterm.font 'Mononoki Nerd Font',
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.8,
  use_fancy_tab_bar = false,
  window_frame = {
    font = wezterm.font { family = 'Mononoki Nerd Font', weight = 'Regular' },

    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 8.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    -- active_titlebar_bg = 'none',

    -- The overall background color of the tab bar when
    -- the window is not focused
    -- inactive_titlebar_bg = 'none',
  },
  colors = {
    tab_bar = {
      background = 'rgba(0,0,0, 80%)',
      inactive_tab_edge = '#000',
      active_tab = {
        bg_color = '#fff',
        fg_color = '#000',
        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        intensity = 'Normal',
        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        underline = 'None',
        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,
        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#000',
        fg_color = '#fff',
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },
      new_tab = {
        bg_color = 'rgba(0, 0, 0, 80%)',
        fg_color = '#fff',
        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },

    },
  },
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

}

-- and finally, return the configuration to wezterm
return config
