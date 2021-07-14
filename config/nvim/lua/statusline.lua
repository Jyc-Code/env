-- source provider function
local colors = require('galaxyline.theme').default
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')

local GitBranch = vcs.get_git_branch

require('galaxyline').section.left[1]= {
  FileName = {
    provider = function()
		return vim.api.nvim_exec(
		[[
			let FilePath = split(expand("%:p"),'/')
			" 防止文件PATH 长度不足导致出错
			call insert(FilePath,'')
			call insert(FilePath,'')
			echo join(FilePath[-3:-1],'/')
		]],true
		)
	end,
    condition = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
      end,
    icon = '',
    highlight = {colors.red},
    separator = ' ',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.left[2]= {
  FileSize = {
    provider = 'FileSize',
    condition = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
      end,
    icon = '',
    highlight = {colors.white},
    separator = '',
    separator_highlight = {colors.white},
  }
}

require('galaxyline').section.left[3]= {
  FileTypeName = {
    provider = 'FileTypeName',
    condition = function()
        return true
      end,
    icon = '',
    highlight = {colors.yellow},
    separator = ' ',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.left[4]= {
  FileFormat = {
    provider = 'FileFormat',
    condition = function()
        return true
      end,
    icon = '',
    highlight = {colors.blue},
    separator = ' ',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.left[5]= {
  GitBranch = {
    provider = 'GitBranch',
    condition = function()
        return true
      end,
    icon = '[',
    highlight = {colors.white},
    separator = ']',
    separator_highlight = {colors.white},
  }
}

-- right ********************************
require('galaxyline').section.right[1]= {
  GetLspClient = {
    provider = 'GetLspClient',
    condition = function()
        return true
      end,
    icon = '',
    highlight = {colors.cyan},
    separator = '',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.right[2]= {
  DiagnosticError = {
    provider = 'DiagnosticError',
    condition = function()
		if diagnostic.get_diagnostic_error ~= 1 then
			return true
		end
		return false
      end,
    icon = 'e:',
    highlight = {colors.red},
    separator = ' ',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.right[3]= {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    condition = function()
		if diagnostic.get_diagnostic_warn ~= 1 then
			return true
		end
		return false
      end,
    icon = 'w:',
    highlight = {colors.yellow},
    separator = '',
    separator_highlight = {colors.darkblue},
  }
}

require('galaxyline').section.right[4]= {
	LineInfo = {
		provider = 'LineColumn',
		separator = ' ',
		separator_highlight = {colors.white},
		highlight = {colors.white},
	}
}

require('galaxyline').section.right[5]= {
  LinePercent = {
    provider = 'LinePercent',
    condition = function()
        return true
      end,
    icon = '',
    highlight = {colors.violet},
    separator = '',
    separator_highlight = {colors.darkblue},
  }
}

