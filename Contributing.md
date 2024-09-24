# Steps to contribute

1. Run `ruby update_formula.rb` to automatically update the formula to contain the latest package from PyPI
2. Download the latest tarball by running one of the commands given to you.
3. Run the `shasum -a 256 packages/*.tar.gz`
4. Copy the shasum, and paste in the Formula
