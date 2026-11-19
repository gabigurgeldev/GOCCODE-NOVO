#!/bin/bash
echo "============================================"
echo " God of Cod - GOC Build Script"
echo "============================================"
echo ""

# Build goc-core (Rust backend)
echo "[1/3] Building goc-core (Rust)..."
cd "$(dirname "$0")/../apps/goc-core"
cargo build --release
if [ $? -ne 0 ]; then
    echo "ERROR: goc-core build failed!"
    exit 1
fi
echo "  goc-core built successfully."

# Copy goc-core binary to desktop resources
echo "[2/3] Copying goc-core binary..."
RESOURCES_DIR="$(dirname "$0")/../apps/desktop/resources/goc-core"
mkdir -p "$RESOURCES_DIR"
cp "target/release/goc-core" "$RESOURCES_DIR/"
echo "  Binary copied to resources."

# Install dependencies and build
cd "$(dirname "$0")/.."
echo "[3/3] Installing dependencies..."
pnpm install
if [ $? -ne 0 ]; then
    echo "ERROR: pnpm install failed!"
    exit 1
fi

echo "Building Electron app..."
pnpm --filter @goc/desktop build
if [ $? -ne 0 ]; then
    echo "ERROR: Electron build failed!"
    exit 1
fi

echo ""
echo "============================================"
echo " Build complete! GOC is ready."
echo " Run: pnpm --filter @goc/desktop dev"
echo "============================================"
