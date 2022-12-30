require ("mason").setup()
require ("mason-lspconfig").setup()


vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { source = "always", border = "single" },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", ':vsplit | lua vim.lsp.buf.definition()<cr>, bufopts')
    vim.keymap.set("n", "gdd", ':belowright split | lua vim.lsp.buf.definition()<cr>, bufopts')
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>", bufopts)
    vim.keymap.set("n", "vr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "pp", vim.lsp.buf.code_action, bufopts)
end

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
    Lua = {
      cmd = {"lua-language-server"},
      runtime = {version = 'LuaJIT',},
      diagnostics = {globals = {'vim'},},
      workspace = {library = vim.api.nvim_get_runtime_file("", true),},
      telemetry = {enable = false,},
    },
  },
}
require'lspconfig'.clangd.setup{ on_attach = on_attach, }
require'lspconfig'.tsserver.setup{ on_attach = on_attach, }
require'lspconfig'.dockerls.setup{ on_attach = on_attach, }
require'lspconfig'.rust_analyzer.setup{ on_attach = on_attach, }
require'lspconfig'.bashls.setup{ on_attach = on_attach, }
require'lspconfig'.svelte.setup{ on_attach = on_attach, }
require'lspconfig'.gopls.setup{ on_attach = on_attach, }
require'lspconfig'.cmake.setup{ on_attach = on_attach, }
require'lspconfig'.graphql.setup{ on_attach = on_attach, }
require'lspconfig'.jsonls.setup { on_attach = on_attach,  capabilities = capabilities, }
require'lspconfig'.cssls.setup {  on_attach = on_attach, capabilities = capabilities, }
require'lspconfig'.html.setup {  on_attach = on_attach, capabilities = capabilities, }
require('go').setup()
