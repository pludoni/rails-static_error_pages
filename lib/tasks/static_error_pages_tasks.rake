# desc "Explaining what the task does"
# task :static_error_pages do
#   # Task goes here
# end

namespace :assets do
  desc "Generate all configured error-pages"
  task error_pages: :environment do
    layout = Rails.application.config.static_error_pages.layout
    Rails.application.config.static_error_pages.pages.each do |file|
      if Rails.version >= '7.0.0'
        out = ApplicationController.renderer.render("error_pages/#{file.remove('.html')}", layout: layout)
      else
        out = ApplicationController.renderer.render("error_pages/#{file}", layout: layout)
      end
      public_path = Rails.public_path.join(file)
      File.write(public_path, out)
      puts "Generated #{file}"
    end
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["assets:error_pages"].invoke
end
