return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        opts = {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        }
    },
}
