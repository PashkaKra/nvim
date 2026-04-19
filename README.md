# Neovim Configuration

Персональная конфигурация Neovim с использованием современных плагинов и инструментов.

## Структура проекта

```
nvim/
├── init.lua              # Главный файл конфигурации
├── lua/
│   ├── configs/
│   │   ├── options.lua   # Настройки опций Neovim
│   │   └── plugins.lua   # Конфигурация пакетного менеджера lazy.nvim
│   └── plugins/          # Конфигурации плагинов
│       ├── autotag.lua
│       ├── autoclose.lua
│       ├── bufferline.lua
│       ├── cmp.lua
│       ├── gitsigns.lua
│       ├── indent.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── neotree.lua
│       ├── telescope.lua
│       ├── toggleterm.lua
│       └── treesitter.lua
└── lazy-lock.json
```

## Установка

1. Склонировать репозиторий в директорию конфигурации Neovim:
   ```bash
   git clone <repo_url> ~/.config/nvim
   ```

2. Запустить Neovim — плагины установятся автоматически через lazy.nvim.

## Используемые плагины

- **nvim-cmp** — Автодополнение кода
- **nvim-lspconfig** — Настройка LSP-серверов
- **cmp-nvim-lsp**, **cmp-buffer**, **cmp-path** — Источники автодополнения
- **mason.nvim** — Менеджер LSP-серверов, линтеров, форматтеров
- **Treesitter** — Синтаксический анализ и подсветка синтаксиса
- **Neotree** — Файловый проводник
- **Telescope** — Быстрый поиск файлов и текста
- **Gitsigns** — Интеграция с Git
- **Lualine** — Статусная строка
- **Bufferline** — Управление буферами
- **nvim-autopairs** — Автозакрытие скобок
- **nvim-autotag** — Автопереименование тегов
- **indent-blankline** — Подсветка отступов
- **toggleterm** — Встроенный терминал

## LSP-серверы

- **pyright** — Python
- **gopls** — Go

## Требования

- Neovim >= 0.9.0
- Git
- Python (для pyright)
- Go (для gopls)

## Управление плагинами

Плагины управляются через [lazy.nvim](https://github.com/folke/lazy.nvim). Команды:
- `:Lazy` — открыть менеджер плагинов
- `:Lazy sync` — синхронизировать плагины