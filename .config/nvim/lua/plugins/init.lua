return {
	  "hashivim/vim-terraform",
	{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
	"tpope/vim-fugitive",
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
	},
	{
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
},
{
  "yanskun/gotests.nvim",
  ft = "go",
  config = function()
    require("gotests").setup()
  end,
},
{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
	event = "InsertEnter",
	opts = {},
},
	  {
      "zbirenbaum/copilot-cmp",
      config = function()
          require("copilot_cmp").setup()
      end,
  },
	}
