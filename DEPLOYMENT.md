# 🚀 部署指南

本文档详细说明如何将 Hugo 网站部署到 GitHub Pages。

## 📋 前提条件

- ✅ 已安装 Hugo Extended
- ✅ 已安装 Git
- ✅ 拥有 GitHub 账号
- ✅ 网站在本地可以正常预览

## 🎯 部署方式对比

| 方式 | 优点 | 缺点 | 推荐度 |
|------|------|------|--------|
| **GitHub Actions** | 自动化、无需手动构建、支持自定义域名 | 需要配置 | ⭐⭐⭐⭐⭐ |
| **手动部署** | 简单直接 | 每次都要手动操作 | ⭐⭐⭐ |

## 方法一：GitHub Actions 自动部署（推荐）

### 步骤 1：创建 GitHub 仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角的 `+` → `New repository`
3. 仓库名称：
   - **个人主页**：`yourusername.github.io`（推荐）
   - **项目主页**：任意名称（如 `my-academic-site`）
4. 设置为 **Public**（公开）
5. **不要**勾选 "Add a README file"
6. 点击 **Create repository**

### 步骤 2：推送代码到 GitHub

在项目根目录打开终端，运行：

```bash
# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Hugo academic website"

# 设置主分支名称
git branch -M main

# 添加远程仓库（替换成你的仓库地址）
git remote add origin https://github.com/yourusername/yourusername.github.io.git

# 推送到 GitHub
git push -u origin main
```

### 步骤 3：配置 GitHub Pages

1. 进入你的 GitHub 仓库页面
2. 点击 **Settings**（设置）
3. 在左侧菜单找到 **Pages**
4. 在 **Source** 部分：
   - 选择 **GitHub Actions**（不是 Deploy from a branch）
5. 保存设置

### 步骤 4：等待部署完成

1. 点击仓库顶部的 **Actions** 标签
2. 你会看到一个正在运行的工作流：`Deploy Hugo site to GitHub Pages`
3. 等待几分钟，直到显示绿色的 ✅
4. 部署完成后，访问：
   - 个人主页：`https://yourusername.github.io`
   - 项目主页：`https://yourusername.github.io/repository-name`

### 步骤 5：后续更新

每次修改内容后，只需：

```bash
git add .
git commit -m "Update content"
git push
```

GitHub Actions 会自动重新构建和部署！

---

## 方法二：手动部署

### 步骤 1：构建网站

```bash
hugo --minify
```

这会在 `public/` 目录生成静态文件。

### 步骤 2：部署到 GitHub Pages

```bash
cd public
git init
git add -A
git commit -m "Deploy website"
git branch -M main
git remote add origin https://github.com/yourusername/yourusername.github.io.git
git push -f origin main
```

### 步骤 3：配置 GitHub Pages

1. 进入仓库 **Settings** > **Pages**
2. **Source** 选择 **Deploy from a branch**
3. **Branch** 选择 **main** 和 **/ (root)**
4. 保存

---

## 🌐 自定义域名（可选）

### 步骤 1：购买域名

从域名注册商（如 Namecheap、GoDaddy、阿里云等）购买域名。

### 步骤 2：配置 DNS

在域名提供商的 DNS 设置中添加以下记录：

**方式 A：使用 CNAME（推荐）**

```
类型: CNAME
名称: www
值: yourusername.github.io
```

**方式 B：使用 A 记录**

```
类型: A
名称: @
值: 185.199.108.153
值: 185.199.109.153
值: 185.199.110.153
值: 185.199.111.153
```

### 步骤 3：在 GitHub 配置自定义域名

1. 在项目根目录创建 `static/CNAME` 文件
2. 文件内容为你的域名：
   ```
   www.yourdomain.com
   ```
3. 推送到 GitHub：
   ```bash
   git add static/CNAME
   git commit -m "Add custom domain"
   git push
   ```

4. 在 GitHub 仓库 **Settings** > **Pages** 中：
   - 在 **Custom domain** 输入你的域名
   - 勾选 **Enforce HTTPS**
   - 保存

### 步骤 4：更新 hugo.yaml

```yaml
baseURL: "https://www.yourdomain.com/"
```

