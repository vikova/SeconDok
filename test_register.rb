require 'test/unit'
require 'selenium-webdriver'
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
    @driver.find_elements(:name, 'reg_tags').each do |spec|
      spec.click if spec.displayed?
    end
    sleep 3
    @driver.find_elements(css: '[data-id="2"]').each do |spec1|
      spec1.click if spec1.displayed?
    end
    @driver.find_elements(css: '.choose.choose_educt').each do |educt|
      educt.click if educt.displayed?
    end
    @driver.find_elements(css: '.inp_search.inp_country input').each do |hospital|
      hospital.send_keys 'второй' if hospital.displayed?
    end
    sleep 3
    @driver.find_elements(css: '[data-id="5"]').each do |hospital1|
      hospital1.click if hospital1.displayed?
    end
   # @driver.find_elements(css: '.inp_search.inp_country input').each do |year_start| year_start.send_keys '2010' if year_start.displayed? end
    sleep 3
    @driver.find_elements(css: '[data-id="2010"]').each do |year1|
      year1.click if year1.displayed?
    end
   # @driver.find_elements(css: '.inp_search.inp_country input').each do |year_finish| year_finish.send_keys '2016' if year_finish.displayed? end
    sleep 3
    @driver.find_elements(css: '[data-id="2010"]').each do |year2|
      year2.click if year2.displayed?
    end
   # @driver.find_elements(css: '.inp_search.inp_country input').each do |spec| spec.send_keys 'Нейрохирургия' if spec.displayed? end
    sleep 3
    @driver.find_elements(css: '[data-id="28"]').each do |spec1|
      spec1.click if spec1.displayed?
    end



    @wait.until { @driver.find_elements(css: '.go_next') }
    @driver.find_elements(css: '.btn.btn_green.ng-binding').each do |next_button|
      next_button.click if next_button.displayed?
    end
    sleep 5

end
  def teardown         # close browser
    @driver.quit
  end
end