
"For details explanation, use the link below:"
"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/"
set encoding=utf-8                          " UTF8 support"

set clipboard=unnamed			    " Want paste to/from other app"

set backspace=indent,eol,start              " Make backspace like every other editor"

let mapleader = ','                         " The default leader is \, but a comma is better"

"==================Vundle======================="
set nocompatible             		    " be iMproved, required"

so ~/.vim/plugins.vim

"==================Folding======================"
"Enable folding"
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar"
nmap <space> za

"==================Visuals======================"
"
let python_highlight_all=1
syntax enable 
colorscheme atom-dark-256

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"==================Indent======================="
"自动缩进                                                                                                
set autoindent                                                                                           
"类似C语言风格的缩进                                                                                     
set cindent                                                                                              
"智能缩进:每一行都和前一行有相同的缩进量,                                                                
"同时这种缩进形式能正确的识别出花括号,当遇到右花括号（}）,                                               
"则取消缩进形式。此外还增加了识别C语言关键字的功能。                                                     
"如果一行是以#开头的(比如宏)，那么这种格式将会被特殊对待而不采用缩进格式                                 
set smartindent                                                                                          
"For Python Programmers                                                                                  
"autocmd FileType python set textwidth=99 " PEP-8 Friendly                                               
                                                                                                         
"把输入的tab自动转换成空格，Python用户必用~                                                              
set expandtab                                                                                            
"一个tab键占据4个空格                                                                                    
set tabstop=4                                                                                            
"一开始,插入的就是4个空格,此时一旦你再按下一次tab,这次的四个空格就会和上次的四个空格组合起来变成一个制表>符                                                                                                       
set softtabstop=4                                                                                        
"每一级自动缩进的空格数                                                                                  
set shiftwidth=4                                                                                         
"根据文件类型设定缩进,覆盖掉默认的~                                                                      
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=99 

"==================Split Management============="
set splitbelow
set splitright

"=====================Search===================="
set hlsearch
set incsearch

"=====================Mappings=================="

"Make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr> 
nmap <Leader><space> :nohlsearch<cr>

"Make it easy to switch between windows"
nmap<C-J> <C-W><C-J>
nmap<C-K> <C-W><C-K>
nmap<C-H> <C-W><C-H>
nmap<C-L> <C-W><C-L>

"Make NERDTree easier to toggle"
nmap <leader>t :NERDTreeToggle<cr>

"Set F12 to preview LaTex file"
nmap <F12> :LLPStartPreview<cr>

"Set map to :tag
nmap <leader>f :tag<space>

"Set map to comments in python                                                                           
vnoremap <silent> # :s/^/#/<cr>:noh<cr>                                                                  
vnoremap <silent> -# :s/^#//<cr>:noh<cr>                                                                 
                                                                                                         
"Set map to python nosetests                                                                                                                                                      
nmap <leader>n :nosetests<cr>  

"Set map to paste current date in jekyll posts
nnoremap <leader>dt "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>P
inoremap <leader>dt <C-R>=strftime('%Y-%m-%d %H:%M:%S %z')<CR>
"===================abbreviate=================="
"shortcut for main in python
abbreviate ifm if __name__ == "__main__":

"===================Auto-Commands==============="

"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"===================LaTex Preview==============="
" Set frequency for LaTex auto update"
autocmd FileType tex setl updatetime=1

"===================Plugin setting=============="
" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" NERDTree
let NERDTreeHijackNetrw = 0

" Set powerline
set laststatus=2
let g:Powline_symbold='fancy'

""""""""""""""""""""""
"Quickly Run Python2
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

""""""""""""""""""""""
"Quickly Run Python3
""""""""""""""""""""""
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"===================Notes and Tips=============="
"<F5> is run python2
"<F6> is run python3
"<F7> is run flake8 check
"<F12> is run latex preview
