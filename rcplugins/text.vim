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
