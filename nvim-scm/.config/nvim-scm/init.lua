vim.g.mapleader = " "

require("roadmanict")
require("plugins")

require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "typescript", "javascript", "rust", "java", "html" }):wait(300000)
require("telescope").setup()

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("blink.cmp").setup()

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_enable = false,
})

vim.lsp.enable({ "lua_ls", "ts_ls", "angularls" })
