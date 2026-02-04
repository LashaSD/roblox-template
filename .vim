set makeprg=./scripts/editor-analyze.sh
set efm+=%f\\(%l\\,%c\\):\ %t%*[^:]:\ %m
noremap <Leader>s :make<CR>
command! RestartLsp lua vim.lsp.enable("luau-lsp", false); vim.lsp.enable("luau-lsp");
