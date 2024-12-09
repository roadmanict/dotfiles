return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = vim.env.DOTNET_ROOT ~= nil,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "c_sharp" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cond = vim.env.DOTNET_ROOT ~= nil,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "csharpier" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = vim.env.DOTNET_ROOT ~= nil,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "omnisharp" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cond = vim.env.DOTNET_ROOT ~= nil,
		opts = {
			servers = {
				omnisharp = {
					cmd = { "omnisharp" },
				},
			},
		},
	},
}
