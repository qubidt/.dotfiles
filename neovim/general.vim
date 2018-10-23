" ==============================================================================
"                                     essential
" ==============================================================================
" Don't require vi compatibility (should be default in Vim8 and neovim)
set nocompatible

" Filetype stuff
set encoding=utf-8
filetype plugin indent on

syntax on           " Syntax highlighting
set hidden          " Don't require unwritten buffers to be visible
set lazyredraw      " Don't update display while executing macros

" Writing to samba shares fail on neovim on mac
" (https://github.com/neovim/neovim/issues/6725)
set nofsync

" ==============================================================================
"                                     options
" ==============================================================================
" ==========
" completion
" ==========
" Enable enhanced command-line completion. Presumes you have compiled with
" +wildmenu. See :help 'wildmenu'
set wildmenu
set wildmode=longest:list,full

" ======
" search
" ======
set showmatch       " jump to matching brace
set hlsearch        " highlight search matches
set incsearch       " jump to search result while typing
" case insensitive search (unless search terms contain uppercase characters)
set ignorecase
set smartcase

" ==========
" formatting
" ==========
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start

autocmd Filetype python setlocal
      \ noexpandtab
      \ copyindent
      \ preserveindent
      \ softtabstop=0
      \ shiftwidth=4
      \ tabstop=4

" folding
" -------
set foldmethod=indent   " fold based on indent
" set foldmethod=syntax
set foldnestmax=4       " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1

" =========
" interface
" =========
set showcmd         " Show (partial) command in status line
set mouse=a
set relativenumber
set number
set ruler

" Unprintable chars mapping
" -------------------------
if has('win32')
  " Windows doesn't like unicode characters... use ascii instead
  " These are the same listchars provided by TPope's Vim-Sensible
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  " Windows' gvim doesn't open as unicde, so this will fail:
  " set showbreak=»
  " Instead, use this:
  let &showbreak="\u00bb\ "
else
  " alternative characters: ‣ · ↲ ⏎ ⟨⟩ «» ¬ ¶ ␣ …
  set listchars=tab:→\ ,trail:•,precedes:⟨,extends:⟩
  set showbreak=↪\
endif
set list

" colors
" ------
set termguicolors         " use truecolor
set background=dark
" let base16colorspace=256  " For base16-shell: Access colors present in 256 colorspace
colorscheme base16-circus
" colorscheme onedark
" colorscheme gruvbox
" colorscheme kalisi
" colorscheme zenburn
" colorscheme solarized
" colorscheme molokai
" let g:molokai_original = 0
" colorscheme bubblegum-256-dark
" colorscheme hybrid
" let g:hybrid_use_Xresources = 1
" colorscheme seoul256
" let g:seoul256_background = 236
" if !has("gui_running") && !has("nvim")
"     set t_Co=256
" endif

" gvim
" ----
if has("gui_running") || (has('nvim-0.2.3'))
  set guifont=DejaVu\ Sans\ Mono\ 8
endif
" set guioptions-=m  " remove menu bar
" set guioptions-=T  " remove toolbar
" set guioptions-=r  " remove right-hand scroll bar
" set guioptions-=L  " remove left-hand scroll bar
set guioptions=ac   " autoselection and console only (no GUI prompt)
set splitbelow
set splitright

" tab and statusline
" ------------------
set laststatus=2
" set showtabline=2
set guioptions-=e
set noshowmode

" long-line
" ---------
set autoindent
set textwidth=79
set formatoptions=c,q,r
