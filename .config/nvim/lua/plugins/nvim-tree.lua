local function open_tab_silent(node)
  local api = require("nvim-tree.api")
  api.node.open.tab(node)
  vim.cmd.tabprev()
end

local function edit_or_open()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    api.node.open.edit()
  else
    api.node.open.edit()
    api.tree.close()
  end
end

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'T', open_tab_silent, opts('Open Tab Silent'))

    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
end

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    cmd = {
        "NvimTreeOpen",
        "NvimTreeToggle",
        "NvimTreeFocus",
    },
    config = function()
        require("nvim-tree").setup {
		on_attach = my_on_attach,
                sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
        }
    end,
}
