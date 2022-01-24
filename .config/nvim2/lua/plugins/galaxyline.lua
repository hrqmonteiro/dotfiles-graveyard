local cmd = vim.cmd
local gl = require("galaxyline")
local fn = vim.fn
local section = gl.section
local condition = require("galaxyline.condition")
gl.short_line_list = {"NvimTree", "packager", "dashboard", "NeogitStatus", "vista", "vista_kind"}
local condition = require('galaxyline.condition')

local colors = {
  -- nordbg = "#242832",
  nordbg = "#292E39",
  nord0 = "#2E3440",
  nord1 = "#3B4252",
  nord2 = "#434C5E",
  nord3 = "#4C566A",
  nord3_bright = "#616E88",
  nord4 = "#D8DEE9",
  nord5 = "#E5E9F0",
  nord6 = "#ECEFF4",
  nord7 = "#8FBCBB",
  nord8 = "#88C0D0",
  nord9 = "#81A1C1",
  nord10 = "#5E81AC",
  nord11 = "#BF616A",
  nord12 = "#D08770",
  nord13 = "#EBCB8B",
  nord14 = "#A3BE8C",
  nord15 = "#B48EAD"
}

local get_filename = function()
  return vim.fn.expand("%:t")
end

local file_readonly = function(readonly_icon)
  if vim.bo.filetype == "help" then
    return ""
  end
  local icon = readonly_icon or ""
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ""
end

local current_file_name_provider = function()
  local file = get_filename()
  if vim.fn.empty(file) == 1 then
    return ""
  end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  local icon = ""
  if vim.bo.modifiable then
    if vim.bo.modified then
      vim.api.nvim_command("hi GalaxyFileName guifg=#BF616A gui=bold")
      return " " .. icon .. " " .. file .. " "
    end
  end
  vim.api.nvim_command("hi GalaxyFileName guifg=#D8DEE9 gui=bold")
  return file .. " "
end

section.left[1] = {
  FirstElement = {
    provider = function()
      return "▌"
    end,
    highlight = {colors.nord9, colors.nordbg}
  }
}

section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.nord9,
        i = colors.nord14,
        v = colors.nord12,
        [""] = colors.nord11,
        V = colors.nord11,
        c = colors.nord9,
        no = colors.nord15,
        s = colors.nord14,
        S = colors.nord14,
        [""] = colors.nord14,
        ic = colors.nord14,
        R = colors.nord11,
        Rv = colors.nord11,
        cv = colors.nord11,
        ce = colors.nord11,
        r = colors.nord11,
        rm = colors.nord11,
        ["r?"] = colors.nord11,
        ["!"] = colors.nord11,
        t = colors.nord11
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "    "
    end,
    separator = " ",
    highlight = {colors.nord9, colors.nordbg, "bold"},
    separator_highlight = {colors.nordbg, colors.nordbg}
  }
}

section.left[3] = {
  FileSize = {
    provider = "FileSize",
    separator = " ",
    condition = buffer_not_empty,
    separator_highlight = {colors.nordbg, colors.nordbg},
    highlight = {colors.nord4, colors.nordbg}
  }
}

section.left[4] = {
  BufferType = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    separator = "",
    separator_highlight = {colors.nordbg, colors.nordbg},
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.nordbg}
  }
}

section.left[5] = {
  FileName = {
    provider = current_file_name_provider,
    condition = condition.buffer_not_empty,
    highlight = {colors.nord8, colors.nordbg, "bold"},
    separator = " ",
    separator_highlight = {colors.nordbg, colors.nordbg},
  }
}

section.left[6] = {
  LineColumn = {
    provider = function()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("%1d:%1d",line,column)
    end,
    highlight = {colors.base4, colors.nordbg},
    separator = " ",
    separator_highlight = {colors.nordbg, colors.nordbg},
  }
}

-- section.left[6] = {
--   LineColumn = {
--     provider = "LineColumn",
--     highlight = {colors.nord4, colors.nordbg},
--     separator = " ",
--     separator_highlight = {colors.nordbg, colors.nordbg},
--   }
-- }

section.left[7] = {
  LinePercent = {
    provider = "LinePercent",
    highlight = {colors.nord4, colors.nordbg},
    separator = " ",
    separator_highlight = {colors.nordbg, colors.nordbg},
  }
}

-- section.right[1] = {
--   BugSymbol = {
--     provider = function()
--       return "    "
--     end,
--     highlight = {colors.red, colors.base05},
--     separator = " ",
--     separator_highlight = {colors.base05, colors.base05},
--   }
-- }
-- 
-- section.right[2] = {
--   LspInfo = {
--     provider = "GetLspClient",
--     highlight = {colors.blue, colors.base05, "bold"},
--     separator = " ",
--     separator_highlight = {colors.base05, colors.base05},
--   }
-- }
-- 
-- section.right[3] = {
--   GitIcon = {
--     provider = function()
--       return " "
--     end,
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     highlight = {colors.green, colors.base05},
--     separator = "  ",
--     separator_highlight = {colors.base05, colors.base05}
--   }
-- }
-- 
-- section.right[4] = {
--   GitBranch = {
--     provider = "GitBranch",
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     highlight = {colors.green, colors.base05, "bold"},
--     separator = "",
--     separator_highlight = {colors.base05, colors.base05}
--   }
-- }
-- 
-- section.right[5] = {
--   LspErrors = {
--     provider = "DiagnosticError",
--     icon = " ",
--     highlight = {colors.red, colors.base05, "bold"},
--     separator = "  ",
--     separator_highlight = {colors.base05, colors.base05}
--   }
-- }
-- 
-- section.right[6] = {
--   LspWarning = {
--     provider = "DiagnosticWarn",
--     icon = " ",
--     highlight = {colors.orange, colors.base05, "bold"},
--     separator = "",
--     separator_highlight = {colors.base05, colors.base05}
--   }
-- }
-- 
-- section.right[7] = {
--   LspHint = {
--     provider = "DiagnosticHint",
--     icon = " ",
--     highlight = {colors.yellow, colors.base05, "bold"},
--     separator = "",
--     separator_highlight = {colors.base05, colors.base05}
--   }
-- }
