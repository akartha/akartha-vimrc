"If vim-plug not found, install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) 
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.vim/plugged')
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'junegunn/goyo.vim'
"Plug 'airblade/vim-gitgutter'


""""""""""""""
"colorschemes"
"""""""""""""""
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'wuelnerdotexe/vim-enfocado'
"Plug 'dracula/vim', { 'as': 'dracula' }
""Plug 'https://github.com/sainnhe/everforest.git'
"Plug 'NLKNguyen/papercolor-theme'
"

"Autocompletes
Plug 'https://github.com/ackyshake/VimCompletesMe.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Use CocInstall coc-tsserver coc-css coc-html coc-sh

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

""""""""""""""""""""
"Beautify your code"
"""""""""""""""""""""
Plug 'maksimr/vim-jsbeautify'
"""""""""""""""""""""""
"Nerdtree File Manager"
""""""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
""""""""""""
"Statusline"
"""""""""""""
"hackline
""Plug 'https://github.com/jssteinberg/hackline.vim.git', {'branch': 'dev'}
"lightline
Plug 'itchyny/lightline.vim'
""""""""""""""""""""""""""""""
"Css colors showing in files"
""""""""""""""""""""""""""""""
Plug 'https://github.com/ap/vim-css-color.git'
"""""""""""""""""""""""""""""""""""
"Comment and uncomment text easily"
""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'
"""""""""""""""""""""""
"Markdown live preview"
""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.vim'
"""""""""""""""""""""""""""""""""""""""""""""
"HTML CSS JS Live preview in default browser"
""""""""""""""""""""""""""""""""""""""""""""""
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
""""""""""""""""""""""""""
"Fix Vim clipboardproblem"
"""""""""""""""""""""""""""
Plug 'christoomey/vim-system-copy'
""""""""""""""""""""""""""""""""""""""""""""
"Syntax highlighting and icons for nerdtree"
"""""""""""""""""""""""""""""""""""""""""""""
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

""""""""""
"surround"
"""""""""""
Plug 'https://github.com/tpope/vim-surround.git'
" This plugin has odd Keybindings but its useful  ysiw" surrounds one word with the " sign  yss) surrounds entire line with )
" yss<p> surrounds line with the <p> tag and auto completes the closing tag to surround multiple lines with a tag like a <li></li> use visual
" selection" then press St and type the tag. Notice that the first < is already written 
" " so dont type it twice otherwise you'll get <<li>
" " remember that its not about speed! vim doesnt care about how fast you
" input
" " the combinations. We're not typing GTA cheats!

""""""""""""""
"Fuzzy Search"
"""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
""""""""""""""
"Syntax Check"
"""""""""""""""
Plug 'https://github.com/vim-syntastic/syntastic.git'
"""""""""""
"Alignment"
""""""""""""
Plug 'https://github.com/godlygeek/tabular.git'
"use :Tabularize /[character] to align
""example :Tabularize /= alignes the = 
""""""""""""""""""""""""""""""""
"Search and open previous Files"
"""""""""""""""""""""""""""""""""
Plug 'https://github.com/yegappan/mru.git'
""""""""""""""
"Start Screen"
"""""""""""""""
Plug 'mhinz/vim-startify'
"""""""""
"Floterm"
""""""""""
Plug 'voldikss/vim-floaterm'

""""""""""""
"indentline"
"""""""""""""
Plug 'https://github.com/Yggdroot/indentLine.git' 
""""""""""
"WhichKey"
"""""""""""
Plug 'liuchengxu/vim-which-key'

call plug#end()

""""""""
" Cursor "
""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set mouse=a
set guicursor+=a:blinkon0
"""""""""""""
" Clipboard "
"""""""""""""
set clipboard=unnamedplus
"for OSX & Windows users 
"set clipboard=unnamed

"Using the clipboard plugin c-p can be used to copy to system clipboard
"and c-v to paste from system clipboard(works in visual mode) - xsel is a
" dependency
"For modern terminals such as konsole-xfce-mate etc... Ctrl Shift V works as
"usual

