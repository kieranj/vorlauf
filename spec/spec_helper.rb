require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'bundler/setup'
require 'vorlauf'
require 'factory_girl'
require 'factories'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
