" Font
if has("win32") || has("win64")
  set guifont=CamingoCode:h11:cANSI
  set printfont=CamingoCode:h11:cANSI
elseif has("mac")
  set guifont=Migu\ 2M:h16
  set printfont=Migu\ 2M:h16
else
  set guifont=Migu\ 2M\ 11
  set printfont=Migu\ 2M\ 11
endif

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
