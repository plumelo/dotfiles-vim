autocmd BufReadPre,BufNewFile *.vim,.yaml,.jinja,.ansible call ondemand#linting()
autocmd BufReadPre,BufRead *.yml packadd ansible-vim
let g:ansible_unindent_after_newline = 1
let g:minisnip_trigger = '<C-j>'
autocmd BufReadPre,BufRead *.twig packadd vim-twig
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.css,scss packadd csscomplete.vim
autocmd BufReadPre,BufRead *.md packadd vim-livedown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
