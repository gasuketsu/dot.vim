" Font
if has("win32") || has("win64")
  set guifont=UDEV\ Gothic\ NF:h12:cANSI
  set printfont=UDEV\ Gothic\ NF:h12:cANSI
elseif has("mac")
  set guifont=UDEV\ Gothic\ NF:h16
  set printfont=UDEV\ Gothic\ NF:h16
else
  set guifont=UDEV\ Gothic\ NF\ 12
  set printfont=UDEV\ Gothic\ NF\ 12
endif

set linespace=0

" Colorscheme
set background=dark
colorscheme gruvbox-material

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
