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
    config = true,
  },
}
