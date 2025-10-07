return{
   {
     "nvim-tree/nvim-tree.lua",
     dependencies = { 
            "nvim-tree/nvim-web-devicons" 
         },

     config = function()
       vim.g.loaded_netrw = 1
       vim.g.loaded_netrwPlugin = 1

       vim.opt.termguicolors = true

       require("nvim-tree").setup({
         sort_by = "case_sensitive",
         view = {
           width = 30,
           side = "left",
         },
         renderer = {
           group_empty = true,
           highlight_git = true,
           icons = {
             show = {
               file = true,
               folder = true,
               folder_arrow = true,
               git = true,
             },
           },
         },
         filters = {
           dotfiles = false,
         },
         git = {
           enable = true,
         },
         actions = {
           open_file = {
             quit_on_open = false,
           },
         },
       })

       vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
     end,
   }
}
