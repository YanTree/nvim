local lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

local opts = {
        capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				disable = { "different-requires" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
			format = { enable = false },
			telemetry = { enable = false },
			-- Do not override treesitter lua highlighting with lua_ls's highlighting
			semantic = { enable = false },
		},
	},
}


lsp.lua_ls.setup(opts)

