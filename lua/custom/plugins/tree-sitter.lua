return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", },
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "rust"},
			highlight = { enable = true, use_languagetree = true },
			indent = { enable = true },  
		})
	end,
}
