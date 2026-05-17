" set termguicolors
" set background=dark
" colorscheme gruvbox

set termguicolors
lua << EOF
require("tokyonight").setup({
  style = "night",
})
vim.cmd("colorscheme tokyonight")
EOF

" set termguicolors
" set background=dark
" lua << EOF
" require("catppuccin").setup({
"   flavour = "mocha",
" })
" vim.cmd.colorscheme("catppuccin")
" EOF

set splitbelow

nnoremap <leader>cd :cd /home/bughunter/prime/python/project <CR>
nnoremap <leader>E :edit /home/bughunter/.config/nvim/init.vim <CR>
nnoremap <leader>- :cd /home/bughunter <CR>

nnoremap <F7> :vertical term <CR>

" Core Performance Tweaks – Make Vim snappy and responsive
set nocompatible              " Disable vi compatibility (modern features on)
set lazyredraw                " Don't redraw while executing macros (faster)
set ttyfast                   " Faster terminal rendering
set updatetime=300            " Quicker cursor hold events (e.g., for diagnostics)
set timeoutlen=500            " Shorter wait for mapped sequences
set ttimeoutlen=50            " Key code timeout
set hidden                    " Allow switching buffers without saving

" Coding Essentials – Ergonomic defaults for devs
syntax enable                 " Syntax highlighting without full 'on' overhead
filetype plugin indent on     " Auto-detect filetypes and indent
set number                    " Line numbers for quick jumps
set relativenumber            " Relative numbers for motion math (e.g., 5j to drop 5 lines)
set cursorline                " Highlight current line for focus
set tabstop=4                 " Tabs as 4 spaces (adjust for your lang)
set shiftwidth=4              " Indent width
set expandtab                 " Tabs to spaces
set autoindent                " Carry over indent
set smartindent               " Smarter indent for code blocks
set ignorecase                " Case-insensitive search...
set smartcase                 " ...unless you capitalize
set incsearch                 " Live search highlighting
set hlsearch                  " Highlight matches (clear with :noh)
set path+=**                  " Search down into subfolders
set wildignore+=*/node_modules/*,*/.git/*,*/tmp/*

" Better line wrapping (especially useful when reading long Python lines)
set wrap
set linebreak               " wrap at words, not mid-word
set breakindent             " indented wrapped lines look better
set showbreak=↪\          " Visual marker on wrapped lines (helps see where break happened)
set display+=lastline     " Show as much as possible of the last line (no @@@ hiding)

" NetRrW - File naviation
let g:netrw_banner = 0      " Hide the bulky top banner
let g:netrw_winsize = 25    " Set side-bar width
let g:netrw_liststyle = 3   " Set files-tray to tree

" Leader Key Remap – Your combo starter (space for easy access)
let mapleader = " "           " Space as leader (e.g., <leader>w for :w)

" Quick Mappings for Speed – Built-in shortcuts on steroids
nnoremap <leader>w :w<CR>     " Save with leader+w
nnoremap <leader>q :q<CR>     " Quit with leader+q
nnoremap <leader>Q :q!<CR>    " Force quit without saving
nnoremap <leader>W :wq<CR>    " Save and quit
nnoremap <leader>e :Lexplore<CR> " Open file explorer (Netrw)
nnoremap <leader>h :noh<CR>   " Clear search highlights

" Buffer Navigation – Hop between open files effortlessly
nnoremap <leader>b :buffers<CR>      " List buffers
nnoremap <leader>n :bnext<CR>        " Next buffer
nnoremap <leader>p :bprevious<CR>    " Previous buffer
nnoremap <leader>d :bdelete<CR>      " Delete current buffer (close file)
nnoremap <C-h> <C-w>h                " Window left (no leader needed!)
nnoremap <C-j> <C-w>j                " Window down
nnoremap <C-k> <C-w>k                " Window up
nnoremap <C-l> <C-w>l                " Window right

" Faster Line Ops
nnoremap Y y$                        " Yank to end of line (like D/C)

" Text Object Power-Ups (use with c/d/y)
nnoremap <leader>iw viw              " Visual inner word (then operate)
nnoremap <leader>ip vip              " Visual inner paragraph

" Surround-Like Quickies (without plugin)
nnoremap <leader>( ciw()<Esc>P " Wrap word in quotes
nnoremap <leader>" ciw""<Esc>P " Wrap word in parens
nnoremap <leader>' ciw''<Esc>P " Wrap word in single quotes
nnoremap <leader>{ ciw{}<Esc>P " Wrap word in Curly braces
nnoremap <leader>[ ciw[]<Esc>P " Wrap word in Normal braces

" Join/Split Lines
nnoremap <leader>J i<CR><Esc>k       " Split line at cursor

" Better Search
nnoremap n nzz                       " Next search: center screen
nnoremap N Nzz                       " Prev search: center
nnoremap * *zz                       " Search word under cursor + center

" Comment Toggle (basic, no plugin – works for // or #)
nnoremap <leader>c :s/^/# /<CR>:noh<CR>     " Comment line (C/C++/JS)
nnoremap <leader>C :s/^# //<CR>:noh<CR>     " Uncomment
vnoremap <leader>c :s/^/" /<CR>:noh<CR>     " Visual comment

" Duplicate Line/Selection
nnoremap <leader>dl :t.<CR>          " Duplicate current line below
vnoremap <leader>dl :t'><CR>         " Duplicate visual selection

" Indent Whole File
nnoremap <leader>= gg=G``            " Re-indent entire file (`` back to start)

" Quick Macro Record/Play (q for record, @ for play)
nnoremap <leader>qm q                " Start macro in register m (then q to stop)
nnoremap <leader>m @@                " Replay last macro (or @m for specific)

" Escape Alternatives (stay on home row)
inoremap jk <Esc>                    " Insert mode: jk → Normal (fast!)
inoremap kj <Esc>

" Save/Quit on Steroids
nnoremap <C-s> :w<CR>                " Ctrl+S save (works in most terminals)
inoremap <C-s> <Esc>:w<CR>a          " Save from Insert too

" No More Arrow Keys – Force Discipline
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Deleting history
nnoremap <leader><Del>h :clearjumps<CR>        " Clear jump history
nnoremap <leader><Del>m :delmarks!<CR>         " Clear all marks
nnoremap <leader><Del>s :let @/=''<CR>         " Clear search highlight
nnoremap <leader><Del>u :call ClearUndo()<CR>  " Clear undo history
nnoremap <leader><Del>q :call histdel(':')<CR> " Clear command-line history

" Quick file open (built-in prompt)
nnoremap <leader>o :edit *
nnoremap <leader>f :find *

" Fast grep/search in files
nnoremap <leader>g :grep *

" Run python command
nnoremap <leader>r :w<CR>:split<CR>:terminal python %<CR>

" Show more context around cursor
set scrolloff=8             " keep 8 lines above/below cursor when scrolling
set sidescrolloff=8         " same for horizontal

" Better command-line completion
set wildmenu
set wildmode=longest:full,full

" Also useful in command-line mode (e.g. after :)
cnoremap jk <C-c>
cnoremap kj <C-c>

" Quick find & replace word under cursor (change next occurrence)
nnoremap <leader>. *``cgn
nnoremap <leader>, #``cgN

" Move current line up / down (repeatable with .)
nnoremap <leader>k :move .-2<CR>==
nnoremap <leader>j :move .+1<CR>==

" Visual mode version – move selected block
vnoremap <leader>k :move '<-2<CR>gv=gv
vnoremap <leader>j :move '>+1<CR>gv=gv

