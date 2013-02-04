if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ts=4
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif
autocmd FileType c,cpp,java,php,perl,python,ruby,sh autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif
set background=dark
set showcmd
"set noincsearch
"set nocindent
"set noautoindent
"set viminfo='20,\"50
"set tabstop=4
"set shiftwidth=4
"set st "collocate shiftwidth
"set et
"set cindent

map <C-t>l <ESC>:tabnext<CR>
map <C-t>h <ESC>:tabprev<CR>
map <C-t>n <ESC>:tabnew<CR><ESC>:e
map <C-t>c <ESC>:tabclose<CR>
map <C-K> viwy:!ydict <C-R>"<CR>
map <F9> gT
map <F10> gt
map <F11> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
map <C-F> :execute "vimgrep /" . expand("<cword>") . "/j ../../**/*.[ch]" <Bar> cw<CR>
map <F3> :cp <CR>
map <F4> :cn <CR>


