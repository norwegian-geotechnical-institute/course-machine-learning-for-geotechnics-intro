# Introduction to Machine Learning in Geotechnics

The code is developed for use in a machine learning intro course at the Norwegian Geotechnical Institute (NGI): [https://www.ngi.no/](https://www.ngi.no/). For more information about geotechnical data and applied machine learning, check out this NGI course: [Introduction to Machine Learning in Geotechnics](https://www.ngi.no/en/events/ngi-code-academy/introduction-to-machine-learning-in-geotechnics-pilot-course/)

Several Jupyter notebooks exemplify key machine learning concepts using geotechnical data. The notebooks are numbered sequentially in the repository root.

The dataset used in this project is the Oberhollenzer CPT dataset, which is a publicly available dataset containing Cone Penetration Test (CPT) data along with corresponding soil type classifications. The dataset is stored in the `data/raw/` directory.

Oberhollenzer dataset: [https://doi.org/10.1016/j.dib.2020.106618](https://doi.org/10.1016/j.dib.2020.106618). The dataset can be downloaded from [here](https://www.tugraz.at/en/institutes/ibg/research/computational-geotechnics-group/database).

The following soil types are supported:

- 1: gravel
- 2: fine grained organic soils
- 3: coarse grained organic soils
- 4: sand to gravel
- 5: sand
- 6: silt to fine sand
- 7: clay to silt

## Project Features

Some of the key features of the project are:

- Use of the **uv** package manager for dependency management and Python versions.
- Use of **ydata-profiling** for data Exploratory Data Analysis (EDA).
- Use of the **XGBoost** library (optionally with gpu support) for training the machine learning model.
- Use of the **scikit-learn** library for data preprocessing ml-algorithms (other than xgboost) and evaluation of the model.
- Use **pyOD** for outlier detection.
- Use **imblearn** for handling imbalanced datasets.


## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/norwegian-geotechnical-institute/course-machine-learning-for-geotechnics-intro.git
    cd course-machine-learning-for-geotechnics-intro
    ```
2. **Install uv**: Follow the instructions at [https://uv.dev/](https://uv.dev/) to install uv.

3. **Install dependencies**:
    ```sh
    uv sync
    ```

## Usage

### Prepare the data

1. Run the `00_setup.ipynb` notebook to download and extract the Oberhollenzer dataset.
2. Run the `01_eda_cpt.ipynb` notebook to preprocess the data and generate exploratory data analysis reports. The preprocessed data will be saved in the `data/model_ready/` directory.
3. Explore machine learning fundamentals with the `02_metrics_and_ml_intro.ipynb` notebook.
4. Train and evaluate models by running the `03_training_evaluation.ipynb` notebook.

## Contact

The project is developed by Tom F. Hansen: [Mail](mailto:tom.frode.hansen@ngi.no)
