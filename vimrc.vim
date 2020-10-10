"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

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

Plugin 'zivyangll/git-blame.vim'

Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

Plugin 'lervag/vimtex'

Plugin 'honza/vim-snippets'
"Plugin 'sirver/ultisnips'

Plugin 'fatih/vim-go'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'tikhomirov/vim-glsl'

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Bundle import begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" default config
" .vimrc
Bundle 'uarun/vim-protobuf'

" thrith support
Bundle 'solarnz/thrift.vim'

" golang source list tagbar
Bundle 'majutsushi/tagbar'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Bundle import end
"""""""""""""""""""""""""""""""""""""""""""""""""""""





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler
set cursorline              " 突出显示当前行
set cursorcolumn            " 突出显示当前列
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

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
"set foldenable              " 开始折叠

set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"colorscheme desert
"colorscheme molokai
colorscheme srcery
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines
"set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_version_warning = 0
au FileType go nmap <leader>I <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>e <Plug>(go-rename)　

"plugin 'NERD_tree'
nmap <silent> <c-n> :NERDTreeToggle<CR>
"nmap <silent> <c-w> :q<CR>

" bundle  majutsushi/Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set tags=tags;
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"nmap <C-a> ggVG

" Quick lookup definition
map <leader>z  yiw:%s/\C\<<C-R>"\>/&/gn<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tl :tabn<cr>
map <leader>th :tabp<cr>
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
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set nu rnu

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ POS:\ %l/%L\ %c

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java,*.tex,*.html exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件

    if &filetype == 'sh'
        call setline(1, "\#! /bin/bash")
        call append(line("."), "")
        call append(line(".")+1, "\#########################################################################")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: cosim")
        call append(line(".")+4, "\# mail: cosimzhou@hotmail.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\#########################################################################")
        call append(line(".")+7, "")
    elseif &filetype == 'python'
        call setline(1, "\#! /usr/bin/python")
        call append(line("."), "# -*- coding: UTF-8 -*-")
        call append(line(".")+1, "")
        call append(line(".")+2, "\#########################################################################")
        call append(line(".")+3, "\# File Name: ".expand("%"))
        call append(line(".")+4, "\# Author: cosim")
        call append(line(".")+5, "\# mail: cosimzhou@hotmail.com")
        call append(line(".")+6, "\# Created Time: ".strftime("%c"))
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    elseif &filetype == 'html'
        call setline(1, "<!doctype html>")
        call append(line("."), "<html lang=\"zh-cn\">")
        call append(line(".")+1, "  <head>")
        call append(line(".")+2, "    <meta charset=\"UTF-8\">")
        call append(line(".")+3, "    <title>Title</title>")
        call append(line(".")+4, "  </head>")
        call append(line(".")+5, "  <body>")
        call append(line(".")+6, "")
        call append(line(".")+7, "  </body>")
        call append(line(".")+8, "</html>")
    elseif &filetype == 'tex'
        call setline(1, "% LaTex Document")
        call append(line("."), "\\documentclass{article}")
        call append(line(".")+1, "")
        call append(line(".")+2, "\\begin{document}")
        call append(line(".")+3, "")
        call append(line(".")+4, "")
        call append(line(".")+5, "\\end{document}")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: cosim")
        call append(line(".")+2, "    > Mail: cosimzhou@hotmail.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
        "call append(line(".")+5, "".&filetype)
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    elseif &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile G
    execute "normal! Go"
    "autocmd G
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g   yiw:vimgrep /\C\<<C-R>"\>/ *<cr>/\C\<<C-R>"\><cr>N
"map <leader>1   :first<cr>
"map <leader>0   :last<cr>
map <silent> <leader>gw  :copen<cr>
map <leader>gg   yiw:!grep -rn --color \\b<C-R>"\\b ..<cr>

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
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
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

function! IsRem()
    return 'rema'
endfunction

" Remark code block in visual mode
function! RemarkBlock()
    let l:saved_reg = @"
    execute 'normal! vgv0o0y'

    let l:pattern = @"
    let l:comment = 0
    execute 'normal! vgv'
    if &filetype == 'sh' || &filetype == 'python' || &filetype == 'ruby'
        if l:pattern=~#'^\s*#'
            let l:comment = 1
        endif
        if l:comment
            :s/^\(\s*\)#/\1/
        else
            :s/^/#/
        endif
    elseif &filetype == 'tex'
        if l:pattern=~#'^\s*%'
            let l:comment = 1
        endif
        if l:comment
            :s/^\(\s*\)%/\1/
        else
            :s/^/%/
        endif
    elseif &filetype == 'vim'
        if l:pattern=~#'^\s*\"'
            let l:comment = 1
        endif
        if l:comment
            :s/^\(\s*\)"/\1/
        else
            :s/^/"/
        endif
    else
        if l:pattern=~#'^\s*\/\/'
            let l:comment = 1
        endif
        if l:comment
            :s/^\(\s*\)\/\//\1/
        else
            :s/^/\/\//
        endif
    endif

    let @" = l:saved_reg
    "execute "normal! gv"
endfunction
vmap <silent> <leader>/      :call RemarkBlock()<cr>
"vmap <silent> <leader>?      :call RemarkBlock('rem')<cr>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
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

function! Setup_ExecNDisplay()
    execute "w"
    if &filetype == 'tex'
      " make latex pdf
        execute "!xelatex %:p 2>&1 && xelatex %:p 2>&1 && open -a preview %:p:r.pdf 2>&1; ls %:p:r\.*|grep -v '.*\.tex\n.*\.pdf'|xargs rm 2>/dev/null"
    elseif &filetype == 'c'
      " gcc c source
        execute "!gcc %:p -o %:p.out 2>&1 && time %:p.out"
    elseif &filetype == 'cpp'
      " g++ a c++ source
        execute "!g++ %:p -o %:p.out 2>&1 && time %:p.out"
    elseif &filetype == 'html'
      " open in a web browser
        execute "!open %:p"
    elseif &filetype == 'java'
      " java
        execute "!javac %:p 2>&1 && java %:t:r"
    else
        execute "silent !chmod +x %:p"
        let n=expand('%:t')
        execute "!%:p 2>&1"
    " | tee ~/.vim/output_".n
    " I prefer vsplit
    "execute "split ~/.vim/output_".n
    "  execute "vsplit ~/.vim/output_".n
    "  execute "redraw!"
    endif
    set autoread
endfunction

nmap <F5> :call Setup_ExecNDisplay()<CR>
vnoremap <F3> :ClangFormat<CR>

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


syntax on
