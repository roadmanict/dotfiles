return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "bicep" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "bicep" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = { bicep = {
				cmd = { "bicep-lsp" },
			} },
		},
	},
}
