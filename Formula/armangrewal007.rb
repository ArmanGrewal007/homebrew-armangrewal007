class Armangrewal007 < Formula
  desc "CLI to display Arman Singh Grewal's resume"
  homepage "https://github.com/yourusername/armangrewal007"
  url "https://files.pythonhosted.org/packages/source/a/armangrewal007/armangrewal007-0.1.3.tar.gz"
  sha256 "7e5ffcce261e9997a164c9c245832ad16e2aec9a7291040d0c2b3dc6ee16c992"

  depends_on "python@3.10"  # Specify the Python version 
  resource "man_page" do
    url "https://raw.githubusercontent.com/ArmanGrewal007/homebrew-armangrewal007/refs/heads/master/man/man1/armangrewal007.1"
    sha256 "2e7e6c9a9ada1e8ea362cf140900ab68305efa9b64697cbfe30f81b64f26b5c8"
  end

  def install
    system "pip", "install", "--prefix=#{prefix}", "--upgrade", "armangrewal007"
    # virtualenv_install_with_resources
    resource("man_page").stage do
      man1.install "armangrewal007.1"
    end
  end

  test do
    system "armangrewal007" # CLI command
  end
end
