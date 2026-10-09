-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { "folke/todo-comments.nvim", opts = {} },
    { "nvim-tree/nvim-web-devicons" },
    { "rebelot/kanagawa.nvim", opts = {} },
    { "nvim-lualine/lualine.nvim" },
    { "folke/which-key.nvim", opts = {} },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { 'nvim-mini/mini.nvim', version = '*' },
    { "nvim-mini/mini.notify", version = '*' },
    { "nvim-mini/mini.animate", version = '*' },
    { "shrynx/line-numbers.nvim" },
    { "OXY2DEV/markview.nvim" },
    { "kiyoon/repeatable-move.nvim" },
    { "NStefan002/screenkey.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "startup-nvim/startup.nvim" },
    {
    	"rachartier/tiny-glimmer.nvim",
    	event = "VeryLazy",
    	priority = 10,
    },
    {
    	"folke/noice.nvim",
    	event = "VeryLazy",
    	dependencies = {
    		"rcarriga/nvim-notify",
    	}
    },
    {
    	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	lazy = false,
    },
    {
    	"willothy/nvim-cokeline",
    	dependencies = {
    		"stevearc/resession.nvim",
        },
    	config = true,
    },
  },
  install = { colorscheme = { "kanagawa" } },
  checker = { enabled = true },
})
