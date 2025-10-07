local function enable_transparency()
   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
   vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
   { -- Color Scheme (Miasma).
      "xero/miasma.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd("colorscheme miasma")

         -- I don't vibe with that, personally :D
         -- enable_transparency()   -- Uncomment if you want transparency.
      end,
   },
}
