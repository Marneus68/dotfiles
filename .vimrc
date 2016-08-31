
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  If I'm running vim on fish, I set the shell back to a standard POSIX shell
if $SHELL =~ 'fish'
  set shell='/bin/sh'
endif

" Map the leader
let mapleader = ";"

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

" Sometimes vim doesn't like fish
if $SHELL =~ 'bin/fish'
set shell=/bin/sh
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position // outline current line
set ruler

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" Display the current cursor line
set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=NONE

" Line numbering // you can't live without it
" TODO : find a way to have both the line numbering and the relative line
"           numbers
set number

" Show a column at chars for every line that is over 80 characters long
call matchadd('ColorColumn', '\%81v', 100)

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show the current mode
set showmode

" Configure the default completion menu behaviour
set wildmenu
set wildmode=list:longest

" Enable Omni Completion
set omnifunc=syntaxcomplete#Complete

" Set the completion menu behaviour
set completeopt=longest,menuone,preview

" Move the vertical splits at the bottom so it doesn't move the code
set splitbelow

" No annoying sound on errors, use a flash instead
set noerrorbells
set t_vb=
set tm=500
set visualbell

" Enable mouse scroll
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Better support of the mouse in terminal
if has("mouse_sgr")
    set ttymouse=urxvt
else
    set ttymouse=xterm2
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors, Fonts and GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting // that should be default
filetype plugin on
filetype plugin indent on
syntax enable
syntax on

" Prevent the 'transparent background' effect, which might be enjoyable
set background=dark

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
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

" Adds v before any search expression to allow normally formed regexps
nnoremap / /\v
vnoremap / /\v

" More appropriate search options
set ignorecase
set smartcase

" Replace all occurrences by default
set gdefault

" Dynamically highlight the search results
set incsearch
set showmatch
set hlsearch

" Clear the search last highlight
nnoremap <leader><space> :noh<cr>

" Maps the % (go to corresponding bracket) to ù
nnoremap ù %
vnoremap ù %

" unmap ctrl+q because it's annoying (and useless to me)
map <c-q> <Nop>

" make the indent behaviour a little more sane
vmap <Tab> >gv
vmap <S-Tab> <gv

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamed


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
set statusline+=%0*\ %<%F\                                "File path
set statusline+=%0*\ %y\                                  "FileType
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%0*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%0*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%0*\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%0*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%0*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck color
:hi clear SpellBad
:hi SpellBad cterm=underline ctermbg=darkred ctermfg=red

let b:myLang=0
let g:myLangList=["nospell","en","fr"]
function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
        endif
    echo ""
endfunction

" Rotates between no spell checking, English dictionary and French dictionary
map <leader><F11> :call ToggleSpell()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts, Extensions and custom bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Binding ctrl space (and ctrl f) for completion
inoremap <Nul> <C-x><C-o>
inoremap <C-f> <C-x><C-o>

" Bindings to reload my vimrc
nmap <leader>rc :e $MYVIMRC<CR>
nmap <leader>rr :source $MYVIMRC<CR>

" Start Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" CtrlP bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ./'

" Enable ctrl+h and ctrl+l to move around the buffers
nmap <c-l> :bn<CR>
nmap <c-h> :bp<CR>

" EasyMotion bindings
nmap <leader>f H<leader><leader>w

" FSwitch options
let g:alternateSearchPath = 'reg:#\<src\>$#include#,reg:#\<include\>$#src#'
au! BufEnter *.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '../include'
au! BufEnter *.h let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'

" FSwitch bindings
nmap <leader>fs :FSHere<CR>

" NERDTree bindings
let g:NERDTreeWinPos = "right"
map <leader><tab> <ESC>:NERDTreeToggle<CR>

" Simple make, make clean, make mrproper, make test and make debug
map <leader>mm :!clear<CR>:!make<CR>
map <leader>mc :!clear<CR>:!make clean<CR>
map <leader>mp :!clear<CR>:!make mrproper<CR>
map <leader>md :!clear<CR>:!make debug<CR>
map <leader>rp :!clear<CR>:!./`basename "$PWD"`<CR>

" Simple valgrind memory leak check
map <leader>vm :!valgrind --tool=memcheck --leak-check=yes ./`basename "$PWD"`<CR>

" vim-go highlight stuff
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  

" location of the snippets
let g:snippets_dir="~/.vim/bundle/snipmate/vim-snipmate/snippets/,~/.vim/snippets/"
