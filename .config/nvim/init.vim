""
"" vim-plug
""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/nvim-completion-manager'
Plug 'phpactor/phpactor', {'do': ':call phpactor#Update()'}
Plug 'roxma/ncm-phpactor'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

Plug 'w0rp/ale'

Plug 'machakann/vim-swap'

Plug 'julesferreira/vim-split-join'

Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-obsession'


Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'

Plug 'ternjs/tern_for_vim'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


Plug 'beloglazov/vim-online-thesaurus', { 'on': ['OnlineThesaurusCurrentWord', 'Thesaurus'] }

" math in vim (conflicts with 'kana/vim-textobj-entire')
" Plug 'arecarn/vim-crunch'
" Plug 'arecarn/vim-selection'

Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'

" Plug 'Konfekt/FastFold'
" Plug 'vim-kana/vim-textobj-entirescripts/LargeFile'


call plug#end()


let mapleader = ' '
let maplocalleader = ' '

let g:crunch_result_type_append = 0

" let g:used_javascript_libs = 'underscore,react,jquery,jasmine'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1

let g:online_thesaurus_map_keys = 0
nn <leader>K :OnlineThesaurusCurrentWord<cr>

let g:ale_linters = {'php': ['phpcs'], 'jsx': ['eslint']}
let g:ale_fixers = {'php': ['phpcbf']}

let g:ale_php_phpcs_executable = '~/bamboo/vendor/bin/phpcs'
let g:ale_php_phpcs_standard = '~/bamboo/vendor/bamboohr/phpcs/BambooHR'
let g:ale_php_phpcbf_executable = '~/bamboo/vendor/bin/phpcbf'
let g:ale_php_phpcbf_standard = '~/bamboo/vendor/bamboohr/phpcs/BambooHR'

let g:ale_javascript_eslint_executable = '~/bamboo/ui-src/node_modules/.bin/eslint'

let g:ale_lint_delay = 1000
let g:ale_enabled = 0
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
nn <leader>cs :ALEToggle<cr>
nn <leader>bf :ALEFix<cr>


""
"" test
""
let test#strategy = 'vimux'
" let test#strategy = 'dispatch'
" let test#strategy = 'dispatch_background'
let test#php#phpunit#executable = '/Users/julesferreira/bamboo/vendor/bin/phpunit'
let test#project_root = '/Users/julesferreira/bamboo/tests/'
let test#filename_modifier = ':~'
" let test#php#phpunit#options = '--configuration /Users/julesferreira/bamboo/tests/phpunit.xml'
nn <silent> <leader>tn :TestNearest<cr>
nn <silent> <leader>tf :TestFile<cr>
nn <silent> <leader>tl :TestLast<cr>
nn <silent> <leader>tv :TestVisit<cr>
" let g:dispatch_compilers = {}
" let g:dispatch_compilers['phpunit'] = '/Users/julesferreira/bamboo/vendor/bin/phpunit'
" let g:phpunit_args = "--configuration /Users/julesferreira/bamboo/tests/phpunit.xml --include-path /Users/julesferreira/bamboo/tests/"¬

""
"" vimrc
""
nnoremap <leader>vo :tabe $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

""
"" quick open
""
nn <leader>todo :tabe ~/todo/neo<cr>
nn <leader>alias :tabe ~/.bash_aliases<cr>
nn <leader>tmux :tabe ~/.tmux.conf<cr>

""
"" movement
""
inoremap jk <esc>
cnoremap jk <c-c>
inoremap <esc> <nop>
" no <tab> %
" no % <nop>
nn j gj
nn k gk

""
"" tabbing
""
set ts=3
set sw=3

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

""
"" tags
""
no ; :
set tags+=.tags

""
"" splits
""
set splitbelow
set splitright
nnoremap <C-W>\ :vsplit<CR>
nnoremap <C-W>- :split<CR>

""
"" misc (name/split?)
""
no ; :
nn : <nop>
set list
set listchars=tab:▸\ ,eol:¬| " show hidden chars
set nofixeol

""
"" folding
""
" let g:php_folding = 1
" COULD TOGGLE SYN OFF/ON INSTEAD OF LARGEFILE PLUGIN


" let g:LargeFile=1
" syn sync maxlines=20
" syn sync minlines=5

" autocmd BufEnter * :syn sync maxlines=20
" autocmd BufEnter * :syn sync minlines=5
" set fdm=syntax
" let g:php_folding=1
" let g:php_sync_method=1

" git grep word under cursor
" nn <leader>gg "zyiw:exe "Ggrep '\\b".@z."\\b'"<cr>
" :cope<cr>
function! s:GitGrepWord()
	let l:winnr = winnr()

	exe 'normal! "zyiw\<cr>'
	exe "Ggrep '\\b".@z."\\b'"
	exe "normal! \<c-o>"
	cope
	redraw!

	if l:winnr !=# winnr()
		wincmd p
	endif
endfunction
nn <leader>gg :call <sid>GitGrepWord()<cr>

" system output to quickfix
command! -nargs=1 Qfsys set errorformat=%f | cexpr system('<args>') | copen

