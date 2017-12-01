scriptencoding utf-8
autocmd FileType yaml call ondemand#linting()
autocmd FileType ansible call ondemand#linting()
autocmd FileType vim call ondemand#linting()
autocmd FileType jinja call ondemand#linting()
autocmd FileType css call ondemand#linting()
autocmd FileType scss call ondemand#linting()
autocmd FileType javascript call ondemand#linting()
autocmd FileType php call ondemand#linting()
autocmd FileType ruby call ondemand#linting()
autocmd FileType json call ondemand#linting()
autocmd FileType coffee call ondemand#linting()
" autocmd BufReadPre,BufRead *.yml packadd vim-ansible-yaml | set filetype=ansible
autocmd BufReadPre,BufRead *.yml packadd vim-yaml
autocmd BufReadPre,BufRead *.twig packadd vim-twig
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.md packadd vim-markdown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
autocmd BufReadPre,BufRead *.fish packadd vim-fish
autocmd BufReadPre,BufRead *.coffee packadd vim-coffee-script
autocmd BufReadPre,BufRead *.json set conceallevel=0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" editorconfig
let g:EditorConfig_core_mode = 'python_builtin'

" matchparen
let g:loaded_matchparen = 1

let g:ags_agexe = 'ag'

let g:indentLine_char = ''
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileType = ['ansible', 'yaml', 'javascript', 'twig', 'scss', 'css', 'html', 'php', 'config']
let g:indentLine_concealcursor=""
let g:indentLine_fileTypeExclude = ['json', 'text', 'sh']
