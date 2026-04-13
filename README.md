# 学术个人主页

基于 Hugo + `heyo` 主题构建的个人学术站点，当前仓库已经统一到 `heyo` 这一套模板与配置。

## 当前特性

- 响应式布局，适配桌面端和移动端
- 左侧固定个人资料栏与导航菜单
- 数学公式支持，可在 `MathJax` 和 `KaTeX` 之间切换
- PDF 讲义内嵌预览与下载
- GitHub Pages 自动部署

## 快速开始

### 1. 安装 Hugo Extended

```bash
hugo version
```

如果本机还没有 Hugo，请先安装 Hugo Extended。

### 2. 本地预览

```bash
hugo server -D
```

Windows 下也可以直接运行：

```bat
start.bat
```

默认访问地址是 `http://localhost:1313`。

### 3. 构建站点

```bash
hugo --minify
```

构建结果输出到 `public/`。

## 目录结构

```text
.
├── archetypes/              # hugo new 使用的默认 front matter 模板
├── content/
│   ├── _index.md            # 首页内容
│   ├── about.md             # 关于页面
│   ├── posts/               # 博文
│   ├── notes/               # 讲义
│   └── papers/              # 论文
├── layouts/
│   ├── partials/            # 对 heyo 主题的局部覆盖
│   └── shortcodes/
│       └── pdf.html         # PDF 预览 shortcode
├── static/
│   ├── css/custom.css       # 自定义样式
│   ├── img/                 # 图片资源
│   └── pdfs/                # PDF 资源
├── themes/heyo/             # 当前使用的主题源码
├── hugo.toml                # 站点主配置
└── .github/workflows/       # GitHub Pages 部署工作流
```

## 常用修改点

### 站点配置

主配置文件是 `hugo.toml`，常见字段包括：

- `params.title` / `params.description`
- `params.profilePicture`
- `params.socialIcons`
- `params.math`
- `menu.main`

### 添加 PDF 讲义

1. 把 PDF 放到 `static/pdfs/`
2. 在 Markdown 中引用 shortcode：

```markdown
{{< pdf url="/pdfs/lecture-01.pdf" height="700px" >}}
```

### 新建内容

```bash
hugo new posts/my-first-post.md
hugo new notes/lecture-02.md
hugo new papers/my-paper.md
```

## 部署

仓库内已经提供 GitHub Pages 工作流，推送到 `master` 或 `main` 会自动触发构建与部署。首次使用时需要在仓库的 Pages 设置中将 Source 设为 `GitHub Actions`。

## 说明

- 当前数学公式由主题自带的 `math.html` partial 处理，不再依赖额外的 `extend_head.html`
- 当前仓库没有接入评论系统；如需添加，建议在 `heyo` 模板基础上单独接线
- `themes/heyo` 当前是直接放在仓库里的主题源码，不是 Git submodule

## 参考

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [heyo 主题仓库](https://github.com/LucasVadilho/heyo-hugo-theme)
