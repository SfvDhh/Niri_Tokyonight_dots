return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

      'nvim-telescope/telescope-ui-select.nvim', 
    },

    opts = {
      pickers = {
        find_files = {
          hidden = true
        },
        live_grep = {
          additional_args = { "--hidden" }
        },
      },

      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    },

    -- Configuration
    config = function(_, opts)
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup(opts)

      -- Bindings
      vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = 'Telescope command history' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      -- Загружаем оба расширения здесь
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
    end
  }
}
