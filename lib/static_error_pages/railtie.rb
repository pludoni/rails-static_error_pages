module StaticErrorPages
  class Railtie < ::Rails::Engine
    # generators do
      # require "path/to/my_railtie_generator"
    # end
    config.static_error_pages = ActiveSupport::OrderedOptions.new
    config.static_error_pages.pages = %w(404.html 500.html 503.html 422.html)
    config.static_error_pages.layout = 'error_pages'
    config.to_prepare do
      ApplicationController.helper(ErrorPagesHelper)
    end
  end
end
