ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Load poltergeist
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
end

