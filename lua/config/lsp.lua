-- =============================
-- Native LSP setup (Neovim 0.11+)
-- Integrated with nvim-cmp
-- =============================

-- Add local user PATH (important for pip-installed tools)
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.local/bin")

-- Helper to start an LSP only once per buffer
local function start_lsp_for_filetype(ft, opts)
   vim.api.nvim_create_autocmd("FileType", {
      pattern = ft,
      callback = function()
         if not vim.lsp.get_clients({ bufnr = 0 })[1] then
            vim.lsp.start(opts)
         end
      end,
   })
end

-- =============================
-- Attach + keymaps
-- =============================
local function on_attach(client, bufnr)
   local buf_map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
   end

   buf_map("n", "gd", vim.lsp.buf.definition)
   buf_map("n", "gD", vim.lsp.buf.declaration)
   buf_map("n", "K", vim.lsp.buf.hover)
   buf_map("n", "gr", vim.lsp.buf.references)
   buf_map("n", "<leader>rn", vim.lsp.buf.rename)
   buf_map("n", "<leader>ca", vim.lsp.buf.code_action)
   buf_map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
   end)
end

-- =============================
-- Integrate with nvim-cmp
-- =============================
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
   capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- =============================
-- Language servers
-- =============================

-- C / C++
start_lsp_for_filetype({ "c", "cpp" }, {
   name = "clangd",
   cmd = { "clangd" },
   root_dir = vim.fn.getcwd(),
   on_attach = on_attach,
   capabilities = capabilities,
})

-- Lua
start_lsp_for_filetype("lua", {
   name = "lua_ls",
   cmd = { "lua-language-server" },
   root_dir = vim.fn.getcwd(),
   on_attach = on_attach,
   capabilities = capabilities,
})

-- Python
if vim.fn.executable("pyright-langserver") == 1 then
   start_lsp_for_filetype("python", {
      name = "pyright",
      cmd = { "pyright-langserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
      on_attach = on_attach,
      capabilities = capabilities,
   })
elseif vim.fn.executable("pylsp") == 1 then
   start_lsp_for_filetype("python", {
      name = "pylsp",
      cmd = { "pylsp" },
      root_dir = vim.fn.getcwd(),
      on_attach = on_attach,
      capabilities = capabilities,
   })
else
   vim.notify("No Python LSP found (install pyright or pylsp)", vim.log.levels.WARN)
end

-- Java
if vim.fn.executable("jdtls") == 1 then
   start_lsp_for_filetype("java", {
      name = "jdtls",
      cmd = { "jdtls", "-data", vim.fn.getcwd() .. "/.workspace" },
      root_dir = vim.fn.getcwd(),
      on_attach = on_attach,
      capabilities = capabilities,
   })
else
   vim.notify("Java LSP (jdtls) not found", vim.log.levels.WARN)
end

-- =============================
-- Diagnostics and appearance
-- =============================
vim.diagnostic.config({
   virtual_text = true,
   underline = true,
   update_in_insert = false,
   severity_sort = true,
   float = {
      border = "rounded",
      source = "always",
   },
})
