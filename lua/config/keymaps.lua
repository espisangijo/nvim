-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Pickers (ff, fb, fr, sg, ... come from LazyVim)
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>fc", function() Snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Config Files" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Pages" })

map("n", "<C-t>", function() Snacks.terminal() end, { desc = "Terminal" })

-- Escape insert mode
for _, lhs in ipairs({ "jk", "kj", "JK", "KJ" }) do
  map("i", lhs, "<Esc>")
end

-- Comment toggle (native gc)
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment" })
map("x", "<leader>/", "gc", { remap = true, desc = "Toggle Comment" })

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Insert blank line below/above without moving the cursor
map("n", "<leader>o", "printf('m`%so<ESC>``', v:count1)", { expr = true, desc = "Insert Line Below" })
map("n", "<leader>O", "printf('m`%sO<ESC>``', v:count1)", { expr = true, desc = "Insert Line Above" })

-- Splits
map("n", "<leader>wj", "<C-w>s", { desc = "Split Window Below" })
map("n", "<leader>wl", "<C-w>v", { desc = "Split Window Right" })

-- Wrap visual selection
local wraps = { ['"'] = { '"', '"' }, ["'"] = { "'", "'" }, ["`"] = { "`", "`" }, ["{"] = { "{", "}" }, ["["] = { "[", "]" }, ["("] = { "(", ")" }, ["<"] = { "<", ">" } }
for key, pair in pairs(wraps) do
  map("x", "<leader>" .. key, string.format([[:s/\%%V\(.*\)\%%V/%s\1%s/<CR>]], vim.fn.escape(pair[1], "/\\"), vim.fn.escape(pair[2], "/\\")), { silent = true, desc = "Wrap in " .. pair[1] .. pair[2] })
end

-- Docstring template
local docstrings = {
  python = { '"""', "Function description.", "", "Args:", "    param1 (type): Description.", "", "Returns:", "    type: Description.", '"""' },
  javascript = { "/**", " * Function description.", " *", " * @param param1 - Description.", " * @returns Description.", " */" },
}
docstrings.typescript, docstrings.javascriptreact, docstrings.typescriptreact = docstrings.javascript, docstrings.javascript, docstrings.javascript

map("n", "<leader>cj", function()
  local lines = docstrings[vim.bo.filetype]
  if not lines then
    return vim.notify("No docstring template for " .. vim.bo.filetype, vim.log.levels.WARN)
  end
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local indent = vim.fn.getline(row):match("^%s*")
  if vim.bo.filetype == "python" then
    indent = indent .. string.rep(" ", vim.fn.shiftwidth())
  end
  vim.api.nvim_buf_set_lines(0, row, row, false, vim.tbl_map(function(l) return indent .. l end, lines))
end, { desc = "Insert Docstring" })
