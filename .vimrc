"
" <===================== Vundle plugin to manage plugin =====================>
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'suan/vim-instant-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Chiel92/vim-autoformat'
Plugin 'elzr/vim-json'
Plugin 'heavenshell/vim-jsdoc'

Plugin 'tomasr/molokai'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use :filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"
" <===================== Plugin Conf ======================>

" =================SyntaxComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" =================YouCompleteMe$                                                                                       

" =================javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'underscore,angularjs,angularuirouter,jquery'
let g:ycm_min_num_of_chars_for_completion = 1

" =================Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_html_checkers = ['jshint', 'eslint', 'tidy']

" ================UtilsSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-j>"

" ================VimAutoFormat
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1

" ================vim-javascript
let g:javascript_plugin_jsdoc = 1

" ================vim-json
let g:vim_json_syntax_conceal = 0

"
" <===================== General  =====================>
"

" Sets how many lines of history VIM has to remember
set history=500


"
" <===================== User interface =====================>
"

" Turn on the WiLd menu
set wildmenu
set wildmode=longest:full,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show line number
set nu

" Set title to path of file in edition
set title

" Show invisible character
set list

"
" <===================== Colors and Fonts  ======================>
"

" Enable colum ruler
set cc=120

" Enable syntax highlighting
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Enable theme
try
  colorscheme molokai
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"
" <===================== Text, Tab, Indent  ======================>
"

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set textwidth=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap


"
" <===================== Visual mode ======================>
"

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"
" <===================== Moving, Tabs, Windows, Buffers ======================>
"

" Map <Leader> to ,
let mapleader = ","

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


"
" <===================== Status line ======================>
"

" Always show the status line
set laststatus=2


"
" <===================== Spell checking  ======================>
"

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"
" <===================== Helper functions ======================>
"

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
