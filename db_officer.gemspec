$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "db_officer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_officer"
  s.version     = DbOfficer::VERSION
  s.authors     = ["ananta raj lamichhane"]
  s.email       = ["anantalamichhane1@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DbOfficer."
  s.description = "TODO: Description of DbOfficer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
 # s.test_files = Dir["test/**/*"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'mime-types', '2.6.2'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "codeclimate-test-reporter"

end
