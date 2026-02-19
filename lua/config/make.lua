local Terminal = require("toggleterm.terminal").Terminal

-- A single reusable terminal for make
local make_term = Terminal:new({
  cmd = "bash",          -- start a shell; we'll send commands to it
  hidden = true,
  direction = "horizontal",
  close_on_exit = false,
})

vim.api.nvim_create_user_command("Make", function(opts)
  local args = table.concat(opts.fargs, " ")
  local cmd = (#args > 0) and ("make " .. args) or "make -j10"

  make_term:open(15)
  make_term:send(cmd .. "\n", false)
end, { nargs = "*" })

vim.keymap.set("n", "<leader>m", ":Make<CR>", { silent = true })

