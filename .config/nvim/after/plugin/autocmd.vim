augroup exe_code
  autocmd!

  " for python
  autocmd FileType python nnoremap <buffer> <localleader>r
              \ :sp<CR> :term python3 %<CR> :startinsert<CR>
  " for lua
  autocmd FileType lua nnoremap <buffer> <localleader>r
              \ :sp<CR> :term lua %<CR> :startinsert<CR>

  " for c
  autocmd FileType c nnoremap <buffer> <localleader>r
              \ :sp<CR> :term gcc % && ./a.out <CR> :startinsert<CR>
  
  " for c++
  autocmd FileType cpp nnoremap <buffer> <localleader>r
              \ :sp<CR> :term g++ % && ./a.out <CR> :startinsert<CR>

augroup END

autocmd BufwinEnter,WinEnter term://* startinsert

augroup config_setting
  autocmd!
  autocmd FileType vim setlocal foldlevel=0 foldmethod=marker
augroup END