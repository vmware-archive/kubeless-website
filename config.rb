require 'net/http'
require 'json'

# use redcarpet as the markdown engine
set :markdown_engine, :redcarpet
# configure redcarpet to use github style fenced code blocks
# (tripe back ticks ```) to denote code
set :markdown, :tables => true, :fenced_code_blocks => true

# Configure the assets folders
set :build_dir, 'build'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Disable warnings from HAML
Haml::TempleEngine.disable_option_validator!

# Use haml in this project
set :haml, { format: :html5 }

# Get the latest release tag from Github
response = Net::HTTP.get(URI('https://api.github.com/repos/kubeless/kubeless/releases/latest'))
tag = JSON.parse(response)['tag_name']
set :latest_release_tag, tag

# Populate docs pages
docs_source_dir = 'kubeless-src'
checkout_commit = '1c592cdc55bf009dc58773a042e42d70085e930b' # Use tag or a specific commit if necessary
system "cd #{docs_source_dir} && git fetch origin && git checkout #{checkout_commit}"
doc_files = Dir["#{docs_source_dir}/docs/*.md"]
doc_files.each{ |f|
  if !f.include? ".html.md" 
    f_dir = File.dirname f
    f_name = File.basename f, ".md"
    if f_name != "README" # Avoid to parse the README file, it just contains a warning
      new_file = "source/docs/#{f_name}.html.md"
      File.open(new_file, 'w') do |fo|
        # We need to include middleman frontmatter
        fo.puts "---"
        fo.puts "title: Kubeless"
        fo.puts "description: Kubeless is a Kubernetes-native serverless framework"
        fo.puts "layout: docs"
        fo.puts "---"
        File.foreach(f) do |li|
          fo.puts li
        end
      end
    end
  end
}
extra_dirs = ["#{docs_source_dir}/docs/img", "#{docs_source_dir}/docs/misc"]
extra_dirs.each{ |d|
  dir_name = File.basename d
  FileUtils.copy_entry d, "source/docs/#{dir_name}"
}

# Remove .html in the URL
activate :directory_indexes

# Configure build environment
configure :build do
  # If you set the MIDDLEMAN_HTTP_PREFIX environment variable on build,
  # all the assets will include this prefix in the URL. This is very useful
  # to deploy the site to GitHub Pages.
  set :http_prefix, ENV['MIDDLEMAN_HTTP_PREFIX'] if ENV['MIDDLEMAN_HTTP_PREFIX'].present?
end
