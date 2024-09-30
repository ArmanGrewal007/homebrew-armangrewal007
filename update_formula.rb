require 'net/http'
require 'json'

# ANSI escape codes for text colors
BLUE = "\e[34m"
RESET = "\e[0m"
BOLD_GREEN = "\e[1;32m"
ITALIC_YELLOW = "\e[3m\e[33m"

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

# puts "\n\nTo download the latest tarball, you can run one of the following commands:"
# puts "Using curl:"
# puts "#{BLUE}curl -L -o packages/#{package_name}-#{latest_version}.tar.gz #{tarball_url}#{RESET}"
# puts "Using wget:"
# puts "#{BLUE}wget -P packages/ #{tarball_url}#{RESET}"

# Prompt the user for confirmation before running curl
print "Do you want to download the latest tarball? (y/n): "
user_input = gets.chomp.downcase

if user_input == 'y'
  # Create packages directory if it doesn't exist
  Dir.mkdir('packages') unless Dir.exist?('packages')

  # Run the curl command to download the tarball
  puts "\n\n Running curl ..."
  system("curl -L -o packages/#{package_name}-#{latest_version}.tar.gz #{tarball_url}")

  # # Remove all other tar.gz versions except the latest downloaded one
  # puts "Removing old tarball versions..."
  # Dir.glob('packages/*.tar.gz').each do |file|
  #   File.delete(file) unless file.include?("#{package_name}-#{latest_version}.tar.gz")
  # end

  # Run shasum to get the sha256 hash of the downloaded tarball
  sha256 = `shasum -a 256 packages/#{package_name}-#{latest_version}.tar.gz`.split.first
  puts "\nSHA256 (tarball): #{sha256}"


  # Update the formula file
  formula_file = "Formula/#{package_name}.rb"
  formula_content = File.read(formula_file)
  updated_formula = formula_content.gsub(/f_url ".*"/, "f_url \"#{tarball_url}\"")
  updated_formula.gsub!(/version ".+"/, "version \"#{latest_version}\"")
  updated_formula.gsub!(/f_sha256 ".*"/, "f_sha256 \"#{sha256}\"")

  # Update the man page
  man_page_path = "man/man1/#{package_name}.1"
  man_page_content = File.read(man_page_path)
  updated_man_page_content = man_page_content.gsub(/version \d+\.\d+\.\d+/, "version #{latest_version}")
  File.write(man_page_path, updated_man_page_content)
  man_page_sha256 = `shasum -a 256 #{man_page_path}`.split.first
  puts "SHA256 (man page): #{man_page_sha256}"
  updated_formula.gsub!(/m_sha256 ".*"/, "m_sha256 \"#{man_page_sha256}\"") if updated_formula =~ /resource "man_page"/

  # Write to formula file
  File.write(formula_file, updated_formula)

  puts "\n#{BOLD_GREEN}formula updated successfully with the latest package URL, tarball SHA256 and manfile SHA256.#{RESET}"
  puts "#{BOLD_GREEN}manfile updated sucessfully with latest version.#{RESET}"
  puts "#{ITALIC_YELLOW}Don't forget to commit the changes and push to the repository. Happy Coding!\n#{RESET}"
else
  puts "No changes made. Exiting..."
end