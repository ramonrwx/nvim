vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = false
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false

vim.opt.signcolumn = 'no'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.hidden = true
vim.opt.lazyredraw = true

-- Disable nvim intro
vim.opt.shortmess:append 'sI'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down', noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up', noremap = true, silent = true })

vim.keymap.set('n', 'gt', ':bnext<CR>', { desc = 'Go to next buffer', noremap = true, silent = true })
vim.keymap.set('n', 'gT', ':bprevious<CR>', { desc = 'Go to previous buffer', noremap = true, silent = true })

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Fast saving', noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':qa!<CR>', { desc = 'Close all windows and exit', noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('hlyank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Dont auto commenting new lines',
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'tiagovla/tokyodark.nvim',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require('tokyodark').setup(opts)
      require('tokyodark').colorscheme()
      vim.cmd.hi 'Comment gui=none'
      vim.cmd.hi 'Keyword gui=none'
      vim.cmd.hi 'Identifier gui=none'
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500, silent = true }
      require('mini.surround').setup { silent = true }

      local statusline = require 'mini.statusline'
      statusline.setup()

      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  performance = {
    cache = {
      enable = true,
    },
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
      },
    },
  },
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
