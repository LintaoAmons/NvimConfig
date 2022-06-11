# Lintao's nvim
> Thanks to 
> 
> <a>https://github.com/LunarVim/Neovim-from-scratch</a>
> 
> <a>https://github.com/ravenxrz/dotfiles</a>
> 
> <a>https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ</a>
> 
> <a>https://space.bilibili.com/26319956</a>

# 非常重要的插件
- Packer 插件管理安装
  - `wbthomason/packer.nvim`
- Explorer 文件浏览
  - `kyazdani42/nvim-tree.lua`
- Lsp 相关，简化Lsp配置与安装
  - `neovim/nvim-lspconfig`
  - `williamboman/nvim-lsp-installer`
  - `jose-elias-alvarez/null-ls.nvim`
- Which-key 可维护的快捷键
  - `folke/which-key.nvim`
- Telescope 各种搜索
  - `nvim-telescope/telescope.nvim`
- Treesitter 文档树解析，语法高亮，速度快
  - `nvim-treesitter/nvim-treesitter`
  - optional: `nvim-treesitter/playground` 
- Color Scheme 随便找一个

# Config Structure

```bash
.
├── ftplugin                          # 针对不同类型的文件设置不同的行为
│   └── typescriptreact.vim               # 针对 ts-react 文件的设置
├── init.lua                          # 入口文件,其他的设置需要在这里 require 引入生效
├── lua                               # 其他配置都放在这个里面
│   ├── keymaps                       # 快捷键相关设置
│   │   ├── cmds.lua          
│   │   ├── init.lua                    # 快捷键入口文件
│   │   ├── leader-keymaps.lua            # leader开头的快捷键，用which-key插件使得更可读，提高可维护性
│   │   ├── no-leader-keymaps.lua         # 不用 leader 的快捷键，比如 c-h 等window navigation, etc.
│   │   └── whichkey-config.lua           # which-key 插件的基本配置
│   ├── lsp                           # LSP 相关配置
│   │   ├── handlers.lua                
│   │   ├── init.lua
│   │   ├── lsp-installer.lua
│   │   ├── lspsaga.lua
│   │   ├── null-ls.lua
│   │   ├── peek.lua
│   │   └── settings
│   │       ├── jsonls.lua
│   │       ├── pyright.lua
│   │       └── sumneko_lua.lua
│   ├── options.lua                    # Vim 基本属性
│   ├── plugin-configs                 # 各个插件的配置(一般一个插件一个文件)
│   │   ├── aerial.lua                   # 大纲(outline)插件的配置
│   │   ├── auto-pair.lua
│   │   ├── ...
│   │   ├── toggleterm.lua
│   │   └── treesitter.lua
│   └── plugins.lua                    # 声明插件的位置，更改后需要重启vim（或者source配置），再使用 `:PackerInstall`安装
├── nlsp-settings
│   └── sumneko_lua.json
└── plugin                             # 编译后的插件声明，可以删除之后用 `:PackerSync` 重新生成
    └── packer_compiled.lua

```
