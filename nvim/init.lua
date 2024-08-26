-- User todos:
-- 1. install rust analyzer
-- 2. install nerd font
-- 3. install pyright
-- 4. install ctags
-- 5. install haskell lsp

-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'NLKNguyen/papercolor-theme'
    use 'morhetz/gruvbox'
    use 'RRethy/nvim-base16'
    use "rebelot/kanagawa.nvim"
    --[[ Based 16 presets
        base16-3024
        base16-apathy
        base16-ashes
        base16-atelier-cave-light
        base16-atelier-cave
        base16-atelier-dune-light
        base16-atelier-dune
        base16-atelier-estuary-light
        base16-atelier-estuary
        base16-atelier-forest-light
        base16-atelier-forest
        base16-atelier-heath-light
        base16-atelier-heath
        base16-atelier-lakeside-light
        base16-atelier-lakeside
        base16-atelier-plateau-light
        base16-atelier-plateau
        base16-atelier-savanna-light
        base16-atelier-savanna
        base16-atelier-seaside-light
        base16-atelier-seaside
        base16-atelier-sulphurpool-light
        base16-atelier-sulphurpool
        base16-atlas
        base16-bespin
        base16-black-metal-bathory
        base16-black-metal-burzum
        base16-black-metal-dark-funeral
        base16-black-metal-gorgoroth
        base16-black-metal-immortal
        base16-black-metal-khold
        base16-black-metal-marduk
        base16-black-metal-mayhem
        base16-black-metal-nile
        base16-black-metal-venom
        base16-black-metal
        base16-brewer
        base16-bright
        base16-brogrammer
        base16-brogrammer2.0
        base16-brushtrees-dark
        base16-brushtrees
        base16-chalk
        base16-circus
        base16-classic-dark
        base16-classic-light
        base16-codeschool
        base16-cupcake
        base16-cupertino
        base16-darktooth
        base16-default-dark
        base16-default-light
        base16-darcula
        base16-dracula
        base16-eighties
        base16-embers
        base16-flat
        base16-fruit-soda
        base16-github
        base16-google-dark
        base16-google-light
        base16-grayscale-dark
        base16-grayscale-light
        base16-greenscreen
        base16-gruvbox-dark-hard
        base16-gruvbox-dark-medium
        base16-gruvbox-dark-pale
        base16-gruvbox-dark-soft
        base16-gruvbox-light-hard
        base16-gruvbox-light-medium
        base16-gruvbox-light-soft
        base16-harmonic-dark
        base16-harmonic-light
        base16-heetch-light
        base16-heetch
        base16-helios
        base16-hopscotch
        base16-horizon-dark
        base16-ia-dark
        base16-ia-light
        base16-icy
        base16-irblack
        base16-isotope
        base16-macintosh
        base16-marrakesh
        base16-materia
        base16-material-darker
        base16-material-lighter
        base16-material-palenight
        base16-material-vivid
        base16-material
        base16-mellow-purple
        base16-mexico-light
        base16-mocha
        base16-monokai
        base16-nord
        base16-ocean
        base16-oceanicnext
        base16-one-light
        base16-onedark
        base16-outrun-dark
        base16-papercolor-dark
        base16-papercolor-light
        base16-paraiso
        base16-phd
        base16-pico
        base16-pop
        base16-porple
        base16-railscasts
        base16-rebecca
        base16-schemer-dark
        base16-schemer-medium
        base16-seti
        base16-shapeshifter
        base16-snazzy
        base16-solarflare
        base16-solarized-dark
        base16-solarized-light
        base16-spacemacs
        base16-summerfruit-dark
        base16-summerfruit-light
        base16-synth-midnight-dark
        base16-tomorrow-night-eighties
        base16-tomorrow-night
        base16-tomorrow
        base16-tube
        base16-twilight
        base16-unikitty-dark
        base16-unikitty-light
        base16-woodland
        base16-xcode-dusk
        base16-zenburn
    --]]
    --[[ Based 16 custom table
        require('base16-colorscheme').setup({
            base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
            base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
            base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
            base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
        })
    --]]
    use 'kyazdani42/nvim-web-devicons'
    use { "catppuccin/nvim", as = "catppuccin" }

    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    use 'simrat39/rust-tools.nvim'
    use {'cespare/vim-toml', branch = 'main'}
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'ryanoasis/vim-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'windwp/nvim-autopairs'

    use 'ziglang/zig.vim'
end)

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Cosmetic
vim.cmd.colorscheme "catppuccin"

vim.o.wrap = false
vim.wo.wrap = false
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.laststatus = 2
vim.wo.number = true

