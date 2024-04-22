return {
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "java" })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "jdtls" })
        end,
    }
}
