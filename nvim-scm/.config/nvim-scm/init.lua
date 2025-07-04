vim.g.mapleader = " "

require("roadmanict")
require("plugins")

require("nvim-treesitter").setup()
require("nvim-treesitter").install({'typescript', 'javascript', 'rust', 'java', 'html'})
require('telescope').setup()
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

vim.lsp.enable({"lua_ls", "ts_ls", "angularls"})
