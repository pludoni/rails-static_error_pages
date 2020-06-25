module StaticErrorPages

  class CopyGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Copies over all SLIM-views"

    def copy_views
      files = Dir["#{StaticErrorPages::Railtie.root.join('app/views')}/**/*.slim"]

      files.each do |file|
        copy_file(file, "app/views/error_pages/#{File.basename(file)}")
      end
    end
  end
end
