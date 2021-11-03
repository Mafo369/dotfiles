# dotfiles

# Key Shortcuts:

Vim/Nvim:

Leader: <Space>

CtrlP:
  <Leader>, :CtrlP
  <Leader>; :CtrlPBuffer

Window management:
  <Leader><Left>  :wincmd h
  <Leader><Down>  :windcmd j
  <Leader><Up>    :wincmd k
  <Leader><Right> :wincmd l

Splits:
  <Leader>s  :wincmd v (Vertical)
  <Leader>sh :split (Horizontal)
  <Leader>+  :vertical resize +5
  <Leader>-  :vertical resize -5

Buffers:
  <C-P> :bprev

Undotree:
  <Leader>u :UndotreeShow

Ripgrep:
  <Leader>rg: Rg

Coc:
  <TAB>      :trigger completion with characters ahead
  <C-Space>  :trigger completion
  <CR>       :auto-select first completion item
  [g         :coc-diagnostic-prev
  ]g         :coc-diagnostic-next
  gd         :coc-definition
  gy         :coc-type-definition
  gi         :coc-implementation
  gr         :coc-references
  K          :preview documentation
  <Leader>rn :coc-rename
  <Leader>f  :coc-format-selected
  <Leader>a  :coc-codeaction-selected
  <Leader>ac :coc-codeaction (current buffer)
  <Leader>qf :coc-fix-current
  <C-f>      :scroll float windows/popups
  <C-b>      :scroll float windows/popups
  <C-s>      :coc-range-select

NvimTree:
  <C-n>     :NvimTreeToggle
  <Leader>r :NvimTreeRefresh
  <Leader>n :NvimTreeFindFile
  <Leader>o :NvimTreeOpen
