ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.reqire(:default, :test)
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }