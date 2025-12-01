vim.api.nvim_set_keymap("n", "<cr>", "<Plug>(neorg.esupports.hop.hop-link)", {noremap=true})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "norg", "neorg" },
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

