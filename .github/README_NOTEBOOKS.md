# Working with Notebooks in this Repository

## Automatic Output Clearing

This repository is configured to **automatically clear notebook outputs** when you commit changes to Git. This keeps the repository clean and reduces file sizes.

### How it works

- **nbstripout** is installed as a Git filter
- When you `git add` or `git commit` notebook files, outputs are automatically stripped
- Your local notebooks keep their outputs - only the committed version is cleaned

### Setup (already done in Codespaces)

The setup is automatic in GitHub Codespaces via `.devcontainer/postCreate.sh`. 

For local development:
```bash
uv sync                    # Install dependencies including nbstripout
uv run nbstripout --install  # Configure git filter
```

### Manual output clearing

To manually clear outputs from all notebooks:
```bash
uv run nbstripout notebooks/*.ipynb
```

To clear outputs from a specific notebook:
```bash
uv run nbstripout notebooks/eda_cpt.ipynb
```

## Running Jupyter

Since this project uses `uv` for dependency management, Jupyter commands must be prefixed with `uv run`:

```bash
# Start Jupyter Lab
uv run jupyter lab

# Start Jupyter Notebook
uv run jupyter notebook

# Check Jupyter version
uv run jupyter --version
```

**Note**: In VS Code, notebooks work directly without any commands - just open `.ipynb` files and run cells.

## Best Practices

1. **Run notebooks in VS Code** - The easiest way, no commands needed
2. **Commit frequently** - Outputs are auto-stripped, so commit size is minimal
3. **Review before pushing** - Use `git diff` to verify only code changes are committed
4. **Keep outputs locally** - Re-run notebooks after pulling to see results

## Troubleshooting

**Problem**: `jupyter: command not found`
**Solution**: Use `uv run jupyter` instead of just `jupyter`

**Problem**: Outputs still appearing in commits
**Solution**: Run `uv run nbstripout --install` to reinstall the git filter

**Problem**: Want to commit WITH outputs (e.g., for sharing results)
**Solution**: Temporarily disable the filter:
```bash
git commit --no-verify -m "Commit with outputs"
```
