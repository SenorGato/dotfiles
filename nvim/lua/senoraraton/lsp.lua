local keymaps = require ("keymaps")

require ("mason").setup()
require ("mason-lspconfig").setup()

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local on_attach = keymaps.lsp_maps(_,bufnr)

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local language_servers = {
    'clangd',
    'tsserver',
    'dockerls',
    'rust_analyzer',
    'bashls',
    'svelte',
    'gopls',
    'cmake',
    'graphql',
    'jsonls',
    'cssls',
    'html',
    --'sqls'
}

local null_ls_servers = {
    --C++
    diagnostics.clang_check,
    diagnostics.cppcheck,
    diagnostics.cpplint,
    diagnostics.cmake_lint,
    diagnostics.checkmake,
    --Typescript/Javascript
    code_actions.eslint_d,
    formatting.prettier,
    diagnostics.jsonlint,
    --NixOs
    diagnostics.deadnix,
    formatting.alejandra,
    code_actions.statix,
    --Lua
    completion.luasnip,
    diagnostics.luacheck,
    formatting.stylua,
    --Golang
    formatting.gofumpt,
    formatting.goimports,
    --Misc
    --completion.spell,
    code_actions.shellcheck,
    diagnostics.dotenv_linter, -- .env Linter
    diagnostics.vint, -- Vimscript Linter
    diagnostics.yamllint, -- Yaml Linter
    diagnostics.hadolint, -- Docker Linter
}

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true


for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

for _, nls in ipairs(null_ls_servers) do
    null_ls.register({nls})
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

require'lspconfig'.terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"tf"},
}


require'lspconfig'.tflint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"tf"},
}

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('go').setup()
