require 'net/http'
require 'json'

# use redcarpet as the markdown engine
set :markdown_engine, :redcarpet
# configure redcarpet to use github style fenced code blocks
# (tripe back ticks ```) to denote code
set :markdown, tables: true, fenced_code_blocks: true, autolink: true, no_intra_emphasis: true, strikethrough: true, hard_wrap: true, with_toc_data: true

# Configure the assets folders
set :build_dir, 'build'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Disable warnings from HAML
Haml::TempleEngine.disable_option_validator!

# Use haml in this project
set :haml, { format: :html5 }

# Populate docs pages
docs_source_dir = 'kubeless-src'
Dir["kubeless-src/docs/*.md"].each do |f|
  # Avoid to parse files twice or the README which just contains a warning
  next if f.include?('.html.md') || f.include?('README')
  f_dir = File.dirname f
  f_name = File.basename f, ".md"
  new_file = "source/docs/#{f_name}.html.md"
  File.open(new_file, 'w') do |fo|
    # We need to include middleman frontmatter
    fo.puts """---
title: Kubeless
description: Kubeless is a Kubernetes-native serverless framework
layout: docs
---
"""
    File.foreach(f) do |li|
      fo.puts li
    end
  end
end
extra_dirs = ["kubeless-src/docs/img", "kubeless-src/docs/misc"]
extra_dirs.each do |d|
  dir_name = File.basename d
  FileUtils.copy_entry d, "source/docs/#{dir_name}"
end
 
# Remove .html in the URL
activate :directory_indexes

# Configure build environment
configure :build do
  # If you set the MIDDLEMAN_HTTP_PREFIX environment variable on build,
  # all the assets will include this prefix in the URL. This is very useful
  # to deploy the site to GitHub Pages.
  set :http_prefix, ENV['MIDDLEMAN_HTTP_PREFIX'] if ENV['MIDDLEMAN_HTTP_PREFIX'].present?
end
