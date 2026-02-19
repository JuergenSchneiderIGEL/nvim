return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Completely replace ensure_installed
      opts.ensure_installed = { "c", "cpp" }
      opts.auto_install = false
    end,
  },
}
