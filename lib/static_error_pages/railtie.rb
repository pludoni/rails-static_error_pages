module StaticErrorPages
  class Railtie < ::Rails::Engine
    config.static_error_pages = ActiveSupport::OrderedOptions.new
    config.static_error_pages.pages = %w(404.html 500.html 503.html 422.html)
    config.static_error_pages.layout = 'error_pages'
    initializer 'static_error_pages.add_error_pages_paths' do |app|
      ActiveSupport.on_load(:application) do
        ApplicationController.helper(StaticErrorPages::ErrorPagesHelper)
      end
    end
  end
end
