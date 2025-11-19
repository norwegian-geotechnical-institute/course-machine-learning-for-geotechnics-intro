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

**Location**: Split between `01_eda_cpt.ipynb` (Part 1) and `03_training_evaluation.ipynb` (Part 2)  
**Time**: 25 minutes  
**Format**: Individual coding exercise with group discussion

### Task

Demonstrate the impact of data leakage by comparing two train/test split approaches:
1. **Leaky split**: Using standard `train_test_split()` without respecting drillhole IDs
2. **Proper split**: Using ID-based splitting to prevent data leakage

This exercise shows why domain knowledge is critical in machine learning and how data leakage can lead to overoptimistic model evaluations.

### Part 1: Creating a Leaky Split (in `01_eda_cpt.ipynb`)

**Instructions:**

1. **Create a leaky train/test split**:
   - Use standard `train_test_split()` on the cleaned dataset
   - Split ratio: 75% train, 25% test
   - Set `random_state=42` for reproducibility

2. **Verify the data leakage**:
   - Check how many unique drillhole IDs (`CPT_ID`) are in the training set
   - Check how many unique drillhole IDs are in the test set
   - Find the overlap: which drillhole IDs appear in BOTH train and test sets?
   - Calculate the percentage of drillholes that are split across both sets

3. **Save the leaky datasets**:
   ```python
   dataset_train_leaky.csv
   dataset_test_leaky.csv
   ```

**Code Template:**

```python
from sklearn.model_selection import train_test_split

# 1. Create leaky split (ignoring CPT_ID)
df_train_leaky, df_test_leaky = train_test_split(
    df_cleaned, 
    test_size=0.25, 
    random_state=42
)

# 2. Check for leakage
train_ids = set(df_train_leaky["CPT_ID"].unique())
test_ids = set(df_test_leaky["CPT_ID"].unique())
shared_ids = train_ids.intersection(test_ids)

print(f"Training set: {len(train_ids)} unique drillholes")
print(f"Test set: {len(test_ids)} unique drillholes")
print(f"Shared drillholes: {len(shared_ids)}")
print(f"Percentage of drillholes split: {len(shared_ids)/len(train_ids.union(test_ids))*100:.1f}%")

# 3. Save the datasets
# Your code here
```

### Part 2: Comparing Model Performance (in `03_training_evaluation.ipynb`)

**Instructions:**

1. **Load the leaky datasets** from Part 1

2. **Train the same KNN model** (k=5) on the leaky training data:
   - Use the same imblearn pipeline with StandardScaler, RandomUnderSampler, and SMOTE
   - Use the same features and target variable

3. **Evaluate on the leaky test set**:
   - Make predictions
   - Generate a classification report
   - Calculate the overall accuracy

4. **Compare results**:
   - Create a comparison table showing metrics from:
     - **Proper split** (from earlier in the notebook)
     - **Leaky split** (from this exercise)
   - Calculate the difference in performance

5. **Write your analysis** (2-3 paragraphs):
   - Why are the metrics higher with the leaky split?
   - What real-world problem does this represent?
   - Why is the ID-based split method essential for CPT data?

**Code Template:**

```python
# 1. Load leaky datasets
df_train_leaky = pd.read_csv("data/model_ready/dataset_train_leaky.csv")
df_test_leaky = pd.read_csv("data/model_ready/dataset_test_leaky.csv")

# 2. Prepare features and target
X_train_leaky = df_train_leaky[FEATURES]
y_train_leaky = df_train_leaky[LABELS]
X_test_leaky = df_test_leaky[FEATURES]
y_test_leaky = df_test_leaky[LABELS]

# 3. Train KNN model (same pipeline as before)
# Your code here

# 4. Generate predictions and classification report
# Your code here

# 5. Create comparison table
comparison = pd.DataFrame({
    "Split Method": ["Proper (ID-based)", "Leaky (random)"],
    "Accuracy": [proper_accuracy, leaky_accuracy],
    "Macro Avg F1": [proper_f1, leaky_f1]
})
print(comparison)
```

### Expected Results

You should observe:
- **10-20% improvement** in metrics with the leaky split
- **Many drillholes split** between train and test (typically 60-80% overlap)
- **Artificially inflated performance** due to data leakage

### Discussion Points

After completing the exercise, we will discuss:

1. **What is data leakage?**
   - How does it occur in geotechnical data?
   - Why are measurements from the same drillhole correlated?

2. **Why are metrics inflated?**
   - The model sees very similar data in both train and test
   - Spatial autocorrelation in CPT measurements

3. **Real-world consequences:**
   - Overconfident model deployment
   - Poor performance on truly new boreholes
   - Loss of stakeholder trust

4. **Prevention strategies:**
   - Always use ID-based splitting for grouped data
   - Understand your data structure before splitting
   - Document your splitting methodology

### Key Learning Points

- **Data leakage inflates performance metrics** (typically 10-20%+ improvement)
- **Domain knowledge matters in ML** - understanding spatial correlation in CPT data is crucial
- **Real-world consequences** of overoptimistic model evaluation can be severe
- **Verification is essential** - always check for shared IDs between train/test sets
- **Proper data splitting** is as important as model selection for geotechnical applications
