" Font
if has("win32") || has("win64")
  set guifont=Sarasa\ Term\ J:h11:cANSI
  set printfont=Sarasa\ Term\ J:h11:cANSI
elseif has("mac")
  set guifont=Sarasa\ Term\ J:h16
  set printfont=Sarasa\ Term\ J:h16
else
  set guifont=Sarasa\ Term\ J\ 11
  set printfont=Sarasa\ Term\ J\ 11
endif

set linespace=0

" Colorscheme
set background=dark
colorscheme gruvbox

" Default window size
set columns=120
set lines=35

" IME settings in Insert/Search Mode for Windows environment
" 0:off 1:off 2:on
if has("win32") || has("win64")
  set iminsert=0
  set imsearch=0
  " Fix IM control mode
  let IM_CtrlMode = 4
endif
