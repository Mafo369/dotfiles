require("trouble").setup({})

vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("Trouble diagnostics toggle");
end)

vim.keymap.set("n", "[t", function()
    require("trouble").next({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "]t", function()
    require("trouble").prev({ skip_groups = true, jump = true });
end)
