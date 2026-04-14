return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
      signs = false,
      highlight = {
          -- Highlight only the foreground of the TODO, nothing else
          keyword = "fg",
          after = "",
          -- Don't require colons after
          pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
          pattern = [[\b(KEYWORDS)\b]],
      },
  },
}
