return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "typescript", "javascript" })
        end,
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "tsserver", "eslint" })
        end,
    }
}
