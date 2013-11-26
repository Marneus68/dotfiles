
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim history
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Ignore object files, temporary lock files, python compiled files, .dll, .lib
set wildignore=*.o,*~,*.pyc,*.dll,*.lib

" Disable VI compatibility mode 
set nocompatible

" We are using a fast terminal
set ttyfast

" UTF-8 master race
set encoding=utf-8

" Unix master race
set ffs=unix,dos,mac

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position // outline current line
set ruler

" Display the current cursor line
set cursorline
" highlight Cursorline cterm=background

" Line numbering // you can't live without it
" TODO : find a way to have both the line numbering and the relative line
"           numbers
set number

" Show a column at 80 chars
"set colorcolumn=85

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show the current mode
set showmode

" Configure the default completion menu behaviour
set wildmenu
set wildmode=list:longest

" No annoying sound on errors, use a flash instead
set noerrorbells
set t_vb=
set tm=500
set visualbell

" Enable mouse scroll
" set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors, Fonts and GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting // that should be default
filetype plugin on
syntax enable

" Prevent the 'transparent background' effect, whiwh might be enjoyable
set background=dark

" if GVIM
if has("gui_running")
    ":set guioptions-=m
	" Remove the icon bar
    :set guioptions-=T
    :set guioptions-=r
	" Terminus Master Race
	set guifont=Terminus\ 8
    " Maximize the window
    set lines=999 columns=999
endif

" Save on focus loss
au FocusLost * :wa

" Proper Markdown support
au BufRead,BufNewFile *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving, Searching and Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Prevent you from using the arrow keys
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

" Adds v before any search expression to allow normally formed regexps
nnoremap / /\v
vnoremap / /\v

" More appropriate search options
set ignorecase
set smartcase

" Replace all occurences by default
set gdefault

" Dinamically highlight the search results
set incsearch
set showmatch
set hlsearch

" Clear the search last highlight
nnoremap <leader><space> :noh<cr>

" Maps the % (go to corresponding bracket) to ù
nnoremap ù %
vnoremap ù %

" Use Ctrl+V in edit mode to paste the content from the clipboard
imap <c-v> <Esc>"*pi
" Use Ctrl+C in edit mode to copy the current line into the clipboard
imap <c-c> <Esc>"*yyi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Arrange windows horizontally and put tha first buffer reserved
" for MiniBufExplorer back to 1 height
map <leader>= <c-w>=<c-w>k :resize 1 <ESC><c-w>j
nnoremap <c-w>v :vsplit <ESC> <leader>= 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 4 spaces wide indents Master Race.
set shiftwidth=4
set tabstop=4

" Use spaces instead of tabulation character
set expandtab

" Auto indent
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo, Redo, File History and restoration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always enable the statusline
set laststatus=2

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=magenta
    elseif a:mode == 'r'
        hi statusline guibg=blue
    else
        hi statusline guibg=red
    endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" default the statusline to green when entering Vim
hi statusline guibg=green

function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

set statusline=
set statusline+=%0*\[%n]                                  "buffernr
set statusline+=%0*\ %<%F\                                "File+path
set statusline+=%0*\ %y\                                  "FileType
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%0*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%0*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%0*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%0*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%0*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts and Extentions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Pathogen
call pathogen#infect()

" CtrlP bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" miniBuffExplorer bindings
map <Leader>b :TMiniBufExplorer<cr>
map <Leader>t :MiniBufExplorer<cr>
" Enable thz wtral+hjkl to move around the tabs 
" let g:miniBufExplMapWindowNavVim = 1
nmap <c-l> <c-w>k<tab><cr>
nmap <c-h> <c-w>k<s-tab><cr>

