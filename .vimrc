" File:    .vimrc
" Author:  Travis Cyronek
" Date:    22 January 2019
" Purpose: Vim configuration settings


" ----- Plugin Management (Vundle) ----- " {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jpalardy/vim-slime'
Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'powerline/fonts'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/indentLine'
call vundle#end()

" }}}


" ----- Editing Settings ----- " {{{

" Filetype, Spell Check, and Encoding
filetype plugin on
filetype indent on
autocmd filetype latex,tex let b:did_indent=1
autocmd filetype latex,tex setlocal indentexpr=
autocmd filetype latex,tex setlocal spell spelllang=en_us
autocmd filetype qf wincmd J
set encoding=utf-8

" Searching
set hlsearch  " highlight matches
set incsearch " search as characters are entered
set wildmenu  " visual autocomplete menu for commands

" Tabs
set expandtab     " sets tabs to spaces
set softtabstop=4 " number of spaces in tab when editing
set tabstop=4     " number of visual spaces per tab
set shiftwidth=4  " make indents a single tab

" Folding and Splitting
set foldenable        " enables folding
set foldmethod=marker " create folds with {{{ }}}
set splitbelow        " split window below
set splitright        " split window to the right

" Miscellany
set backspace=indent,eol,start " backspace acts as normal
set clipboard=unnamed          " vim saves to / takes from the system clipboard

" Syntastic (Plugin)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }

" Vim-Latex (Plugin)
let g:tex_flavor="latex"
let g:Tex_CompileRule_pdf="pdflatex --interaction=nonstopmode $*"
let g:Tex_DefaultTargetFormat="pdf"               " set target format to pdf and tell what reader to use
let g:Tex_MultipleCompileFormats="pdf,bibtex,pdf"
let g:Tex_ViewRule_pdf="Preview"
let g:Tex_GotoError=0                             " do not go to the location of the first error after compile
let Tex_FoldedSections=""                         " disable the automatic folding upon opening .tex file
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Vim-Slime (Plugin)
let g:slime_target="tmux"

" indentLine (Plugin)
let g:indentLine_setColors=0 " 0 means don't overwrite colorscheme

" }}}


" ----- User Interface ----- " {{{

" Text
syntax on                                          " enables syntax processing
set cursorline                                     " highlight current line
set cursorcolumn                                   " highlight current column
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12 " must have unicode chars
set showmatch                                      " highlight matching for {[()]}

" Colors
colorscheme solarized                    " a nice color scheme
set background=dark                      " background dark / light
set t_Co=256                             " let it use all colors

" Window
set cmdheight=1             " command line height
set columns=213 lines=94    " default size of window (when not in fullscreen)
set laststatus=2            " status bar open by default
set lazyredraw              " don't redraw mid macro
set number                  " row numbering
set relativenumber          " numbering is relative to selected line
set numberwidth=5           " line-number margin width
if has("gui_running")
    set guioptions -=m      " removes the menubar
    set guioptions -=T      " removes the toolbar
endif

" Airline (Plugin)
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts=1        " allow it to use powerline fonts / symbols
if !exists('g:airline_symbols')        " makes sure it doesn't overwrite stuff
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'           " unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''           " powerline symbols
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERDTree and TagBar (Plugins)
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35
let g:NERDTreeNodeDelimiter="\u00a0"
let g:NERDTreeMapMenu='M'
let g:tagbar_width=35
let g:tagbar_autofocus=0
let g:tagbar_ctags_bin='/usr/local/Cellar/universal-ctags/HEAD-45968ef/bin/ctags'
"if has('gui_running')
"else
"    autocmd VimEnter * NERDTree " auto-open NERDTree
"    autocmd VimEnter * Tagbar   " auto-open Tagbar
"endif

" Vim-Signature (Plugin)
highlight SignColumn ctermbg=none
highlight SignatureMarkText ctermbg=none ctermfg=White

" }}}


" ----- Custom Key Bindings ----- " {{{

" buffer switch, nerd tree toggle, tagbar toggle
nnoremap <F2> :buffers<CR>:buffer<Space>
nnoremap <Leader><F2> :TagbarToggle<CR>
nnoremap <Tab><F2> :NERDTreeToggle<CR>

" syntastic syntax toggles, delete trailing whitespace
nnoremap <F3> :SyntasticCheck<CR>
nnoremap <Leader><F3> :SyntasticReset<CR>
nnoremap <Tab><F3> :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><CR>

" compile latex, open viewer
nnoremap <F4> :call Tex_RunLaTeX()<CR>
nnoremap <Leader><F4> :call Tex_ViewLaTeX()<CR>

" smooth scrolling
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" delete buffer without messing up window configuration
nnoremap <Leader>b :bp<CR>:bd #<CR>

" }}}
