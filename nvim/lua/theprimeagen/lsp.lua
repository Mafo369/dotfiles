require("conform").setup({
    formatters_by_ft = {
    }
})

local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

require("fidget").setup({})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd"
    },
    handlers = {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,

        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                            -- Put format options here
                            -- NOTE: the value should be STRING!!
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "2",
                            }
                        },
                    }
                }
            }
        end,
    }
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

vim.diagnostic.config({
    -- update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
