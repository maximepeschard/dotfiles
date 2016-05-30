filetype plugin indent on
syntax on
colorscheme Tomorrow-Night

" Tabs behavior
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Line numbers on
set number

" Width
set nowrap
set textwidth=80

" Status line
set statusline=%f\ %y%=\ Line:\ %l/%L\ Col:\ %c
set laststatus=2

" Optional local setup
try
    source ~/.vimrc-local
catch
    " No local setup : ignore.
endtry

