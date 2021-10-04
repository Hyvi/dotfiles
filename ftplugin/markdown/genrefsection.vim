" https://vitalyparnas.com/guides/vim-ref-links/
" To invoke, it remains to type :GenRefSection in any markdown document (it should auto-complete).

function! GenRefSection()
    $norm o### Sources referenced <a name='#ref'></a>
    g/\[[^\]]\+\]([^)]\+)/t$
    silent! '^,$s/\v[^\[]*(\[[^\]]+\])\(([^)]+)\)[^\[]*/- \1[]\r\1: \2\r/g
    '^,$g/^$/d
    '^,$g/^\[/m $
    silent! 1,'^s/\v(\[[^\]]+\])\([^)]+\)/\1[]/g
endfunction
command! GenRefSection call GenRefSection()
