# Setup instructions for the ML course

These steps show you how to run the course notebooks in your browser using **GitHub Codespaces**.  
You do not need to install Python or any tools on your own computer.

---

## 1. Before the course

1. **Create a GitHub account**  
   - If you do not already have one, go to github.com and sign up.
   - Log in to your account.

2. **Check your browser**  
   - Use a modern browser (Chrome, Edge, Firefox, or similar).

---

## 2. Open the course environment (Codespaces)

1. Open the course GitHub repository (link provided by the lecturer).
2. Click the green **`<> Code`** button.
3. Select the **Codespaces** tab.
4. Click **“Create codespace on main”** (or the default branch).

GitHub will now start a cloud-based development environment for you.  
This may take a few minutes the first time.

---

## 3. Wait for the environment to finish initial setup

When the Codespace opens:

- You will see **VSCode in the browser**.
- At the bottom right, you may see a notification about the dev container being built and post-create steps running.

In the background, the container will:

- Install **Python 3.12**
- Install **uv**
- Run `uv sync` to install all required Python packages
- Install VS Code extensions (Python, Jupyter, Data Wrangler, Ruff, etc.)

Wait until this finishes (no more "installing" messages).  
If you open a terminal (View → Terminal), you should be able to run:

```bash
uv --version
python --version
uv run jupyter --version
```

**Note**: Commands like `jupyter` must be run with `uv run` prefix (e.g., `uv run jupyter lab`). However, notebooks work directly in VS Code without additional commands.

---

## 4. Download the dataset

1. In VS Code, open the `00_setup.ipynb` notebook from the file explorer (left sidebar).
2. Run all cells in the notebook (click "Run All" at the top, or run each cell individually).
3. The dataset will be downloaded and extracted to `data/raw/` in the repository.

---

## 5. Start learning!

1. After the dataset is downloaded, open `01_eda_cpt.ipynb`.
2. Run cells sequentially to explore the data.
3. Continue with the other notebooks in order:
   - `00_setup.ipynb` - Dataset download and extraction
   - `01_eda_cpt.ipynb` - Data exploration and preprocessing
   - `02_metrics_and_ml_intro.ipynb` - Machine learning fundamentals
   - `03_training_evaluation.ipynb` - Model training and evaluation

**Tip**: You can run cells by clicking the play button next to each cell or pressing `Shift + Enter`.


---

## 6. Persistence: What happens to your files and downloaded data?

When you work in **GitHub Codespaces**, you are working inside a personal cloud workspace  
(a small virtual machine that belongs only to you).

### ✔️ Your work is saved automatically
All files you change or create inside the Codespace are saved automatically.  
This includes:

- Changes to notebooks
- New scripts or notes
- The downloaded dataset in `data/raw/`
- Any processed data you generate

### ✔️ When you close the browser
You can close the browser tab at any time.  
Later, when you open the same Codespace again:

- Your notebooks are still there  
- Your changes are still there  
- **The dataset you downloaded is still there**  
- Your environment is still ready to run  
- You do **not** need to download the data again

This makes it safe to continue work across several days.

### ✔️ When does data disappear?
Only when *you* delete your Codespace, or if you intentionally create a new one.

If you delete the Codespace:
- All files inside it are removed  
- You will start from a clean environment next time  
- You will need to download the dataset again using `00_download_data.ipynb`

### ✔️ Important for this course
For the whole course, **use the same Codespace**.  
Do not delete it until the course has finished.

---

