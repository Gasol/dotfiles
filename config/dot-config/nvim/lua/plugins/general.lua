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
    "zbirenbaum/copilot.lua",
    name = "copilot",
    cmd = "Copilot",
    lazy = true,
    event = { "InsertEnter" },
    config = true,
  },
}