map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" a tab should be 4 spaces and the tab character should always be expanded to spaces
set tabstop=4
set shiftwidth=4
set expandtab
set number
set background=dark
set scrolloff=10
set hlsearch
syntax on
" color scheme stuff
colorscheme base16-eighties
hi StatusLine guibg=#dc9656
hi StatusLine guifg=black
set cursorline
hi CursorLine guibg=#292966
set guifont=Ubuntu\ Mono\ 9

" enable auto-indenting based on filetype
filetype plugin indent on

" options for tag list plug in
" only show function names for current buffer
let Tlist_Show_One_File = 1
" move focus to tag list window when toggled (w/ F8, see below)
let Tlist_GainFocus_On_ToggleOpen = 1

" options for code completion, disable the preview window
" longest option also
set completeopt-=preview
set completeopt+=longest,menuone

" ** Options for the clang_complete plugin **
" tell clang_complete to use libclang instead of calling clang on the command line
let g:clang_use_library=1

" uncomment the next line if on Ubuntu 13.10. libclang.so gets put here instead of
" /usr/lib like on previous Ubuntu versions.
"let g:clang_library_path="/usr/lib/llvm-3.2/lib"

" tell clang_complete to use compile_commands.json to know how to compile a file
let g:clang_auto_user_options="compile_commands.json"

" the source_me.sh script exports the CLANG_COMPILATION_DATABASE 
" variable so clang_complete can find the compile_commands.json file
if exists("$CLANG_COMPILATION_DATABASE")
    let g:clang_compilation_database=$CLANG_COMPILATION_DATABASE
endif

" set to 1 to enable debug so there is helpful information if something goes wrong
let g:clang_debug=0

" automatically select the first autocomplete entry when the list first comes up
let g:clang_auto_select=0

" automatically open quickfix window on error
let g:clang_complete_copen=0

" automatically close preview window after a completion
let g:clang_close_preview=1

" enable snippets support so parantheses/parameters get completed too
let g:clang_snippets=1
let g:clang_snippets_engine="ultisnips"

" conceal snippets for more readability
let g:clang_conceal_snippets=1

" add a trailing placeholder after function
let g:clang_trailing_placeholder=1

" conceal in insert (i), normal (n) and visual (v) modes
set concealcursor=inv

" hide concealed text completely unless replacement character is defined
set conceallevel=2

" have clang_complete autocomplete when there is only one matching entry
" set completeopt=menu,longest



" allow vim to operate on multiple buffers (files) by allowing buffers to be 'hidden'
set hidden
" auto-save buffers when executing commands
set autowrite
" turn off swap file message
set shortmess+=A
" turn off swap files
set noswapfile

" map F8 toggle the tag list
map <F8> :TlistToggle<CR>
" map F9 to SVN diff
map <F9> :vnew<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
" map F10 to open an explorer at the current directory
map <F10> :e %:h <CR>
" map F11 to grep for the word under the cursor, assumed starting directory
map <F11> :execute "vimgrep /" . expand("<cword>") . "/j source/**" <Bar> cw<CR> 
" map F12 to tselect under the current cursor
map <F12> :tselect "expand("<cword>")" <CR> 

" **Load all plugins in ~/.vim/bundle **
execute pathogen#infect()
"map <C-\> :exec("tag ".expand("<cword>"))<CR>

" omnicpp settings
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1

" only show line highlighting on the current active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

