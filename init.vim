"author kee yan

set nocompatible
set termguicolors "true color

filetype plugin indent on
syntax on

colorscheme evening
set number
set autoindent
set smartindent
set expandtab
set tabstop =2
set softtabstop =2
set shiftwidth =2
set shiftround

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set ignorecase

set backspace =indent,eol,start
set hidden
set laststatus =2   "always show statusline
set display =lastline   "show as much as possible of the last line
set ruler "状态栏中显示当前鼠标位置

set showmatch "括号匹配
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
set paste "鼠标粘贴不会改格式
set listchars=tab:>-,trail:- "显示空格和tab键

set shell=/bin/zsh

set backup
set backupdir =$HOME/.vim/files/backup/
set backupext =-vimbackup
set backupskip =
set directory =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir =$HOME/.vim/files/undo
set viminfo ='100,n$HOME/.vim/files/info/viminfo'

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
