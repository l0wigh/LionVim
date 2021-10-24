fun! LionUpdate()
	lua for k in pairs(package.loaded) do if k:match('^LionUpdate') then package.loaded[k] = nil end end
	lua require("LionTools").update()
endfun

fun! LionStatus()
	lua for k in pairs(package.loaded) do if k:match('^LionStatus') then package.loaded[k] = nil end end
	lua require("LionTools").status()
endfun

augroup LionTools
	autocmd!
augroup END
