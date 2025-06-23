vim.api.nvim_create_user_command("ToggleInlayEndHints", function(args)
    require("lsp-endhints").toggle()
end, {})

return {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}
}
