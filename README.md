# 学术个人主页

基于 Hugo + PaperMod 主题构建的学术型个人网站。

## 功能特性

- ✅ 响应式设计，支持移动端和桌面端
- ✅ Profile Mode 个人形象展示
- ✅ 数学公式支持（KaTeX）
- ✅ PDF 在线预览与下载
- ✅ Giscus 评论系统
- ✅ GitHub Actions 自动部署

## 快速开始

### 1. 安装 Hugo Extended

```powershell
winget install Hugo.Hugo.Extended
```

### 2. 克隆主题

```bash
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
git submodule update --init --recursive
```

### 3. 本地预览

```bash
hugo server -D
```

访问 http://localhost:1313 查看网站。

### 4. 构建网站

```bash
hugo --minify
```

生成的静态文件在 `public/` 目录。

## 目录结构

```
.
├── content/
│   ├── posts/          # 博客文章
│   ├── notes/          # 学术讲义
│   ├── papers/         # 论文列表
│   └── about.md        # 关于页面
├── static/
│   ├── img/            # 图片资源（头像等）
│   └── pdfs/           # PDF 文件
├── layouts/
│   ├── partials/
│   │   ├── extend_head.html    # KaTeX 支持
│   │   └── comments.html       # Giscus 评论
│   └── shortcodes/
│       └── pdf.html            # PDF 预览组件
├── themes/
│   └── PaperMod/       # 主题（Git Submodule）
├── hugo.yaml           # 网站配置
└── .github/
    └── workflows/
        └── hugo.yaml   # GitHub Actions 配置
```

## 配置说明

### 个人信息配置

编辑 `hugo.yaml` 中的以下部分：

```yaml
params:
  profileMode:
    title: "Your Name"
    subtitle: "博士研究生 | 人工智能 | 计算机科学"
    imageUrl: "/img/avatar.jpg"
  
  socialIcons:
    - name: github
      url: "https://github.com/yourusername"
    - name: email
      url: "mailto:your.email@example.com"
```

### 添加头像

将头像图片放置在 `static/img/avatar.jpg`。

### 添加 PDF 讲义

1. 将 PDF 文件放在 `static/pdfs/` 目录
2. 在 Markdown 中使用 shortcode：

```markdown
{{< pdf url="/pdfs/lecture-01.pdf" height="700px" >}}
```

### 配置 Giscus 评论

1. 在 GitHub 仓库中启用 Discussions
2. 访问 https://giscus.app/zh-CN 获取配置
3. 编辑 `layouts/partials/comments.html`，替换相关参数

## GitHub Pages 部署

### 方法一：GitHub Actions（推荐）

1. 在 GitHub 仓库设置中启用 Pages
2. 选择 "GitHub Actions" 作为部署源
3. 推送代码到 `main` 分支，自动触发部署

### 方法二：手动部署

```bash
hugo --minify
cd public
git init
git add -A
git commit -m "Deploy"
git push -f git@github.com:yourusername/yourusername.github.io.git main
```

## 写作指南

### 创建新博文

```bash
hugo new posts/my-first-post.md
```

### 创建新讲义

```bash
hugo new notes/lecture-02.md
```

### Front Matter 示例

```yaml
---
title: "文章标题"
date: 2024-01-15
draft: false
tags: ["标签1", "标签2"]
categories: ["分类"]
math: true  # 启用数学公式
---
```

## 数学公式示例

行内公式：`$E=mc^2$`

独立公式块：

```markdown
$$
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}
$$
```

## 常见问题

### Q: PDF 无法显示？
A: 确保 PDF 文件路径正确，且 `hugo.yaml` 中设置了 `unsafe: true`。

### Q: 数学公式不渲染？
A: 检查 `layouts/partials/extend_head.html` 是否正确引入 KaTeX。

### Q: 主题更新？
A: 运行 `git submodule update --remote --merge`

## 参考资源

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [KaTeX 文档](https://katex.org/)
- [Giscus 文档](https://giscus.app/zh-CN)

## 许可证

MIT License
