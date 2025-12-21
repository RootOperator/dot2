return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            hover = {
                enabled = false
            },
            signature = {
                enabled = false
            },
            progress = {
                enabled = false
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim"
    }
}
