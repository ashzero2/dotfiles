" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>
" Save + back into insert
" imap <C-S> <esc>:w<cr>a

" Control-C Copy in visual mode
vmap <C-C> y

" Control-V Paste in insert and command mode
imap <C-V> <esc>pa
cmap <C-V> <C-r>0

" nvimtree & term
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-t> :FloatermToggle<CR>

" comment out
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" open terminal on the bottom 
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-x> :call OpenTerminal()<CR>

" Coc commands

command! -nargs=0 Format :call CocAction('format')

" Formatting 
nnoremap <silent>F <cmd>Format<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <c-f> :Format<CR>

" Diagnostic Navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
