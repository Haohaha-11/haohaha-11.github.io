# PDF 文件目录

请将课程讲义、论文等 PDF 文件放置在此目录。

## 示例文件

- `lecture-01.pdf` - 第一讲讲义
- `lecture-02.pdf` - 第二讲讲义
- `paper-2024.pdf` - 研究论文

## 使用方法

在 Markdown 中嵌入 PDF：

```markdown
{{< pdf url="/pdfs/lecture-01.pdf" height="700px" >}}
```

参数说明：
- `url`: PDF 文件路径（必需）
- `height`: 预览器高度（可选，默认 600px）
