return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "query",
        "dart",
        "java",
        "c",
        "prisma",
        "bash",
        "go",
        "lua",
        "vim",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "toml",
        "python",
        "rust",
        "cpp",
        "css",
        "scss",
        "sql",
        "xml",
      },
      highlight = {
        enable = true,
        disable = {}, -- list of language that will be disabled
      },
      indent = {
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
    })
  end,
}