---

## 🔧 GitHub Actions 配置说明

项目中的 `.github/workflows/hugo.yaml` 文件配置了自动部署流程：

### 工作流程

1. **触发条件**：推送到 `main` 分支时自动运行
2. **构建步骤**：
   - 安装 Hugo Extended
   - 检出代码（包括 submodules）
   - 构建网站
   - 上传构建产物
3. **部署步骤**：
   - 部署到 GitHub Pages

### 自定义配置

如果需要修改 Hugo 版本，编辑 `.github/workflows/hugo.yaml`：

```yaml
env:
  HUGO_VERSION: 0.121.0  # 修改这里
```

---

## 📊 部署状态检查

### 查看部署日志

1. 进入 GitHub 仓库
2. 点击 **Actions** 标签
3. 点击最近的工作流运行
4. 查看详细日志

### 常见部署状态

| 状态 | 图标 | 说明 |
|------|------|------|
| 成功 | ✅ | 部署完成，网站已更新 |
| 进行中 | 🟡 | 正在构建和部署 |
| 失败 | ❌ | 部署出错，查看日志 |

---

## 🐛 常见问题

### Q1: 推送代码后网站没有更新

**解决方案**：
1. 检查 Actions 是否成功运行
2. 清除浏览器缓存
3. 等待 5-10 分钟（DNS 传播需要时间）

### Q2: GitHub Actions 失败

**可能原因**：
- Hugo 版本不兼容
- 主题 submodule 未正确加载
- 配置文件有语法错误

**解决方案**：
1. 查看 Actions 日志中的错误信息
2. 确保本地 `hugo server` 可以正常运行
3. 检查 `.github/workflows/hugo.yaml` 配置

### Q3: 404 错误

**解决方案**：
1. 确认 GitHub Pages 已启用
2. 检查 `baseURL` 配置是否正确
3. 确认仓库是 Public（公开）

### Q4: 样式丢失或主题未加载

**解决方案**：
1. 确保主题 submodule 已正确添加：
   ```bash
   git submodule update --init --recursive
   ```
2. 检查 `hugo.yaml` 中 `theme: PaperMod` 配置
3. 推送时确保包含 `.gitmodules` 文件

### Q5: 自定义域名不工作

**解决方案**：
1. 检查 DNS 配置是否正确
2. 等待 DNS 传播（可能需要 24-48 小时）
3. 确保 `static/CNAME` 文件存在且内容正确
4. 在 GitHub Pages 设置中启用 HTTPS

---

## 🔐 安全建议

### 1. 保护敏感信息

不要在代码中包含：
- API 密钥
- 密码
- 个人身份信息

### 2. 使用 SSH 密钥

推荐使用 SSH 而不是 HTTPS 推送代码：

```bash
git remote set-url origin git@github.com:yourusername/yourrepo.git
```

### 3. 启用 HTTPS

在 GitHub Pages 设置中勾选 **Enforce HTTPS**。

---

## 📈 性能优化

### 1. 启用压缩

在 `hugo.yaml` 中：

```yaml
minify:
  minifyOutput: true
```

### 2. 优化图片

- 使用 WebP 格式
- 压缩图片大小
- 使用适当的分辨率

### 3. 使用 CDN

考虑使用 Cloudflare 等 CDN 服务加速访问。

---

## 📚 参考资源

- [GitHub Pages 官方文档](https://docs.github.com/en/pages)
- [GitHub Actions 文档](https://docs.github.com/en/actions)
- [Hugo 部署文档](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
- [自定义域名配置](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

---

## 🎯 部署检查清单

部署前确认：

- [ ] Hugo 本地预览正常
- [ ] 所有内容文件 `draft: false`
- [ ] `hugo.yaml` 中 `baseURL` 正确
- [ ] 头像文件 `static/img/avatar.jpg` 存在
- [ ] Git 仓库已初始化
- [ ] 主题 submodule 已添加
- [ ] `.github/workflows/hugo.yaml` 文件存在
- [ ] 代码已推送到 GitHub
- [ ] GitHub Pages 已启用
- [ ] Actions 工作流运行成功

---

**祝你部署顺利！** 🚀
