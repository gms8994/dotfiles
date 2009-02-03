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

setlocal comments-=:#

" return to the location we were at
autocmd BufReadPost *  if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" |   endif " has("autocmd")
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview
" syntax highlight
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

syntax on

" create a nice statusline with the filename, ascii value (decimal), hex
" value, and the standard lines, cols, and %
set statusline=%t%h%m%r%=[%b\ 0x%02B]\ \ \ %l,%c%V\ %P
 
" * Text Formatting

" for Perl programming, have things in braces indenting themselves:
"autocmd FileType perl set smartindent
autocmd FileType php set smartindent
let timestamp_regexp = '\v\C%(\@version\s+)@<=.*$' 
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"autocmd FileType sql set filetype=mysql

" " make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
"
" " show the `best match so far' as search strings are typed:
set incsearch

" Created: Wed 06 Aug 2008 07:53:37 PM UTC
" Last Modified: Mon 11 Aug 2008 09:01:11 PM UTC


" create automagic headers for files
let new_file_name=system('grep -f <(ps auxw | grep '.expand("%").' | grep -v grep | awk "{print $1}") <(getent passwd) | awk -F\: "{print $5}" | awk -F, "{print $1}"')

autocmd bufnewfile *.php so ~/.php_header.txt
autocmd bufnewfile *.php exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.php exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd bufnewfile *.php exe "1," . 10 . "g/Created By :.*/s//Created By : " .new_file_name
autocmd Bufwritepre,filewritepre *.php execute "normal ma"
autocmd Bufwritepre,filewritepre *.php exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.php execute "normal `a"
