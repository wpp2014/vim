" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" ---------- Leader 系按键 ----------
" \rb                      一键去除全部尾部空白
" \rm                      一键去除全部 ^M 字符
" \rt                      一键替换全部 Tab 为空格

" 判断操作系统类型
if(has('win32') || has('win64'))
  let g:isWIN = 1
  let g:isMAC = 0
else
  if system('uname') =~ 'Darwin'
    let g:isWIN = 0
    let g:isMAC = 1
  else
    let g:isWIN = 0
    let g:isMAC = 0
  endif
endif

" 判断是否处于GUI界面
if has('gui_running')
  let g:isGUI = 1
else
  let g:isGUI = 0
endif

" 设置着色模式和字体
if g:isWIN
  colorscheme molokai
  set guifont=Monaco:h11
elseif g:isMAC
  colorscheme molokai
  set guifont=Monaco:h14
else
  if g:isGUI
    colorscheme molokai
    set guifont=Monospace\ Regular\ 12
  else
    colorscheme molokai
    set guifont=Monaco\ 11
  endif
endif

" 使用GUI界面时的设置
if g:isGUI
  " 启动时自动最大化窗口
  if g:isWIN
    au GUIEnter * simalt ~x
  endif
  winpos 600 350              " 指定窗口出现的位置，坐标原点在屏幕左上角
  set lines=25 columns=100   " 指定窗口大小，lines 为高度，columns 为宽度
  set guioptions+=c          " 使用字符提示框
  set guioptions-=m          " 隐藏菜单栏
  set guioptions-=T          " 隐藏工具栏
  set guioptions-=L          " 隐藏左侧滚动条
  set guioptions-=r          " 隐藏右侧滚动条
  set guioptions-=b          " 隐藏底部滚动条
  set showtabline=0          " 隐藏Tab栏
  set cursorline             " 高亮突出当前行
  " set cursorcolumn         " 高亮突出当前列
endif

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改后自动载入
set autoread
" 取消备份
set nobackup
" 关闭交换文件
set noswapfile

" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn

" 显示当前的行号
set ruler
" 在状态栏显示正在输入的命令
" set showcmd
" 左下角显示当前vim模式
" set showmode

" 显示行号
set number
" 取消换行
" set nowrap

" 括号配对情况，跳转并高亮一下匹配的括号
set showmatch
" 括号匹配时闪烁的频率
set matchtime=2

" 设置文内只能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式，随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个以上大写字母时仍大小写敏感
set smartcase
" 禁止搜索到末端时重新搜索
set nowrapscan

" 缩进配置
" 只能缩进
" set smartindent
" 打开自动缩进
set autoindent
" set cindent

" 设置Tab的宽度 [等同的空格个数]
set tabstop=2
" 每一次缩进对应的空格数
set shiftwidth=2
" 按退格键时可以一次删掉2个空格
set softtabstop=2
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用Ctrl+V+Tab]
set expandtab
" 缩进时，取整
set shiftround

set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.

au FileType php,python set shiftwidth=2
au FileType php,python set tabstop=2

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"==========================================
" 状态栏设置
"==========================================
" 显示状态栏
set laststatus=2

"==========================================
" 括号自动补全
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap < <><LEFT>

"function! RemovePairs()
"  let s:line = getline(".")
"  let s:previous_char = s:line[col(".")-1]

"  if index(["(","[","{"],s:previous_char) != -1
"    let l:original_pos = getpos(".")
"    execute "normal %"
"    let l:new_pos = getpos(".")
"    " only right (
"    if l:original_pos == l:new_pos
"      execute "normal! a\<BS>"
"      return
"    end

"    let l:line2 = getline(".")
"    if len(l:line2) == col(".")
"      execute "normal! v%xa"
"    else
"      execute "normal! v%xi"
"    end
"  else
"    execute "normal! a\<BS>"
"  end
"endfunction

"function! RemoveNextDoubleChar(char)
"  let l:line = getline(".")
"  let l:next_char = l:line[col(".")]

"  if a:char == l:next_char
"    execute "normal! l"
"  else
"    execute "normal! i" . a:char . ""
"  end
"endfunction

" inoremap <BS> <ESC>:call RemovePairs()<CR>a
" inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
" inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
" inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
" inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a

"==========================================
" 插件设置
"==========================================
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'powerline/powerline'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'vim-scripts/phd'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'derekwyatt/vim-fswitch'
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
" Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
" Plugin 'scrooloose/nerdtree'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'lilydjwg/fcitx.vim'

" 插件列表结束
call vundle#end()
filetype plugin indent on

" vim-powserline 配置
set noshowmode
set t_Co=256
let g:Powerline_symbols='unicode'

" \rb                 一键去除全部尾部空白
imap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <leader>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" \rm                 一键去除全部 ^M 字符
imap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>
nmap <leader>rm :%s/<c-v><c-m>//g<cr>
vmap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>

" \rt                 一键替换全部 Tab 为空格
nmap <leader>rt <esc>:retab<cr>
