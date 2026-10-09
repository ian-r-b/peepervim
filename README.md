# peepervim
a lazy.nvim config for neovim, featuring my cat, peepers.

init is located at config root. plugins are located at `lua/config/lazy.lua`. all plugin configs are located at `lua/config/plugins.lua`. start screen themes are located at `lua/startup/themes/`.

to change the startup theme, you can edit the last line of `init.lua`. there are three included peepers-centric themes, aptly named `peepervim-1`, `peepervim-2`, and `peepervim-3`.

to change colorscheme, set another one to install in `lazy.lua`, (optionally) remove the old theme (`rebelot/kanagawa.nvim`), and change this line in `init.lua`:
```
vim.cmd [[ colorscheme {your-colorscheme-here} ]]
```

note:
--------
inputs are displayed via `screenkey.nvim`. to disable screenkey (the `motions` window) on boot, comment/remove this block at the bottom of `plugins.lua`:
```
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() vim.schedule(function() vim.cmd("Screenkey") end) end,
})
```

plugin list
------------
- `folke/todo-comments.nvim`
- `nvim-tree/nvim-web-devicons`
- `rebelot/kanagawa.nvim`
- `nvim-lualine/lualine.nvim`
- `folke/which-key.nvim`
- `nvim-telescope/telescope.nvim`
- `nvim-telescope/telescope-file-browser.nvim`
- `nvim-mini/mini.nvim`
- `nvim-mini/mini.notify`
- `nvim-mini/mini.animate`
- `shrynx/line-numbers.nvim`
- `OXY2DEV/markview.nvim`
- `kiyoon/repeatable-move.nvim`
- `NStefan002/screenkey.nvim`
- `MunifTanjim/nui.nvim`
- `nvim-lua/plenary.nvim`
- `startup-nvim/startup.nvim`
- `rachartier/tiny-glimmer.nvim`
- `folke/noice.nvim`
- `rcarriga/nvim-notify`
- `nvim-neo-tree/neo-tree.nvim`
- `willothy/nvim-cokeline`
- `stevearc/resession.nvim`
