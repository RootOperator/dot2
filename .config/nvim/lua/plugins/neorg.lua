return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
        'nvim-neorg/lua-utils.nvim',
        'pysan3/pathlib.nvim',
        'nvim-neotest/nvim-nio',
    },
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {
                config = {
                    icon_preset = "varied"
                }
            },
            ["core.export"] = {},
            ["core.export.markdown"] = {
                config = {
                    extensions = "all"
                }
            },
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/notes",
                    }
                }
            },
            ["core.esupports.metagen"] = {
                config = {
                    update_date = true,
                    type = "empty",
                    timezone = "implicit-local"
                }
            }
        }
    }
}
