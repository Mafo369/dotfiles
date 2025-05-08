local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
    cmake_command =
    "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\IDE\\CommonExtensions\\Microsoft\\CMake\\CMake\\bin\\cmake.exe",
    cmake_executor = {   -- executor to use
        default_opts = { -- a list of default and possible values for executors
            quickfix = {
                size = 20,
            },
        },
    },
}

vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>', {})
vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>', {})
