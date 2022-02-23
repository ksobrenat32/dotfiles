" Ksobrenatural .vimrc

" --- Vim native
" Set internal encoding of vim
set encoding=utf-8
" Sintax highlighting
syntax on
" Show line number
set number
" Show command
set showcmd
"  Show line where the cursor is
set cursorline
" Identify specific file types
filetype indent on
" Command autocompletation
set wildmenu
" Highlight matching (){}[]
set showmatch
" Searching configuration
set incsearch
set hlsearch
" How to set splitted content
set splitbelow
set splitright
set diffopt=vertical
" Configure indents as 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" --- Plugins (Install https://github.com/junegunn/vim-plug)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


" Set my favourite color scheme
colorscheme gruvbox
set background=dark

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

