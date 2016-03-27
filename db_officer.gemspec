$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "db_officer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_officer"
  s.version     = DbOfficer::VERSION
  s.authors     = ["anantalamichhane"]
  s.email       = ["anantalamichhane1@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DbOfficer."
  s.description = "TODO: Description of DbOfficer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_dependency "rspec-rails", "~> 3.0"
  s.add_dependency "factory_girl_rails"
  s.add_dependency "pry-rails"
  s.add_dependency 'jquery-rails', ['>= 3.0', '< 5']
  s.add_dependency 'jquery-ui-rails', '~> 5.0'
end
