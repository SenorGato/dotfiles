local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
-- Base
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "voldikss/vim-floaterm"
    use { 'mbbill/undotree'}
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
--Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    --use { 'sharkdp/fd'}
    --use { 'BurntSushi/ripgrep'}
--Tree-Sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects'}
    use { 'nvim-treesitter/playground' }
--Statusline
    use {'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
-- LSP
    use 'LnL7/vim-nix' -- Nix LSP
--Golang
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommanded if need floating window support

--cmp plugins
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-nvim-lua"

--Snippets
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use ({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}) --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "mattn/emmet-vim"
--Colorschemes
    use 'folke/tokyonight.nvim'
    use 'rose-pine/neovim'
    use 'wadackel/vim-dogrun'
    use 'liuchengxu/space-vim-theme'
    use 'daschw/leaf.nvim'
--Debugger
    use 'mfussenegger/nvim-dap'
    use { "jbyuki/one-small-step-for-vimkind", requires = {"mfussenegger/nvim-dap"}}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use 'theHamsta/nvim-dap-virtual-text'
--Formatters
    use "alvan/vim-closetag"
    use('MunifTanjim/prettier.nvim')
    use ({ "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim"},
    })
--Misc
    use "scrooloose/nerdcommenter"
    use { 'tpope/vim-fugitive'}
--Todo:
    --use 'rmagatti/auto-session'
    --use { 'rmagatti/session-lens',
        --requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'}}
    --use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
