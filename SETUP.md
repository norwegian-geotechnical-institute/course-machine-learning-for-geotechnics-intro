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

- You will see **VS Code in the browser**.
- At the bottom right, you may see a notification about the dev container being built and post-create steps running.

In the background, the container will:

- Install **Python 3.12**
- Install **uv**
- Run `uv sync` to install all required Python packages
- Install VS Code extensions (Python, Jupyter, Data Wrangler, Ruff, etc.)

Wait until this finishes (no more “installing” messages).  
If you open a terminal (View → Terminal), you should be able to run:

```bash
uv --version
python --version
jupyter --version
```
