
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position // outline current line
set ruler

" Display the current cursor line
set cursorline
" highlight Cursorline cterm=background
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=NONE

" Line numbering // you can't live without it
" TODO : find a way to have both the line numbering and the relative line
"           numbers
set number

" Show a column at 80 chars
"set colorcolumn=81

" Show a column at chars for every line that is over 80 characters long
" highlight ColorColumn ctermbg-magenta
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
set nocp
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" No annoying sound on errors, use a flash instead
set noerrorbells
set t_vb=
set tm=500
set visualbell

" Enable mouse scroll
set mouse=a
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
    :set guioptions-=m
    :set guioptions-=lrbTm
    :set guioptions-=L
    :set guioptions-=r
	" Terminus Master Race
	"set guifont=Terminus\ 8
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

" unmap ctrl+q because it's annoying (and useless to me)
map <c-q> <Nop>

" make the indent behaviour a little more sane
vmap <Tab> >gv
vmap <S-Tab> <gv

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
" Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" binding to enable and disable spellchecking with the french dictionnary
map <leader><F11> :setlocal spell! spelllang=fr<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language-specific shenanigans
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap log<tab> Debug.Log(

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts, Extentions and custom bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload my vimrc
nmap <leader>rc :e $MYVIMRC<CR>
nmap <leader>rr :so $MYVIMRC<CR>

" Start Pathogen
call pathogen#infect()

" CtrlP bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ./'

" miniBuffExplorer bindings
"map <Leader>b :TMiniBufExplorer<cr>
"map <Leader>t :MiniBufExplorer<cr>

" Enable ctrl+h and ctrl+l to move around the buffers
" let g:miniBufExplMapWindowNavVim = 1
"nmap <c-l> <c-w>k<tab><cr>
nmap <c-l> :bn<CR>
"nmap <c-h> <c-w>k<s-tab><cr>
nmap <c-h> :bp<CR>

" EasyMotion bindings
nmap <leader>f H<leader><leader>w

" Syntastic options
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_auto_refresh_includes = 1
"let g:syntastic_cpp_include_dirs = [ 'include', 'headers', 'inc', '../include', '../inc', '../headers' ]

" FSwitch options
let g:alternateSearchPath = 'reg:#\<src\>$#include#,reg:#\<include\>$#src#'
au! BufEnter *.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '../include'
au! BufEnter *.h let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'
" FSwitch bindings
nmap <leader>fs :FSHere<CR>

" OmniCppComplete
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/sfml
set tags+=~/.vim/tags/gtkmm-3.0
set tags+=~/.vim/tags/gtkmm-2.4
set tags+=~/.vim/tags/irr
set tags+=~/.vim/tags/temp
" build tags of your own project wiOmniCpp_SelectFirstItem = 0th Ctrl-F12
map <leader><F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/temp .<CR><CR>
"
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_SelectFirstItem = 1 " autmatically select the first item
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Simple make, make clean, make mrproper, make test and make debug
map <leader>mm :!make<CR>
map <leader>mc :!make clean<CR>
map <leader>mp :!make mrproper<CR>
map <leader>md :!make debug<CR>

" Simple valgrind memory leak check
map <leader>vm :!valgrind --tool=memcheck --leak-check=yes ./`basename "$PWD"`<CR>
command! PrettyXML exe ":silent 1,$!tidy --input-xml true --indent yes 2>/dev/null"

