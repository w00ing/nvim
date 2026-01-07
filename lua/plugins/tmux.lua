local function is_lazygit_terminal()
  if vim.bo.filetype == "lazygit" then
    return true
  end

  local title = vim.b.term_title or ""
  if title:lower():find("lazygit", 1, true) then
    return true
  end

  local name = vim.api.nvim_buf_get_name(0)
  return name:lower():find("lazygit", 1, true) ~= nil
end

local function term_tmux_or_nvim(tmux_flag, nvim_cmd)
  return function()
    if vim.env.TMUX and is_lazygit_terminal() then
      vim.fn.system({ "tmux", "select-pane", tmux_flag })
      return
    end

    local esc = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
    vim.api.nvim_feedkeys(esc, "n", false)
    vim.cmd(nvim_cmd)
  end
end

return {
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n", desc = "Tmux navigate left" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n", desc = "Tmux navigate down" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n", desc = "Tmux navigate up" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n", desc = "Tmux navigate right" },
      { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = "n", desc = "Tmux navigate previous" },
      { "<M-h>", term_tmux_or_nvim("-L", "TmuxNavigateLeft"), mode = "t", desc = "Tmux navigate left" },
      { "<M-j>", term_tmux_or_nvim("-D", "TmuxNavigateDown"), mode = "t", desc = "Tmux navigate down" },
      { "<M-k>", term_tmux_or_nvim("-U", "TmuxNavigateUp"), mode = "t", desc = "Tmux navigate up" },
      { "<M-l>", term_tmux_or_nvim("-R", "TmuxNavigateRight"), mode = "t", desc = "Tmux navigate right" },
      { "<M-\\>", term_tmux_or_nvim("-l", "TmuxNavigatePrevious"), mode = "t", desc = "Tmux navigate previous" },
    },
  },
}
