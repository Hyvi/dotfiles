" vim: shiftwidth=4:tabstop=4:softtabstop=4 
set foldmethod=expr
setlocal foldexpr=GetGoFold(v:lnum)
set foldtext=Gofoldtext()
set fillchars= 
" hi Folded ctermbg=white ctermfg=red
" hi Folded xxx term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue
" hi Folded xxx term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=LightGrey
" hi! link Folded Normal

function Gofoldtext() 
    let line    = getline(v:foldstart)
	let foldlen = v:foldend - v:foldstart + 1
	let lines   = substitute(line, "[\ \t]*", '', '') . ' ' . foldlen . ' lines ... ' 
	" if foldlen < 10
    " let lines = ' ' . lines
	" endif

    let retval = ''
    let i = 0
    while i <  indent(v:foldstart)
        let retval = retval . ' ' 
        let i += 1
    endwhile

	" let retval = retval . v:folddashes . lines
    let retval = retval . lines

	return retval
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction


function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! GetGoFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$' 
        return '-1'
    endif 

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
