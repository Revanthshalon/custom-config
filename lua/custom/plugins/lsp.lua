return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {'j-hui/fidget.nvim', opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local cmp_lsp = require 'cmp_nvim_lsp'

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ['rust-analyzer']={
          checkOnSave = {
            command = "clippy",
          },
          check = {
            command = "clippy",
          },
        },
      },
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local builtin = require "telescope.builtin"

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Lsp definitions" })
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "Lsp Implementations" })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Lsp References" })

        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = 0 })

        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({bufnr = args.buf, id = client.id})
            end,
          })
        end
      end,
    })
  end,
}