vim.o.scrolloff = 9999
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.colorcolumn = '100'

vim.opt.list = true

require("ibl").setup()

vim.api.nvim_exec(
    [[
    augroup Terminal
        autocmd!
        au TermOpen * set nonu
    augroup end
    ]],
    false
)

vim.g.termguicolors = true

    -- lsp 
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.wgsl",
        callback = function()
            vim.bo.filetype = "wgsl"
        end,
    })

    require("lsp_lines").setup();
    local lsp = require'lspconfig';
    require('nvim-cmp');

    -- Setup lspconfig.
    lsp.jdtls.setup{
        capabilities = capabilities
    }
    lsp.clangd.setup {
        capabilities = capabilities
    }
    lsp.hls.setup {
        capabilities = capabilities
    }
    lsp.wgsl_analyzer.setup {
        capabilities = capabilities
    }
    lsp.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                checkOnSave = {
                    command = "check"
                },
                procMacro = {
                    enable = true
                },
                diagnostics = {
                    disabled = {
                        "unresolved-proc-macro"
		            }
                }
            }
        }
    })

    vim.lsp.protocol.CompletionItemKind = {
        "   (Text) ",
        "   (Method)",
        "   (Function)",
        "   (Constructor)",
        " ﴲ  (Field)",
        "[] (Variable)",
        "   (Class)",
        " ﰮ  (Interface)",
        "   (Module)",
        " 襁 (Property)",
        "   (Unit)",
        "   (Value)",
        " 練 (Enum)",
        "   (Keyword)",
        "   (Snippet)",
        "   (Color)",
        "   (File)",
        "   (Reference)",
        "   (Folder)",
        "   (EnumMember)",
        " ﲀ  (Constant)",
        " ﳤ  (Struct)",
        "   (Event)",
        "   (Operator)",
        "   (TypeParameter)",
    } 

    vim.fn.sign_define(
        "LspDiagnosticsSignError",
        { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
    )
    vim.fn.sign_define(
        "LspDiagnosticsSignWarning",
        { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
    )
    vim.fn.sign_define(
        "LspDiagnosticsSignHint",
        { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
    )
    vim.fn.sign_define(
        "LspDiagnosticsSignInformation",
        { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
    )

    vim.diagnostic.config({ virtual_text = false })
    vim.diagnostic.config({ virtual_lines = true })
    --vim.o.updatetime = 150
    --vim.cmd [[autocmd CursorHold, * lua vim.diagnostic.open_float({focusable=false})]]
    --vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --    virtual_text = false,
    --})

    -- lsputlis

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return '▊'
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        return ''
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}

ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)


-- rust tools
local rust_tool_opts = {
    tools = { -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools/executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = true,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
                "bmp",
                "cgimage",
                "canon",
                "dot",
                "gv",
                "xdot",
                "xdot1.2",
                "xdot1.4",
                "eps",
                "exr",
                "fig",
                "gd",
                "gd2",
                "gif",
                "gtk",
                "ico",
                "cmap",
                "ismap",
                "imap",
                "cmapx",
                "imap_np",
                "cmapx_np",
                "jpg",
                "jpeg",
                "jpe",
                "jp2",
                "json",
                "json0",
                "dot_json",
                "xdot_json",
                "pdf",
                "pic",
                "pct",
                "pict",
                "plain",
                "plain-ext",
                "png",
                "pov",
                "ps",
                "ps2",
                "psd",
                "sgi",
                "svg",
                "svgz",
                "tga",
                "tiff",
                "tif",
                "tk",
                "vml",
                "vmlz",
                "wbmp",
                "webp",
                "xlib",
                "x11",
            },
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        -- rust-analyer options
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                checkOnSave = {
                    command = "clippy"
                },
                procMacro = {
                    enable = true
                },
                diagnostics = {
                    disabled = {
                        "unresolved-proc-macro"
		            }
                }
            }
        },
    },

    -- debugging stuff
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
}

