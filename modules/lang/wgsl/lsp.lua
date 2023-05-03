local lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

local opts = {
        capabilities = capabilities,
        single_file_support = true,
}


lsp.wgsl_analyzer.setup(opts)

