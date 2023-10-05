local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,

  -- rust
  b.formatting.rustfmt,

  -- go
  b.formatting.gofmt,
  b.formatting.goimports,

  
	-- Meta formatters
	b.formatting.prettierd.with {
		filetypes = { "html", "yaml", "javascript", "typescript" },
	},
}


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method "textDocument/formatting" then
		vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format { bufnr = bufnr }
			end,
		})
	end
end

null_ls.setup {
  -- debug = true,
  debug = false,
  sources = sources,
  on_attach=on_attach,
}

-- add autocmds to run formatting on save for .go, .rs, and .py files
vim.cmd([[
  augroup null_ls_formatting
    autocmd!
    autocmd BufWritePre *.go lua vim.lsp.buf.format((nil, 1000)
    autocmd BufWritePre *.rs lua vim.lsp.buf.format((nil, 1000)
    autocmd BufWritePre *.py lua vim.lsp.buf.format((nil, 1000)
    " autocmd BufWritePre *.js lua vim.lsp.buf.format((nil, 1000)
    " autocmd BufWritePre *.jsx lua vim.lsp.buf.format((nil, 1000)
    " autocmd BufWritePre *.ts lua vim.lsp.buf.format((nil, 1000)
    " autocmd BufWritePre *.tsx lua vim.lsp.buf.format((nil, 1000)
  augroup END
]])
