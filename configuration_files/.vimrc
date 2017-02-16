" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"    Aminopterin: One heavy influence is Amir Salihefendic's `.vimrc`,
" retrived from either `github.com/amix/vimrc` or `amix.dk/vim/vimrc.txt`
"    I classfied settings in the manner of a usual GUI toolbar.
"    Legend: `<cr>` for the return key, `<esc>` the escape key,
" <bs> for the backspace, <space> for the spacebar, and
" `<c-*>` for `<ctrl>*` (holding `<ctrl>` while pressing * where * is some key).
"    Though abbreviations exist, I use full name form for ease of reading.
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" First, to define a "leader" to be the space bar, after turning off
" its default behavior (right arrow). The enables lots more combinations.
nnoremap <space> <Nop>
let mapleader=" "

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          File, read and write
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" Do not make Vim compatible with Vi.
set nocompatible

" To save current buffer  with `<space>w` (for "write"),
" not if readonly or filename exists.
nnoremap <leader>w :w<cr>

" To close buffer and quit window with `<space>q` (for "quit"),
" not if buffer not being saved.
nnoremap <leader>q :q<cr>

" To absolutely forbid modifying a file opened as read-only with `:vie[w]`.
" (Default is first to warn, and then allow edit.)
autocmd BufRead * let &l:modifiable = !&readonly

" To check file changes and prompt to reload, every moment Vim's
" window is focussed again. If no change in Vim, buffer is reloaded.
autocmd FocusGained * checktime

" To reload all opened buffers manually with `<space>e` (for "edit").
nnoremap <leader>e :bufdo e <cr>

" To set to auto read when a file is changed from the outside.
set autoread

" To enable filetype detection, filetype-specific settings.
filetype on

" To enable automatic loading of plugins upon recognizing filetype.
filetype plugin on

" To enable indent in the manner suitable for the filetype.
filetype indent on

" To allow unwritten buffers to be hidden (not in view).
set hidden

" To keep a backup file.
set backup

" To specify where to backup files (lest there be lots of hidden backup files).
set backupdir=~/Documents/Vim_swap_files_storeroom

" To tell Vim where to put swap files; I set same place, but one need not.
set dir=~/Documents/Vim_swap_files_storeroom

" To set how many lines of history Vim has to remember.
set history=700

" To open `~/.vimrc` in a new tab by `<space>,`.
" (Preferences window of a Mac app is often opened by `<cmd>,`.)
nnoremap <leader>, :tabe $MYVIMRC<cr>

" To source (apply) `~/.vimrc` by `<space>.`
" (`.` is a Bash alias for source.)
nnoremap <leader>. :source $MYVIMRC<cr>

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Edit, search and replace
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" To define `<shift>y` for "copying to end of line" for consistency (compare `D`).
nmap Y y$

" To put (paste) from the system clipboard with `<space>p` and so on.
nnoremap <leader>p "*p
nnoremap <leader>P "*P

" To yank (copy) from the system clipboard with `<space>y` and so on.
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>yy "*yy

" To delete (cut) from the system clipboard with `<space>d` and so on.
noremap <leader>d "*d
noremap <leader>D "*D
noremap <leader>dd "*dd

" To enable backspace to delete indentation, line breaks, pre-existing characters.
set backspace=eol,start,indent

" To add one whitespace only, when joining the lines with `J`.
set nojoinspaces

" To wait 3[s] for combination key, and afterwards wait 0.1[s]
" for key codes after that (both in ms),
" preventing delay after `O` (opening another line above).
set timeout
set timeoutlen=3000
set ttimeoutlen=100

" Do not automatically supply comment-symbol (e.g. "//" in C++).
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" To allow magic (which is default) so regular expressions are simplified,
" but literal `\`, `~`, `*`, `$`, `.`  each requires escape by prefixing `\`
" My mnemonic: STAMP -- backslash, tilde, asterisk, money, period.
set magic

" To automatically search once a character is typed.
set incsearch

" To highlight search results.
set hlsearch

" But toggle not to highlight with `<space>l` (for "light").
nnoremap <leader>l :setlocal nohlsearch!<cr>

" To temporarily clean highlight of what's being searched with `<space><cr>`.
noremap <leader><cr> :nohlsearch<cr>

" To ignore case when searching as default.
set ignorecase

" When searching, if string contains one upper case and
" one lower case, to let Vim be case sensitive, otherwise not.
set smartcase

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          View, windows, and NETRW
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" To remember the list of all (`^`) opened buffers (`%`) when closing.
set viminfo^=%

