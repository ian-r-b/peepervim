require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16,
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}

require('line-numbers').setup ({
  enabled = true,
  mode = "absolute", -- "both" for relative numbers + absolute
})

require("tiny-glimmer").setup({
    -- Enable/disable the plugin
    enabled = true,

    -- Disable warnings for debugging highlight issues
    disable_warnings = true,

    -- Automatically reload highlights when colorscheme changes
    -- When enabled, cached highlights will be refreshed on ColorScheme autocmd
    autoreload = false,

    -- Animation refresh rate in milliseconds
    refresh_interval_ms = 8,

    -- Timeout in milliseconds to wait after the last edit before processing animations
    -- This uses a debouncing approach: the timer restarts on each edit, and only fires
    -- when edits stop for this duration. This properly handles multi-location atomic
    -- edits from surround plugins and similar tools (default: 50)
    text_change_batch_timeout_ms = 50,

    -- Automatic keybinding overwrites
    overwrite = {
        -- Automatically map keys to overwrite operations
        -- Set to false if you have custom mappings or prefer manual API calls
        auto_map = true,

        -- Yank operation animation
        yank = {
            enabled = true,
            default_animation = "fade",
        },

        -- Search navigation animation
        search = {
            enabled = true,
            default_animation = "pulse",
            next_mapping = "n",      -- Key for next match
            prev_mapping = "N",      -- Key for previous match
        },

        -- Paste operation animation
        paste = {
            enabled = true,
            default_animation = "reverse_fade",
            paste_mapping = "p",     -- Paste after cursor
            Paste_mapping = "P",     -- Paste before cursor
        },

        -- Undo operation animation
        undo = {
            enabled = true,
            default_animation = {
                name = "fade",
                settings = {
                    from_color = "DiffDelete",
                    max_duration = 500,
                    min_duration = 500,
                },
            },
            undo_mapping = "u",
        },

        -- Redo operation animation
        redo = {
            enabled = true,
            default_animation = {
                name = "fade",
                settings = {
                    from_color = "DiffAdd",
                    max_duration = 500,
                    min_duration = 500,
                },
            },
            redo_mapping = "<c-r>",
        },
    },

    -- Third-party plugin integrations
    support = {
        -- Support for gbprod/substitute.nvim
        -- Usage: require("substitute").setup({
        --     on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
        --     highlight_substituted_text = { enabled = false },
        -- })
        substitute = {
            enabled = false,
            default_animation = "fade",
        },
    },

    -- Special animation presets
    presets = {
        -- Pulsar-style cursor highlighting on specific events
        pulsar = {
            enabled = true,
            on_events = { "CursorMoved", "CmdlineEnter", "WinEnter" },
            default_animation = {
                name = "fade",
                settings = {
                    max_duration = 1000,
                    min_duration = 1000,
                    from_color = "DiffDelete",
                    to_color = "Normal",
                },
            },
        },
    },

    -- Override background color for animations (for transparent backgrounds)
    transparency_color = nil,

    -- Animation configurations
    animations = {
        fade = {
            max_duration = 400,              -- Maximum animation duration in ms
            min_duration = 300,              -- Minimum animation duration in ms
            easing = "outQuad",              -- Easing function
            chars_for_max_duration = 10,     -- Character count for max duration
            from_color = "Visual",           -- Start color (highlight group or hex)
            to_color = "Normal",             -- End color (highlight group or hex)
            font_style = {},                 -- Additional font styling (e.g. { bold = true }, see `:h nvim_set_hl`)
        },
        reverse_fade = {
            max_duration = 380,
            min_duration = 300,
            easing = "outBack",
            chars_for_max_duration = 10,
            from_color = "Visual",
            to_color = "Normal",
            font_style = {},
        },
        bounce = {
            max_duration = 500,
            min_duration = 400,
            chars_for_max_duration = 20,
            oscillation_count = 1,          -- Number of bounces
            from_color = "Visual",
            to_color = "Normal",
            font_style = {},
        },
        left_to_right = {
            max_duration = 350,
            min_duration = 350,
            min_progress = 0.85,
            chars_for_max_duration = 25,
            lingering_time = 50,            -- Time to linger after completion
            from_color = "Visual",
            to_color = "Normal",
            font_style = {},
        },
        pulse = {
            max_duration = 600,
            min_duration = 400,
            chars_for_max_duration = 15,
            pulse_count = 2,                -- Number of pulses
            intensity = 1.2,                -- Pulse intensity
            from_color = "Visual",
            to_color = "Normal",
            font_style = {},
        },
        rainbow = {
            max_duration = 600,
            min_duration = 350,
            chars_for_max_duration = 20,
            -- Note: Rainbow animation does not use from_color/to_color
            font_style = {},
        },

        -- Custom animation example
        custom = {
            max_duration = 350,
            chars_for_max_duration = 40,
            color = "#ff0000",  -- Custom property

            -- Custom effect function
            -- @param self table - The effect object with settings
            -- @param progress number - Animation progress [0, 1]
            -- @return string color - Hex color or highlight group
            -- @return number progress - How much of the animation to draw
            effect = function(self, progress)
                return self.settings.color, progress
            end,
        },
    },

    -- Filetypes to disable hijacking/overwrites
    hijack_ft_disabled = {
        "alpha",
        "snacks_dashboard",
    },

    -- Virtual text display priority
    virt_text = {
        priority = 2048,  -- Higher values appear above other plugins
    },
})
require("screenkey").setup({
    win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 1,
        relative = "editor",
        anchor = "SE",
        width = 40,
        height = 3,
        border = "double",
        title = "motions",
        title_pos = "right",
        style = "minimal",
        focusable = false,
        noautocmd = true,
    },
    hl_groups = {
        ["screenkey.hl.key"] = { link = "Normal" },
        ["screenkey.hl.map"] = { link = "Normal" },
        ["screenkey.hl.sep"] = { link = "Normal" },
    },
    winblend = 0,
    compress_after = 3,
    clear_after = 3,
    emit_events = true,
    disable = {
        filetypes = {},
        buftypes = {},
        modes = {},
    },
    show_leader = true,
    group_mappings = false,
    display_infront = {},
    display_behind = {},
    filter = function(keys)
        return keys
    end,
    colorize = function(keys)
        return keys
    end,
    separator = " ",
    keys = {
        ["<TAB>"] = "󰌒",
        ["<CR>"] = "󰌑",
        ["<ESC>"] = "Esc",
        ["<SPACE>"] = "␣",
        ["<BS>"] = "󰌥",
        ["<DEL>"] = "Del",
        ["<LEFT>"] = "",
        ["<RIGHT>"] = "",
        ["<UP>"] = "",
        ["<DOWN>"] = "",
        ["<HOME>"] = "Home",
        ["<END>"] = "End",
        ["<PAGEUP>"] = "PgUp",
        ["<PAGEDOWN>"] = "PgDn",
        ["<INSERT>"] = "Ins",
        ["<F1>"] = "󱊫",
        ["<F2>"] = "󱊬",
        ["<F3>"] = "󱊭",
        ["<F4>"] = "󱊮",
        ["<F5>"] = "󱊯",
        ["<F6>"] = "󱊰",
        ["<F7>"] = "󱊱",
        ["<F8>"] = "󱊲",
        ["<F9>"] = "󱊳",
        ["<F10>"] = "󱊴",
        ["<F11>"] = "󱊵",
        ["<F12>"] = "󱊶",
        ["CTRL"] = "Ctrl",
        ["ALT"] = "Alt",
        ["SUPER"] = "󰘳",
        ["<leader>"] = "<leader>",
    },
    notify_method = "echo",
    log = {
        min_level = vim.log.levels.OFF,
        filepath = vim.fn.stdpath("data") .. "/screenkey_log",
    },
})
require('mini.completion').setup({})
require('mini.notify').setup({})
require('mini.animate').setup({})
require("telescope").load_extension("noice")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() vim.schedule(function() vim.cmd("Screenkey") end) end,
})
