module DbOfficer
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    isolate_namespace DbOfficer
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
