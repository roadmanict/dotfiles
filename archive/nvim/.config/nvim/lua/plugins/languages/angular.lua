return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "html" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "prettierd" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "ts_ls", "eslint", "angularls" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {},
				eslint = {},
				angularls = {},
			},
		},
	},
}
