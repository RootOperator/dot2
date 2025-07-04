local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "gra",
  function()
    vim.cmd.RustLsp('codeAction')
  end,
  { silent = true, buffer = bufnr }
)

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        if err ~= nil and err.code == -32603 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
vim.g.navic_silence = true
