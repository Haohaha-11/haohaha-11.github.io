---
title: "第一讲：机器学习基础"
date: 2024-01-10
draft: false
tags: ["机器学习", "深度学习"]
categories: ["课程讲义"]
---

## 课程概述

本讲介绍机器学习的基本概念和核心算法。

## 主要内容

### 1. 监督学习

监督学习的目标是学习一个从输入 $X$ 到输出 $Y$ 的映射函数：

$$
f: X \rightarrow Y
$$

常见的监督学习任务包括：
- **分类**：输出是离散的类别标签
- **回归**：输出是连续的数值

### 2. 损失函数

对于回归问题，常用均方误差（MSE）：

$$
L(y, \hat{y}) = \frac{1}{n}\sum_{i=1}^{n}(y_i - \hat{y}_i)^2
$$

对于分类问题，常用交叉熵损失：

$$
L(y, \hat{y}) = -\sum_{i=1}^{n} y_i \log(\hat{y}_i)
$$

### 3. 模型评估

- **训练集**：用于训练模型
- **验证集**：用于调整超参数
- **测试集**：用于评估最终性能

## 课程讲义 PDF

下面是本讲的完整讲义，包含更多示例和练习题：

{{< pdf url="/pdfs/lecture-01.pdf" height="700px" >}}

## 课后作业

1. 实现一个简单的线性回归模型
2. 比较不同学习率对收敛速度的影响
3. 阅读参考文献中的第 1-3 章

## 参考资料

- 《机器学习》周志华
- "Pattern Recognition and Machine Learning" by Christopher Bishop
- [Coursera 机器学习课程](https://www.coursera.org/learn/machine-learning)

---

**提示**：如果 PDF 无法显示，请点击下载按钮查看完整讲义。
