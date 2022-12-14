-- This file can be loaded by calling `require('plugins')` from your init.lua

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
	-- Plugins Here:
   -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- commenting things out
        use "terrortylor/nvim-comment"
        require('nvim_comment').setup()

	-- Toggle Terrminal
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	end}

        --color scheme
        use { "ellisonleao/gruvbox.nvim" }

        if packer_bootstrap then
                require('packer').sync()
        end
end)
