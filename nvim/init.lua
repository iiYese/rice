-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Editor
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "lua", "html", "rust" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
      end
    },
    { 'mrcjkb/rustaceanvim', version = '^6', lazy = false, },
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy", -- Or `LspAttach`
      priority = 1000, -- needs to be loaded in first
      config = function()
        require('tiny-inline-diagnostic').setup({
          preset = "powerline",
          options = { multilines = { enabled = true } }
        })
        vim.diagnostic.config({ virtual_lines = false })
      end
    },
    {
      "folke/trouble.nvim",
      cmd = "Trouble",
      opts = {
        modes = {
          cascade = {
            mode = "diagnostics", -- inherit from diagnostics mode
            win = { position = "right" },
            filter = function(items)
              local severity = vim.diagnostic.severity.HINT
              for _, item in ipairs(items) do
                severity = math.min(severity, item.severity)
              end
              return vim.tbl_filter(function(item)
                return item.severity == severity
              end, items)
            end,
          },
        },
      }
    },
    {
      'saghen/blink.cmp',
      version = '1.*',
      opts_extend = { "sources.default" },
      opts = {
        keymap = { preset = 'default' },
        appearance = { nerd_font_variant = 'mono' },
        completion = { documentation = { auto_show = false } },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
    },
    { 'akinsho/toggleterm.nvim', version = "*", opts = { size = 100, direction = 'float' } },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      lazy = false,
      opts = {},
    },
    -- Cosmetic
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  },
  change_detection = { enabled = true },
  install = { missing = true, colorscheme = { "catppuccin-macchiato" } },
  checker = { enabled = true },
  rocks = { enaabled = false },
})

-- Cosmetic
vim.cmd.colorscheme "catppuccin-mocha"

-- Editor
vim.o.wrap = false
vim.wo.wrap = false
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.laststatus = 2
vim.wo.number = true

vim.o.scrolloff = 9999
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.colorcolumn = '100'

vim.opt.list = true

vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.o.undofile = true
vim.bo.undofile = true
vim.opt.clipboard = 'unnamedplus'

vim.o.completeopt = 'menuone,noselect'
vim.cmd [[autocmd BufWritePre * lua  vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePost *.rs lua vim.cmd('Trouble cascade')]]

-- Bindings
vim.api.nvim_set_keymap('n', '<leader>q', [[<cmd>q<cr>]], { noremap = true })

vim.api.nvim_set_keymap('t', '<esc>', [[<cmd>ToggleTerm<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>ToggleTerm<cr>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>e', [[<cmd>Neotree<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>Neotree<cr>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>vs<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', [[<cmd>sp<cr>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-Up>', '<cmd>resize -1<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<cmd>resize +1<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<cmd>vertical resize -1<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<cmd>vertical resize +1<cr>', { noremap = true })

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})
