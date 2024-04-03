return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "hcl" })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "terraformls" })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = { terraformls = {}}
        },
    },
}
