""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Cosim Zhou
"
" Version:
"       1.0 - 2014/12/20
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/cosimzhou/my-vimrc
"
" Sections:
"    -> Vundle.vim
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype on                   " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" add git blame cmdline
Plugin 'zivyangll/git-blame.vim'

" markdown preview
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

Plugin 'sirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'sirver/ultisnips'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

"
Plugin 'rhysd/vim-clang-format'

" Add new language supporting
Plugin 'fatih/vim-go'         " golang
Plugin 'uarun/vim-protobuf'   " protobuf
Plugin 'solarnz/thrift.vim'   " thrift
Plugin 'tikhomirov/vim-glsl'  " glsl
Plugin 'bazelbuild/vim-bazel' " bzl, BUILD, WORKSPACE for bazel
Plugin 'lervag/vimtex'        " latex
Plugin 'pangloss/vim-javascript'

" golang source list tagbar
"Plugin 'majutsushi/tagbar'
Plugin 'preservim/tagbar'

" vim-gutentags
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'maksimr/vim-jsbeautify'

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:username="cosimzhou"
let g:usermail="cosimzhou@hotmail.com"

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread
"set autochdir

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" System clipboard copy & paste
nmap <leader>y  "+y

let &t_TI=""
let &t_TE=""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler
"set cursorline
set cursorcolumn
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden  "hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


set foldcolumn=0
set foldmethod=indent
set foldlevel=3
"set foldenable              " fold code

set number relativenumber  "nu rnu
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"colorscheme desert
"colorscheme molokai
"colorscheme srcery
colorscheme darkblue
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup "nowb
set noswapfile


nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>l :redraw!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set linebreak
set tw=500

set list
set listchars=tab:>_,trail:_

set autoindent " Auto indent (ai)
set smartindent " Smart indent (si)
set nowrap " Don't wrap lines
"set wrap "Wrap lines
noremap <leader>w   :set wrap!<CR>
noremap <leader>r   :set nu! rnu!<CR>
"inoremap <silent><Esc>  <Esc>`^

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" VimTex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-go settings
"        Golang
let g:go_fmt_command = "goimports"
let g:go_version_warning = 0
autocmd FileType go nmap <leader>I <Plug>(go-implements)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)
autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <leader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <leader>e <Plug>(go-rename)　

" gtags
"
" Ubuntu install gtags
"   sudo apt-get build-dep global
"   sudo apt-get install libncurses5-dev libncursesw5-dev
"   wget https://ftp.gnu.org/pub/gnu/global/global-6.6.tar.gz
"   tar -zxvf global-6.6.tar.gz && cd global-6.6
"   ./configure --with-sqlite3
"   make -j4
"   make check
"   sudo make install
"   sudo make installcheck
"   global --version
"
"   pip install pygments
"
let $GTAGSLABEL = 'native-pygments'
let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'WORKSPACE']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags.project~'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--fields=+niazS']  ", '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1

set cscopetag " Use cscope as tags command
set cscopeprg='gtags-cscope' " Use gtags-cscope instead of cscope

"gtags.vim
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1


"plugin 'NERD_tree'
function! MyNerdShow()
  let l:cwd = findfile(expand('%')) == ''? expand('#:p:h'): expand('%:p:h')
  execute 'NERDTreeToggle '.l:cwd
endfunction
nmap <silent> <c-n> :call MyNerdShow()<CR>

" bundle  majutsushi/Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
    \     'p:package',
    \     'i:imports:1',
    \     'c:constants',
    \     'v:variables',
    \     't:types',
    \     'n:interfaces',
    \     'w:fields',
    \     'e:embedded',
    \     'm:methods',
    \     'r:constructor',
    \     'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
    \     't' : 'ctype',
    \     'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
    \     'ctype' : 't',
    \     'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set tags=tags.project;
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quick lookup definition
map <leader>z  yiw:%s/\C\<<C-R>"\>/&/gn<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
"map <leader>tl :tabn<cr>
"map <leader>th :tabp<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{expand('%')}%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ POS:\ %l/%L\ %c\ %{HasPaste()}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" New file template
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.cc,*.[ch],*.sh,*.py,*.java,*.tex,*.html execute ":call TemplateDoc()"
autocmd BufReadPost *.cpp,*.cc,*.[ch],*.sh,*.py,*.java,*.tex,*.html
      \ if line('$') == 1 && getline(1) == '' |
      \   execute ":call TemplateDoc()" |
      \ endif
function ClassNameCpp(filename)
  return substitute(substitute(a:filename, '\v_(\l)', '\U\1', 'g'), '\v^(\l)', '\U\1', '')
