" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
vmap <Cr> <Plug>(EasyAlign)

let g:easy_align_ignore_groups = ['Comment', 'String']
