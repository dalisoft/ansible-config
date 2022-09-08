# Fix for https://github.com/numpy/numpy/issues/15947
echo "Cleaning old numpy cache and wheel..."
rm -v ~/Library/Caches/pip/wheels/*/*/*/*/*numpy*

echo "Installing openblas for macOS via Homebrew..."
brew install openblas

echo "Installing numpy..."
OPENBLAS=(brew --prefix openblas) pip3 install numpy

echo "Checking by installing matpliblib..."
OPENBLAS=(brew --prefix openblas) pip3 install matplotlib

echo "Done"
