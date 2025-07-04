vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, range = range })
end, { range = true })

return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        formatters = {
            ["clang-format"] = {
                prepend_args = {"-style=file"}
            },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    }
}
