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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'romainl/vim-qf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular' " required for vim-polyglot
Plug 'sheerun/vim-polyglot'
" Color Schemes
Plug 'morhetz/gruvbox'
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
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox

" statusline (airline)
let g:airline#extensions#tabline#enabled = 1

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
set listchars=tab:>\ ,trail:-,nbsp:+
set ambiwidth=double

set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set updatetime=100

"-----------------------------
" Editor configuration
"-----------------------------
set mouse=a
set nobackup
set noswapfile
set viminfo=
set noundofile

" enable to open other file in edit
set hidden

" wildmode(complement)
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.a,*.pyc,*.DS_Store,*.db,*/tmp/*,*.swp,*.zip,*.exe,*.dll,*.so,NTUSER*,ntuser*

" no beep
set vb t_vb=

" timeout
" may need to  put these settings into vimfiles/plugin/notimeout.vim
set notimeout
set ttimeout
set timeoutlen=200

" Default Indentation
set cindent
set cino=l1,:0,N-s,g0,(0,W4,m1

" enable to delete newline
set backspace=2

" Copy&Paste
set clipboard=unnamed

" Search behavior
set hlsearch
set ignorecase
set smartcase
set wrapscan

" Yank to end of line
nnoremap Y y$
" turn off search highlighting until the next search
nnoremap <silent> <C-l> :nohl<CR>
" change current directory when changing buffer
nnoremap <silent> <F6> :<C-u>lcd %:h<CR>

map q <Nop>

"-----------------------------
" Ctags
"-----------------------------
set tags+=tags;~/

"-----------------------------
" Buffergator
"-----------------------------
let g:buffergator_viewport_split_policy = 'T'

"-----------------------------
" vim-qf
"-----------------------------
nmap <Leader>qq <Plug>(qf_qf_toggle)
nmap <Leader>ql <Plug>(qf_loc_toggle)
nmap <silent> [q <Plug>(qf_qf_previous)
nmap <silent> ]q <Plug>(qf_qf_next)
nmap <silent> [l <Plug>(qf_loc_previous)
nmap <silent> ]l <Plug>(qf_loc_next)

"-----------------------------
" fzf
"-----------------------------
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fb :Buffers<CR>

"-----------------------------
" NERDCommenter
"-----------------------------
let g:NERDDefaultAlign = 'left'

"-----------------------------
" NERDTree
"-----------------------------
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"-----------------------------
" vim-better-whitespace
"-----------------------------
" disable highlighting trailing whitespace by default.
" (perform :ToggleWhitespace to enable highlighting)
nnoremap <silent> <leader>w :ToggleWhitespace<CR>
vnoremap <silent> <leader>sw :StripWhitespace<CR>
nnoremap <silent> <leader>sw :StripWhitespace<CR>

"-----------------------------
" multiple cursors
"-----------------------------
let g:multiple_cursor_use_default_mapping=0
let g:multiple_cursor_next_key='<C-n>'
let g:multiple_cursor_prev_key='<C-h>'
let g:multiple_cursor_skip_key='<C-x>'
let g:multiple_cursor_quit_key='<Esc>'

"--------------------------
" clang-format
"--------------------------
let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>Cf :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>Cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>Ct :ClangFormatAutoToggle<CR>

"-----------------------------
" rainbow parentheses
"-----------------------------
" Always enable Rainbow Parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces


"-----------------------------
" sheerun/vim-polyglot
"-----------------------------
" go
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" cpp
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
" markdown
let g:vim_markdown_conceal_code_blocks = 0


" Post hook to source machine-specific configuration
" (should be placed at the last of this file)
let s:local_rc = expand($HOME.'/.vimrc_local')
if filereadable(s:local_rc)
  execute 'source' s:local_rc
endif
