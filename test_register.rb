require 'test/unit'
require 'selenium-webdriver'
require 'pry'
require_relative 'main_module'

class TestRegistration < Test::Unit::TestCase
  include MainModule
 # wait = Selenium::WebDriver::Wait.new(:timeout => 10)
 # wait.until { @driver.find_elements(:id => "some-dynamic-element") }

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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
    actual_test = @driver.find_element(css: '.end_text.ng-binding') #.text
   # assert_equal(expected_test, actual_test)
    assert(actual_test.displayed?)

  end
  def teardown         # close browser
    @driver.quit
  end
end