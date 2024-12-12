return { 
  'nvim-focus/focus.nvim',
  config = function()
    local focus = require "focus"
    focus.setup()
  end,
}
