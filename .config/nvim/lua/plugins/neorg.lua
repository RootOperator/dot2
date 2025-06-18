return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
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
}
