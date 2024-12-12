return {
  'saecki/crates.nvim',
  tag = 'stable',
  event = {"BufRead Cargo.toml"},
  config = function()
    local config = require "crates"
    config.setup({
      completion = {
        crates = {
          enabled = true,
          max_results = 8,
          min_chars = 3,
        },
        cmp = {
          enabled = true
        },
      },
    })
  end,
}
