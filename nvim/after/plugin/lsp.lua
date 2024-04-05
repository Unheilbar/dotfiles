local lsp_zero = require('lsp-zero')


require('mason').setup({})                  
require('mason-lspconfig').setup({
-- Replace the language servers listed here 
-- with the ones you want to install
      ensure_installed = {'gopls', 'rust_analyzer', 'clangd', "lua_ls"},
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

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	sources = {                                                                                                                                                                                                  		{name = 'nvim_lsp'},                                                                                                                                                                                       },
	window = {
        	completion = cmp.config.window.bordered(),
        	documentation = cmp.config.window.bordered(),
      	},
      	mapping = cmp.mapping.preset.insert({
        	['<C-Space>'] = cmp.mapping.confirm(),
      	}),
      	snippet = {
        	expand = function(args)
          			require('luasnip').lsp_expand(args.body)
        		end,
      	},
    })



lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
 -- lsp_zero.default_keymaps({buffer = bufnr})
 local opts = {buffer = brnr, remap = false}

 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
 vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
 vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)



end)


