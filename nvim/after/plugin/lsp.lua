local lsp_zero = require('lsp-zero')


require('mason').setup({})                  
require('mason-lspconfig').setup({
-- Replace the language servers listed here 
-- with the ones you want to install
      ensure_installed = {'gopls', 'rust_analyzer', 'clangd'},
      handlers = {
        lsp_zero.default_setup,
	gopls = function()
      --- in this function you can setup
      --- the language server however you want. 
      --- in this example we just use lspconfig

      require('lspconfig').gopls.setup({
        ---
        -- in here you can add your own
        -- custom configuration
        ---
	-- 
      })
    end,
 },
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
 -- lsp_zero.default_keymaps({buffer = bufnr})
 local opts = {buffer = brnr, remap = false}

 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	
end)