endfunction
""定义函数TemplateDoc，自动插入文件头
function TemplateDoc()
  let l:ext = expand('%:e')
  let l:linebuf = []
  let l:inputline = v:none
  if &filetype == 'sh'
    let l:linebuf = ["\#! /bin/bash", ""
          \, "\#########################################################################"
          \, "\# File Name: ".expand("%")
          \, "\# Author: ".g:username
          \, "\# mail: ".g:usermail
          \, "\# Created Time: ".strftime("%c")
          \, "\#########################################################################"
          \, ""]
  elseif &filetype == 'python'
    let l:linebuf = ["\#! /usr/bin/python"
          \, "# -*- coding: UTF-8 -*-", ""
          \, "\#########################################################################"
          \, "\# File Name: ".expand("%")
          \, "\# Author: ".g:username
          \, "\# mail: ".g:usermail
          \, "\# Created Time: ".strftime("%c")
          \, "\#########################################################################"
          \, ""]
  elseif &filetype == 'html'
    let l:linebuf = ["<!doctype html>"
          \, "<html lang=\"zh-cn\">"
          \, "  <head>"
          \, "    <meta charset=\"UTF-8\">"
          \, "    <title>Title</title>"
          \, "  </head>"
          \, "  <body>", "", ""
          \, "  </body>"
          \, "</html>"]
    let l:inputline = 8
  elseif &filetype == 'tex'
    let l:linebuf = ["% LaTex Document"
          \, "\\documentclass{article}", ""
          \, "\\begin{document}", "", ""
          \, "\\end{document}"]
    let l:inputline = 5
  elseif &filetype == 'c'
    let l:linebuf = [l:ext == 'h'? "#pragma once": '#include "'.expand("%:t:r").'.h"']
  elseif &filetype == 'cpp'
    let l:filename = expand("%:t:r")
    if l:ext == 'h'
      let l:linebuf = ["#pragma once", ""]
    elseif l:filename =~# '_test$'
      let l:linebuf += ['#include "'.expand("%:h").'/'.substitute(l:filename, '\v_test$', '', '').'.h"'
            \, '', '#include "glog/logging.h"'
            \, '#include "gmock/gmock.h"'
            \, '#include "gtest/gtest.h"', '']
    else
      let l:linebuf = ['#include "'.expand("%:h").'/'.l:filename.'.h"']
    endif
    let l:packarray = split(expand('%:h'), '/')
    let l:layer = len(l:linebuf)
    for i in l:packarray
      call insert(l:linebuf, '}  // namespace '.i, l:layer)
      call insert(l:linebuf, 'namespace '.i.' {', l:layer)
      let l:layer = l:layer + 1
    endfor
    call insert(l:linebuf, '', l:layer)
    if l:filename =~# '_test$'
      let l:class_name = ClassNameCpp(l:filename)
      call insert(l:linebuf, 'class '.l:class_name.' : public ::testing::Test {};', l:layer)
      call insert(l:linebuf, '', l:layer+1)
      call insert(l:linebuf, 'TEST_F('.l:class_name.', Normal) {}', l:layer+2)
    elseif l:filename =~# '_mock'
      let l:linebuf += ['class '.l:class_name.' {', 'MOCK_METHOD1(Func, void(int));', '};'];
    endif
    call insert(l:linebuf, '', l:layer)
    let l:inputline = l:layer+3
  endif

  if len(l:linebuf)
    let l:offset = 0
    call setline(1, l:linebuf[0])
    for l in l:linebuf[1:]
      call append(line(".")+l:offset, l)
      let l:offset = l:offset + 1
    endfor
  endif

  "autocmd BufNewFile G
  if l:inputline == v:none
    execute "normal! Go"
  else
    execute "normal! ".l:inputline.'j'
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Refactor()
  let l:v = ""
  let l:vnew = ""
  execute "s/\<".l:v."\>/".l:vnew."/g"
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0             ^
map <leader>0     $

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  execute "normal mz"
  %s/\s\+$//ge
  execute "normal `z"
