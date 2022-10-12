" xkb-layout.vim - Edit xkb-layouts
" Author:       ungnis
" Version:      1.0

let g:template_dir="$XDG_LOCAL_HOME/templates/"
let g:layout_dir="$XDG_LOCAL_HOME/keyboard/"

function s:xkb_layout()
    %substitute+\(\S\)+\=printf('U%04X', char2nr(submatch(0)))+g
    %substitute+ +, +g
    normal G
    r g:template_dir/%:r.template
    normal ggJJJ0majJJJ0mbjJJJ0mcjJJ0mdgg
    let n = 33
    while n > 0
        exe "normal /[  \<CR>t]'ad2w\<C-o>P'bd2w\<C-o>p'cd2w\<C-o>p'dd2w\<C-o>pgg"
        let n -= 1
    endwhile
    delmarks a-d
    %substitute+,  ]+ ]+g
    normal ggdip
endfunction

nnoremap <leader>uni :%substitute+\vU(\x{4})+\=nr2char(str2nr(submatch(1), 16))+g
nnoremap <leader>guni :%substitute+\(\S\)+\=printf('U%04X', char2nr(submatch(0)))+g

autocmd BufWritePost g:layout_dir/*.layout write | call s:xkb_layout() | write %:r | !sudo cp %:r /usr/share/X11/xkb/symbols/%:r
