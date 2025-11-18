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

echo "Installing nbstripout for automatic notebook output clearing..."
uv run nbstripout --install

echo "Verifying environment setup..."
if uv run python -c "import pandas, sklearn, xgboost, ydata_profiling; print('✓ All core packages imported successfully')"; then
    echo "✓ Environment is ready!"
    echo ""
    echo "Next steps:"
    echo "  1. Download the dataset by running 00_setup.ipynb"
    echo "  2. Open 01_eda_cpt.ipynb to start data exploration"
    echo "  3. Run cells sequentially through the numbered notebooks"
    echo ""
    echo "Note: Use 'uv run jupyter lab' or 'uv run jupyter notebook' to start Jupyter"
else
    echo "⚠ Warning: Some packages may not be installed correctly"
fi

echo ""
echo "Done. Notebooks are configured to auto-clear outputs on commit."