endfunction
autocmd BufWrite * :call DeleteTrailingWS()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => vimgrep searching and cope displaying
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g   yiw:vimgrep /\C\<<C-R>"\>/ ./**/*<cr>/\C\<<C-R>"\><cr>N
"map <leader>1   :first<cr>
"map <leader>0   :last<cr>
map <silent> <leader>gw  :copen<cr>
map <leader>gg   yiw:!grep -Irn --color \\b<C-R>"\\b .<cr>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mmm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" copy all content and paste into a new tab
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>Pgg


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exec "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  "unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" Remark code block in visual mode
function! RemarkBlock()
  if visualmode() != 'V'| execute "V"| endif
  let l:saved_reg = @"
  execute "y"

  let l:symbol = '\/\/'
  if &filetype == 'sh' || &filetype == 'python' || &filetype == 'ruby' || &filetype == 'bzl'
    let l:symbol = '#'
  elseif &filetype == 'tex'
    let l:symbol = '%'
  elseif &filetype == 'vim'
    let l:symbol = '"'
  elseif &filetype == 'sql'
    let l:symbol = '--'
  elseif &filetype == 'bas' || &filetype == 'vbs'
    let l:symbol = "'"
  endif
  let l:pattern = @"
  let l:is_remark = l:pattern =~# '^\s*'.l:symbol

  "
  let l:indent = len(l:pattern)
  for l:sngl in split(l:pattern, '\r')
    let l:diff = len(l:sngl) - len(substitute(l:sngl, '^\s*', '', ''))
    if l:diff < l:indent | let l:indent = l:diff | endif
    if l:diff == 0 | break | endif
  endfor
  let l:prefix = repeat('\s', l:indent)

  " Remark action
  let l:cmd = l:is_remark? ('s/^\(\s*\)'.l:symbol.'/\1/'): ('s/^\('.l:prefix.'\)/\1'.l:symbol.'/')
  execute "normal! gv"
  execute "'<,'>".l:cmd
  let @" = l:saved_reg
  "execute "normal! gv"
endfunction
vmap <silent> <leader>/      :<bs><bs><bs><bs><bs>call RemarkBlock()<cr>


" Returns true if paste mode is enabled
function! HasPaste()
  return &paste? '<PASTE>': ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" Source file toggle
function! ChangeCppFile()
  let l:hdrs = ['h', 'hpp']
  let l:csrcs = ['cc', 'cpp', 'c']
  function! TryCppFile(path, array)
    for i in a:array
      if filereadable(a:path.'.'.i)
        return a:path.'.'.i
      endif
    endfor
    return v:null
  endfunction

  let l:file = expand('%')
  for cs in l:csrcs
    if l:file =~ '.*\.'.cs
      let l:file = TryCppFile(substitute(l:file, '\.'.cs.'$', '', ''), l:hdrs)
      if l:file != v:null
        execute ':e '.l:file
        return
      endif
    endif
  endfor

  for cs in l:hdrs
    if l:file =~ '.*\.'.cs
      let l:file = TryCppFile(substitute(l:file, '\.'.cs.'$', '', ''), l:csrcs)
      if l:file != v:null
        execute ':e '.l:file
        return
      endif
    endif
  endfor

  echom "no pair file"
endfunction
autocmd FileType c,cpp nmap <leader>c :call ChangeCppFile()<CR>
nmap <leader>o :e <c-r>#<CR>
nmap <leader>p :set paste!<CR>


" Try to run c/c++ project built by bazel, make and so on.
function! RunCppFile()
  if filereadable('WORKSPACE')
    let l:path = expand('%:h')
    let l:paths = split(l:path,'/')
    let l:file = expand('%:t')
    let l:pack = expand('%:t:r')

    let l:trylist = ['main', l:paths[-1].'_main', l:pack, l:paths[-1]]
    let l:run = l:pack =~# '\v_test$'? 'test': 'run'

    for p in l:trylist
      let l:cmd = 'Bazel '.l:run.' //'.l:path.':'.p
      let l:candidates = bazel#CompletionList(0,l:cmd,len(l:cmd))
      if len(l:candidates) > 0
        execute l:cmd
        echom l:cmd
        return v:true
      endif
    endfor
  elseif filereadable('Makefile')
    execute 'make'
    return v:true
  endif
  return v:false
endfunction


" Bazel supports
function! BazelTargetArgs()
  let l:target0 = substitute(expand('%:r:h'),'.*\zs/',':','')
  let l:target = substitute(l:target0,'_main$','','')
  let l:target = substitute(l:target,'\.','_','')
  let l:debug = '--compilation_mode=dbg -s'
  let l:action = 'run'
  if &filetype == 'proto'
    let l:target .= '_proto'
    let l:debug = '-s'
    let l:action = 'build'
  endif
  if l:target0 =~# '_test$'
    let l:action = 'test'
  endif
  let @/=l:debug
  let @z=l:target
  let @x=l:action
  return l:target
endfunction

nmap <leader>b   :call BazelTargetArgs()<cr>:Bazel build <c-r>/ //<c-r>z
nmap <leader>br  :call BazelTargetArgs()<cr>:Bazel <c-r>x <c-r>/ //<c-r>z
nmap <leader>bd  :call BazelTargetArgs()<cr>:Bazel build -c opt //<c-r>z
nmap <leader>bq  :call BazelTargetArgs()<cr>:!bazel query 'deps(<c-r>z)'
nmap <leader>bqq :call BazelTargetArgs()<cr>:!bazel query 'somepath(<c-r>z, )'<left><left>
nmap <leader>bt  :let @z=expand('%:.:h')<cr>:Bazel test --compilation_mode=dbg -s //<c-r>z/...<cr>
nmap <leader>bb  :e %:p:h/BUILD<cr>
nmap <leader>q   /\<error:<cr>

