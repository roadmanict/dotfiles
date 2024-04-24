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
			vim.list_extend(opts.ensure_installed, { "stylua" })
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

			for server, server_opts in pairs(opts.servers) do
				server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, server_opts or {})

				lspconfig[server].setup(server_opts)
			end

			vim.api.nvim_create_autocmd("lspattach", {
				group = vim.api.nvim_create_augroup("userlspconfig", {}),
				callback = function(ev)
					-- Disable lsp highlighting in favor of treesitter
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil

					-- enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local opts = { buffer = ev.buf, remap = false }

					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					--    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_next()
					end, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_prev()
					end, opts)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end, opts)
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end, opts)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end,
			})
		end,
	},
}
