return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- opens as a split by default
      direction = "horizontal",
      size = 15,
      -- keeps terminal buffers around
      persist_size = true,
      close_on_exit = false,
    })
  end,
}