" To save session (like current windows) with `<space>m` (for "make").
noremap <leader>m :mksession! ~/.my_vim_session.vim<cr>

" To load saved session with `<space>o` (for "open").
noremap <leader>o :source ~/.my_vim_session.vim<cr>

" Don't update the display while executing macros.
set lazyredraw

" To redraw screen  with `<space>r` (for "refresh"),
" since I have mapped `<ctrl>l` for toggling linebreak.
nnoremap <leader>r <c-l>

" To always show current position.
set ruler

" To always display line numbers.
set number

" To show the present mode.
set showmode

" To move windows simply by `<ctrl>` plus `h`, `j`, `k`, or `l`.
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" To initialize settings in NETRW buffer (directory browser).
let g:netrw_bufsettings='nomodifiable nomodified number nobuflisted wrap readonly'

" In NETRW buffer, to hide the banner on top of files.
let g:netrw_banner = 0

" In NETRW buffer, to specify files to be hidden, comma-separated.
let g:netrw_list_hide=
    \ '^\..*/$,' . '^\..*$,' .
    \ '^.*\.swp$,' . '^.*\.o$,' . '^.*\.pyc$' .
    \ '^.*\.pdf$,' . '^.*\.doc$,' . '^.*\.docx$' .
    \ '^.*\.png$,' . '^.*\.jpg$,' . '^.*\.jpeg$'

" In NETRW buffer, to hide files specified above.
let g:netrw_hide=1

" In NETRW buffer, to toggle hiding files with `<space>h` (for "hide").
noremap <silent> <leader>h :call ToggleDisplayHiddenFiles()<cr>

" To select the previous tab with `<space>9` (think of `(`).
" To select the next tab with `<space>0` (think of `)`).
nnoremap <leader>9 gT
nnoremap <leader>0 gt

" To select the previous buffer with `<space>[`.
" To select the next buffer with `<space>]`.
nnoremap <leader>[ :bprevious<cr>
nnoremap <leader>] :bnext<cr>

" To open a new tab with `<space>n` showing current file (for "new").
" To close the current tab with `<space>c` (for "close").
nnoremap <leader>n :tabedit %<cr>
nnoremap <leader>c :tabclose<cr>

" To open a new buffer with `<space>=` (think of `+`).
" To delete current buffer with `<space>-` (meaning removal).
nnoremap <leader>= :enew<cr>
nnoremap <leader>- :bprevious<cr>:bdelete #<cr>

" To switch, with `<space>b` (for "buffer"), among existing
" buffers by typing its number shown on the screen.
nnoremap <leader>b :ls<cr>:buffer

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Command bar and other tools
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" To press backspace to initiate internal commands.
nnoremap <bs> :

" To press enter to initiate external shell commands.
nnoremap <cr> :!

" To set height of the command bar to be 2 lines.
set cmdheight=2

" To turn on the wild menu of auto command line completion by pressing Tab.
set wildmenu

" To ignore files with some extensions when completing with tab.
:set wildignore=*.swp,*.o,*.pyc,*.pdf,*.doc,*.docx,*.png,*.jpg,*.jpeg

" To always show the status line, with height being 2 lines.
set laststatus=2

" To format the status line. They are resp.:
" `%F` full path to this file, `%m` modified flag,
" `%r` readonly flag, `%h` help buffer flag,
" `%b` buffer number, `%l` current line no.,
" `%L` total line no., `%c` current column no.,
" `%V` virtual column no. as shown on the screen (with `-` sign).
set statusline=\ %F%m%r%h\ B:%n\ L:%l\/%L\ C:%c%V

" To toggle spell checking on and off with`<space>s` (for "spell").
noremap <leader>s :setlocal spell!<cr>

" To set dictionary for completion, called by `<ctrl>x<ctrl>k` in insert mode.
set dictionary=/usr/share/dict/words

" To set source codes syntax completion, called by `<ctrl>x<ctrl>o` in insert mode.
set omnifunc=syntaxcomplete#Complete

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Display of text
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" To enable syntax highlighting.
syntax enable

" To use the terminal's native color for display.
set termguicolors

" To use dark background.
set background=dark

" To choose Romain Lafourcade's "flattened" (`romainl/flattened`) color scheme,
" based on Ethan Schoonover's "solarized" (`altercation/vim-colors-solarized`).
" (See note in README.md in the same directory.)
colorscheme flattened

" To switch among my favorite color schemes with `<space>t` (for "theme").
nnoremap <leader>t :call ChooseNextColor()<cr>

" To make comments shown in terminal, italic; GUI MacVim already does.
highlight Comment cterm=italic

