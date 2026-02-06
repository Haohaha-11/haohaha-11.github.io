# 网站配置指南

## 第一步：安装 Hugo Extended

在 PowerShell 或命令提示符中运行：

```powershell
winget install Hugo.Hugo.Extended
```

安装完成后，重启终端或 PyCharm，然后验证安装：

```bash
hugo version
```

应该看到类似输出：`hugo v0.121.0+extended windows/amd64`

## 第二步：初始化 Git 仓库并添加主题

```bash
# 初始化 Git 仓库
git init

# 添加 PaperMod 主题作为 submodule
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

# 更新 submodule
git submodule update --init --recursive
```

## 第三步：个性化配置

### 1. 修改 `hugo.yaml` 中的个人信息

```yaml
baseURL: "https://yourusername.github.io/"  # 改为你的 GitHub Pages 地址
title: "你的名字 - 学术主页"

params:
  profileMode:
    title: "你的名字"
    subtitle: "你的职位 | 研究方向"
    imageUrl: "/img/avatar.jpg"
  
  socialIcons:
    - name: github
      url: "https://github.com/你的用户名"
    - name: email
      url: "mailto:你的邮箱@example.com"
    - name: googlescholar
      url: "https://scholar.google.com/citations?user=你的ID"
```

### 2. 添加头像

将你的头像图片（建议 300x300 像素）保存为 `static/img/avatar.jpg`

### 3. 配置 Giscus 评论系统

1. 在你的 GitHub 仓库中启用 Discussions 功能
2. 访问 https://giscus.app/zh-CN
3. 按照指引获取配置参数
4. 编辑 `layouts/partials/comments.html`，替换以下参数：
   - `data-repo="yourusername/yourrepo"`
   - `data-repo-id="YOUR_REPO_ID"`
   - `data-category-id="YOUR_CATEGORY_ID"`

## 第四步：本地预览

```bash
hugo server -D
```

打开浏览器访问 http://localhost:1313

## 第五步：添加内容

### 创建新博文

```bash
hugo new posts/my-first-post.md
```

### 创建新讲义

```bash
hugo new notes/lecture-02.md
```

### 添加 PDF 文件

1. 将 PDF 文件放在 `static/pdfs/` 目录
2. 在 Markdown 中使用：

```markdown
{{< pdf url="/pdfs/your-file.pdf" height="700px" >}}
```

## 第六步：部署到 GitHub Pages

### 方法一：使用 GitHub Actions（推荐）

1. 在 GitHub 创建新仓库（如 `yourusername.github.io`）

2. 推送代码到 GitHub：

```bash
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/yourusername.github.io.git
git push -u origin main
```

3. 在 GitHub 仓库设置中：
   - 进入 Settings > Pages
   - Source 选择 "GitHub Actions"
   - 保存设置

4. 每次推送到 `main` 分支，GitHub Actions 会自动构建和部署

### 方法二：手动部署

```bash
# 构建网站
hugo --minify

# 进入 public 目录
cd public

# 初始化 Git 并推送
git init
git add -A
git commit -m "Deploy website"
git push -f git@github.com:yourusername/yourusername.github.io.git main
```

## 常用命令

```bash
# 本地预览（包含草稿）
hugo server -D

# 本地预览（不包含草稿）
hugo server

# 构建网站
hugo

# 构建并压缩
hugo --minify

# 创建新内容
hugo new posts/article-name.md
hugo new notes/lecture-name.md

# 更新主题
git submodule update --remote --merge
```

## 目录结构说明

```
.
├── archetypes/         # 内容模板
├── content/            # 网站内容
│   ├── posts/         # 博客文章
│   ├── notes/         # 课程讲义
│   ├── papers/        # 论文列表
│   └── about.md       # 关于页面
├── layouts/           # 自定义布局
│   ├── partials/      # 部分模板
│   └── shortcodes/    # 短代码
├── static/            # 静态资源
│   ├── img/          # 图片
│   └── pdfs/         # PDF 文件
├── themes/            # 主题
│   └── PaperMod/     # PaperMod 主题
├── .github/           # GitHub Actions
│   └── workflows/
│       └── hugo.yaml
└── hugo.yaml          # 网站配置
```

## 故障排除

### 问题：Hugo 命令找不到
**解决**：重启终端或 PyCharm，确保环境变量已更新

### 问题：主题未加载
**解决**：检查 `themes/PaperMod` 目录是否存在，运行 `git submodule update --init --recursive`

### 问题：数学公式不显示
**解决**：确保 `layouts/partials/extend_head.html` 文件存在且包含 KaTeX 脚本

### 问题：PDF 无法预览
**解决**：
1. 检查 PDF 文件路径是否正确
2. 确保 `hugo.yaml` 中设置了 `markup.goldmark.renderer.unsafe: true`
3. 某些浏览器可能阻止 PDF 嵌入，尝试使用下载按钮

### 问题：GitHub Actions 部署失败
**解决**：
1. 检查仓库 Settings > Actions > General 中是否启用了 Workflow 权限
2. 确保 Settings > Pages 中选择了 "GitHub Actions" 作为部署源

## 进阶配置

### 自定义域名

1. 在 `static/` 目录创建 `CNAME` 文件，内容为你的域名：
   ```
   www.yourdomain.com
   ```

2. 在域名提供商处添加 DNS 记录：
   ```
   CNAME  www  yourusername.github.io
   ```

### 添加 Google Analytics

在 `hugo.yaml` 中添加：

```yaml
services:
  googleAnalytics:
    ID: G-XXXXXXXXXX
```

### 启用搜索功能

PaperMod 主题已内置搜索功能，在 `hugo.yaml` 中已配置。

## 参考资源

- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [KaTeX 支持的函数](https://katex.org/docs/supported.html)
- [Giscus 配置指南](https://giscus.app/zh-CN)
- [GitHub Pages 文档](https://docs.github.com/en/pages)

## 需要帮助？

如果遇到问题，可以：
1. 查看 Hugo 官方文档
2. 访问 PaperMod 主题的 GitHub Issues
3. 在你的仓库中启用 Discussions 并提问

祝你使用愉快！🎉
