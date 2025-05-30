return {
    {
        'nvim-telescope/telescope.nvim',
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-s>"] = "select_vertical",
                        ["<C-i>"] = "select_horizontal",
                    },
                    n = {
                        ["s"] = "select_vertical",
                        ["i"] = "select_horizontal",
                    }
                }
            }

        }
    }
}
