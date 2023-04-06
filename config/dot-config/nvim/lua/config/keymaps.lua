local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "<cr>", "<c-]>", { buffer = true })
    vim.keymap.set("n", "<bs>", "<c-T>", { buffer = true })
    vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = true })
    vim.cmd([[
    if has('vertsplit')
      let s:ratio = &co / str2float(&lines)
      let s:display_landscape = s:ratio > 2.74
      if s:display_landscape
        wincmd L
      endif
    endif
    ]])
  end,
})

map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "Q", "<nop>")
