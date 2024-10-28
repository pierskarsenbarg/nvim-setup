require("lazy").setup({
    spec = { -- import your plugins
        {
            "dracula/vim",
            priority = 1000,
            init = function()
                vim.cmd.colorscheme 'dracula'
                vim.cmd.hi 'Comment gui=none'
            end
        },
        {'tpope/vim-sleuth'},
        {
            "lukas-reineke/indent-blankline.nvim",
            main = 'ibl'
        },
        {
            'nvim-neo-tree/neo-tree.nvim',
            version = '*',
            lazy=false,
            priority=100,
            dependencies = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
                            'MunifTanjim/nui.nvim'},
            cmd = 'Neotree',
            keys = {{
                '\\',
                ':Neotree reveal<CR>',
                desc = 'NeoTree reveal',
                silent = true
            }},
            opts = {
                filesystem = {
                    window = {
                        mappings = {
                            ['\\'] = 'close_window'
                        }
                    }
                }
            }
        },
        { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            main = 'nvim-treesitter.configs', -- Sets main module to use for opts
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
            opts = {
                ensure_installed = {'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
                                    'query', 'vim', 'vimdoc'},
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = {
                    enable = true,
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    --  If you are experiencing weird indenting issues, add the language to
                    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = {'ruby'}
                },
                indent = {
                    enable = true,
                    disable = {'ruby'}
                }
            }
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v4.x'
        },
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {
            'lewis6991/gitsigns.nvim',
            opts = {
                on_attach = function(bufnr)
                    local gitsigns = require 'gitsigns'

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal {
                                ']c',
                                bang = true
                            }
                        else
                            gitsigns.nav_hunk 'next'
                        end
                    end, {
                        desc = 'Jump to next git [c]hange'
                    })

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal {
                                '[c',
                                bang = true
                            }
                        else
                            gitsigns.nav_hunk 'prev'
                        end
                    end, {
                        desc = 'Jump to previous git [c]hange'
                    })

                    -- Actions
                    -- visual mode
                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk {vim.fn.line '.', vim.fn.line 'v'}
                    end, {
                        desc = 'stage git hunk'
                    })
                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk {vim.fn.line '.', vim.fn.line 'v'}
                    end, {
                        desc = 'reset git hunk'
                    })
                    -- normal mode
                    map('n', '<leader>hs', gitsigns.stage_hunk, {
                        desc = 'git [s]tage hunk'
                    })
                    map('n', '<leader>hr', gitsigns.reset_hunk, {
                        desc = 'git [r]eset hunk'
                    })
                    map('n', '<leader>hS', gitsigns.stage_buffer, {
                        desc = 'git [S]tage buffer'
                    })
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk, {
                        desc = 'git [u]ndo stage hunk'
                    })
                    map('n', '<leader>hR', gitsigns.reset_buffer, {
                        desc = 'git [R]eset buffer'
                    })
                    map('n', '<leader>hp', gitsigns.preview_hunk, {
                        desc = 'git [p]review hunk'
                    })
                    map('n', '<leader>hb', gitsigns.blame_line, {
                        desc = 'git [b]lame line'
                    })
                    map('n', '<leader>hd', gitsigns.diffthis, {
                        desc = 'git [d]iff against index'
                    })
                    map('n', '<leader>hD', function()
                        gitsigns.diffthis '@'
                    end, {
                        desc = 'git [D]iff against last commit'
                    })
                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {
                        desc = '[T]oggle git show [b]lame line'
                    })
                    map('n', '<leader>tD', gitsigns.toggle_deleted, {
                        desc = '[T]oggle git show [D]eleted'
                    })
                end
            }
        },
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            -- Optional dependency
            dependencies = {'hrsh7th/nvim-cmp'},
            config = function()
                require('nvim-autopairs').setup {}
                -- If you want to automatically add `(` after selecting a function or method
                local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
                local cmp = require 'cmp'
                cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
            end
        },
        -- Configure any other settings here. See the documentation for more details.
        -- colorscheme that will be used when installing plugins.
        install = {
            colorscheme = {"tokyonight"}
        },
        -- automatically check for plugin updates
        checker = {
            enabled = true,
            notify = true
        }
    }
})
