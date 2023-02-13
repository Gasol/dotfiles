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
    "tpope/vim-sensible",
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
    "rafi/awesome-vim-colorschemes",
  },
  {
    "chrisbra/sudoedit.vim",
    cmd = "SudoWrite",
  },
}
