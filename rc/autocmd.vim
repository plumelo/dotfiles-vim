scriptencoding utf-8

" :h last-position-jump
autocmd vimrc BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" completion in insertmode
autocmd vimrc InsertEnter * call ondemand#completion()

" git gutter
autocmd vimrc BufWinEnter * call ondemand#gitgutter()

" lessspace
autocmd vimrc InsertLeave,InsertChange * call ondemand#lessspace()

" delimitMate
autocmd vimrc InsertEnter * call ondemand#delimitmate()

" rsi
autocmd vimrc InsertEnter * packadd vim-rsi

" minisnip
autocmd vimrc InsertEnter * call ondemand#minisnip()

" ranger
map <leader>f :packadd ranger.vim<CR>:Ranger<CR>
