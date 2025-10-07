return {
   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "saadparwaiz1/cmp_luasnip",
         "L3MON4D3/LuaSnip",
         "onsails/lspkind.nvim",
      },
      config = function()
         local cmp = require("cmp")
         local luasnip = require("luasnip")
         local lspkind = require("lspkind")

         luasnip.config.setup({})

         cmp.setup({
            snippet = {
               expand = function(args)
                  luasnip.lsp_expand(args.body)
               end,
            },
            mapping = cmp.mapping.preset.insert({
               ["<C-Space>"] = cmp.mapping.complete(),
               ["<CR>"] = cmp.mapping.confirm({ select = true }),
               ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                     luasnip.expand_or_jump()
                  else
                     fallback()
                  end
               end, { "i", "s" }),
               ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                     luasnip.jump(-1)
                  else
                     fallback()
                  end
               end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "luasnip" },
               { name = "path" },
               { name = "buffer" },
            }),
            formatting = {
               format = lspkind.cmp_format({
                  mode = "symbol_text",
                  maxwidth = 50,
                  ellipsis_char = "...",
               }),
            },
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
            experimental = {
               ghost_text = true,
            },
         })
      end,
   },
}