require("trouble").setup {
    auto_close = false, -- auto close when there are no items
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = true, -- auto refresh when open
    auto_jump = false, -- auto jump to the item when there's only one
    focus = false, -- Focus the window when opened
    restore = true, -- restores the last location in the list when opening
    follow = true, -- Follow the current item
    indent_guides = true, -- show indent guides
    max_items = 200, -- limit number of items that can be displayed per section
    multiline = true, -- render multi-line messages
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
    ---@type trouble.Window.opts
    win = {}, -- window options for the results window. Can be a split or a floating window.
    -- Window options for the preview window. Can be a split, floating window,
    -- or `main` to show the preview in the main editor window.
    ---@type trouble.Window.opts
    preview = {
        type = "main",
        -- when a buffer is not yet loaded, the preview window will be created
        -- in a scratch buffer with only syntax highlighting enabled.
        -- Set to false, if you want the preview to always be a real loaded buffer.
        scratch = true,
    },
    -- Throttle/Debounce settings. Should usually not be changed.
    ---@type table<string, number|{ms:number, debounce?:boolean}>
    throttle = {
        refresh = 20, -- fetches new data when needed
        update = 10, -- updates the window
        render = 10, -- renders the window
        follow = 100, -- follows the current item
        preview = { ms = 100, debounce = true }, -- shows the preview for the current item
    },
    -- Key mappings can be set to the name of a builtin action,
    -- or you can define your own custom action.
    ---@type table<string, trouble.Action.spec>
    keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        -- go down to next item (accepts count)
        -- j = "next",
        ["}"] = "next",
        ["]]"] = "next",
        -- go up to prev item (accepts count)
        -- k = "prev",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        zo = "fold_open",
        zO = "fold_open_recursive",
        zc = "fold_close",
        zC = "fold_close_recursive",
        za = "fold_toggle",
        zA = "fold_toggle_recursive",
        zm = "fold_more",
        zM = "fold_close_all",
        zr = "fold_reduce",
        zR = "fold_open_all",
        zx = "fold_update",
        zX = "fold_update_all",
        zn = "fold_disable",
        zN = "fold_enable",
        zi = "fold_toggle_enable",
        gb = { -- example of a custom action that toggles the active view filter
            action = function(view)
                view:filter({ buf = 0 }, { toggle = true })
            end,
            desc = "Toggle Current Buffer Filter",
        },
        s = { -- example of a custom action that toggles the severity
            action = function(view)
                local f = view:get_filter("severity")
                local severity = ((f and f.filter.severity or 0) + 1) % 5
                view:filter({ severity = severity }, {
                id = "severity",
                template = "{hl:Title}Filter:{hl} {severity}",
                del = severity == 0,
                })
            end,
            desc = "Toggle Severity Filter",
        },
    },
    ---@type table<string, trouble.Mode>
    modes = {
        diagnostics = {
            auto_open = true,
            win = { position = "right" },
        },
        -- sources define their own modes, which you can use directly,
        -- or override like in the example below
        lsp_references = {
            -- some modes are configurable, see the source code for more details
            params = {
                include_declaration = true,
            },
        },
        -- The LSP base mode for:
        -- * lsp_definitions, lsp_references, lsp_implementations
        -- * lsp_type_definitions, lsp_declarations, lsp_command
        lsp_base = {
            params = {
                -- don't include the current location in the results
                include_current = false,
            },
        },
        -- more advanced example that extends the lsp_document_symbols
        symbols = {
            desc = "document symbols",
            mode = "lsp_document_symbols",
            focus = false,
            win = { position = "right" },
            filter = {
                -- remove Package since luals uses it for control flow structures
                ["not"] = { ft = "lua", kind = "Package" },
                any = {
                    -- all symbol kinds for help / markdown files
                    ft = { "help", "markdown" },
                    -- default set of symbol kinds
                    kind = {
                        "Class",
                        "Constructor",
                        "Enum",
                        "Field",
                        "Function",
                        "Interface",
                        "Method",
                        "Module",
                        "Namespace",
                        "Package",
                        "Property",
                        "Struct",
                        "Trait",
                    },
                },
            },
        },
    },
    -- stylua: ignore
    icons = {
        ---@type trouble.Indent.symbols
        indent = {
            top           = "│ ",
            middle        = "├╴",
            last          = "└╴",
            -- last          = "-╴",
            -- last       = "╰╴", -- rounded
            fold_open     = " ",
            fold_closed   = " ",
            ws            = "  ",
        },
        folder_closed   = " ",
        folder_open     = " ",
        kinds = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TypeParameter = " ",
            Variable      = "󰀫 ",
        },
    },
}

require('rust-tools').setup(rust_tool_opts)
require('nvim-tree').setup()

-- Utility
vim.o.completeopt = 'menuone,noselect'
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
require('nvim-autopairs').setup()

vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.o.undofile = true
vim.bo.undofile = true
vim.opt.clipboard = "unnamedplus"

-- Key mappings
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', [[:below new term://zsh<CR>:resize 10<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', [[:q<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', [[:vs<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', [[:sp<CR>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>e', [[:NvimTreeToggle<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[:NvimTreeRefresh<CR>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +1<CR>', {noremap = true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle win.position=right<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set(
  "n",
  "<Leader>1",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
