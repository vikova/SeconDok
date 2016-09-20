require 'test/unit'
require 'selenium-webdriver'
require 'pry'
require_relative 'main_module'
require 'capybara'
require 'capybara/dsl'

#require 'chromedriver-helper'
#require 'test-unit-capybara'


class TestRegistration < Test::Unit::TestCase
  include Capybara::DSL
  include MainModule
  Capybara.default_max_wait_time
 # wait = Selenium::WebDriver::Wait.new(:timeout => 10)
 # wait.until { @driver.find_elements(:id => "some-dynamic-element") }

  def setup
    Capybara.current_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.app_host = 'http://91.239.235.128/~secondok/#/'
    page.driver.browser.navigate.refresh
    page.evaluate_script 'window.location.reload()'
    #Capybara.app_host = 'http://secondok.afedorovsky.dev.ideus.biz/#/registration'
  end

  def load_page
    visit('/')
    page.driver.browser.navigate.refresh
    page.evaluate_script 'window.location.reload()'
  end

  def test_register
    load_page

    register
    rules
    first_dot
    second_dot
    third_dot
    fouth_dot
    fifth_dot
    finish
    sleep 2
    #expected_test = 'Ваши данные отправлены на проверку. Мы свяжемся с Вами для подтверждения информации в ближайшее время'
    actual_test = find('.end_text.ng-binding') #.text
   # assert_equal(expected_test, actual_test)
    assert(actual_test.visible?)
  end

  def teardown # close browser
    Capybara.reset_sessions!
    Capybara.use_default_driver
   # @driver.quit
  end

end