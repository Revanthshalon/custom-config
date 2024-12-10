vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Exit insert mode" })
keymap.set("n", "Y", "y$", { desc = "Copy the entire line" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll with screen centering" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll with screen centering" })
