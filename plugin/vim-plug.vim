if empty(glob('$HOME/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('/Users/christopherschroeder/.vim/bundle')
    Plug 'alx741/vim-hindent'
    Plug 'gruvbox-community/gruvbox'
    Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/gv.vim'
    Plug 'lervag/vimtex'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mbbill/undotree'
    Plug 'mhinz/neovim-remote'
    Plug 'mhinz/vim-signify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovimhaskell/haskell-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'wlangstroth/vim-racket'
call plug#end()
