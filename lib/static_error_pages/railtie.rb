module StaticErrorPages
  class Railtie < ::Rails::Engine
    config.static_error_pages = ActiveSupport::OrderedOptions.new
    config.static_error_pages.pages = %w(404.html 500.html 503.html 422.html)
    config.static_error_pages.layout = 'error_pages'
    config.to_prepare do
      ActiveSupport.on_load(:action_controller) do
        ActiveSupport::Reloader.to_prepare do
          ApplicationController.helper(StaticErrorPages::ErrorPagesHelper)
        end
      end
    end
  end
end
