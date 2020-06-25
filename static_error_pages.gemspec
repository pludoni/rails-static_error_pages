$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "static_error_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "static_error_pages"
  spec.version     = StaticErrorPages::VERSION
  spec.authors     = ["Stefan Wienert"]
  spec.email       = ["info@stefanwienert.de"]
  spec.homepage    = "https://github.com/pludoni/rails-static_error_pages"
  spec.summary     = "Generate Rails error pages on deployment using application-controller renderer"
  spec.description = "Generate Rails error pages on deployment using application controller renderer"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.2.4.3"
end
