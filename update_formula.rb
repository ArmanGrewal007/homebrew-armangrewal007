require 'net/http'
require 'json'

# ANSI escape code for blue color
BLUE = "\e[34m"
RESET = "\e[0m"

# Define the package name
package_name = "armangrewal007"

# Fetch the latest version from PyPI
uri = URI("https://pypi.org/pypi/#{package_name}/json")
response = Net::HTTP.get(uri)
data = JSON.parse(response)
latest_version = data['releases'].keys.last

# Get the URL for the latest tarball
tarball_url = "https://files.pythonhosted.org/packages/source/a/#{package_name}/#{package_name}-#{latest_version}.tar.gz"

# Print the latest version and tarball URL
puts "Latest Version: #{latest_version}"
puts "Tarball URL: #{tarball_url}"

puts "\n\nTo download the latest tarball, you can run one of the following commands:"
puts "Using curl:"
puts "#{BLUE}curl -L -o packages/#{package_name}-#{latest_version}.tar.gz #{tarball_url}#{RESET}"
puts "Using wget:"
puts "#{BLUE}wget -P packages/ #{tarball_url}#{RESET}"

# Update the formula file
formula_file = "Formula/#{package_name}.rb"
formula_content = File.read(formula_file)
updated_formula = formula_content.gsub(/url ".*"/, "url \"#{tarball_url}\"")
updated_formula.gsub!(/version ".+"/, "version \"#{latest_version}\"")
File.write(formula_file, updated_formula)
