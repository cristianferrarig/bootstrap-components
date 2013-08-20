###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do

  def component(tags, &block)
    content = capture(&block)
    view = Haml::Engine.new(content).render

    content_tag("div", view, :class => "preview") +
    content_tag("pre", :class => "haml prettyprint linenums") do
      content
    end +
    content_tag("pre", :class => "html prettyprint linenums") do
      h view
    end +
    content_tag("div", tags, :class => "tags")
  end

end

set :css_dir, 'assets/stylesheets'

set :js_dir, 'assets/javascripts'

set :images_dir, 'assets/images'

set :fonts_dir, 'assets/fonts'

# Development-specific configuration
configure :development do
  # set :debug_assets, true
end

# Build-specific configuration
configure :build do
  ignore 'assets/images/*.psd'
  ignore 'assets/stylesheets/lib/*'
  ignore 'assets/stylesheets/vendor/*'
  ignore 'assets/javascripts/lib/*'
  ignore 'assets/javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end