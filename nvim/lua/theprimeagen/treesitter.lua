if not pcall(require, "nvim-treesitter") then
  return
end

-- :h nvim-treesitter-query-extensions
local custom_captures = {
  ["function.call"] = "LuaFunctionCall",
  ["function.bracket"] = "Type",
  ["namespace.type"] = "TSNamespaceType",
}

require("nvim-treesitter.highlight").set_custom_captures(custom_captures)

-- alt+<space>, alt+p -> swap next
-- alt+<backspace>, alt+p -> swap previous
-- swap_previous = {
--   ["<M-s><M-P>"] = "@parameter.inner",
--   ["<M-s><M-F>"] = "@function.outer",
-- },
local swap_next, swap_prev = (function()
  local swap_objects = {
    p = "@parameter.inner",
    f = "@function.outer",
    e = "@element",

    -- Not ready, but I think it's my fault :)
    -- v = "@variable",
  }

  local n, p = {}, {}
  for key, obj in pairs(swap_objects) do
    n[string.format("<M-Space><M-%s>", key)] = obj
    p[string.format("<M-BS><M-%s>", key)] = obj
  end

  return n, p
end)()

require'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all"
   ensure_installed = { "c", "lua", "rust", "cpp" ,"python" },

   -- Install parsers synchronously (only applied to `ensure_installed`)
   sync_install = false,

   highlight = {
     -- `false` will disable the whole extension
     enable = true,

     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
     -- the name of the parser)
     -- list of language that will be disabled
     disable = { },

     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
     -- Using this option may slow down your editor, and you may see some duplicate highlights.
     -- Instead of true it can also be a list of languages
     additional_vim_regex_highlighting = false,
   },

  refactor = {
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },

    smart_rename = {
      enable = false,
      keymaps = {
        -- mapping to rename reference under cursor
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = false,
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
      },
    },
  },

 incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  textobjects = {
      move = {
        enable = true,
        set_jumps = true,

        goto_next_start = {
          ["]p"] = "@parameter.inner",
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[p"] = "@parameter.inner",
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",

          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",

          ["av"] = "@variable.outer",
          ["iv"] = "@variable.inner",
        },
      },

      swap = {
        enable = true,
        swap_next = swap_next,
        swap_previous = swap_prev,
      },
  },
}
