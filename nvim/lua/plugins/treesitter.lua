return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ---@type TSConfig
        ---@diagnostic disable-next-line: missing-fields
        opts = {
            -- A list of parser names, or "all" (the four listed parsers should always be installed)
            ensure_installed = {
                "javascript",
                "typescript",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "svelte",
                "yaml",
                "rust" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }

    },
    { "nvim-treesitter/nvim-treesitter-context" },
}
