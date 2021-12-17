fun! LionUpdate()
	lua for k in pairs(package.loaded) do if k:match('^LionUpdate') then package.loaded[k] = nil end end
	lua require("LionTools").update()
endfun

fun! LionStatus()
	lua for k in pairs(package.loaded) do if k:match('^LionStatus') then package.loaded[k] = nil end end
	lua require("LionTools").status()
endfun

fun! LionNewFile()
	lua for k in pairs(package.loaded) do if k:match('^LionNewFile') then package.loaded[k] = nil end end
	lua require("LionTools").newFile()
endfun

augroup LionTools
	autocmd!
augroup END
