set nocompatible              " be iMproved, required
filetype off                  " required
 " set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" This is the Vundle package, which can be found on GitHub.
" " For GitHub repos, you specify plugins using the
" " 'user/repository' format
	Plugin 'gmarik/vundle'
"
	filetype plugin indent on
"  We could also add repositories with a ".git" extension
	Plugin 'scrooloose/nerdtree.git'
	Plugin 'w0rp/ale'
	Plugin 'kien/ctrlp.vim'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'tpope/vim-fugitive'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'jeetsukumaran/vim-buffergator'
	Plugin 'qpkorr/vim-bufkill'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'junegunn/goyo.vim'
	Plugin 'reedes/vim-pencil'
    Plugin 'shougo/deoplete.nvim'
	Plugin 'bling/vim-airline'
	Plugin 'majutsushi/tagbar'
	Plugin 'liuchengxu/space-vim-dark'
    
" set cursorline
set wildmenu
set lazyredraw
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
set expandtab
set shiftwidth=4  "Assists code formatting
set splitright
set t_Co=256
syntax on
colorscheme space-vim-dark
set background=dark
highlight Normal ctermfg=252 ctermbg=none
highlight LineNr ctermfg=152 ctermbg=none
hi! SpellBad ctermfg=196 ctermbg=235
hi! SpellCap ctermfg=110 ctermbg=235
hi! SpellRare ctermfg=218 ctermbg=235
hi! SpellLocal ctermfg=166 ctermbg=235
"setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
highlight NonText ctermbg=none
autocmd BufRead,BufNewFile * syn match parens /[{}]/ | hi parens ctermfg=68
autocmd BufRead,BufNewFile * syn match parenhs /[()]/ | hi parenhs ctermfg=44
set clipboard=unnamed
set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
set foldmethod=manual  "Lets you hide sections of code
"--- The following commands make the navigation keys work like standard editors
imap <silent> <down> <c-o>gj
imap <silent> <up> <c-o>gk
nmap <silent> <down> gj
nmap <silent> <up> gk
"--- Ends navigation commands
"--- The following adds a sweet menu, press F4 to use it.
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<c-z>
map <f4> :emenu <c-z>
map <C-c> :BD <CR>
map <C-c><C-c> :BD! <CR>
"--- End sweet menu


let g:airline#extensions#ale#enabled = 1

let g:tagbar_width = 25

nmap <F8> :TagbarToggle<CR>
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
let g:ctrlp_map = '<C-a>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <C-n> :NERDTreeToggle <CR> 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDTreeWinSize = 25
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
let g:NERDTreeShowHidden = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDTreeSortHiddenFirst = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
let g:NERDTreeAutoDeleteBuffer = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <F4> :Goyo 95%x95%<CR>
map <F5> :setlocal spell! spelllang=en_gb<CR>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let g:deoplete#enable_at_startup = 1
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
:execute "helptags " . g:opamshare . "/merlin/vim/doc"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 0f401487b6e6e6e397fa227393008a3e ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/nages004/.opam/system/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction

" power tab
imap <silent><expr><tab> TabWrap()

" Enter: complete&close popup if visible (so next Enter works); else: break undo
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"

" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()

" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
nnoremap <leader>m :below 14sp term://$SHELL<cr>i

tnoremap <Esc> <C-\><C-n>
