ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'application.rb')

require 'sinatra'
require 'rack/test'
require 'factory_girl'
require 'database_cleaner'

# setup test environment
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryGirl::Syntax::Methods
end
DatabaseCleaner.strategy = :truncation

FactoryGirl.find_definitions
DatabaseCleaner.clean
