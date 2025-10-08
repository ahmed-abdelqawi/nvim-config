return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- dynamic version
    local v = vim.version()
    local version = string.format("v%d.%d.%d", v.major, v.minor, v.patch)

    -- your ASCII art
    local header = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- measure the visible (display) width of the widest art line
    local max_width = 0
    for _, line in ipairs(header) do
      local w = vim.fn.strdisplaywidth(line)
      if w > max_width then max_width = w end
    end

    -- build the version text and center it relative to max_width
    local text = string.format("N E O V I M  %s", version)
    local text_width = vim.fn.strdisplaywidth(text)
    local pad = 0
    if max_width > text_width then
      pad = math.floor((max_width - text_width) / 2)
    end
    local centered_line = string.rep(" ", pad) .. text

    -- assign header (art + blank line + centered version)
    dashboard.section.header.val = vim.list_extend(header, { "", centered_line })

    -- remove extras
    dashboard.section.buttons.val = {}
    dashboard.section.footer.val = {}

    -- vertical centering
    local win_height = vim.fn.winheight(0)
    local art_height = #dashboard.section.header.val
    local top_padding = math.max(2, math.floor((win_height - art_height) / 2))

    dashboard.opts.layout = {
      { type = "padding", val = top_padding },
      dashboard.section.header,
    }

    dashboard.opts.opts = dashboard.opts.opts or {}
    dashboard.opts.opts.margin = 0

    alpha.setup(dashboard.opts)
  end,
}
