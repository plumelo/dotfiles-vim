Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_do_mapping          = 0
  let g:EasyMotion_smartcase           = 1
  let g:EasyMotion_off_screen_search   = 0
  nmap <leader>; <Plug>(easymotion-s2)

Plug 'godlygeek/tabular', {'on': 'Tabularize'}
  nnoremap tt :Tabularize /
  vnoremap tt :Tabularize /

Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType twig setlocal commentstring={#\ %s\ #}
    au FileType jinja setlocal commentstring={#\ %s\ #}


Plug 'osyo-manga/vim-hopping', {'on': 'HoppingStart'}

nmap <Space>/ <Plug>(hopping-start)

" Keymapping
let g:hopping#keymapping = {
\	"\<C-n>" : "<Over>(hopping-next)",
\	"\<C-p>" : "<Over>(hopping-prev)",
\	"\<C-u>" : "<Over>(scroll-u)",
\	"\<C-d>" : "<Over>(scroll-d)",
\}

