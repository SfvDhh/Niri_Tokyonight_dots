-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- List of plugins
require("lazy").setup({

	{ import = "plugins" },

	-- Games for learning Nvim
	{ "ThePrimeagen/vim-be-good" },

	-- Icons
	{ "nvim-tree/nvim-web-devicons" },
})