" join newline-delimited internals of ()
" ignore errors is `F(f(` finds nothing
nn <leader>gj :silent! exe "normal F(f("<cr>vi(:s/\t//g<cr>vi(:s/\n/ /g<cr>i<bs><esc>%i<bs><bs><esc>:nohl<cr>

" split comma-delimited internals of ()
nn <leader>gs va(:s/\%V(/(\r/g<cr>va(:s/\%V)/\r)/g<cr>vi(:s/, /,\r/g<cr>=a):nohl<cr>

""
"" hmmmmmm, what think?
""
set scrolloff=3| " try to keep three lines above/below cursor
set ruler| " basic ruler; customize? or something like airline?
set undofile| " persist undo tree
set noshowmode
set lazyredraw
set shortmess+=c
set cmdheight=1
" set cmdheight=2 need extra height for type info?
set ignorecase smartcase
set clipboard=unnamed,unnamedplus

""
"" nerdtree
""
nn <leader>nn :NERDTreeToggle<cr>
nn <leader>nf :NERDTreeFind<cr>

""
"" colors
""
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
colorscheme gruvbox

" ============================================================================
" phpactor {{{
" ============================================================================

""
"" navigate (goto)
""
aug phpactor
	au!
	au FileType php nn <buffer> <leader>gd :call phpactor#GotoDefinition()<cr>
	au FileType php nn <buffer> <leader>gr :call phpactor#FindReferences()<cr>
	au FileType php nn <buffer> <leader>gm :call phpactor#ContextMenu()<cr>
	" follow same name down stack?
	au FileType php nn <buffer> <leader>gn j$h%h:call phpactor#GotoDefinition()<cr>
	au FileType php nn <buffer> <leader>gt :call phpactor#Navigate()<cr>

	""
	"" transform (add)
	""
	au FileType php nn <buffer> <leader>au :call phpactor#UseAdd()<cr>
aug END

" }}}

" ============================================================================
" tern {{{
" ============================================================================

let g:tern#command = ['node', '/Users/julesferreira/bin/ternjs', '--no-port-file']
" let g:tern#command = ['node', '/Users/julesferreira/bamboo/ui-src/node_modules/.bin/tern', '--no-port-file']

aug tern
	au!
	au FileType javascript nn <buffer> <leader>gd :TernDef<cr>
	au FileType javascript nn <buffer> <leader>gn j$h%h:TernDef<cr>
	au FileType javascript nn <buffer> <leader>gr :TernRefs<cr>
aug END

" }}}

" ============================================================================
" motion {{{
" ============================================================================

" map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" disabled for faster fF easymotion
" noremap <silent><expr> f/  incsearch#go(<SID>config_easyfuzzymotion())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" }}}

" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
"  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fl :Lines<CR>
nnoremap <silent> <Leader>fm :Marks<CR>
nnoremap <silent> <Leader>fs :History/<CR>
nnoremap <silent> <Leader>fh :History<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" imap <leader><tab> <plug>(fzf-maps-i) " creates delay after <space> :/


function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink': function('s:plug_help_sink')}))

" }}}

" ============================================================================
" UltiSnips {{{
" ============================================================================

" let g:UltiSnipsSnippetsDir = '~/.local/share/nvim/snippets'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" inoremap <c-x><c-k> <c-x><c-k>
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" " optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" }}}


" text blocks for args
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

let g:splitJoin_do_mapping = 0
noremap <LocalLeader>j( :<c-u>call splitJoinCommon#joinParameters()<return>
noremap <LocalLeader>j) :<c-u>call splitJoinCommon#joinParameters()<return>
noremap <LocalLeader>j[ :<c-u>call splitJoinJs#joinArray()<return>
noremap <LocalLeader>j[ :<c-u>call splitJoinPhp#joinArray()<return>
noremap <LocalLeader>j] :<c-u>call splitJoinJs#joinArray()<return>
noremap <LocalLeader>j] :<c-u>call splitJoinPhp#joinArray()<return>
noremap <LocalLeader>j{ :<c-u>call splitJoinJs#joinObject()<return>
noremap <LocalLeader>j} :<c-u>call splitJoinJs#joinObject()<return>
noremap <LocalLeader>s( :<c-u>call splitJoinCommon#splitParameters()<return>
noremap <LocalLeader>s) :<c-u>call splitJoinCommon#splitParameters()<return>
noremap <LocalLeader>s[ :<c-u>call splitJoinJs#splitArray()<return>
noremap <LocalLeader>s[ :<c-u>call splitJoinPhp#splitArray()<return>
noremap <LocalLeader>s] :<c-u>call splitJoinJs#splitArray()<return>
noremap <LocalLeader>s] :<c-u>call splitJoinPhp#splitArray()<return>
noremap <LocalLeader>s{ :<c-u>call splitJoinJs#splitObject()<return>
noremap <LocalLeader>s} :<c-u>call splitJoinJs#splitObject()<return>

" class member to assignment (`private $steps;` to `$this->steps = $steps;`)
nn <leader>ma wdwlywhpa = $<esc>0wathis-><esc>j0

