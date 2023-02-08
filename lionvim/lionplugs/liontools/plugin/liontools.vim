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

fun! LionNewProject()
	lua for k in pairs(package.loaded) do if k:match('^LionNewProject') then package.loaded[k] = nil end end
	lua require("LionTools").newprojects_name(1)
endfun

fun! LionOpenProject()
	lua for k in pairs(package.loaded) do if k:match('^LionOpenProject') then package.loaded[k] = nil end end
	lua require("LionTools").selectproject()
endfun

fun! LionProjectsManager()
	lua for k in pairs(package.loaded) do if k:match('^LionProjectsManager') then package.loaded[k] = nil end end
	lua require("LionTools").projectsmanager()
endfun

fun! LionDelProject()
	lua for k in pairs(package.loaded) do if k:match('^LionDelProject') then package.loaded[k] = nil end end
	lua require("LionTools").deleteproject()
endfun

fun! LionTerminal()
	lua for k in pairs(package.loaded) do if k:match('^LionTerminal') then package.loaded[k] = nil end end
	lua require("LionTools").lionterminal()
endfun

fun! LionPackagesUpdate()
	lua for k in pairs(package.loaded) do if k:match('^LionPackagesUpdate') then package.loaded[k] = nil end end
	lua require("LionTools").update_packages()
endfun

fun! LionAddDapConfig()
	lua for k in pairs(package.loaded) do if k:match('^LionAddDapConfig') then package.loaded[k] = nil end end
	lua require("LionTools").add_dap_configuration()
endfun

augroup LionTools
	autocmd!
augroup END
