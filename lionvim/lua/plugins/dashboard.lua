vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
" `VMM, AMMMV'  ,AMMMMMMMMMMMMMMMMMMMMMMM,                ,",
"  VMMMmMMV'  ,AMY~~''  'MMMMMMMMMMMM' '~~             ,aMM",
"  `YMMMM'   AMM'        `VMMMMMMMMP'_              A,aMMMM",
"   AMMM'    VMMA. YVmmmMMMMMMMMMMML MmmmY          MMMMMMM",
"  ,AMMA   _,HMMMMmdMMMMMMMMMMMMMMMML`VMV'         ,MMMMMMM",
"  AMMMA _'MMMMMMMMMMMMMMMMMMMMMMMMMMA `'          MMMMMMMM",
" ,AMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMa      ,,,   `MMMMMMM",
" AMMMMMMMMM'~`YMMMMMMMMMMMMMMMMMMMMMMA    ,AMMV    MMMMMMM",
" VMV MMMMMV   `YMMMMMMMMMMMMMMMMMMMMMY   `VMMY'  adMMMMMMM",
" `V  MMMM'      `YMMMMMMMV.~~~~~~~~~,aado,`V''   MMMMMMMMM",
"    aMMMMmv       `YMMMMMMMm,    ,/AMMMMMA,      YMMMMMMMM",
"    VMMMMM,,v       YMMMMMMMMMo oMMMMMMMMM'    a, YMMMMMMM",
"    `YMMMMMY'       `YMMMMMMMY' `YMMMMMMMY     MMmMMMMMMMM",
"     AMMMMM  ,        ~~~~~,aooooa,~~~~~~      MMMMMMMMMMM",
"       YMMMb,d'         dMMMMMMMMMMMMMD,   a,, AMMMMMMMMMM",
"                                                          ",
"                                             LionVim 0.0.1"
}

local custom_section = {
	a = {
		description = { "  Find Files   " },
		command = "Telescope find_files"
	},
	b = {
		description = { "  Recent Files " },
		command = "Telescope oldfiles"
	},
	c = {
		description = { "  Find Words   " },
		command = "Telescope live_grep"
	},
	d = {
		description = { "  Configuration" },
		command = ":e ~/.config/lionvim"
	},
}

local custom_footer = {
	"https://github.com/L0Wigh/LionVim",
}

vim.g.dashboard_custom_section = custom_section
vim.g.dashboard_custom_footer = custom_footer
