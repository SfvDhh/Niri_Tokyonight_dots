return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  
  opts = {
    ensure_installed = { 
      "c", "lua", "vim", "vimdoc", "query", 
      "markdown", "markdown_inline", "bash", "python" 
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  }

}