" The default mapping is cp for copying and cv for pasting, and can be
" followed by any motion or text object. For instance:
" cpiw => copy word into system clipboard
" cpi' => copy inside single quotes to system clipboard
" cvi' => paste inside single quotes from system clipboard
" In addition, cP is mapped to copy the current line directly.
" The sequence cV is mapped to paste the content of system clipboard to the
" next line.
""""""""""""""
"Usual Things"
""""""""""""""
"For folds to be saved on exit
"augroup remember_folds
 "autocmd!
"autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent! loadview
"augroup END

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd") 
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set modifiable
set cmdheight=1
set foldenable
set foldmethod=manual
set path+=**
set noswapfile
set autoindent
set ic
set incsearch
set smartcase
set lazyredraw
set noerrorbells
set novisualbell


set nocompatible
set encoding=UTF-8
set nu rnu

"" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" " which is the default
map Y y$
"
" " Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>
"
" "------------------------------------------------------------
if has('syntax')
  syntax on
endif

set hlsearch
set showcmd
set wildmenu
set autoread
"set spell
"set spelling=en_us
set backspace=indent,eol,start

set ignorecase
set smartcase

set autoindent
set ruler

set shiftwidth=4
set softtabstop=4
set expandtab

"""""""
"Theme"
""""""""
" Inspect $TERM instad of t_Co
if &term =~ '256color'
   " Enable true (24-bit) colors instead of (8-bit) 256 colors.
   if has('termguicolors')
       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
       set termguicolors
    endif
    colorscheme gruvbox
endif

"put colorscheme in above statement, default is gruvbox 
"" other colorschemes include:
" nord 
" " enfocado
" " PaperColor
" " gruvbox
" " everforest
" " dracula
" " monokai

" Below statement is for everforest colors
" uncomment the ones with ""
" everforest theme takes a second to generate the settings the first time

" Important!!
"" if has('termguicolors')
"" set termguicolors
"" endif

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'

"" let g:everforest_background = 'hard'
"" For better performance
"" let g:everforest_better_performance = 1
"" let g:everforest_enable_italic = 1
"-------------------
"for enfocado theme
"let g:enfocado_style = 'nature' " Available: `nature` or `neon`.
"-------------------
set background=dark
"Indentline follow theme change to 1 if colors are fucked
let g:indentLine_setColors = 0
"set background=light

"""""""""""""""""""""
"hackline statusline"
""""""""""""""""""""""
" let g:hackline_laststatus = 2
" let g:hackline_mode = 1
" let g:hackline_bufnum = 0
" let g:hackline_filetype = 1
" let g:hackline_fileformat = 0
" let g:hackline_tab_info = 0
" " Any valid statusline value
" let g:hackline_custom_end = '
"             \ %l/%L[%p%%]
"             \'
" " let g:hackline_highlight_normal = 'StatusLine'
" let g:hackline_highlight_normal = 'PmenuSel'
" let g:hackline_highlight_command = 'Todo'
" let g:hackline_highlight_insert = 'DiffAdd'
" let g:hackline_highlight_terminal = 'Todo'
" let g:hackline_highlight_visual = 'IncSearch'
" let g:hackline_highlight_replace = 'DiffDelete'
" let g:hackline_highlight_select = 'IncSearch'
""""""""""""""""""""""""""
"for lightline status bar"
""""""""""""""""""""""""""
"minimal info on narrow splits
let g:lightline = { 
            \'component_function': { 'lineinfo': 'LightlineLineinfo', } 
            \}

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif
    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

"remove readonly in help window
let g:lightline = {
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \ },
    \ }

function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" let g:lightline = {
"    \'component_function':  { 'mode': 'LightlineMode'}
"    :w
"    \}

" function! LightlineMode() abort
"     let ftmap = {
"       \ 'NERDTree': 'NERDTree',
"       \ }
"     return get(ftmap, &filetype, lightline#mode())
" endfunction


" no statusline in nerdtree window
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

set laststatus=2
set noshowmode

" Available colors are: one solarized wombat papercolor everforest gruvbox ||
" Each has a dark and light version according to the set background option. || default is powerline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \ 'left': [ [ 'mode' ], [ 'readonly', 'absolutepath','modified' ] ],
    \ 'right': [ [ 'lineinfo' ],[ 'percent' ],['filetype'] ] },
    \ 'component': {
    \ 'charvaluehex': '0x%B'
    \ },
    \ }
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
let mapleader = " "
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

nnoremap <leader>n :NERDTree
"------------------------------------------------------------
