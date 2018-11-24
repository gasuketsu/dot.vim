" Be improved
set nocompatible
filetype plugin indent on
syntax enable

" vim-plug
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

let s:plugged_dir = has("win32") || has("win64") ? '~/vimfiles/plugged/' : '~/.vim/plugged/'
call plug#begin(expand(s:plugged_dir))
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'milkypostman/vim-togglelist'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'gasuketsu/gtags.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'sjl/splice.vim'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'dag/vim-fish'
" colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
call plug#end()

"-----------------------------
" Visual configuration
"-----------------------------
" Enable truecolor if possible
if has("termguicolors")
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Colorscheme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

"-----------------------------
" Display configuration
"-----------------------------
set shortmess+=I
set shellslash
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

set number
set cursorline
set wrap
set list
set listchars=tab:>-,trail:.,extends:<,precedes:>
set ambiwidth=double

set cmdheight=2
set laststatus=2
set showcmd
set display=lastline

"-----------------------------
" Editor configuration
"-----------------------------
set mouse=a
set nobackup
set noswapfile
set viminfo=
if v:version >= 704
  set noundofile
endif

" enable to open other file in edit
set hidden

" wildmode(complement)
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.a,*.pyc,*.DS_Store,*.db,*/tmp/*,*.swp,*.zip,*.exe,*.dll,*.so
if has("win32") || has("win64")
  set wildignore+=NTUSER*,ntuser*
endif

" no beep
set vb t_vb=

" timeout
" may need to  put these settings into vimfiles/plugin/notimeout.vim
set notimeout
set ttimeout
set timeoutlen=200

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cindent
set cino=>2,l1,N-s,g0,(0,W2

" enable to delete newline
set backspace=2

" Copy&Paste
set clipboard=unnamed

" Search behavior
set hlsearch
set ignorecase
set smartcase

" IME settings in Insert/Search Mode for Windows environment
" 0:off 1:off 2:on
if has("win32") || has("win64")
    set iminsert=0
    set imsearch=0
  " Fix IM control mode
  let IM_CtrlMode = 4
endif

" Yank to end of line
nnoremap Y y$
" turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>
" change current directory when changing buffer
nnoremap <silent> <F3> :<C-u>lcd %:h<CR>

"-----------------------------
" Ctags
"-----------------------------
set tags+=tags;~/

"-----------------------------
" Gtags
"-----------------------------
nnoremap tg :<C-u>Gtags -g
nnoremap <silent> tf :<C-u>Gtags -f %<CR>
nnoremap <silent> tt :<C-u>Gtags <C-r><C-w><CR>
nnoremap <silent> tr :<C-u>Gtags -r <C-r><C-w><CR>
nnoremap <silent> <C-Q> :<C-u>ccl<CR>
nnoremap <silent> <C-j> :<C-u>cn<CR>
nnoremap <silent> <C-k> :<C-u>cp<CR>

"-----------------------------
" fzf
"-----------------------------
let g:fzf_layout = { 'up': '~40%' }
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>g :GFiles<CR>

"-----------------------------
" NERDTree
"-----------------------------
nmap <silent> <C-o> :<C-u>NERDTreeToggle<CR>

"-----------------------------
" vim-better-whitespace
"-----------------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
vnoremap <silent> <F12> :StripWhitespace<CR>
nnoremap <silent> <F12> :StripWhitespace<CR>

"-----------------------------
" multiple cursors
"-----------------------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

"-----------------------------
" clang-format
"-----------------------------
let g:clang_format#code_style = "mozilla"
let g:clang_format#style_options = {
      \ "AlignEscapedNewlinesLeft": "true",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AllowShortLoopsOnASingleLine" : "true",
      \ "BinPackArguments" : "false",
      \ "BinPackParameters" : "false",
      \ "MaxEmptyLinesToKeep" : 2,
      \ "TabWidth" : 4}

let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"-----------------------------
" rainbow parentheses
"-----------------------------
" Always enable Rainbow Parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

"-----------------------------
" pymode
"-----------------------------
let g:pymode_options_max_line_length = 88

" Post hook to source machine-specific configuration
" (should be placed at the last of this file)
let s:local_rc = expand($HOME.'/.vimrc_local')
if filereadable(s:local_rc)
  execute 'source' s:local_rc
endif
