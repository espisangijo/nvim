return {
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true, current_line_blame_opts = { delay = 500 } },
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    opts = { kind = "split" },
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit Status" },
      { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Neogit Log" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
      { "<leader>gd", "<cmd>Neogit diff<cr>", desc = "Neogit Diff" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Neogit Branch" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Neogit Pull" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Neogit Push" },
    },
  },
}
