let mapleader = ','
let maplocalleader = '\\'

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'skywind3000/asyncrun.vim'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

Plug 'airblade/vim-gitgutter'
set updatetime=100

Plug 'vim-ruby/vim-ruby'
autocmd FileType ruby compiler ruby

Plug 'Yggdroot/LeaderF', { 'do': '.\install.sh' }
" let g:Lf_ShortcutF = '<C-F>'
" let g:Lf_ShortcutB = '<C-B>'
let g:Lf_UseCache = 0
let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
noremap <leader>m :LeaderfFunction<CR>
noremap <F4> :LeaderfMru<CR>
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <leader>rg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spell=0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1

Plug 'ludovicchabant/vim-gutentags'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=0
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let g:cpp_concepts_highlight=1
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

Plug 'dense-analysis/ale'
let g:ale_linters = { 'cpp': ['gcc'] }
let g:ale_c_build_dir_names = ['build', 'vsbuild']
let g:ale_c_parse_compile_commands = 1
" set omnifunc=ale#completion#OmniFunc

" Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

call plug#end()

packadd! matchit

" Force to use python3
if has('python3')
endif

set spell spelllang=en_us
set nospell

augroup coding
	autocmd FileType c,cpp noremap <buffer> <leader>cf :py3f /usr/share/clang/clang-format.py<cr>
	autocmd FileType c,cpp inoremap <buffer> <leader>cf <c-o>:py3f /usr/share/clang/clang-format.py<cr>
augroup END

set guifont=Monaco:h10
set background=dark
set number
set relativenumber
set incsearch
set hlsearch
set shiftwidth=4
set tabstop=4
set smartindent
set cursorline
set foldmethod=syntax
set nofoldenable
" Using the system clipboard as the default register
set clipboard=unnamed
set backspace=indent,eol,start
colorscheme OceanicNext
syntax enable

noremap <F3> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap + ddkP
nnoremap - ddp
inoremap <leader>u <esc>viwUi
nnoremap <leader>u viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
vnoremap <leader>" <esc>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>a)<esc>`<i(<esc>
" nnoremap H ^
" nnoremap L $

iabbrev @@ paul_shu@keysight.com
iabbrev ccopy //<cr>// Copyright 2017 Keysight Technologies<cr>//<cr>
iabbrev ssig -- <cr>Paul Shu<cr>paul_shu@keysight
augroup special_code_indent
    autocmd!
    autocmd FileType ruby,javascript :setlocal shiftwidth=2 tabstop=2
augroup END

" Folding setting for XML file type
augroup xmlfolding
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup end
