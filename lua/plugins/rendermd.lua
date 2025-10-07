return {
   {
     "MeanderingProgrammer/render-markdown.nvim",
     ft = { "markdown", "quarto" },  
     main = "render-markdown",
     dependencies = {
       "nvim-treesitter/nvim-treesitter",  -- needed for parsing/injection
       "nvim-tree/nvim-web-devicons",      
     },
     opts = {
       -- Whether rendering is enabled by default
       enabled = true,

       -- Which filetypes this should run on
       file_types = { "markdown", "quarto" },

       render_modes = { "n", "c", "t" },
       -- If you want it in *all* modes:
       -- render_modes = true,

       -- Anti-conceal configuration (to disable rendering at cursor line, etc.)
       anti_conceal = {
         enabled = true,
         disabled_modes = false,
         above = 0,
         below = 0,
         ignore = {
           code_background = true,
           indent = true,
           sign = true,
           virtual_lines = true,
         },
       },

       -- Debounce time (ms) for re-rendering while scrolling or moving
       debounce = 100,

       -- Max file size (in MB) to attempt rendering
       max_file_size = 10.0,

       -- Window options when rendering vs not
       win_options = {
         conceallevel = { default = vim.o.conceallevel, rendered = 3 },
         concealcursor = { default = vim.o.concealcursor, rendered = "" },
       },

       -- Overrides per filetype / buftype if desired
       overrides = {
         buftype = {
           nofile = {
             render_modes = true,
             padding = { highlight = "NormalFloat" },
             sign = { enabled = false },
           },
         },
         filetype = {
           -- e.g. disable for a certain filetype
         },
       },

       injections = {
         gitcommit = {
           enabled = true,
           query = [[
             ((message) @injection.content
                (#set! injection.combined)
                (#set! injection.include-children)
                (#set! injection.language "markdown"))
           ]],
         },
       },

       markdown = {
         disable = true,
         directives = {
           { id = 17, name = "conceal_lines" },
           { id = 18, name = "conceal_lines" },
         },
       },
     },
     config = function(_, opts)
       require("render-markdown").setup(opts)

       vim.keymap.set("n", "<leader>m", function()

         local rm = require("render-markdown")
         if rm.is_enabled() then
           rm.disable()
         else
           rm.enable()
         end
       end, { desc = "Toggle Markdown rendering" })
     end,
   }
}
