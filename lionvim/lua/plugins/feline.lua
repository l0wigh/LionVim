local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local function pourcentColors()
	return vi_mode_utils.get_mode_color()
end

local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local colors = {
  bg = '#002b36',
  black = '#000000',
  yellow = '#b58900',
  cyan = '#2aa198',
  oceanblue = '#45707a',
  green = '#859900',
  orange = '#cb4b16',
  violet = '#6c71c4',
  magenta = '#d33682',
  white = '#eee8d5',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#dc322f',
}

local vi_mode_colors = {
  NORMAL = 'yellow',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = '<|',
  OP = '<|',
  INSERT = '|>',
  VISUAL = '<>',
  LINES = '<>',
  BLOCK = '<>',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = '<|',
  SHELL = '<|',
  TERM = '<|',
  NONE = '<>'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

force_inactive.buftypes = {
  'terminal'
}

-- LEFT

-- vi-mode
components.active[1][1] = {
  provider = ' LionVim ',
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'

    return val
  end,
  right_sep = ' '
}
-- vi-symbol
components.active[1][2] = {
	--[[
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.fg = vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
  ]]
}
-- filename
components.active[1][3] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- gitBranch
components.active[1][4] = {
  provider = 'git_branch',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  }
}
-- diffAdd
components.active[1][5] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold'
  }
}
-- diffModfified
components.active[1][6] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  }
}
-- diffRemove
components.active[1][7] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  }
}

-- MID

-- LspName
components.active[2][1] = {
	--[[
  provider = 'lsp_client_names',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
  ]]
}
-- diagnosticErrors
components.active[3][3] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
-- diagnosticWarn
components.active[3][4] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
-- diagnosticHint
components.active[3][5] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
-- diagnosticInfo
components.active[3][6] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}

-- RIGHT

-- fileIcon
components.active[3][1] = {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ''
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileType
components.active[3][2] = {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ''
}
-- fileSize
components.active[3][7] = {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- fileFormat
components.active[3][8] = {
  provider = function() return ' ' .. vim.bo.fileformat:upper() .. '' end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- fileEncode
components.active[3][9] = {
  provider = 'file_encoding',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- rubyVersion
	--[[
components.active[3][6] = {
  provider = function()
    return '🦁'
  end,
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
	]]

-- lineInfo
	--[[
components.active[3][7] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
  ]]--
-- linePercent
components.active[3][10] = {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- scrollBar
components.active[3][11] = {
  provider = 'scroll_bar',
  hl = function()
    local val = {}

    val.fg = vi_mode_utils.get_mode_color()
    val.bg = colors.bg

    return val
  end,
}

-- INACTIVE

-- fileType
components.inactive[1][1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}

require('feline').setup({
  colors = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
