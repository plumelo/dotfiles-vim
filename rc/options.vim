scriptencoding utf-8

if !exists('g:syntax_on')
  syntax enable
endif

" visibility
set listchars=tab:▸\ ,trail:.
set list
set showbreak=\

" hl trailing spaces instead of trail:c
function! s:hl_trailing_spaces()
  " Test
  highlight! link TrailingSpaces Error
  syntax match TrailingSpaces containedin=ALL /\s\+$/
endfunction
autocmd vimrc BufWinEnter,ColorScheme * call s:hl_trailing_spaces()

" conceal
set conceallevel=2
set concealcursor=nv

" completion
set completeopt&
set completeopt+=preview
" set completeopt+=longest
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect

set splitbelow " sohw preview window at bottom

set infercase "Ignore case on insert completion
set showfulltag "Show rich info for ins-completion

set wildmenu " Command line autocompletion
set wildmode=longest,full

" fold
set foldenable "Enable fold
set foldlevel=100 "Folds with a higher level will be closed
"}}}

" indent
set expandtab "Use the appropriate number of spaces to insert a <Tab>
set smarttab  "When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" set tabstop=2 "Number of spaces that a <Tab> in the file counts for
set shiftwidth=2 "Number of spaces to use for each step of (auto)indent
" set softtabstop=2 "Number of spaces that a <Tab> counts for while editing operations
set shiftround "Round indent to multiple of 'shiftwidth'

" lang
set spelllang=en "Spell checking language

" search
set incsearch "Incremental searching
set ignorecase "Ignore case in search patterns
set smartcase "Override the ignorecase option if the pattern contains upper case
set hlsearch | nohlsearch "Highlight search patterns, support reloading
"}}}

" undo
if has('persistent_undo')
  let &undodir = g:vimrc_root . '/undo'
  set undofile "Automatically saves undo history
  set undoreload=1000 "Save the whole buffer for undo when reloading it
endif
"}}}

" viminfo
set viminfo&
 " !: store information when you exit Vim for later
set viminfo+=!
 " n{filename}: specify viminfo file
let &viminfo .= ',n' .  g:vimrc_root . '/info/viminfo.txt'

" swap
set swapfile "Use a swapfile for the buffer
let &directory = g:vimrc_root . '/swap'
if !isdirectory(&directory)
  call mkdir(&directory)
endif
"}}}

" misc
set autoread "Automatically read file again which has been changed outside of Vim
set backspace=indent,eol,start "Working of <BS>,<Del>,CTRL-W,CTRL-U
"set colorcolumn=80
set diffopt+=iwhite,vertical "Ignore changes in amount of white space
set display=lastline "Display as much as possible of the last line
set grepprg=rg\ --vimgrep "Program to use for the :grep command
let g:grep_cmd_opts = '--line-numbers --noheading'
set helplang& helplang=en " English help file
set hidden "Display another buffer when current buffer isn't saved.
set history=1024 "Amount of Command history
set keywordprg=:help "Open Vim internal help by K command
set laststatus=2 "Always display statusline
set matchpairs+=<:> "Characters that form pairs
set matchtime=1 "Tenths of a second to show the matching paren
set modeline "Set Vim local buffer option to specific file
set noerrorbells "Don't ring the bell for error messages
set novisualbell "Don't use visual bell instead of beeping
set nrformats-=octal "Bases Vim will consider for numbers(Ctrl-a,Ctrl-x)
set ruler "Show the line and column number of the cursor position
set shortmess+=I "Don't give the message when starting Vim :intro
set virtualedit=block "Cursor can be positioned virtually when Visual-block mode
set whichwrap=b,s,h,l,[,],<,> "Allow specified keys to move to the previous/next line
set wrap "Lines longer than the width of the window will wrap
set wrapscan "Searches wrap around the end of the file

" misc-conditional
if has('ambiwidth')
  " ref: https://gist.github.com/sgk/5991138
  set ambiwidth=double "Use twice the width of ASCII characters for Multibyte
endif

if has('unnamedplus')
  set clipboard^=unnamedplus
endif

set formatoptions-=r,o " Turn off Automatically comment out when line break
" If we have Vim 7.4, add j to the format options to get rid of comment
" leaders when joining lines
if v:version >= 704
  set formatoptions+=j
endif
" }}}

