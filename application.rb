require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'dotenv'
require 'sinatra/activerecord'
require File.join(File.dirname(__FILE__), 'enviroment')

# load enviromental variables yippy
Dotenv.load

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
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

