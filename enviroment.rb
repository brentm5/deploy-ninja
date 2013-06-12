require 'rubygems'
require 'bundler/setup'


require 'sinatra' unless defined?(Sinatra)

configure do
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end