" To set utf8 as standard encoding.
set encoding=utf8

" To force to use Unix-styled end-of-line (EOL)
" (see note in README.md in the same directory).
set fileformat=unix
set fileformats=unix

" To use whitespaces instead of tabbed space.
set expandtab

" To always convert 1 tabbed space to 3 whitespaces.
set shiftwidth=3
set tabstop=3

" To break lines instead of split a word when wrapping.
set linebreak

" But toggle linebreak or not with `<space>l` (for "line").
nnoremap <leader>l :setlocal nolinebreak!<cr>

" To wrap lines in displaying.
set wrap

" Never to automatically wrap text by setting to 0, however long it is.
set textwidth=0

" Not to display last line, if incomplete.
set display=

" But toggle between displaying, as much as possible, the next line
" not able to be fully shown, or not so, with `<space>\`.
" (Think of `\` that indicates line continuation.)
noremap <silent> <leader>\ :call ToggleDisplayLastLine()<cr>

" To mark newline, tabbed space, and unfinished or continued lineas.
set listchars=eol:~,tab:>\ ,extends:+,precedes:-
set list

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Navigation and cursor
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" Since line-wrapping is set, to navigate in terms of display lines
" by `j` and `k`, and of physical lines by `gj` and `gk`, swapping them.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" For these navigation actions, to continue navigation acrossing newline.
set whichwrap+=<,>,h,l

" To scroll a page with no repeated lines, instead of two lines in both
" before and after; leaving cursor in the middle.
nnoremap <c-f> <c-f><c-e><c-e>M
nnoremap <c-b> <c-b><c-y><c-y>M

" To scroll half a page, with cursor in the middle after that.
nnoremap <c-d> <c-d>M
nnoremap <c-u> <c-u>M

" To jump to previous / next fullwidth CJK punctuation mark (in normal mode).
nnoremap <silent> <leader>k ?[、，；。！？：“”‘’「」『』—]<cr>:noh<cr>
nnoremap <silent> <leader>j /[、，；。！？：“”‘’「」『』—]<cr>:noh<cr>

" To return to last edit position upon opening files.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" To turn off the blinking cursor in normal (`n`) mode (relevant in MacVim).
set guicursor=n:blinkon0

" To disallow "mouse" (i.e. trackpad or whatever) to change cursor location.
set mouse=

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Helper functions's implementation
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

function! ToggleDisplayLastLine()
    if (&display=='')
        let &display='truncate'
    else
        let &display=''
    endif
endfunction

function! ToggleDisplayHiddenFiles()
    if (g:netrw_hide==0)
        let g:netrw_hide=1
    else
        let g:netrw_hide=0
    endif
endfunction

" To switch among my favorite color schemes only.
" (Place desired `.vim` in `~/.vim/colors` in order to add a color scheme.)
function! ChooseNextColor()
    if (g:colors_name=='flattened')
        :colorscheme gruvbox
    elseif (g:colors_name=='gruvbox')
        :colorscheme tomorrow-eighties
    elseif (g:colors_name=='tomorrow-eighties')
        :colorscheme tomorrow-bright
    elseif (g:colors_name=='tomorrow-bright')
        :colorscheme molokai
    elseif (g:colors_name=='molokai')
        :colorscheme default
    elseif (g:colors_name=='default')
        :colorscheme flattened
    endif

    highlight Comment cterm=italic
endfunction

" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "
"          Summary of custom leader commands
" " " " " " " " " " " " " " " " " " " " " " " " " " " " " " " "

" Short summary in alphabetical order:
" <space><cr>   To cancel highlight of the last search
" <space>,      To open `.vimrc` in a new tab
" <space>.      To source `.vimrc`
" <space>-      To delete the current buffer
" <space>=      To open a new buffer
" <space>[      To select the previous buffer
" <space>]      To select the next buffer
" <space>0      To select the next tab
" <space>9      To select the previous tab
" <space>b      To choose among existent buffers by number
" <space>c      To close the current tab
" <space>d      To cut from system clipboard (similar for `D`, `dd`)
" <space>e      To reload all opened buffers
" <space>h      To toggle whether to hide files in NETRW
" <space>l      To toggle whether to highlight search
" <space>m      To save the current session
" <space>n      To open a new tab with a new buffer
" <space>o      To load the saved session
" <space>p      To paste from system clipboard (similar for `P`)
" <space>q      To quit the current window
" <space>r      To redraw the screen
" <space>s      To toggle spell checking or not
" <space>t      To choose among themes I favored
" <space>w      To save the current buffer
" <space>y      To copy from system clipboard (similar for `Y`, `yy`)
