"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'tomasr/molokai'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplete.vim' 
NeoBundle 'rking/ag.vim'
call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" color
"-------------------------
syntax on
colorscheme molokai
set t_Co=256

"-------------------------
" short cut
"-------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-l> gt :NERDTreeToggle<CR>
nnoremap <C-h> gT :NERDTreeToggle<CR>


"-------------------------
" paste mode
"-------------------------


if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

"=====================
"auto comment off
"=====================

augroup auto_comment_off

   autocmd!

    autocmd BufEnter * setlocal formatoptions-=r

    autocmd BufEnter * setlocal formatoptions-=o

augroup END

"======================
"クウォート補完
"======================
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"
" vim起動と同時にnerdtree起動
"
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif


"
"インデント
"
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

"
"インデントショートカット
"
map <Space>= gg=<S-g><C-o><C-o>zz


"-------------------------
" End Neobundle Settings.
"------------------------

