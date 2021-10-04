lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
  enable = true,              -- false will disable the whole extension
  },
}
EOF