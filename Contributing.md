# Steps to contribute

### Update the `formula.rb`
> [!Tip]
> I want to automate this whole process, so I guess for that we need to use a shell
> script instead of ruby one. I created Ruby script for this because HomeBrew uses Ruby
> to manage packages, so ... just for conformity ... I know ... silly right?

1. Run `ruby update_formula.rb` to automatically update the formula to contain the latest package from PyPI
    1. Downloads the latest tarball by running `curl`.
    2. Automatically updaes roff page with latest version.
    3. Automatically updates `formula.rb` with latest version and shasum of tarball, and shasum of manpage.
    4. Copies the shasum, and paste in the Formula
  
### Test the formula locally
1. To run locally run `brew install --build-from-source --force --verbose Formula/armangrewal007.rb`
2. Test using `armangrewal007` and `man armangrewal007`
  