" Run test or preview
function! Setup_ExecNDisplay()
  execute "w"
  if RunCppFile()
    echom "build target"
  elseif &filetype == 'vim'
    " run vimscript
    execute "so %"
  elseif &filetype == 'tex'
    " make latex pdf
    execute "!xelatex %:p 2>&1 && xelatex %:p 2>&1 && open -a preview %:p:r.pdf 2>&1; ls %:p:r\.*|grep -v '.*\.tex\n.*\.pdf'|xargs rm 2>/dev/null"
  elseif &filetype == 'c'
    " gcc c source
    execute "!gcc %:p -o %:p.out 2>&1"
  elseif &filetype == 'cpp'
    " g++ a c++ source
    execute "!g++ -std=c++11 %:p -o %:p.out 2>&1"
  elseif &filetype == 'html'
    " open in a web browser
    execute "!open %:p"
  elseif &filetype == 'java'
    " java
    execute "!javac %:p 2>&1 && java %:t:r"
  elseif &filetype == 'dot'
    " dot
    execute "!dot -Tsvg %:p >/tmp/.tmp-graphviz.svg && open /tmp/.tmp-graphviz.svg"
  elseif &filetype == 'markdown'
    " md
    if g:mkdp_server_started
      execute ":MarkdownPreviewStop"
      echo "Markdown preview stopped"
    else
      execute ":MarkdownPreview"
      echo "Markdown previewing"
    endif
  else
    execute "silent !chmod +x %:p"
    execute "!%:p 2>&1"
  endif
endfunction

nmap <F5> :call Setup_ExecNDisplay()<CR>

" Binary editor
let b:edit_binary_mode = v:false
function! BinaryEditToggle()
  if b:edit_binary_mode
    let b:edit_binary_mode = v:false
    execute ":%!xxd -r"
    set readonly
  else
    let b:edit_binary_mode = v:true
    execute ":%!xxd -g 1"
    set noreadonly
  endif
  execute "redraw!"
endfunction
nmap <silent><leader>h :call BinaryEditToggle()<CR>

" Mouse Using
function! ToggleMouseUse()
  if &mouse != 'a'
    set mouse=a
    echom "Enable mouse"
  else
    set mouse=
    echom "Disable mouse"
  endif
endfunction
nmap <leader>m :call ToggleMouseUse()<cr>


nnoremap x "_x
nnoremap X "_X
"nnoremap D "_D
"vnoremap d "_d
"vnoremap dd "_dd
nnoremap c "_c
vnoremap c "_c

nnoremap <leader>x ""x
nnoremap <leader>X ""X
nnoremap <leader>d ""d
nnoremap <leader>dd ""dd
nnoremap <leader>D ""D
vnoremap <leader>d ""d
vnoremap <leader>dd ""dd
nmap <leader>f :let @+=expand('%:p')<CR>:echo @+<CR>

let g:ToggleOfCutAndDelete = '1'
function! ToggleCutAndDelete()
  if g:ToggleOfCutAndDelete == '0'
    let g:ToggleOfCutAndDelete = '1'

    nnoremap x "_x
    nnoremap X "_X
    nnoremap d "_d
    nnoremap dd "_dd
    nnoremap D "_D
    vnoremap d "_d
    vnoremap dd "_dd

    nnoremap <leader>x ""x
    nnoremap <leader>X ""X
    nnoremap <leader>d ""d
    nnoremap <leader>dd ""dd
    nnoremap <leader>D ""D
    vnoremap <leader>d ""d
    vnoremap <leader>dd ""dd

    execute "echo 'Delete mode enter'"
  else
    let g:ToggleOfCutAndDelete = '0'

    nnoremap x ""x
    nnoremap X ""X
    nnoremap d ""d
    nnoremap dd ""dd
    nnoremap D ""D
    vnoremap d ""d
    vnoremap dd ""dd

    nnoremap <leader>x "_x
    nnoremap <leader>X "_X
    nnoremap <leader>d "_d
    nnoremap <leader>dd "_dd
    nnoremap <leader>D "_D
    vnoremap <leader>d "_d
    vnoremap <leader>dd "_dd

    execute "echo 'Cut mode enter'"
  endif
endfunction
nmap <F2> :call ToggleCutAndDelete()<CR>
vnoremap <F3> :ClangFormat<CR>


augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,javascript AutoFormatBuffer js-beautify
  "autocmd FileType json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative:
  " autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

