"CR --> Enter
" C-r --> Run gcc on files and execute
" Select line by visual mode to fold and then press <F9> 
"! <command> --> Run a command on shell prompt


filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set number
set hlsearch
set incsearch
set ignorecase
set autoread
set ruler
map ,p “+p
map ,P “+P
map ,y “+y
set clipboard =unnamedplus
set go+=a
set nobackup
set showmode
set paste
set title " to set the title of terminal with file name
set mouse=a " to enable mouse

set history=2000 " saves last 200 commands 
set undolevels=1000 " upto how much we can undo

set cursorline " to higlight the cursor line
set splitright

let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return   " 
let g:DoxygenToolkit_authorName="Varun Tibrewal <vtibrewa>\n@author Chinmay Kamat"

set wildmode=list:longest
set wildchar=<TAB>
"let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1)
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1

autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1) | endif
"autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1) | endif
" Highlight if column length over 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
" Incase you type W instead of small w
command WQ wq 
command W w 
command Wq wq
" Incase you type Q instead of small q
command Q q 

" F3: Toggle expansion of tabs to spaces.
nmap <F3> :set expandtab!<CR>

" Remove all trailing whitespace
nmap <F9> :%s/\s\+$//

" F5: Insert current date.
map <F5> :r !date<CR>

"vmap <F6> :call Comment() <CR> 
 
" Save the file for ww
map ww :w <CR>
" Manually fold some line 
map <leader>td <Plug>TaskList
let g:pyflakes_use_quickfix = 0
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
map <F2> :retab <CR> :wq! <CR>

map <leader>n :NERDTreeToggle<CR>

if has('cscope')
  "if has('quickfix')
    "set cscopequickfix=s-,c-,d-,i-,t-,e-
  "endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command Cscopep3 cs add ~/src/p3/ ~/src/p3/
  command Cscopep4 cs add ~/src/p4 ~/src/p4/
  command Cscopeft cs add ~/14740/14740Lab2/ ~/14740/14740Lab2/
  command Cs15641p1 cs add ~/15641/15641/project1 ~/15641/15641/project1
  command Cs641p2 cs add ~/641p2/641p2 ~/641p2/641p2
endif

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
