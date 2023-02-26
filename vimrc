" --------------------------------------------------
" Basic
" --------------------------------------------------
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set updatetime=50
" Disable error sounds
set noerrorbells
" Line number on cursor and relative number on the other lines
set number relativenumber
" Disable line change while it is too long
set nowrap
" case insensitive
set ignorecase
" Useful during searching case insensitive if not use uppercase
set smartcase
" Disable swapfile
set noswapfile
" Disable backup instead of set undo profile
set nobackup
" Enable cursor highlight
set cursorline
" Enable ruler highlight
set colorcolumn=120
" Enable incremental search
set incsearch
" Better backspace reaction
set backspace=indent,eol,start
" Share clipboard with system
set clipboard=unnamed
" Enable mouse mode
set mouse=a
" Do not render json
let g:vim_json_conceal=0
" Syntax highlight
syntax on
let g:python_highlight_all = 1
" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead, BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
autocmd BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\ $/
" else
set nocompatible
set ruler
set showcmd
set incsearch
set formatoptions+=r
set fileformat=unix
set encoding=utf-8
let mapleader = "<Space>"
filetype plugin on
filetype plugin indent on
" Indentation
filetype indent on
inoremap <silent> <S-Tab> <C-D>
vnoremap <silent> <Tab> >gV
vnoremap <silent> <S-Tab> <gV
nnoremap <silent> <Tab> >>
nnoremap <silent> <S-Tab> <<
" Map Escape key as 'jj'
inoremap jk <Esc>
" Map Escape key as 'F1' disalbe F1 help
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
vnoremap <F1> <Esc>
" Map Redo key as 'U'
nnoremap <S-U> <C-R>
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <S-Up> :vertical resize +5<CR>
nnoremap <silent> <S-Down> :vertical resize -5<CR>
" Handle Input Movement
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
inoremap <C-H> <Left>
" ==================================================
" Vimscript NetrwToggle <leader><leader>
" --------------------------------------------------
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:NetrwIsOpen=0
" --------------------------------------------------
function! NetrwToggle()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
" --------------------------------------------------
noremap <silent> <leader><leader> :call NetrwToggle()<CR>
" ==================================================
" Vimscript CopyModeToggle <F3>
" --------------------------------------------------
" wrap line, disable number, disable IndentLines
let s:copy_mode = "F"
function! CopyModeToggle()
    if (s:copy_mode ==? "T")
        let s:copy_mode = "F"
        set nu
        set rnu
        set nowrap
    else
        let s:copy_mode = "T"
        set nonu
        set nornu
        set wrap
    endif
endfunction
nnoremap <silent> <F3> :call CopyModeToggle()<CR>
" ==================================================
" Vimscript ThemeToggle <F4>
" --------------------------------------------------
set background=light
let s:bg_mode = "light"
function! BgToggle()
    if (s:bg_mode ==? "light")
        set background=dark
        let s:bg_mode = "dark"
    else
        set background=light
        let s:bg_mode = "light"
    endif
endfunction
nnoremap <silent> <F4> :call BgToggle()<CR>
" ==================================================
