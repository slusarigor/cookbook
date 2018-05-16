ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "database_cleaner"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
#require "minitest/pride"
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_url("robohash.org")
end

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
