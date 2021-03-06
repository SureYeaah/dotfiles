" plugins
call plug#begin('~/.local/share/nvim/plugged')
" General
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'qpkorr/vim-bufkill'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'monkoose/fzf-hoogle.vim'
"Plug 'terryma/vim-smooth-scroll'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
"Plug 'yonchu/accelerated-smooth-scroll'
Plug 'lilydjwg/colorizer'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
" Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'purescript-contrib/purescript-vim'
Plug 'vmchale/dhall-vim'
" Themes
"Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'
"Plug 'flazz/vim-colorschemes'
"Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'whatyouhide/vim-gotham'
"Plug 'Rigellute/rigel'
call plug#end()

" general settings
set number relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set showcmd
set wildmenu
set incsearch
set hlsearch
set mouse=a
set clipboard=unnamedplus
set autoread
set hidden
set termguicolors
set nobackup
set nowritebackup
"set signcolumn=yes
" colors, font, syntax

filetype plugin indent on
syntax on 
set t_Co=256
set encoding=utf-8
set background=dark
colorscheme gruvbox
autocmd BufRead *.sql set filetype=mysql      
set cmdheight=2
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set cursorline

" bindings
let mapleader = " "
nmap <F2> :mksession! ~/.vim_session<CR> 
nmap <F3> :source ~/.vim_session<CR> 
autocmd FileType cpp nnoremap <silent> <F5> :<C-U>!g++ -Wall -g -O2 % -o ~/Code/a.out && timeout 4s ~/Code/./a.out < ~/Code/input.txt > ~/Code/output.txt<CR>
nmap <C-A> ggvG$
vmap <C-C> "+y
nmap <C-C> "+yy
map <leader>p "+p
map <C-S> :w<CR>

" clear search
map <C-l> :noh<CR>

" buffers
nmap <leader>n :enew<cr>
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>bl :ls<CR>
nmap <leader>d :BD<CR>

" Move between splits
nnoremap <leader>mh <C-w>h
nnoremap <leader>mj <C-w>j
nnoremap <leader>mk <C-w>k
nnoremap <leader>ml <C-w>l

" Close upper buffer
" nmap <leader>u <C-w>k:q<CR>

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'hard'

" smooth scroll
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
" Airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline_powerline_fonts             = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme                       = 'gruvbox'
let g:airline_powerline_fonts             = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" coc
let g:coc_global_extensions = ['coc-pairs', 'coc-snippets',]
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Restart Coc
nnoremap <silent> <leader>cr :CocRestart<cr>

" Tabular
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" NERDtree
autocmd StdinReadPre * let s:std_in=1
"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>
"Show hidden files in NERDTree
let NERDTreeShowHidden = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"autoload
let g:session_autoload = 'no'
" cpp
autocmd Filetype cpp setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" haskell
autocmd Filetype haskell setlocal formatprg=ormolu
autocmd Filetype haskell setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
let g:cabal_indent_section            = 2
let g:haskell_backpack                = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting    = 1
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1  " to enable highlighting of `static`
let g:haskell_indent_if               = 3
let g:haskell_indent_case             = 2
let g:haskell_indent_let              = 4
let g:haskell_indent_where            = 6
let g:haskell_indent_before_where     = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do               = 3
let g:haskell_indent_in               = 1
let g:haskell_indent_guard            = 2
let g:haskell_indent_case_alternative = 1
" purescript
let purescript_indent_if = 3
let purescript_indent_case = 5
let purescript_indent_let = 4
let purescript_indent_where = 6
let purescript_indent_do = 3
let purescript_indent_in = 1
let purescript_indent_dot = v:true
" indentline
autocmd Filetype json let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
