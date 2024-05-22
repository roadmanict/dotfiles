return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	dependencies = {
			-- 		"saadparwaiz1/cmp_luasnip",
			-- 		"rafamadriz/friendly-snippets",
			-- 	},
			-- },
			-- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local lspkind = require("lspkind")
			lspkind.init({})

			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
				},
			})

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<c-j>", function()
				return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
			end, { silent = true })
		end,
	},
}
