--CMP

local cmp = require'cmp'

cmp.setup({
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
    window = {
        completion = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k"] = cmp.mapping.select_prev_item(),
        ["<C-j"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    }, {
        {name = 'buffer'},
    }),
    formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
    },
})










--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.foldingRange = {
    --dynamicRegistration = false,
    --lineFoldingOnly = true
--}
--
--vim.o.foldcolumn = '1' -- '0' is not bad
--vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
--vim.o.foldlevelstart = -1
--vim.o.foldenable = true

--require('ufo').setup()
--Sessions

--local session_opts = {
  --log_level = 'info',
  --auto_session_enable_last_session = false,
  --auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  --auto_session_enabled = true,
  ----auto_save_enabled = nil,
  ----auto_restore_enabled = nil,
  ----auto_session_suppress_dirs = nil,
  --auto_session_use_git_branch = nil,
  ----auto_session_create_enabled = true,
  ---- the configs below are lua only
  --bypass_session_save_file_types = nil
--}
--
--function _G.close_all_floating_wins()
  --for _, win in ipairs(vim.api.nvim_list_wins()) do
    --local config = vim.api.nvim_win_get_config(win)
    --if config.relative ~= '' then
      --vim.api.nvim_win_close(win, false)
    --end
  --end
--end


--require('auto-session').setup{
    --session_opts,
    --pre_save_cmds = { _G.close_all_floating_wins },
--}
--require('session-lens').setup {
    --prompt_title = 'Saison',
    --path_display = {'shorten'},
--}
