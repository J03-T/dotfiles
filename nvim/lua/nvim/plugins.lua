vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'neovim/nvim-lspconfig'
    }
    use {
        'williamboman/mason.nvim'
    }
    use {
        'williamboman/mason-lspconfig.nvim'
    }
    use {
        'hrsh7th/nvim-cmp'
    }
    use {
        'hrsh7th/cmp-nvim-lsp'
    }
    use {
        'L3MON4D3/LuaSnip'
    }
    use {
        'alligator/accent.vim'
    }
    use {
        'kkoomen/vim-doge',
        run = ":call doge#install()"
    }
    use {
        'lervag/vimtex'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt=true }
    }
    use {
        'github/copilot.vim'
    }
    use {
        'tpope/vim-fugitive'
    }
    use {
        'tpope/vim-rhubarb'
    }
    use {
        'lewis6991/gitsigns.nvim'
    }
    use {
        'lukas-reineke/indent-blankline.nvim'
    }
    use {
        'folke/which-key.nvim'
    }
    use {
        'folke/trouble.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = false }
    }
    use {
        'nvim-tree/nvim-web-devicons'
    }
    use {
        'yamatsum/nvim-cursorline'
    }
    use {
        'sainnhe/gruvbox-material'
    }
    use {
        'christoomey/vim-tmux-navigator'
    }
    use {
        'navarasu/onedark.nvim'
    }
end)
