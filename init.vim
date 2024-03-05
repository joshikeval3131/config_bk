syntax on 
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:set rtp+=~/.config/nvim/bundle/Vundle.vim
:set tags+=~/mcusdk/mcu_plus_sdk/tags
:set tags+=~/mcusdk/mcu_plus_sdk/usb/tinyusb/tinyusb-stack
:set tags+=~/ti/tifs/tags
:set tags+=~/ti/mbedtls
:set tags+=~/ti/lwip
:set colorcolumn=120

" set buffer hidden true " 
:set hidden 
" let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_diff_background = 1

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/cjuniet/clang-format.vim' " :ClangFormat
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf' 
" code autocompeletion 
Plug 'caenrique/nvim-toggle-terminal'
Plug 'arcticicestudio/nord-vim', { 'tag': 'v0.11.0' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'craigemery/vim-autotag' "This plugin is for tags code navigation 
" " syntax highlighting 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'David-Kunz/markid'

" This is lazygit plugin in nvim 
Plug 'kdheepak/lazygit.nvim'

" Dracula theme for nvim 
Plug 'Mofiqul/dracula.nvim'

" for markdown file preview 
Plug 'ellisonleao/glow.nvim'

set encoding=UTF-8

call plug#end()

call vundle#begin()


" ----- Vim as a programmer's text editor -----------------------------
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-fugitive'
" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'instant-markdown/vim-instant-markdown'

" markdown and notes taking related plugins 
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim'

"set default color scheme to gruvbox 
colorscheme gruvbox

" FZF file finder 
let $FZF_DEFAULT_COMMAND = 'ag --ignore .repo --ignore .git --hidden -l -g  ""'
let g:easytags_async=1
let g:easytags_auto_highlight=0

map <C-P> :FZF<CR> 
map <C-b> :Buffers<CR> 

call vundle#end()
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-.> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap <silent> <leader>t :ToggleTerminal<Enter>

nmap ,N :e ~/notes/<CR>

nmap ,n :NERDTreeFind<CR>

nmap <F8> :TagbarToggle<CR>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

nmap ,n :NERDTreeFind<CR>

nmap <F8> :TagbarToggle<CR>

nmap <leader>[ :bp<CR>

nmap <leader>] :bn<CR> 

" shortcut to open lazygit 
nmap <leader>g :LazyGit<CR> 
nmap <leader>gf :LazyGitFilter<CR> 

nmap <leader>d :bd<CR>
nmap <leader>= :buffers<CR>

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:clang_library_path = '/usr/lib/x86_64-linux-gnu/libclang-10.so.1'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE


let NERDTreeShowHidden=1

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

lua require('plugins')
lua <<EOF
local cmp = require('cmp')
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = {
    {name = 'buffer'},
    {name = 'path'},
  }
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer'}
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'path'},
    {name = 'cmdline'}
  }
})
EOF
