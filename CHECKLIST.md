# ✅ 项目配置检查清单

使用这个清单确保你的网站配置完整。

## 📦 环境准备

- [ ] 已安装 Hugo Extended（运行 `hugo version` 检查）
- [ ] 已安装 Git（运行 `git --version` 检查）
- [ ] 已安装 PowerShell 或命令提示符
- [ ] 拥有 GitHub 账号

## 🎬 项目初始化

- [ ] 已运行 `init.ps1` 或手动初始化 Git
- [ ] 已添加 PaperMod 主题（`themes/PaperMod` 目录存在）
- [ ] 已更新 Git Submodules（运行 `git submodule update --init --recursive`）
- [ ] 本地可以运行 `hugo server -D`

## ⚙️ 基础配置

### hugo.yaml 配置

- [ ] 修改 `baseURL` 为你的 GitHub Pages 地址
- [ ] 修改 `title` 为你的网站标题
- [ ] 修改 `languageCode`（如需要）
- [ ] 检查 `theme: PaperMod` 配置正确

### 个人信息配置

- [ ] 修改 `params.profileMode.title`（你的名字）
- [ ] 修改 `params.profileMode.subtitle`（你的身份描述）
- [ ] 修改 `params.profileMode.imageUrl`（头像路径）
- [ ] 修改 `params.author`（作者名）

### 社交链接配置

- [ ] 配置 GitHub 链接
- [ ] 配置 Email 地址
- [ ] 配置 Google Scholar（如有）
- [ ] 添加其他社交平台（可选）

## 📁 静态资源

- [ ] 添加头像图片到 `static/img/avatar.jpg`
- [ ] 准备 PDF 文件放到 `static/pdfs/`（如有）
- [ ] 准备其他图片资源到 `static/img/`（如有）

## 📝 内容创建

### 必需内容

- [ ] 编辑 `content/about.md`（关于页面）
- [ ] 至少创建一篇博客文章
- [ ] 设置文章 `draft: false` 以发布

### 可选内容

- [ ] 创建课程讲义（`content/notes/`）
- [ ] 添加论文列表（`content/papers/`）
- [ ] 添加 PDF 讲义文件
- [ ] 创建更多博客文章

## 🧪 本地测试

- [ ] 运行 `hugo server -D` 成功
- [ ] 在浏览器访问 http://localhost:1313 正常
- [ ] 检查首页 Profile 显示正确
- [ ] 检查头像显示正常
- [ ] 检查菜单导航工作正常
- [ ] 检查博客文章显示正常
- [ ] 检查数学公式渲染正常（如有）
- [ ] 检查 PDF 预览功能（如有）
- [ ] 检查移动端显示（调整浏览器窗口大小）
- [ ] 检查深色/浅色主题切换

## 🔧 高级功能测试

### 数学公式

- [ ] 创建包含数学公式的测试文章
- [ ] 确认行内公式 `$...$` 渲染正常
- [ ] 确认独立公式 `$$...$$` 渲染正常
- [ ] 检查复杂公式显示正确

### PDF 预览

- [ ] 添加测试 PDF 文件到 `static/pdfs/`
- [ ] 在文章中使用 `{{< pdf url="/pdfs/test.pdf" >}}`
- [ ] 确认 PDF 在线预览工作
- [ ] 确认下载按钮工作
- [ ] 测试移动端 PDF 显示

### 评论系统（可选）

- [ ] 在 GitHub 仓库启用 Discussions
- [ ] 访问 https://giscus.app/zh-CN 获取配置
- [ ] 编辑 `layouts/partials/comments.html`
- [ ] 填入正确的 `data-repo`
- [ ] 填入正确的 `data-repo-id`
- [ ] 填入正确的 `data-category-id`
- [ ] 测试评论功能

## 🚀 GitHub 部署

### 仓库设置

- [ ] 在 GitHub 创建新仓库
- [ ] 仓库名称正确（建议 `yourusername.github.io`）
- [ ] 仓库设置为 Public（公开）

