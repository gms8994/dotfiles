set softtabstop=2
set shiftwidth=4
set tabstop=4
set expandtab
set nobk
set autoread
set backspace=2
syntax on
set ruler
set formatoptions-=r
let perl_extended_vars=1
set foldenable
set foldmethod=indent
set si

set wildmenu
set ruler
set guioptions-=T
set completeopt-=preview
set smarttab
" " make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
"
" " show the `best match so far' as search strings are typed:
set incsearch

set backupdir=/tmp
set directory=/tmp

setlocal comments-=:#

" create a nice statusline with the filename, ascii value (decimal), hex
" value, and the standard lines, cols, and %
set statusline=%t%h%m%r%=[%b\ 0x%02B]\ \ \ %l,%c%V\ %P
 
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
au BufWritePre *.py normal m`:%s/\s\+$//e ``
au BufRead,BufNewFile *.inc   setfiletype php
au FileType perl set smartindent
au FileType php set smartindent
au FileType sql set filetype=mysql
au BufReadPost *  if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" |   endif " has("autocmd")
au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

