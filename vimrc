"MacVim configuration settings
"20150228 Ken
" cp ~/.vimrc ~/.vim/vimrc 
" for github

"-----------------
"Gerneral setting
"-----------------

"execute pathogen#infect() "不用pathogen

"不需要使用 vi 兼容模式
set nocompatible

filetype off 
"---------------------------------------------------------
"                Vundle Setting
"---------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

"Nerdtree Plugin
Plugin 'scrooloose/nerdtree'
"Tagbar Plugin
Plugin 'majutsushi/tagbar'
"Vim-snippets
Plugin 'honza/vim-snippets'
"Unite.vim
Plugin 'Shougo/unite.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
"FuzzyFinder
Plugin 'FuzzyFinder'
"Align
Plugin 'Align'
"grep.vim
Plugin 'grep.vim'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
" -----------------------------------------------------------------
"                   Vundle setting end
" -----------------------------------------------------------------

"開啟文件類型檢測/開啟外掛/開啟不同檔案類型獨立設定
filetype plugin indent on
"開啟程式語法標示
syntax on

"用F2開關NERDTree
nnoremap <silent> <F2> :NERDTree<CR>
"用F3開關tagbar
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30

"顯示行號
set number
"設置默認打開窗口大小
set lines=40 columns=170
"設置背景色
set bg=dark
"使用配色設定
colorscheme wombat256
"總是在窗口右下角顯示光標的位置
set ruler
"分頁快捷鍵
nnoremap  <C-n> :tabnew<CR>
nnoremap  <C-h> :tabprevious<CR>
nnoremap  <C-l> :tabnext<CR>

"--------------------------------------------------
"                  編輯設定
"--------------------------------------------------

"設置字體
set gfn=Source_code_Pro:h14
"設定TAB格數
set tabstop=4
"設置自動換行
set wrap

"--------------------------------------------------
"                 搜尋設定
"--------------------------------------------------
"
"--------------------------------------------------
"                 Unite.vim setting
"--------------------------------------------------
let g:unite_enable_split_vertically = 1

let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 5

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

"" File search

nnoremap <silent><C-p> :Unite -no-split -start-insert file_rec buffer<CR>

"" shortcup
nnoremap <silent><leader>u  :<C-u>Unite -start-insert mapping<CR>

"" Execute help.
nnoremap <silent><leader>h  :Unite -start-insert -no-split help<CR>

"" Tag search

""" For searching the word in the cursor in tag file
nnoremap <silent><leader>f :Unite -no-split tag:<C-R><C-w><CR>

nnoremap <silent><leader>ff :Unite tag -start-insert -no-split<CR>

"" grep dictionay

""" For searching the word in the cursor in the current directory
"nnoremap <silent><leader>s :Unite -no-split grep:.::<C-R><C-w><CR>
nnoremap <silent><leader>s :Unite -horizontal grep:.::<C-R><C-w><CR>

""" For searching the word handin
"nnoremap <silent><leader>ss :Unite -no-split grep:.<CR>
nnoremap <silent><leader>ss :Unite -horizontal grep:.<CR>

""" For searching the word in the cursor in the current buffer
noremap <silent><leader>sf :Unite -no-split grep:%::<C-r><C-w><CR>

""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>sa :Unite -no-split grep:$buffers::<C-r><C-w><CR>

" :UniteResume Press <leader>ur to re-open last Unite buffer
 nnoremap <silent><leader>ur :<C-u>UniteResume<CR>

" :UniteNext Press <leader>un to re-open last Unite buffer
 nnoremap <silent><leader>un :<C-u>UniteNext<CR>
 
" :UnitePrevious Press <leader>up to re-open last Unite buffer
 nnoremap <silent><leader>up :<C-u>UnitePrevious<CR> 

" :UniteFirst Press <leader>uf to re-open last Unite buffer
 nnoremap <silent><leader>uf :<C-u>:UniteFirst<CR>
 
" :UniteLast Press <leader>ul to re-open last Unite buffer
 nnoremap <silent><leader>ul :<C-u>UniteLast<CR>

" :UniteClose Press <leader>uc to re-open last Unite buffer
 nnoremap <silent><leader>uc :<C-u>UniteClose<CR>

 

let g:unite_source_grep_default_opts = "-iRHn"
\ . " --exclude='tags'"
\ . " --exclude='cscope*'"
\ . " --exclude='*.svn*'"
\ . " --exclude='*.log*'"
\ . " --exclude='*tmp*'"
\ . " --exclude-dir='**/tmp'"
\ . " --exclude-dir='CVS'"
\ . " --exclude-dir='.svn'"
\ . " --exclude-dir='.git'"
\ . " --exclude-dir='node_modules'"

"" outline
nnoremap <leader>o :Unite -start-insert -no-split outline<CR>

"" Line search
nnoremap <leader>l :Unite line -start-insert -no-split<CR>

"" Yank history
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" search plugin
" :Unite neobundle/search
"--------------------------------------------------
"                 Unite.vim setting End
"--------------------------------------------------

