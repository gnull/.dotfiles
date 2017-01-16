" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

colorscheme torte

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

set noautoindent
set nocindent
set nosmartindent
set sw=8

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$\| \+\t\+/

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set keymap=russian-jcukenwin
set spelllang=ru_yo,en
set iminsert=0
set imsearch=0

set colorcolumn=80
set langmap  =ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЁ;ABCDEFGHIJKLMNOPQRSTUVWXYZ~
set langmap +=фисвуапршолдьтщзйкыегмцчняё;abcdefghijklmnopqrstuvwxyz`
set number

set wildmenu
set completeopt=menuone,longest
set wildmode=list:longest,full
set hidden
set lazyredraw

filetype plugin on
filetype plugin indent on

if isdirectory(glob('~/.vimbackup'))
        set backupdir=~/.vimbackup
endif

if filereadable(glob('~/.vimrc.local'))
        source ~/.vimrc.local
endif

" cscope keybindigns
" nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
