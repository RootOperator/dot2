return {
    'dense-analysis/ale',
    lazy = false,
    commit = "f3512cd",
    config = function ()
        vim.g.ale_disable_lsp = 1
        vim.g.ale_linters = {
            c = {"clangtidy", "clang"},
        }
    end
}
