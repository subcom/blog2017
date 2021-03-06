#Replace with below for Option 2: with 'selenium-webdriver'
  #Note: if selenium-webdriver gem does not update to newest Firefox version fast enough for you
  #you can download a specific version of Firefox and configure to use that version in tests
  #example: 
    #Capybara.register_driver :selenium do |app|
      #require 'selenium/webdriver'
      #Selenium::WebDriver::Firefox::Binary.path = "/home/user/Sites/firefox46/firefox"
      #Capybara::Selenium::Driver.new(app, :browser => :firefox)
    #end

ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  # Prevent database truncation if the environment is production
  abort("The Rails environment is running in production mode!") if Rails.env.production?
  # Add additional requires below this line. Rails is not loaded until this point!

  # Requires supporting ruby files with custom matchers and macros, etc, in
  # spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
  # run as spec files by default. This means that files in spec/support that end
  # in _spec.rb will both be required and run as specs, causing the specs to be
  # run twice. It is recommended that you do not name files matching this glob to
  # end with _spec.rb. You can configure this pattern with the --pattern
  # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
  #
  # The following line is provided for convenience purposes. It has the downside
  # of increasing the boot-up time by auto-requiring all files in the support
  # directory. Alternatively, in the individual `*_spec.rb` files, manually
  # require only the support files necessary.
  #
  # Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }


  require 'spec_helper'
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'simple_bdd'
  require 'shoulda/matchers'
  Capybara.javascript_driver = :webkit

  ActiveRecord::Migration.maintain_test_schema!

  RSpec.configure do |config|

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
    
    config.include SimpleBdd, type: :feature

    RSpec.configure do |config|
      config.include Devise::Test::ControllerHelpers, type: :controller
    end
    
    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
    
    config.infer_spec_type_from_file_location!

    config.filter_rails_from_backtrace! 

  end




