##
# Bower
##

@bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
ignore @bower_config["directory"].gsub(/source\//, "") + '/*'

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  # Require additional compass plugins.
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/Han/sass"
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/foundation/scss"
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/susy/sass"

  # config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Template Engine Options
###

set :haml, { :attr_wrapper => '"', :format => :html5 }

require 'slim'
set :slim, :pretty => true

###
# Blog
###

activate :blog do |blog|
  blog.name = "events"
  blog.prefix = "events"
  blog.permalink = "{year}/{title}.html"
  blog.taglink = "tag/{tag}.html"
  blog.paginate = true
  Time.zone = "Taipei"
  #blog.layout = 'event_layout'
end

activate :blog do |blog|
  blog.name = "articles"
  blog.prefix = "articles"
  blog.permalink = "{year}/{title}.html"
  blog.taglink = "tag/{tag}.html"
  #blog.sources = "{category}/{year}-{month}-{day}-{title}.html"
  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 5
  Time.zone = "Taipei"
  #blog.layout = 'article_layout'
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, :port => 35732, :apply_css_live => true
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def nav_link(link_text, link_path)
#     is_active = (current_page.path == link_path || current_page.url.slice(/\/?[^\/]*\//).chomp('/') == link_path) ? 'active' : ''

#     content_tag(:li, :class => is_active) do
#       link_to link_text, link_path
#     end
#   end
# end

activate :directory_indexes

# Add bower's directory to sprockets asset path
sprockets.append_path File.join "#{root}", @bower_config["directory"]

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # activate :imageoptim

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  
  relative_assets = true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
  deploy.remote = 'https://github.com/NTUST-ECE/ntust-ece.github.io.git'
end
