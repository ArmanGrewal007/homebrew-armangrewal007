class Armangrewal007 < Formula
  desc "CLI to display Arman Singh Grewal's resume"
  homepage "https://github.com/yourusername/armangrewal007"
  url "https://files.pythonhosted.org/packages/source/a/armangrewal007/armangrewal007-0.1.2.tar.gz" 
  sha256 "38b561affa07997dea3dc34c9dcd9cc3f5587204ed8520d95bb05ab34ce37971" 

  # depends_on "python@3.9"  # Specify the Python version 

  def install
    system "pip3", "install", "--prefix=#{prefix}", "--upgrade", "armangrewal007"
  end

  test do
    system "armangrewal007" # CLI command
  end
end
