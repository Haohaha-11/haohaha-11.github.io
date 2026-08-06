---
title: "Lecture 01: Foundations of Machine Learning"
date: 2024-01-10
summary: "Supervised learning, loss functions, and model evaluation."
---

## Overview
This note introduces the basic concepts and core algorithms of machine learning.

## Contents

### 1. Supervised Learning
Supervised learning aims to learn a mapping from inputs $X$ to outputs $Y$:
$$ f: X \rightarrow Y $$
Common tasks:
- **Classification** — discrete class labels
- **Regression** — continuous values

### 2. Loss Functions
Mean Squared Error (MSE) for regression:
$$ L(y, \hat{y}) = \frac{1}{n}\sum_{i=1}^{n}(y_i - \hat{y}_i)^2 $$
Cross-entropy for classification:
$$ L(y, \hat{y}) = -\sum_{i=1}^{n} y_i \log(\hat{y}_i) $$

### 3. Model Evaluation
- **Training set** — fit the model
- **Validation set** — tune hyper-parameters
- **Test set** — measure final performance

## References
- *Machine Learning*, Zhi-Hua Zhou
- *Pattern Recognition and Machine Learning*, Christopher Bishop
