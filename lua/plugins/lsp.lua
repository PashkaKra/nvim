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

    local lspconfig = require('lspconfig')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- npm install -g pyright
    -- sudo pacman -S gopls lua-language-server
    -- Mason может автоматически ставить зависимости
    -- Тут нужно вписать названия серверов, поддерживаемых nvim-lspconfig
    local servers = {
      'pyright',
      'gopls',
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = setup_lsp_keymaps,
        capabilities = capabilities,
      }
    end
  end
}
