# desc "Explaining what the task does"
# task :static_error_pages do
#   # Task goes here
# end

namespace :assets do
  desc "Generate all configured error-pages"
  task error_pages: :environment do
    Rails.application.config.static_error_pages.pages.each do |file|
      out = ApplicationController.renderer.render("error_pages/#{file}", layout: '../error_pages/layout')
      public_path = Rails.public_path.join(file)
      File.write(public_path, out)
      puts "Generated #{file}"
    end
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["assets:error_pages"].invoke
end
