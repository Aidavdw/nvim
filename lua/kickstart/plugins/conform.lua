return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        -- Probably not used as much, since autoformat on save. Still nice to have as a backup.
        '<leader>ba',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[B]uffer: Auto[F]ormat',
      },
      {
        '<leader>bd',
        function()
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          if vim.b.disable_autoformat then
            vim.notify('Autoformat on save disabled for this buffer', vim.log.levels.INFO)
          else
            vim.notify('Autoformat on save enabled for this buffer', vim.log.levels.INFO)
          end
        end,
        desc = '[B]uffer: toggle autoformat on [S]ave',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Check if a variable is set for this specific buffer to *NOT* apply autoformattin.
        -- In doing so, we can opt-out of autoformatting.
        -- Note that this resets on every time you load the file, but it's a rare-enough occurrence that this should be pretty alright
        if vim.b[bufnr].disable_autoformat then
          return nil
        end

        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        yaml = { 'yamlfix' },
        sh = { 'shfmt' },
        json = { 'fixjson' },
        tex = { 'tex-fmt' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
