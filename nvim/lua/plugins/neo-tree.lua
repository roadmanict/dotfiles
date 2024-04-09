return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            { "<leader>pv", "<cmd>Neotree filesystem focus left<CR>", desc = "NeoTree" },
        },
        opts = {
            window = {
                mappings = {
                    ["%"] = {
                        "add",
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none", -- "none", "relative", "absolute"
                        }
                    },
                    ["d"] = { "add_directory" }
                }
            }
        }
    }
}
