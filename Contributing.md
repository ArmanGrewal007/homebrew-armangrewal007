# Steps to contribute

1. Run `ruby update_formula.rb` to automatically update the formula to contain the latest package from PyPI
    - Downloads the latest tarball by running one of the commands given to you.
    - Runs the `shasum -a 256 packages/*.tar.gz`
    - Copies the shasum, and paste in the Formula
2. To run locally run `brew install --build-from-source --force --verbose Formula/armangrewal007.rb`
3. Test using `armangrewal007` and `man armangrewal007`
  
