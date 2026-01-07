return {
  "dukjjang/codex-cli.nvim",
  config = function()
    require("codex_cli").setup({
      split = {
        command = "codex --yolo",
        direction = "below",
      },
    })
  end,
}
