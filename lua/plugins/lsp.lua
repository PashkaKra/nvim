return{
  "hrsh7th/nvim-cmp",
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline'
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      })
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function setup_lsp_keymaps(client, bufnr)
      -- ваши горячие клавиши
    end

    -- Вспомогательная функция для настройки серверов
    local function setup_server(name, config)
      config.capabilities = capabilities
      config.on_attach = setup_lsp_keymaps
      
      -- Новый API
      vim.lsp.config[name] = config
      vim.lsp.enable(name)
    end

    -- Настройка pyright
    setup_server('pyright', {
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
    })

    -- Настройка gopls
    setup_server('gopls', {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod' },
      root_markers = { 'go.mod', '.git' },
    })
  end
}
