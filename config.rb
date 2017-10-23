# include MD5 gem, should be part of standard ruby install
require 'digest/md5'

# Configuration
set :build_dir, 'build'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Disable warnings from HAML
Haml::TempleEngine.disable_option_validator!

# Use haml in this project
set :haml, { format: :html5 }

# Remove .html in the URL
activate :directory_indexes
