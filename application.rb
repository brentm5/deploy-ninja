require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'dotenv'
require 'airbrake'
require 'sinatra/activerecord'
require File.join(File.dirname(__FILE__), 'enviroment')

# load enviromental variables yippy
Dotenv.load

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  # Setup the default connection
  db = URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.schema,
    host: db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  )
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
    config.host    = 'errbit.bmontague.com'
    config.port    = 80
    config.secure  = config.port == 443
  end
  use Airbrake::Rack
  enable :raise_errors
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join('\n')
  'Application error'
end

# Load application parts
load 'models.rb'
load 'helpers.rb'
load 'routes.rb'