let g:pdv_template_dir = '/Users/julesferreira/.local/share/nvim/plugged/pdv/templates_snip'
nn <leader>doc :call pdv#DocumentWithSnip()<CR>
nn <leader>var 0O/**<cr><esc>i<bs><space><esc>la<space>@var<esc>o/<esc>k$a<space>

" spell check toggle ,s
nn <silent> <leader>sp :set spell!<cr>

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
nn U :UndotreeToggle<cr>


function! s:ToggleQf()
	for buffer in tabpagebuflist()
		if bufname(buffer) == ''
			" then it should be the quickfix window
			cclose
			return
		endif
	endfor

	copen
endfunction
nn <leader>co :call <sid>ToggleQf()<cr>

function! s:AddMember()
	" normal! 0wwy2wbgg]]oprivate <esc>pa;<esc>/construct<cr><esc>$%$%O$this-><esc>pla = <esc>pa;<esc>0wwwwhxj%kw
	" call phpactor#UseAdd()
	" normal! 
	" normal 0wwy2wb augg]]oprivate jkpa;jk/construct$%$%O$this->jkpla = jkpa;jk0wwwwhxj%kw
	" normal! 0wwy2wbgg/classoprivate pa;/construct$%$%O$this->pla = pa;0wwwwhxj%kw
	silent! normal! 0wwy2wbgg/classoprivate pa;/construct$%$%O$this->pla = pa;0wwwwhxj%kw
	silent! normal! y$j0w%	kko@param pa -b**0w
	call phpactor#UseAdd()
endfunction
nn <leader>am :call <sid>AddMember()<cr>

" split resizing¬
nn <Up> <C-w>+
nn <Down> <C-w>-
nn <Right> <C-w>>
nn <Left> <C-w><



function! s:add_doc_block(type, name, desc)
	call search('__construct')
	call append(line('.') - 2, '	 * @param ' . a:type . ' $' . a:name . ' ' . a:desc)
	" execute "normal! kO@param " . a:type . ' $' . a:name . ' ' . a:desc
	" execute "normal! =="
endfunction

function! s:process_line()
	mark a
	let l:line = split(getline('.'))
	let l:type = remove(l:line, 0)
	let l:name = remove(l:line, 0)
	let l:desc = join(l:line)
	if !search('__construct')
		call s:create_empty_constructor()
	endif
	execute 'normal! $%k'
	call append('.', '		' . l:type . ' $' . l:name . ',')
	call s:add_doc_block(l:type, l:name, l:desc)
	'a
	execute line('.') 'delete _'

	" breakadd here
	" PP l:line
	" echo l:line
	" let l:type = expand('<cword>')
	" normal w
	" let l:name = expand('<cword>')
	" echo l:name
	" ["a]yiw
	" execute 'normal! "ayiw'
	" yank a
	" exe "Ggrep '\\b".@z."\\b'"
endfunction

function! s:create_empty_constructor()
	call search('class')
	execute "normal! o/**\<cr>/\<cr>public function __construct(\<cr>) {\<cr>}"
	call search('__construct')
endfunction

function! s:BuildDTO()
	call s:process_line()
	" call s:create_empty_constructor()
endfunction

nn <leader>dto :call <sid>BuildDTO()<cr>
" nn <leader>dto :debug :call <sid>BuildDTO()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:dto()
	mark a
	let l:var_info = s:parse_docblock_line(getline('.'))
	call s:add_constructor_param(l:var_info[0], l:var_info[1])
	call s:add_assignment(l:var_info[1])
	call s:add_accessor(l:var_info[0], l:var_info[1], l:var_info[2])
	call s:add_property(l:var_info[0], l:var_info[1])
	'a
endfunction

function! s:add_property(type, name)
	call search('__construct')
	if !search('\v^\s*pr(ivate|otected)\s+\$', 'b')
		call search('class')
	endif
	call append(line('.'), [
		\'',
		\'	/**',
		\'	 * @var ' . a:type,
		\'	 */',
		\'	private $' . a:name . ';',
	\])
endfunction

function! s:add_accessor(type, name, desc)
	call cursor(line('$'), 1)
	call search('}', 'bc')
	call append(line('.') - 1, [
		\'',
		\'	/**',
		\'	 * @return ' . a:type . ' ' . a:desc,
		\'	 */',
		\'	public function ' . a:name . '(): ' . a:type . ' {',
		\'		return $this->' . a:name . ';',
		\'	}',
	\])
endfunction

function! s:add_assignment(name)
	call search('__construct')
	execute 'normal! $%$%'
	call append(line('.') - 1, '		$this->' . a:name . ' = $' . a:name . ';')
endfunction

function! s:add_constructor_param(type, name)
	call search('__construct')
	execute 'normal! $%'
	call append(line('.') - 1, '		' . a:type . ' $' . a:name . ',')
endfunction

function! s:parse_docblock_line(line)
	" let l:line = '	 * @param string $avatar image url'
	let l:var_info = remove(matchlist(a:line, '\v.+param\s+(\S+)\s+\$(\S+)\s+(.+)'), 1, 3)
	return l:var_info
endfunction

" nn <leader>k :debug :call <sid>dto()<cr>
nn <leader>k :call <sid>dto()<cr>


