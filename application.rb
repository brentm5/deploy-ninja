require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'dotenv'
require 'sinatra/activerecord'
require File.join(File.dirname(__FILE__), 'enviroment')

Dotenv.load

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join('\n')
  'Application error'
end

db = URI.parse(ENV['DATABASE_URL'])
ActiveRecord::Base.establish_connection(
  adapter: db.scheme == 'postgres' ? 'postgresql' : db.schema,
  host: db.host,
  username: db.user,
  password: db.password,
  database: db.path[1..-1],
  encoding: 'utf8'
)

get '/' do
  erb :root
end

