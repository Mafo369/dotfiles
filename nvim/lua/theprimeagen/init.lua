require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.telescope")
require("theprimeagen.oil")
require("theprimeagen.treesitter")
require("theprimeagen.undotree")
require("theprimeagen.lsp")
require("theprimeagen.trouble")
require("theprimeagen.cmake-tools")

vim.cmd [[colorscheme tokyonight-night]]

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

local format_group = augroup('FormatOnSave', { clear = true })

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "BufWritePre" }, {
    group = format_group,
    pattern = { "*.cpp", "*.c", "*.hpp", "*.h", "*.lua" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "K", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- Automatically open float *only* for errors on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            severity = vim.diagnostic.severity.ERROR, -- only show if there's an error
            focus = false,
        }

        -- Get diagnostics for the current line with severity = ERROR
        local diagnostics = vim.diagnostic.get(0, {
            lnum = vim.api.nvim_win_get_cursor(0)[1] - 1,
            severity = vim.diagnostic.severity.ERROR,
        })

        if #diagnostics > 0 then
            vim.diagnostic.open_float(nil, opts)
        end
    end,
})
