return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    keys = {
      { "j", "<Plug>(accelerated_jk_gj)" },
      { "k", "<Plug>(accelerated_jk_gk)" },
    },
  },
  {
    "ntpeters/vim-better-whitespace",
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "tpope/vim-commentary",
    lazy = true,
    keys = "gc",
  },
  {
    "tpope/vim-dispatch",
    lazy = true,
    cmd = { "Make", "Dispatch" },
  },
  {
    "tpope/vim-unimpaired", -- complementary pairs of mappings
    lazy = true,
    event = "InsertEnter",
  },
  {
    "tpope/vim-characterize", -- unicode metadata lookup
    lazy = true,
    keys = "ga",
    config = function()
      vim.keymap.set("n", "ga", "<Plug>(characterize)", { desc = "Print character metadata" })
    end,
  },
  {
    "tpope/vim-projectionist",
    config = function()
      vim.g.projectionist_heuristics = {
        ["tests/&phpunit.xml|phpunit.xml.dist"] = {
          ["src/*.php"] = {
            alternate = "tests/{}Test.php",
            type = "source",
          },
          ["tests/*Test.php"] = {
            alternate = "src/{}.php",
            type = "test",
          },
        },
      }
    end,
  },
  {
    "tpope/vim-repeat",
  },
  {
    "tpope/vim-surround",
  },
  {
    "tpope/vim-obsession",
  },
  {
    "tpope/vim-rsi",
  },
  {
    "rhysd/vim-grammarous",
    lazy = true,
    config = function()
      vim.g["vim-grammarous#default_comments_only_filetypes"] = {
        ["*"] = 1,
        help = 0,
        markdown = 0,
        gitcommit = 0,
      }
      vim.g["grammarous#hooks"] = {
        on_check = function(_)
          vim.keymap.set("n", "<c-n>", "<Plug>(grammarous-move-to-next-error)", { buffer = true })
          vim.keymap.set("n", "<c-p>", "<Plug>(grammarous-move-to-previous-error)", { buffer = true })
        end,
        on_reset = function(_)
          vim.keymap.del("n", "<c-n>", { buffer = true })
          vim.keymap.del("n", "<c-p>", { buffer = true })
        end,
      }
    end,
  },
  {
    "editorconfig/editorconfig-vim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gitcommit" },
        callback = function()
          vim.g.EditorConfig_disable = 1
        end,
      })
    end,
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
  },
  {
    "michaeljsmith/vim-indent-object",
  },
  {
    "skywind3000/asyncrun.vim",
    lazy = true,
    cmd = "AsyncRun",
    config = function()
      vim.g.asyncrun_open = 8
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    name = "copilot",
    cmd = "Copilot",
    lazy = true,
    event = { "InsertEnter" },
    opts = {
      pane = {
        auto_refresh = true,
      },
      suggestion = {
        auto_trigger = true,
      },
      node = "/usr/local/bin/node",
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.cmd("highlight CopilotSuggestion guifg=#c9a3d6 ctermfg=8")
    end,
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "embear/vim-localvimrc",
    init = function()
      vim.g.localvimrc_persistent = 1
    end,
    priority = 1000,
  },
  {
    "chrisbra/sudoedit.vim",
    cmd = "SudoWrite",
  },
  { "catppuccin/nvim", name = "catppuccin", opts = {
    dim_inactive = {
      enabled = true,
    },
  } },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "folke/styler.nvim",
    dependencies = {
      "ellisonleao/gruvbox.nvim",
    },
    config = function()
      require("styler").setup({
        themes = {
          fugitive = { colorscheme = "gruvbox" },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = true,
      },
      window = {
        border = "single",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto", a = "Print char meta" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>G"] = { name = "Git summary" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>sn"] = { name = "+noice" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    keys = { "<leader>w", "<leader>e", "<leader>E" },
    config = function()
      local picker = require("window-picker")
      picker.setup()
      vim.keymap.set("n", "<leader>w", function()
        local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = "Pick a window" })
    end,
  },
  {
    "tzachar/local-highlight.nvim",
  },
  {
    "preservim/vim-markdown",
    ft = "markdown",
    dependencies = {
      "godlygeek/tabular",
    },
    config = function()
      vim.g.vim_markdown_strikethrough = 1
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*.md" },
        callback = function()
          vim.opt_local.conceallevel = 2
        end,
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
