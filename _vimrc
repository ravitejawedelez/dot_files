call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType python set ft=python.django  " For SnipMate
autocmd FileType htmll set ft=htmldjango.html " For SnipMate
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:session_autoload = 'no'
set nu
set expandtab
set cindent
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set modeline
set ls=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set completeopt=menuone,longest,preview
set undofile
set undodir=~/.vim/undodir
set nofoldenable
map <C-up> :tabr<cr>
map <C-down> :tabl<cr>
map <C-h> :tabp<cr>
map <C-l> :tabn<cr>
map <space> /*())(<cr>
cmap tn tabnew
cmap vs vsplit
cmap bu buffer
cmap ntt NERDTreeToggle
cmap ntf NERDTreeFind
nnoremap <f4> :buffers<CR>:buffer<Space>
nnoremap <F8> :TagbarToggle<CR>
nmap <C-x> :w<CR>
nmap \o :set paste!<CR>
" move down/up row-wise instead of line-wise
nmap j gj
nmap k gk
nmap <f5> :!jslint --var --eqeq --white --forin --color %<cr>
nmap <C-v> :w<CR>:make %<CR>:cw<CR>
nmap <cr> G

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap (( (
inoremap () ()

inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[ [
inoremap [] []
set statusline=\ "
set statusline+=%1*%-25.80f%*\ " file name minimum 25, maxiumum 80 (right justified)
set statusline+=%2*
set statusline+=%h "help file flag
set statusline+=%r "read only flag
set statusline+=%m "modified flag
set statusline+=%w "preview flag
set statusline+=%*\ "
set statusline+=%3*[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]%*\ "
set statusline+=%4*%{fugitive#statusline()}%*\ " Fugitive
set statusline+=%6*%{SyntasticStatuslineFlag()}%* " Syntastic Syntax Checking
set statusline+=%= " right align
set statusline+=%8*%-14.(%l,%c%V%)\ %<%P%* " offset

nnoremap <C-p> :Unite file_rec/async<cr>

" python support
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

let g:pyflakes_use_quickfix = 0

let pymode_rope_vim_completion=1
let pymode_rope_extended_complete=1
let pymode_lint=1
cmap ln PyLintToggle

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,    " MacOSX/Linux
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\ve$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
\ 'file': '\.exe$\|\.so$\|\.dat$|\.swp$'
\ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*ve/*,*.git/*,*.so     " Linux/MacOSX

nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
