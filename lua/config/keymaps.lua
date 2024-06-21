-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

--
-- Find files using Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)

-- Search for text in your project
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- List all open buffers
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- View all available commands and run them
map("n", "<leader>fc", ":Telescope commands<CR>", opts)

-- Find and open files in your Neovim config
map("n", "<leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>", opts)

-- Show help tags and go to help
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
-- Manage tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

map("n", "<C-t>", ":terminal<CR>", { desc = "terminal" })
-- Neogit
-- Open NeoGit status
map("n", "<leader>gs", ":Neogit<CR>", opts)

-- Open NeoGit log
map("n", "<leader>gl", ":Neogit log<CR>", opts)

-- Open NeoGit staging (this will only stage changes)
map("n", "<leader>ga", ":Neogit stage<CR>", opts)

-- Open NeoGit commit prompt (after staging your changes)
map("n", "<leader>gc", ":Neogit commit<CR>", opts)

-- Open NeoGit diff (shows a diff of the current buffer)
map("n", "<leader>gd", ":Neogit diff<CR>", opts)

-- Open NeoGit branch management
map("n", "<leader>gb", ":Neogit branch<CR>", opts)

-- Pull changes
map("n", "<leader>gp", ":Neogit pull<CR>", opts)

-- Push changes
map("n", "<leader>gP", ":Neogit push<CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- TODO: To yank text out of vim into system clipboard manager
map("n", "<C-S>c", '"+y', opts)
map("v", "<C-S>c", '"+y', opts)
map("i", "<C-S>c", '"+y', opts)

-- NOTE: Press jk or lk to return back to normal mode instead of using the escape key all the time
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("i", "JK", "<ESC>", opts)
map("i", "KJ", "<ESC>", opts)

-- Tree Toggle
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map(
  "n",
  "<C-u>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
  { noremap = true, silent = true }
)
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
})

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines up and down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>Wr",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- windows
map("n", "<leader>ww", "<c-w>p", { desc = "other window" })
map("n", "<leader>wd", "<c-w>c", { desc = "delete window" })
map("n", "<leader>wj", "<c-w>s", { desc = "split window below" })
map("n", "<leader>wl", "<c-w>v", { desc = "split window right" })
map("n", "<leader>-", "<c-w>s", { desc = "split window below" })
map("n", "<leader>|", "<c-w>v", { desc = "split window right" })

map("v", '<leader>"', ':s/\\%V\\(.*\\)\\%V/\\"\\1\\"/<CR>', { desc = "wrap in double quotes" })

-- Wrap in curly braces
map("v", "<leader>{", ":s/\\%V\\(.*\\)\\%V/{\\1}/<CR>", { desc = "wrap in curly braces" })

-- Wrap in square brackets
map("v", "<leader>[", ":s/\\%V\\(.*\\)\\%V/[\\1]/<CR>", { desc = "wrap in square brackets" })

-- Wrap in parentheses
map("v", "<leader>(", ":s/\\%V\\(.*\\)\\%V/(\\1)/<CR>", { desc = "wrap in parentheses" })

-- Wrap in backticks
map("v", "<leader>`", [[:s/\%V\(.*\)\%V/`\1`/<CR>]], opts)

-- Wrap in single quotes
map("v", "<leader>'", [[:s/\%V\(.*\)\%V/'\1'/<CR>]], opts)

-- Wrap in angle brackets
map("v", "<leader><", [[:s/\%V\(.*\)\%V/<\1>/<CR>]], opts)

local function insert_docstring()
  local filetype = vim.bo.filetype

  local docstrings = {
    python = [[
    """
    Function description.

    Args:
        param1 (type): Description of param1.
        param2 (type): Description of param2.

    Returns:
        type: Description of return value.
    """
    ]],
    typescript = [[
    /**
      * Function description.
      *
      * @param param1 - Description of param1.
      * @param param2 - Description of param2.
      * @returns Description of the return value.
      */
    ]],
    javascript = [[
    /**
      * Function description.
      *
      * @param param1 - Description of param1.
      * @param param2 - Description of param2.
      * @returns Description of the return value.
      */
    ]],
    rust = [[
    /// Function description.
    ///
    /// Arguments:
    ///
    /// * `param1` - Description of param1.
    /// * `param2` - Description of param2.
    ///
    /// Returns: Description of return value.
    ]],
  }

  local docstring = docstrings[filetype]
  if docstring then
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line, line, false, vim.split(docstring, "\n"))
  else
    print("No docstring template for filetype: " .. filetype)
  end
end

vim.keymap.set("n", "<leader>cd", insert_docstring)

vim.keymap.set("n", "<leader>tk", "<cmd>:ChatGPT<cr>")
vim.keymap.set("n", "<leader>tj", "<cmd>:ChatGPTActAs<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>:ChatGPTEditWithInstructions<cr>")

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- Example keybindings for refactoring
vim.keymap.set("v", "<leader>rf", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>")
vim.keymap.set("v", "<leader>rv", "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
