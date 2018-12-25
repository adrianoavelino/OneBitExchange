require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
