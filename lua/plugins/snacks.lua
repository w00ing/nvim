return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        exclude = { ".DS_Store", ".git", ".next" },
        sources = {
          files = {
            hidden = false, -- Include hidden files?
            ignored = false, -- Include gitignored files?
          },
          grep = {
            hidden = false, -- Also search in hidden files
            ignored = false, -- Include gitignored files?
          },
        },
      },
    },
  },
}
