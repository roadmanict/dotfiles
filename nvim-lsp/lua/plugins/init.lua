return {
	  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
    'tpope/vim-sleuth',
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
            vim.cmd.colorscheme('rose-pine-moon')
        end
    },

}
