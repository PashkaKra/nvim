--парсинга исходников
return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- Парсеры для каждого языка нужно ставить отдельно
      ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "go", "javascript", "tsx", "php", "vue", "html", "json", "css", "yaml" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