### 代码推送

- [ ] 运行 `git add .`
- [ ] 运行 `git commit -m "Initial commit"`
- [ ] 运行 `git branch -M main`
- [ ] 添加远程仓库 `git remote add origin ...`
- [ ] 推送代码 `git push -u origin main`
- [ ] 确认代码已上传到 GitHub

### GitHub Pages 配置

- [ ] 进入仓库 Settings > Pages
- [ ] Source 选择 "GitHub Actions"
- [ ] 保存设置

### GitHub Actions

- [ ] 检查 `.github/workflows/hugo.yaml` 文件存在
- [ ] 进入仓库 Actions 标签
- [ ] 确认工作流已触发
- [ ] 等待工作流完成（绿色 ✅）
- [ ] 检查是否有错误（红色 ❌）

### 网站访问

- [ ] 访问 `https://yourusername.github.io`
- [ ] 确认网站可以正常访问
- [ ] 检查所有页面正常显示
- [ ] 检查图片和资源加载正常
- [ ] 检查链接工作正常

## 🔐 安全与隐私

- [ ] 检查 `.gitignore` 文件正确
- [ ] 确认没有提交敏感信息
- [ ] 确认没有提交大文件（>100MB）
- [ ] 检查 Email 地址是否正确
- [ ] 考虑是否需要隐藏某些信息

## 📊 SEO 优化（可选）

- [ ] 添加网站描述（`params.description`）
- [ ] 为文章添加 `summary` 字段
- [ ] 使用描述性的文章标题
- [ ] 添加相关标签和分类
- [ ] 考虑添加 Google Analytics（可选）

## 🎨 自定义样式（可选）

- [ ] 考虑修改主题颜色
- [ ] 添加自定义 CSS（如需要）
- [ ] 添加自定义 JavaScript（如需要）
- [ ] 自定义 favicon（网站图标）

## 📱 移动端优化

- [ ] 在手机浏览器测试
- [ ] 检查响应式布局
- [ ] 检查触摸操作
- [ ] 检查 PDF 在移动端显示
- [ ] 检查菜单在移动端工作

## 🔄 持续维护

### 定期检查

- [ ] 定期更新 Hugo 版本
- [ ] 定期更新 PaperMod 主题
- [ ] 检查链接有效性
- [ ] 备份重要内容
- [ ] 监控网站性能

### 内容更新

- [ ] 定期发布新文章
- [ ] 更新个人信息
- [ ] 更新论文列表
- [ ] 回复评论（如有）

## 📚 文档阅读

- [ ] 阅读 `QUICK_START.md`
- [ ] 阅读 `SETUP.md`
- [ ] 阅读 `DEPLOYMENT.md`
- [ ] 阅读 `PROJECT_STRUCTURE.md`
- [ ] 阅读 `FEATURES.md`
- [ ] 阅读 `README.md`

## 🎓 学习资源

- [ ] 浏览 Hugo 官方文档
- [ ] 浏览 PaperMod 主题文档
- [ ] 学习 Markdown 语法
- [ ] 学习 KaTeX 数学公式
- [ ] 了解 GitHub Actions

## 🐛 故障排除

如果遇到问题，检查：

- [ ] Hugo 版本是否为 Extended
- [ ] Git Submodules 是否正确初始化
- [ ] `hugo.yaml` 配置是否有语法错误
- [ ] 文件路径是否正确
- [ ] 图片和 PDF 文件是否存在
- [ ] GitHub Actions 日志中的错误信息

## ✨ 完成！

当所有必需项都完成后，你的学术网站就可以正式上线了！

---

**提示**：
- ✅ 表示已完成
- ⬜ 表示未完成
- 必需项必须完成
- 可选项根据需要完成

**建议顺序**：
1. 环境准备 → 项目初始化
2. 基础配置 → 静态资源
3. 内容创建 → 本地测试
4. GitHub 部署 → 网站访问
5. 持续维护

祝你配置顺利！🎉
