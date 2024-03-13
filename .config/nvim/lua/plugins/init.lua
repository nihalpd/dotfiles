return {
	  "hashivim/vim-terraform",
	  "folke/which-key.nvim",
	{
		"lewis6991/gitsigns.nvim",
	    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
    "nvim-tree/nvim-web-devicons",
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},
	{
    'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
				theme = "catppuccin",
				},
			})
		end,
    dependencies = {
			'nvim-tree/nvim-web-devicons',
			lazy = true,
		}
	},
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
						"css",
						"lua",
						"vim",
						"vimdoc",
						"go",
						"javascript",
						"html",
						"hcl",
						"terraform"
					},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 },
	{
		"catppuccin/nvim",
		priority = 1000,
		opts = {},
		config = function ()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
		{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	}

	}
