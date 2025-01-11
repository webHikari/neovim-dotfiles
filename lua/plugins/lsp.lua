
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})

      -- Здесь добавим null-ls
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.prettier.with({
            filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" },
          }),
        },
      })

      -- Создаем автокоманду для форматирования
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
          vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		  
		  -- Форматируем код с Prettier
		  vim.keymap.set("n", "<Leader>w", function()
			-- Форматируем с помощью LSP
			vim.lsp.buf.format({ async = false })
			-- Сохраняем файл
			vim.cmd("write")
		  end,{ desc = "Format and Save File" })
		end,
      })
    end,
  },

  -- Устанавливаем null-ls плагин
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      -- Конфигурация null-ls для Prettier
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.prettier.with({
            filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" },
          }),
        },
      })
    end,
  },
}

