fun! CalcLine()
	lua for k in pairs(package.loaded) do if k:match('^line') then package.loaded[k] = nil end end
	lua require("calc").line()
endfun

fun! CalcFull()
	lua for k in pairs(package.loaded) do if k:match('^full') then package.loaded[k] = nil end end
	lua require("calc").full()
endfun

" augroup calc
" 	autocmd!
" 	autocmd FileType *.calc
" 		\ autocmd BufWritePre,BufWrite <buffer> :call CalcFull()
" augroup END

autocmd BufEnter,InsertLeave,TextChanged *.calc :call CalcFull()
