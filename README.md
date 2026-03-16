
# Manufacturing Quality Analysis Using PCA

## Project Overview

In many manufacturing industries, products are produced in **batches**, often called **lots**. Sometimes these batches produce good results, and sometimes they produce poor results.

In this project, we analyze manufacturing data to understand:

- Why some batches produce **good outcomes**
- Why some batches produce **poor outcomes**
- Which material characteristics influence quality the most

To solve this problem, we use a statistical technique called **Principal Component Analysis (PCA)**.

The goal of this project is simple:

> Use data to identify which characteristics of raw materials are causing poor manufacturing outcomes.

This project demonstrates how **data science can be used to solve real engineering and manufacturing problems**.

![appleIphone](https://github.com/user-attachments/assets/a67996a3-7f7b-4a24-ba58-2222e9cfbaac)



---

# Business Problem

A manufacturing company noticed that the **quality of their product has started to decline**.

Engineers suspect that the problem may be caused by the **raw materials supplied to the factory**, but they are not sure which characteristics are responsible.

Every batch of material is tested in a laboratory. After production, an experienced engineer evaluates the final result and labels the outcome as either:

- **Adequate** → The product quality is acceptable
- **Poor** → The product quality is not acceptable

The company wants to know:

- What measurements influence product quality?
- Why do some batches fail?
- How can they improve their manufacturing process?

To answer these questions, we analyze the data using **Principal Component Analysis (PCA)**.

---

# Dataset Explanation

Each row in the dataset represents **one batch of raw material**.

The dataset contains several measurements taken from the material before it is used in production.

| Column | Description |
|------|------|
| Lot Number | Unique identifier for each batch |
| Outcome | Final result (Adequate or Poor) |
| Size 5 | Particle size measurement |
| Size 10 | Particle size measurement |
| Size 15 | Particle size measurement |
| TGA | Thermogravimetric Analysis measurement |
| DSC | Differential Scanning Calorimetry measurement |
| TMA | Thermomechanical Analysis measurement |



Simply think of these variables as **different characteristics of the raw material**.


---

# Tools Used

- R Programming Language
- Principal Component Analysis (PCA)
- Data Visualization

---

# Load the Dataset

First, we load the dataset into R.

```r
engineering_dataset <- read.csv(file.choose())
```


---

# Improve the Row Labels

Each row represents a batch of material. To make plots easier to interpret, we combine the **Lot Number** and **Outcome** into the row names.

```r
rownames(engineering_dataset) <- paste(engineering_dataset$Lot.number, '', engineering_dataset$Outcome)
```

Example row names might look like:

```
Lot12 Adequate
Lot18 Poor
```

This helps us identify which batches performed well and which performed poorly when visualizing the data.

---

# Apply Principal Component Analysis (PCA)

The dataset contains **six numerical measurements**:

- Size 5
- Size 10
- Size 15
- TGA
- DSC
- TMA

Instead of analyzing all six variables individually, we apply **Principal Component Analysis (PCA)**.


Think of PCA like **compressing information while keeping the most important patterns**.

We run PCA on the six numerical measurements.

```r
results <- prcomp(engineering_dataset[,3:8], scale = TRUE)
```


Each measurement may use **different units**. Scaling ensures that every variable contributes equally to the analysis.

---

# Determine the Number of Principal Components

PCA creates multiple **principal components**, each explaining a percentage of the variation in the dataset.

We calculate how much variance each component explains.

```r
results$sdev^2/sum(results$sdev^2)
```

Example output:

| Component | Variance Explained |
|------|------|
| PC1 | 44% |
| PC2 | 34% |
| PC3 | 14% |
| PC4 | 5% |

Since the first **three components explain most of the variation**, we focus on:

- PC1
- PC2
- PC3

---

# Interpret PCA Loadings

Loading plots show **which variables influence each principal component**.

```r
barplot(results$rotation[,1], main ="PC 1 Loading Plot")
barplot(results$rotation[,2], main ="PC 2 Loading Plot")
barplot(results$rotation[,3], main ="PC 3 Loading Plot")
```

---

## PC1 Loading Plot


<img width="747" height="553" alt="pic4" src="https://github.com/user-attachments/assets/f5030fc1-a8b4-4220-a49f-8b9b3ce0ff23" />



Interpretation:

PC1 is strongly influenced by the **Size measurements**:

- Size 5
- Size 10
- Size 15

This means that **particle size plays a major role in the dataset's variation**.

---

## PC2 Loading Plot


<img width="743" height="576" alt="pic5" src="https://github.com/user-attachments/assets/d0eb8942-88d2-4789-a46c-f30c6a001fc8" />



Interpretation:

PC2 is mainly influenced by:

- TGA
- TMA

These measurements relate to **thermal properties of the material**.

---

## PC3 Loading Plot

<img width="742" height="585" alt="6" src="https://github.com/user-attachments/assets/cd061a42-75f0-46d6-8a34-07ff35d1705b" />


Interpretation:

PC3 is mainly influenced by:

- DSC

This means another independent pattern in the dataset is related to **heat behavior of the material**.

---

# Creating the PCA Biplot

Finally, we create a **biplot** to visualize the relationship between the batches and the variables.

```r
biplot(results, scale = 0)
```

<img width="744" height="582" alt="7" src="https://github.com/user-attachments/assets/54b3e1b2-bc1a-4241-a842-315d6dc8191e" />
---

The biplot displays:

- Each batch as a point
- Each variable as an arrow showing its influence

Key observations from the plot:

- Many **Poor outcomes cluster on the left side**
- These poor batches align closely with the **Size variables**

This indicates that **particle size is strongly associated with poor outcomes**.

---

# Key Findings

The analysis reveals that:

- Particle size measurements have the strongest influence on product quality.
- Batches with certain size characteristics are more likely to produce poor outcomes.

This means that **variation in particle size is likely causing the quality problems**.

---

# Business Recommendations

To improve manufacturing quality, the company should:

1. Monitor particle size measurements closely
2. Work with suppliers to control particle size distribution
3. Reject raw material batches that fall outside acceptable size ranges

By controlling these variables, the company can likely **reduce poor outcomes and improve product quality**.

---

# Project Summary

This project demonstrates how **data science techniques can solve real-world manufacturing problems**.

Using **Principal Component Analysis (PCA)**, we discovered that:

- Particle size measurements are the strongest contributors to poor outcomes
- Controlling these measurements could significantly improve production quality

Even without engineering knowledge, data analysis can uncover insights that help businesses make better decisions.

---

# Skills Demonstrated

- Data Cleaning
- Exploratory Data Analysis
- Principal Component Analysis (PCA)
- Data Visualization
- Business Insight from Data
