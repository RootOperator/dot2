return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        --config = true,
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
                        type = "empty",
                        timezone = "implicit-local"
                    }
                }
            }

        }
    }
}
