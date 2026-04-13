---
title: "数学公式测试 - 梯度下降与波动方程"
date: 2024-01-15
draft: false
tags: ["数学", "机器学习", "物理"]
categories: ["技术博客"]
math: true
showToc: true
summary: "用机器学习和物理学中的典型公式测试站点的数学排版效果。"
---

## 机器学习中的梯度下降

梯度下降是优化算法的核心。给定损失函数 $L(\theta)$，参数更新规则为：

$$
\theta_{t+1} = \theta_t - \eta \nabla_\theta L(\theta_t)
$$

其中 $\eta$ 是学习率，$\nabla_\theta L(\theta_t)$ 是损失函数对参数的梯度。

### 随机梯度下降 (SGD)

对于包含 $n$ 个样本的数据集，批量梯度下降的更新公式为：

$$
\nabla_\theta L(\theta) = \frac{1}{n} \sum_{i=1}^{n} \nabla_\theta L_i(\theta)
$$

而 SGD 每次只使用一个样本：

$$
\theta_{t+1} = \theta_t - \eta \nabla_\theta L_i(\theta_t)
$$

### Adam 优化器

Adam 结合了动量和自适应学习率：

$$
\begin{aligned}
m_t &= \beta_1 m_{t-1} + (1-\beta_1) g_t \\
v_t &= \beta_2 v_{t-1} + (1-\beta_2) g_t^2 \\
\hat{m}_t &= \frac{m_t}{1-\beta_1^t} \\
\hat{v}_t &= \frac{v_t}{1-\beta_2^t} \\
\theta_t &= \theta_{t-1} - \frac{\eta}{\sqrt{\hat{v}_t} + \epsilon} \hat{m}_t
\end{aligned}
$$

## 物理学中的波动方程

一维波动方程描述了波的传播：

$$
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}
$$

其中 $u(x,t)$ 是位移，$c$ 是波速。

### 达朗贝尔解

通解可以表示为：

$$
u(x,t) = f(x-ct) + g(x+ct)
$$

### 能量守恒

波动方程的能量密度为：

$$
E = \frac{1}{2}\rho \left[\left(\frac{\partial u}{\partial t}\right)^2 + c^2\left(\frac{\partial u}{\partial x}\right)^2\right]
$$

## 深度学习中的反向传播

考虑一个简单的神经网络，损失函数对权重的梯度通过链式法则计算：

$$
\frac{\partial L}{\partial w_{ij}^{(l)}} = \frac{\partial L}{\partial a_j^{(l)}} \cdot \frac{\partial a_j^{(l)}}{\partial z_j^{(l)}} \cdot \frac{\partial z_j^{(l)}}{\partial w_{ij}^{(l)}}
$$

其中：
- $z_j^{(l)} = \sum_i w_{ij}^{(l)} a_i^{(l-1)} + b_j^{(l)}$ 是加权和
- $a_j^{(l)} = \sigma(z_j^{(l)})$ 是激活值
- $\sigma$ 是激活函数

## 贝叶斯定理

在概率论中，贝叶斯定理表述为：

$$
P(A|B) = \frac{P(B|A) \cdot P(A)}{P(B)}
$$

在机器学习中，我们常用它来进行参数推断：

$$
P(\theta|D) = \frac{P(D|\theta) \cdot P(\theta)}{P(D)}
$$

其中 $D$ 是观测数据，$\theta$ 是模型参数。

---

这篇文章展示了站点中的数学公式渲染效果，包括行内公式 $E=mc^2$ 和独立公式块。
