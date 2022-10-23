
function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

package.path = string.format("%s;%s?.lua", package.path, script_path())


require('plugins')
require('configs/toggleterm')

--Color scheme

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")


vim.cmd([[
  augroup packer_user_config
      autocmd!
          autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            augroup end
            ]])
