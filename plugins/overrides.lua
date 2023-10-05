local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "java","javascript","json","json5","jsonc",
    "regex","sql",
    "rust",
    "typescript",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- markdown
    "marksman",
    "misspell",

    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- go
    "gopls",
    "glint",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gotestsum",

    -- python
    "pyright",
    "flake8",
    "black",
    "mypy",
    "pydocstyle",
    "pylint",
    "pyre",
    "autoflake",
    "autopep8",
    "python-lsp-server",

    -- yaml
    "terraform-ls",
    "tflint",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- sql
    "sqlfluff",
    "sqls",

  		-- JavaScript/Typescript
		"typescript-language-server",
		"prettierd",
		"eslint_d",

		-- Rust
		"rust-analyzer",
		"rustfmt",

		-- File Formats
		"json-lsp",
		"jsonlint",
		"jq",
		"yaml-language-server",
		"yamllint",
		"yamlfmt",

		-- Git
		"commitlint",
		"gitlint",

		-- Writing
		"marksman",
		"markdownlint",
		"vale",
		"write-good",
		"cspell",
		"misspell",
		"proselint",

		-- Shell
		"bash-language-server",
		"beautysh",
		"shfmt",
		"shellcheck",
		-- "shellharden",

		-- Others
		-- "ansible-language-server",
		"css-lsp",
		-- "codespell",
		-- "dockerfile-language-server",
		-- "dot-language-server",
		"editorconfig-checker",
		"html-lsp",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
