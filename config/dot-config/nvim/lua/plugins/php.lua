return {
  {
    "rayburgemeestre/phpfolding.vim",
    lazy = true,
    ft = "php",
  },
  {
    "haginaga/vim-compiler-phpunit",
    dependencies = {
      { "vim-test/vim-test" },
    },
    lazy = true,
    ft = "php",
  },
}
