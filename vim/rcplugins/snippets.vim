Plug 'Shougo/neosnippet.vim', {'for': ['twig', 'html', 'scss', 'css', 'js', 'php']}
Plug 'Shougo/neosnippet-snippets', {'for': ['twig', 'html', 'scss', 'css', 'js', 'php']}
Plug 'Shougo/context_filetype.vim', {'for': ['twig', 'html', 'scss', 'css', 'js', 'php']}
Plug 'honza/vim-snippets', {'for': ['twig', 'html', 'scss', 'css', 'js', 'php']}
Plug 'hungle88/vim-craft-snippets', {'for': 'twig'}

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" [neocomplete] Use tab to select a completion, Ctrl+K to expand a snippet,
" Ctrl+H to close Neocomplete
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-h> pumvisible() ? "\<C-y>" : "\<C-h>"
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets, ~/.vim/plugged/vim-snippets/snippets'
" Load CraftCMS Snippets
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['twig'] = 'twig,jinja,html,js,css,craft'
