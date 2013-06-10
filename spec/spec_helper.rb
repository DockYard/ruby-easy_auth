require 'rubygems'
require 'bundler/setup'
require 'byebug'

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'capybara/rspec'
require 'rspec/rails'
require 'valid_attribute'
require 'factory_girl_rails'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each { |f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/config/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :mocha
  config.use_transactional_fixtures = false
  config.include Factory::Syntax::Methods

  config.before(:each, :type => :request) do
    Dir[File.join(ENGINE_RAILS_ROOT, 'spec/requests/step_helpers/**/*.rb')].each { |f| require f }
  end
end
