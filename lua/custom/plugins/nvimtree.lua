return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    hijack_netrw = true,
    sort_by = 'suffix',
    sort = {
      folders_first = true,
    },
    view = {
      width = 25,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    git = {
      enable = false,
    },
  },
  lazy = false,
  cmd = 'NvimTreeToggle',
}
