filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype on
filetype plugin indent on
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline

" Allows folding on tabbed area
set foldmethod=indent
set foldlevel=99

" Interacting with Git
" Gblame, Gwrite, Gread, Gcommit
set statusline=%{fugitive#statusline()}

" Used for nose testing
map <leader>dt :set makeprg=pyton\ manage.py\ test\|:call MakeGreen()<CR>

" Open TODO list
map <leader>td <Plug>TaskList

" Navigate windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open revision history
map <leader>g :GundoToggle<CR>

" Remove Pyflakes quick fix
let g:pyflakes_use_quickfix = 0

" Map jumping from pep8 violations
let g:pep8_map='<leader>8'

" Set tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Map to filetree
map <leader>n :NERDTreeToggle<CR>

" Map to definitions and renames
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Map to fuzzy text searching
nmap <leader>a <Esc>:Ack!

" py.test mappings
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Django tweak for code completion in django modules
" DJANGO_SETTINGS_MODULE=project.settings gvim .

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

