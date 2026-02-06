# 项目结构说明

## 📁 完整目录树

```
.
├── .github/
│   └── workflows/
│       └── hugo.yaml              # GitHub Actions 自动部署配置
├── archetypes/
│   └── default.md                 # 新内容的默认模板
├── content/                       # 网站内容目录
│   ├── notes/                     # 课程讲义
│   │   ├── _index.md             # 讲义列表页
│   │   └── lecture-01.md         # 示例讲义（含 PDF 嵌入）
│   ├── papers/                    # 研究论文
│   │   ├── _index.md             # 论文列表页
│   │   └── paper-template.md     # 论文模板
│   ├── posts/                     # 博客文章
│   │   ├── _index.md             # 博客列表页
│   │   ├── welcome.md            # 欢迎文章
│   │   └── test-math.md          # 数学公式测试文章
│   └── about.md                   # 关于页面
├── layouts/                       # 自定义布局
│   ├── partials/
│   │   ├── extend_head.html      # KaTeX 数学公式支持
│   │   └── comments.html         # Giscus 评论系统
│   └── shortcodes/
│       └── pdf.html              # PDF 预览组件
├── static/                        # 静态资源
│   ├── img/                      # 图片资源
│   │   └── README.md             # 使用说明（请在此放置 avatar.jpg）
│   └── pdfs/                     # PDF 文件
│       └── README.md             # 使用说明
├── themes/                        # 主题目录
│   └── PaperMod/                 # PaperMod 主题（Git Submodule）
├── .gitignore                     # Git 忽略文件
├── hugo.yaml                      # Hugo 主配置文件
├── init.ps1                       # PowerShell 初始化脚本
├── build.bat                      # Windows 构建脚本
├── start-server.bat              # Windows 启动服务器脚本
├── README.md                      # 项目说明文档
├── SETUP.md                       # 详细配置指南
└── PROJECT_STRUCTURE.md          # 本文件
```

## 🎯 核心文件说明

### 配置文件

| 文件 | 说明 |
|------|------|
| `hugo.yaml` | 网站主配置，包含站点信息、菜单、主题参数等 |
| `.github/workflows/hugo.yaml` | GitHub Actions 自动部署配置 |
| `.gitignore` | Git 版本控制忽略规则 |

### 内容文件

| 目录/文件 | 说明 |
|-----------|------|
| `content/posts/` | 博客文章目录 |
| `content/notes/` | 课程讲义目录 |
| `content/papers/` | 研究论文目录 |
| `content/about.md` | 个人简介页面 |

### 布局文件

| 文件 | 功能 |
|------|------|
| `layouts/partials/extend_head.html` | 引入 KaTeX 数学公式渲染库 |
| `layouts/partials/comments.html` | Giscus 评论系统集成 |
| `layouts/shortcodes/pdf.html` | PDF 在线预览组件 |

### 静态资源

| 目录 | 用途 |
|------|------|
| `static/img/` | 存放图片（头像、插图等） |
| `static/pdfs/` | 存放 PDF 文件（讲义、论文等） |

### 脚本文件

| 文件 | 用途 |
|------|------|
| `init.ps1` | PowerShell 初始化脚本（推荐） |
| `start-server.bat` | 快速启动开发服务器 |
| `build.bat` | 快速构建网站 |

## 🚀 快速开始流程

### 1. 安装 Hugo

```powershell
winget install Hugo.Hugo.Extended
```

### 2. 初始化项目

**方法 A：使用 PowerShell 脚本（推荐）**
```powershell
.\init.ps1
```

**方法 B：手动执行**
```bash
git init
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
git submodule update --init --recursive
```

### 3. 个性化配置

1. 编辑 `hugo.yaml`：
   - 修改 `baseURL`
   - 修改 `title`
   - 修改 `params.profileMode` 中的个人信息
   - 修改 `params.socialIcons` 中的社交链接

2. 添加头像：
   - 将头像图片保存为 `static/img/avatar.jpg`

3. 配置评论系统（可选）：
   - 编辑 `layouts/partials/comments.html`
   - 按照 SETUP.md 中的说明配置 Giscus

### 4. 本地预览

**方法 A：双击运行**
```
start-server.bat
```

**方法 B：命令行**
```bash
hugo server -D
```

访问 http://localhost:1313

### 5. 创建内容

```bash
# 创建博客文章
hugo new posts/my-article.md

# 创建课程讲义
hugo new notes/lecture-02.md

# 创建论文页面
hugo new papers/my-paper.md
```

### 6. 构建网站

**方法 A：双击运行**
```
build.bat
```

**方法 B：命令行**
```bash
hugo --minify
```

### 7. 部署到 GitHub Pages

1. 在 GitHub 创建仓库
2. 推送代码：
   ```bash
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/yourrepo.git
   git push -u origin main
   ```
3. 在仓库设置中启用 GitHub Pages（选择 GitHub Actions）

## 📝 内容创作指南

### 博客文章模板

```markdown
---
title: "文章标题"
date: 2024-01-15
draft: false
tags: ["标签1", "标签2"]
categories: ["分类"]
math: true  # 如果需要数学公式
---

文章内容...
```

### 讲义模板（含 PDF）

```markdown
---
title: "第 X 讲：主题"
date: 2024-01-15
draft: false
tags: ["课程", "主题"]
---

## 讲义内容

文字说明...

## PDF 讲义

{{< pdf url="/pdfs/lecture-X.pdf" height="700px" >}}
```

### 数学公式

```markdown
行内公式：$E = mc^2$

独立公式块：
$$
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}
$$
```

### 图片插入

```markdown
![图片描述](/img/your-image.jpg)
```

## 🔧 常见任务

### 更新主题

```bash
git submodule update --remote --merge
```

### 清理构建缓存

```bash
hugo --gc
```

### 查看草稿

```bash
hugo server -D
```

### 构建生产版本

```bash
hugo --minify
```

## 📚 参考文档

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [KaTeX 文档](https://katex.org/)
- [Markdown 语法](https://www.markdownguide.org/)
- [GitHub Pages 文档](https://docs.github.com/en/pages)

## 🎨 自定义建议

### 修改配色

编辑 `hugo.yaml`，添加：

```yaml
params:
  assets:
    theme_color: "#your-color"
```

### 添加自定义 CSS

创建 `assets/css/extended/custom.css`

### 添加自定义 JavaScript

创建 `assets/js/extended/custom.js`

## ⚠️ 注意事项

1. **头像路径**：确保 `static/img/avatar.jpg` 存在
2. **PDF 路径**：PDF 文件必须放在 `static/pdfs/` 目录
3. **数学公式**：需要在 Front Matter 中设置 `math: true`
4. **草稿状态**：`draft: true` 的文章不会在生产环境显示
5. **主题更新**：更新主题前建议备份自定义修改

## 🐛 故障排除

### Hugo 命令找不到
- 重启终端或 PyCharm
- 检查环境变量

### 主题未加载
- 运行 `git submodule update --init --recursive`

### 数学公式不显示
- 检查 `layouts/partials/extend_head.html` 是否存在
- 确保文章 Front Matter 中有 `math: true`

### PDF 无法预览
- 检查 `hugo.yaml` 中 `markup.goldmark.renderer.unsafe: true`
- 检查 PDF 文件路径是否正确
- 尝试使用下载按钮

## 📞 获取帮助

如果遇到问题：
1. 查看 `SETUP.md` 详细配置指南
2. 查看 `README.md` 项目说明
3. 访问 Hugo 官方文档
4. 在 GitHub 仓库提 Issue

---

**最后更新**: 2024-01-17
