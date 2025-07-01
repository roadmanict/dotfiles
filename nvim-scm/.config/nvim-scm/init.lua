vim.g.mapleader = " "

require("roadmanict")
require("plugins")

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})

vim.lsp.enable({"lua_ls"})
