scriptencoding utf-8

autocmd BufReadPre,BufRead *.yml packadd iro.vim
let g:iro#enabled_filetypes = {
      \ 'yaml': 1,
      \ 'ruby': 1,
      \}

autocmd BufReadPre,BufRead *.html.twig,*.twig packadd vim-twig
autocmd BufReadPre,BufRead *.html packadd html5.vim
autocmd BufReadPre,BufRead *.js packadd yajs.vim
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.md packadd vim-markdown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
autocmd BufReadPre,BufRead *.fish packadd vim-fish
autocmd BufReadPre,BufRead *.coffee packadd vim-coffee-script
autocmd BufReadPre,BufRead *.json set conceallevel=0
autocmd BufReadPre,BufRead *.yamllint set filetype=yaml
autocmd BufEnter * :syntax sync fromstart

" Additional syntax groups for php baselib
let g:php_baselib = 1
" Highlight unclosed ([]) - from $VIMRUNTIME/syntax/php.vim
let g:php_parentError = 1
" Assume strings contain HTML
let g:php_htmlInStrings = 1

" $VIMRUNTIME/indent/php.vim and 2072/
" Don't indent after <?php opening
let g:PHP_default_indenting = 0
" Don't outdent the <?php tags to the first column
let g:PHP_outdentphpescape  = 0
