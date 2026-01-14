return {
  "williamboman/mason.nvim",
  opts = {
    -- 提前安装
    ensure_installed = {
      -- need apt install unzip
      "stylua",
      "luacheck",
      "shellcheck",
      "shfmt",
      "tailwindcss-language-server",
      "emmet-language-server",
      "prettier",
      "html-lsp",
      "typescript-language-server",
      "css-lsp",
    },
  },
}
