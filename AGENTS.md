# AGENTS.md

This file provides guidance to AI coding assistants when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration. LazyVim is a Neovim setup powered by lazy.nvim that provides sensible defaults and a modular plugin system.

## Architecture

```
~/.config/nvim/
├── init.lua              # Entry point, loads config.lazy
├── lazyvim.json          # LazyVim extras and version tracking
├── lazy-lock.json        # Plugin version lockfile
└── lua/
    ├── config/
    │   ├── lazy.lua      # lazy.nvim bootstrap and plugin setup
    │   ├── options.lua   # Custom Neovim options (extends LazyVim defaults)
    │   ├── keymaps.lua   # Custom keymaps (loaded on VeryLazy event)
    │   └── autocmds.lua  # Custom autocommands (loaded on VeryLazy event)
    └── plugins/
        └── *.lua         # Plugin specs (auto-loaded by lazy.nvim)
```

## Plugin Configuration

- Add new plugins by creating Lua files in `lua/plugins/`
- Each file should return a table of plugin specs
- To override a LazyVim plugin, specify the same plugin name and merge/override opts
- To disable a LazyVim plugin: `{ "plugin/name", enabled = false }`

## Enabled LazyVim Extras

The following extras are enabled in `lazyvim.json`:
- `lazyvim.plugins.extras.lang.json`
- `lazyvim.plugins.extras.lang.markdown`
- `lazyvim.plugins.extras.lang.tailwind`
- `lazyvim.plugins.extras.lang.typescript`

## Git Conventions

Use [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages:
- `feat:` new feature
- `fix:` bug fix
- `docs:` documentation changes
- `chore:` maintenance tasks
- `refactor:` code refactoring

## Key References

- LazyVim defaults: https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/config
- LazyVim plugins: https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins
- lazy.nvim docs: https://lazy.folke.io/
