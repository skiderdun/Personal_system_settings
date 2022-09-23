--nvim--------------------------------------------------------------------------------------------------------------
-- PACKER
-- -------------------------------------------------------------------------------------------------------------
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
return true
end
return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        -- Add Packages HERE
        -- ------------------------------------

        -- Color
        -- ---------------------------------------------------------------------------------------------------------------
        use "EdenEast/nightfox.nvim"
        --Default options
        require('nightfox').setup({
                        options = {
                                -- Compiled file's destination location
                                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                                compile_file_suffix = "_compiled", -- Compiled file suffix
                                transparent = false,    -- Disable setting background
                                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                                dim_inactive = false,   -- Non focused panes set to alternative background
                                styles = {              -- Style to be applied to different syntax groups
                                        comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
                                        conditionals = "NONE",
                                        constants = "NONE",
                                        functions = "NONE",
                                        keywords = "NONE",
                                        numbers = "NONE",
                                        operators = "NONE",
                                        strings = "NONE",
                                        types = "NONE",
                                        variables = "NONE",
                                },
                                inverse = {             -- Inverse highlight for different types
                                        match_paren = false,
                                        visual = false,
                                        search = false,
                                },
                                modules = {
                        -- ...
                                },
                                },
                        palettes = {},
                        specs = {},
                        groups = {},
        })

        vim.cmd("colorscheme nightfox")

        ----------------------------------------------------------------------------------------------------------------------
        if packer_bootstrap then
                require('packer').sync()
        end
end)
