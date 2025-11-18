#!/usr/bin/env bash
set -e

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

export PATH="$HOME/.local/bin:$PATH"

echo "Syncing environment with uv..."
if [ -f "uv.lock" ] || [ -f "pyproject.toml" ]; then
    uv sync
fi

echo "Registering Jupyter kernel..."
uv run python -m ipykernel install --user --name=course-ml-geo --display-name="Python (ML Course)"

echo "Formatting notebooks with Ruff..."
uv run ruff format notebooks/ || echo "Note: Some notebooks may need manual formatting"

echo "Verifying environment setup..."
if uv run python -c "import pandas, sklearn, xgboost, ydata_profiling; print('✓ All core packages imported successfully')"; then
    echo "✓ Environment is ready!"
    echo ""
    echo "Next steps:"
    echo "  1. Download the dataset (see README.md or download notebook)"
    echo "  2. Open notebooks/eda_cpt.ipynb to start"
    echo "  3. Run cells sequentially through the notebooks"
else
    echo "⚠ Warning: Some packages may not be installed correctly"
fi

echo ""
echo "Done. You can now run notebooks in VS Code or use 'uv run jupyter lab'."
