"author kee yan

set nocompatible
set termguicolors "true color

filetype plugin indent on
syntax on

colorscheme desert
set number
set autoindent
set smartindent
set expandtab
set tabstop =2
set softtabstop =4
set shiftwidth =4
set shiftround

set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8

set ignorecase

set backspace =indent,eol,start
set hidden
"set laststatus =2   "always show statusline
set display =lastline   "show as much as possible of the last line

set showmode  "show current mode in command-line
set showcmd   "show already typed keys when more are expected

set incsearch "highlight while searching with / or ?
set hlsearch  "keep highlighted

set ttyfast
set lazyredraw

set splitbelow   "open new windows below the current window
set splitright

set cursorline
set wrapscan   "重新搜索 N到尾从头开始 can remove
set report =0
set synmaxcol =200

set list
if has('multi_byte') && &encoding ==# 'utf-8'
        let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
        let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set mouse=nv


set shell=/bin/zsh

"set backup
"set backupdir =$HOME/.vim/files/backup/
"set backupext =-vimbackup
"set backupskip =
"set directory =$HOME/.vim/files/swap//
"set updatecount =100
"set undofile
"set undodir =$HOME/.vim/files/undo
"set viminfo ='100,n$HOME/.vim/files/info/viminfo'

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 显示状态行当前设置
"
" " 设置状态行显示常用信息
" " %F 完整文件路径名
" " %m 当前缓冲被修改标记
" " %m 当前缓冲只读标记
" " %h 帮助缓冲标记
" " %w 预览缓冲标记
" " %Y 文件类型
" " %b ASCII值
" " %B 十六进制值
" " %l 行数
" " %v 列数
" " %p 当前行数占总行数的的百分比
" " %L 总行数
" " %{...} 评估表达式的值，并用值代替
" " %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"}
" 显示文件编码
" " %{&ff} 显示文件类型
"one style
"set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
"two style
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"three style
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

"four style
function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction
set statusline=%<%1*[B-%n]%*
" TOT  is  an  abbreviation  for  total  
 set statusline+=%2*[TOT:%{Buf_total_num()}]%* 
 set statusline+=%3*\ %{File_size(@%)}\ %*
 set statusline+=%4*\ %F\ %*
 set statusline+=%5*『\ %{exists('g:loaded_ale')?ALEGetStatusLine():''}』%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
 set statusline+=%6*\ %m%r%y\ %*
 set statusline+=%9*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
 set statusline+=%=%7*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-14.(%l:%c%V%)%*
 set statusline+=%8*\ %P\ %*

hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=208 ctermbg=238
hi User6 cterm=None ctermfg=246 ctermbg=237
hi User7 cterm=None ctermfg=250 ctermbg=238
hi User8 cterm=None ctermfg=249 ctermbg=240
hi User9 cterm=None ctermfg=253 ctermbg=232 "中间长条

"set for true color
hi User1 cterm=bold guifg=#080808 guibg=#d7af5f
hi User2 cterm=None guifg=#ffaf00 guibg=#666666
hi User3 cterm=None guifg=#c6c6c6 guibg=#585858
hi User4 cterm=bold guifg=#d75faf guibg=#4e4e4e
hi User5 cterm=None guifg=#ff8700 guibg=#444444
hi User6 cterm=None guifg=#949494 guibg=#3a3a3a
hi User7 cterm=None guifg=#bcbcbc guibg=#444444
hi User8 cterm=None guifg=#b2b2b2 guibg=#585858
hi User9 cterm=None guifg=#dadada guibg=#080808 "中间长条

"
" " 设置 laststatus = 0 ，不显式状态行
" " 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" " 设置 laststatus = 2 ，总是显式状态行
 set laststatus=2
