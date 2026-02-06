# 🚀 快速开始指南

## 第一次使用？跟着这 5 步走！

### ✅ 步骤 1：安装 Hugo Extended

打开 PowerShell 或命令提示符，运行：

```powershell
winget install Hugo.Hugo.Extended
```

安装完成后，**重启终端或 PyCharm**。

---

### ✅ 步骤 2：初始化项目

**推荐方式**：双击运行 `init.ps1` 或在 PowerShell 中运行：

```powershell
.\init.ps1
```

这个脚本会自动：
- 初始化 Git 仓库
- 添加 PaperMod 主题
- 检查环境配置

**手动方式**（如果脚本不工作）：

```bash
git init
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
git submodule update --init --recursive
```

---

### ✅ 步骤 3：配置个人信息

编辑 `hugo.yaml` 文件，修改以下内容：

```yaml
baseURL: "https://yourusername.github.io/"  # 改成你的 GitHub Pages 地址
title: "你的名字 - 学术主页"

params:
  profileMode:
    title: "你的名字"
    subtitle: "博士研究生 | 人工智能 | 计算机科学"  # 改成你的身份
    imageUrl: "/img/avatar.jpg"
  
  socialIcons:
    - name: github
      url: "https://github.com/你的用户名"  # 改成你的 GitHub
    - name: email
      url: "mailto:你的邮箱@example.com"  # 改成你的邮箱
```

**别忘了**：将你的头像图片保存为 `static/img/avatar.jpg`

---

### ✅ 步骤 4：本地预览

**最简单方式**：双击 `start-server.bat`

**命令行方式**：

```bash
hugo server -D
```

然后在浏览器打开：http://localhost:1313

按 `Ctrl+C` 停止服务器。

---

### ✅ 步骤 5：部署到 GitHub Pages

#### 5.1 创建 GitHub 仓库

在 GitHub 上创建一个新仓库，名称建议为：`yourusername.github.io`

#### 5.2 推送代码

```bash
git add .
git commit -m "Initial commit: Hugo academic website"
git branch -M main
git remote add origin https://github.com/yourusername/yourusername.github.io.git
git push -u origin main
```

#### 5.3 启用 GitHub Pages

1. 进入仓库的 **Settings** > **Pages**
2. 在 **Source** 下拉菜单中选择 **GitHub Actions**
3. 保存设置

等待几分钟，你的网站就会自动部署到：`https://yourusername.github.io`

---

## 🎉 完成！

现在你可以：

### 📝 创建新内容

```bash
# 创建博客文章
hugo new posts/my-first-post.md

# 创建课程讲义
hugo new notes/lecture-02.md

# 创建论文页面
hugo new papers/my-paper.md
```

### 📄 添加 PDF 讲义

1. 将 PDF 文件放到 `static/pdfs/` 目录
2. 在 Markdown 中使用：

```markdown
{{< pdf url="/pdfs/lecture-01.pdf" height="700px" >}}
```

### 🔢 使用数学公式

在文章的 Front Matter 中添加 `math: true`，然后：

```markdown
行内公式：$E = mc^2$

独立公式：
$$
\nabla \cdot \mathbf{E} = \frac{\rho}{\epsilon_0}
$$
```

### 🖼️ 添加图片

将图片放到 `static/img/` 目录，然后：

```markdown
![图片描述](/img/your-image.jpg)
```

---

## 📚 更多帮助

- **详细配置**：查看 `SETUP.md`
- **项目结构**：查看 `PROJECT_STRUCTURE.md`
- **完整说明**：查看 `README.md`

---

## 🆘 遇到问题？

### Hugo 命令找不到
→ 重启终端或 PyCharm

### 主题没有加载
→ 运行 `git submodule update --init --recursive`

### 数学公式不显示
→ 确保文章开头有 `math: true`

### PDF 无法预览
→ 检查文件路径是否正确，确保在 `static/pdfs/` 目录

---

## 💡 小贴士

- 使用 `draft: false` 发布文章
- 使用 `draft: true` 保存草稿
- 每次修改后推送到 GitHub，网站会自动更新
- 本地预览时使用 `-D` 参数可以看到草稿

---

**祝你使用愉快！** 🎓✨
