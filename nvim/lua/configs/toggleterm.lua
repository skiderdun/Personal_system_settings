local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	size = 15,
	open_mapping =[[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shell = vim.o.shell,
	shading_factor = 2,
	start_in_insert = true,
	persist_size = true,
	direction = 'float',
	close_on_exit = true,
})

-- keybind various systems down here such as python

local python = Terminal:new({cmd = "python3", hidden = true})

function PyToggle()
	python:toggle()
end

