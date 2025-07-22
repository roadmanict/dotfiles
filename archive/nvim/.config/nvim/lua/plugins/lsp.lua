return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")

			mason.setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "stylua", "taplo" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"lua_ls",
				"dockerls",
				"bashls",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				bashls = {},
			},
		},
		config = function(_, opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil

				-- enable completion triggered by <c-x><c-o>
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
				local keymap_opts = { buffer = bufnr, remap = false }

				vim.lsp.inlay_hint.enable()

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, keymap_opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, keymap_opts)
				--    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, keymap_opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, keymap_opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, keymap_opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, keymap_opts)
			end

			for server, server_opts in pairs(opts.servers) do
				server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
					on_attach = on_attach,
				}, server_opts or {})

				lspconfig[server].setup(server_opts)
			end
		end,
	},
}
