require('telescope').setup{
  defaults = {
    file_ignore_patterns = { '*.lock' },
  },
  extensions = {
    wrap_results = true,
    -- Add any configuration setup for fzf extensions here
    fzf = {},
    -- Configurations for ui-select here
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
}

local telescope_extensions = require 'telescope' -- Adding for convienience

-- Loading extensions
telescope_extensions.load_extension('fzf')

local builtin = require('telescope.builtin') -- Adding for convienience
local keymap = vim.keymap -- Adding for convienience

-- Setting up keymaps
keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>h', builtin.help_tags)
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)

keymap.set('n', '<leader>ts', builtin.treesitter)

keymap.set('n', '<leader>gw', builtin.grep_string)
