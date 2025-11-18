# Course Exercises

## Exercise 1: Data Quality Assessment and Preprocessing Planning

**Location**: After viewing the ydata-profiling report in `01_eda_cpt.ipynb`  
**Time**: 15 minutes  
**Format**: Group discussion or individual reflection

### Task

Based on the ydata-profiling report you just viewed, identify which values or ranges should be removed from each feature during preprocessing. Consider:

1. **Physical impossibilities**: Which values are not physically possible for CPT measurements?
2. **Measurement errors**: Are there obvious outliers that suggest measurement issues?
3. **Data quality**: Which ranges indicate poor data quality?

### Questions to Consider

For each of the following features, determine if there are values that should be filtered out:

- **qc (MPa)** - Cone resistance
- **fs (kPa)** - Sleeve friction
- **Rf (%)** - Friction ratio
- **u0 (kPa)** - Pore water pressure
- **Qtn (-)** - Normalized cone resistance
- **Fr (%)** - Normalized friction ratio

### Guiding Questions

1. Can cone resistance (`qc`) be zero or negative? What would that mean physically?
2. What about pore water pressure (`u0`) - can it be negative?
3. Are there any extreme values in `fs` that seem unrealistic for geotechnical measurements?
4. Look at the distribution plots - do you see any obvious outliers?
5. Should we keep or remove class 0 in `Oberhollenzer_classes`? Why?

### Deliverable

Write down your suggested filtering rules for each feature. Format:
```python
# Example:
df = df[df["feature_name"] > threshold_value]
df = df[(df["feature_name"] > min_value) & (df["feature_name"] < max_value)]
```

**After 10 minutes**, we will discuss your suggestions and then review the actual preprocessing implementation in the notebook.

---

## Exercise 2: Train a Decision Tree Model

**Location**: After the KNN model example in `03_training_evaluation.ipynb`  
**Time**: 15 minutes  
**Format**: Individual coding exercise

### Task

Train a Decision Tree classifier on the CPT dataset and evaluate its performance. Compare the results with the KNN model we just saw.

### Instructions

1. **Import the necessary libraries**:
   - `DecisionTreeClassifier` from `sklearn.tree`
   - Reuse the classification metrics we've been using

2. **Train a Decision Tree model**:
   - Use the same training data (`X_train`, `y_train`)
   - Set `random_state=42` for reproducibility
   - You can start with default hyperparameters

3. **Make predictions** on the test set (`X_test`)

4. **Evaluate the model** using `classification_report`

5. **Bonus questions** (if you finish early):
   - Do Decision Trees require feature scaling? Why or why not?
   - Try different values for `max_depth` parameter (e.g., 5, 10, 15, None). How does it affect performance?
   - How does the Decision Tree compare to KNN in terms of performance and training time?

### Code Template

```python
from sklearn.tree import DecisionTreeClassifier

# Your code here:
# 1. Create a DecisionTreeClassifier
# 2. Train it on X_train, y_train
# 3. Make predictions on X_test
# 4. Print the classification report
```

### Expected Output

Your classification report should show precision, recall, and F1-scores for each soil class. Compare these metrics with the KNN results.

### Discussion Points

After completing the exercise, we will discuss:
- How Decision Trees differ from KNN in their approach to classification
- The advantages and disadvantages of Decision Trees
- Why we don't need to scale features for tree-based models
- The risk of overfitting with deep trees

---

## Exercise 3: Data Leakage Demonstration

Part 1 (in 01_eda_cpt.ipynb): create a "leaky" split by using standard train_test_split() without grouping by drillhole IDs, then verify that many drillholes are split between train and test sets.

Part 2 (in 03_training_evaluation.ipynb): train the same KNN model on the leaky data and compare metrics with the properly split data.

Key Learning Points:

Demonstrates how data leakage inflates performance metrics (typically 10-20%+ improvement)
Shows why domain knowledge matters in ML (spatially correlated data)
Emphasizes real-world consequences of overoptimistic model evaluation
Includes verification code to check for shared drillhole IDs
Requires written analysis comparing both approaches
The exercise is positioned as the final one, providing a powerful demonstration of why the ID-based splitting method we showed earlier is essential for this type of data.
