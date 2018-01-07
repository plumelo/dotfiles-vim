scriptencoding utf-8

AutoCmd BufEnter * packadd vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType jinja setlocal commentstring={#\ %s\ \#}
autocmd FileType twig setlocal commentstring={#\ %s\ \#}
autocmd FileType twig.html setlocal commentstring={#\ %s\ \#}
autocmd FileType dosini setlocal commentstring=#\ %s
