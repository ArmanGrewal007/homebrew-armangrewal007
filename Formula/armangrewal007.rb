class Armangrewal007 < Formula
  desc "CLI to display Arman Singh Grewal's resume"
  homepage "https://github.com/yourusername/armangrewal007"
  url "https://files.pythonhosted.org/packages/source/a/armangrewal007/armangrewal007-0.1.3.tar.gz" 
  sha256 "7e5ffcce261e9997a164c9c245832ad16e2aec9a7291040d0c2b3dc6ee16c992" 

  depends_on "python@3.10"  # Specify the Python version 

  def install
    system "pip", "install", "--prefix=#{prefix}", "--upgrade", "armangrewal007"
    # virtualenv_install_with_resources
    man1.install "man/man1/armangrewal007.1"
  end

  test do
    system "armangrewal007" # CLI command
  end
end
