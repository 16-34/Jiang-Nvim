# LUE-NVIM

个人 Neovim 配置仓库。

## 目录结构

```text
.
├── init.lua                  # 配置入口，加载 custom、plugins 模块
├── lsp/                      # Neovim 原生 LSP 服务配置
│   ├── clangd.lua            # C/C++ LSP
│   ├── lua_ls.lua            # Lua LSP
│   ├── pyright.lua           # Python 类型检查 LSP
│   └── ruff.lua              # Python Ruff LSP
├── lua/
│   ├── custom/               # 基础编辑体验配置
│   │   ├── appearence.lua    # 配色、浮窗、状态栏外观
│   │   ├── keymaps.lua       # 全局快捷键
│   │   ├── lsp.lua           # LSP 启用、诊断和 LSP 快捷键
│   │   └── options.lua       # 行号、缩进、搜索、分屏等基础选项
│   ├── plugins/              # 插件配置
│   │   ├── blink.lua         # 补全
│   │   ├── conform.lua       # 格式化
│   │   ├── flash.lua         # 快速跳转
│   │   ├── mason.lua         # Mason 管理界面
│   │   ├── mini.lua          # mini.move、mini.pick、mini.pairs
│   │   ├── neo-tree.lua      # 文件树
│   │   ├── noice.lua         # 命令行和 LSP UI
│   │   ├── nvim-dap.lua      # 调试
│   │   ├── nvim-tree.lua     # 备用文件树配置
│   │   ├── nvim-treesitter.lua # Treesitter 高亮
│   │   ├── oil.lua           # 目录编辑式文件管理
│   │   ├── smear-cursor.lua  # 光标动画
│   │   ├── telescope.lua     # 搜索
│   │   ├── toggleterm.lua    # 浮动终端
│   │   └── which-key.lua     # 快捷键提示
│   └── utils/                # 其他工具
│       ├── status-line-icon.lua
│       └── status-line-text.lua
└── nvim-pack-lock.json       # 插件锁定文件
```

## 安装

将仓库放到 Neovim 配置目录：

```sh
git clone --depth 1 https://github.com/16-34/LUE-NVIM ~/.config/nvim
```

首次启动时，`vim.pack.add` 会按配置拉取插件。部分语言服务、formatter 和调试器需要提前安装到系统 `PATH`。

## 环境要求

- Neovim：需要支持 `vim.pack.add`、`vim.lsp.enable` 和 `vim.o.winborder` 的版本。
- Git：用于拉取插件。
- 推荐命令行工具：`ripgrep`、`fd`、`cmake`。
- LSP 可执行文件：`ruff`、`pyright-langserver`、`lua-language-server`、`clangd`（部分可在 Mason 安装）。
- 调试器或调试适配器：`python`、`lldb-dap`、`codelldb`、`gdb`，按实际语言调试需求安装。
- 配色：需要确保 `catppuccin` 主题在 Neovim 中可用，或自行替换 `lua/custom/appearence.lua` 中的配色名称。
- 字体：推荐安装 Nerd Font，以正确显示状态栏和图标。

## 常用快捷键

Leader 键为 `Space`。

| 快捷键                         | 功能                       |
| ------------------------------ | -------------------------- |
| `<leader>f`                    | LSP 格式化当前文件         |
| `<leader>nh`                   | 取消搜索高亮               |
| `<leader>r`                    | 重做                       |
| `jk`                           | 插入模式退出到普通模式     |
| `<leader>\|`                   | 水平分割窗口               |
| `<leader>\\`                   | 垂直分割窗口               |
| `<leader><Left/Right/Up/Down>` | 在窗口之间移动             |
| `<leader>w`                    | 关闭当前窗口               |
| <kbd>Ctrl</kbd> + <kbd>`</kbd> | 切换浮动终端               |
| `-`                            | 打开 `oil.nvim` 文件管理   |
| `<leader>t`                    | 切换 `neo-tree` 文件树     |
| `s`                            | 使用 `flash.nvim` 快速跳转 |
| `<leader><leader>f`            | 查找文件                   |
| `<leader><leader>g`            | 全局搜索内容               |
| `<leader><leader>b`            | 查找 Buffer                |
| `<leader><leader>h`            | 查找帮助文档               |
| `<leader><leader>i`            | 查看 LSP incoming calls    |
| `<leader><leader>d`            | 查看诊断列表               |

## LSP 快捷键

| 快捷键       | 功能                     |
| ------------ | ------------------------ |
| `gd`         | 垂直分屏后跳转到定义     |
| `gt`         | 垂直分屏后跳转到类型定义 |
| `gr`         | 垂直分屏后查看引用       |
| `gi`         | 垂直分屏后跳转到实现     |
| `r`          | LSP 重命名               |
| `<leader>ca` | 代码动作                 |
| `<leader>dn` | 下一个诊断               |
| `<leader>dp` | 上一个诊断               |
| `<leader>dv` | 开关诊断虚拟行           |

## 调试快捷键

| 快捷键                   | 功能           |
| ------------------------ | -------------- |
| `<leader>du`             | 切换 DAP UI    |
| `<leader>dU`             | 重置 DAP UI    |
| `<leader>ds` / `<F5>`    | 开始或继续调试 |
| `<leader>dc`             | 运行到光标处   |
| `<leader>dq`             | 终止调试       |
| `<leader>dr`             | 重启当前调试帧 |
| `<leader>do` / `<F10>`   | Step over      |
| `<leader>di` / `<F11>`   | Step into      |
| `<leader>dO` / `<S-F11>` | Step out       |
| `<leader>db`             | 切换断点       |
| `<leader>dB`             | 设置条件断点   |
| `<leader>dD`             | 清空断点       |

## 说明

- `init.lua` 中默认启用 `neo-tree`，`nvim-tree` 目前作为备用配置保留但未加载。
- `lua/custom/appearence.lua` 默认加载图标版状态栏；如需纯文本状态栏，可改为加载 `utils.status-line-text`。
- Telescope 和 mini.pick 绑定了相同的部分搜索快捷键，后加载的 Telescope 会覆盖 mini.pick 对应映射。
