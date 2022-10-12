filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set columns=100

highlight OverColumnWidth ctermbg=brown ctermfg=white
match OverColumnWidth /\%>80v.\+/

nnoremap tf :tabfind<Space>./
nnoremap tn :tabnew<Space>./

nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
