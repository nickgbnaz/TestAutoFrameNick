require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require File.dirname(__FILE__) + '/testconfig'
require_relative 'testconfig'
require 'capybara/cucumber'
require 'selenium-webdriver'

Before do
  Capybara.run_server = false
  Capybara.default_driver = TestConfig["capybara_default_driver"]
  Capybara.default_max_wait_time = TestConfig["default_timeout"]
  Capybara.app_host = TestConfig["default_site"]

  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => ['--start-maximized']})

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)

  end
end

After do
  Capybara.current_session.driver.quit

end