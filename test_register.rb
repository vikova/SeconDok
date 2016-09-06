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
    @wait.until { @driver.find_elements(css: '.block_cval') }
    @driver.find_elements(:id,'reg_cval').each do |cval|
      cval.click if cval.displayed?
    end
    @driver.find_elements(css: '.inp_search.inp_country input').each do |cat|
      cat.send_keys 'второй' if cat.displayed?
    end
    sleep 3
    @driver.find_elements(css: '[data-id="5"]').each do |qual|
      qual.click if qual.displayed?

    end
    sleep 3

    @driver.find_elements(css: '.block_educ').each do |educ|
      educ.click if educ.displayed?
    end
     sleep 3
    @driver.find_elements(css: '[data-id="220"]').each do |country|
      country.click if country.displayed?
    end
      sleep 3
   @driver.find_elements(css: '.inp_search.inp_country input').each do |search|
     search.send_keys 'харьков' if search.displayed?
   end
   sleep 3
   @driver.find_elements(:css, '.name').each do |city|
     if city.displayed?
       city.click
       break
     end
   end
   @driver.find_elements(css: '[data-id="2"]').each do |institute|
     institute.click if institute.displayed?
   end
   @driver.find_elements(css: '[data-id="3"]').each do |degree|
     degree.click if degree.displayed?
   end
   @wait.until { @driver.find_elements(css: '.btn.btn_white.btn_upload.ng-binding') }
    @driver.find_elements(css: '.btn.btn_white.btn_upload.ng-binding').each do |button|
      button.click if button.displayed?
    end
    sleep 5
    @driver.find_elements(css: '[data-file="front"]').each do |front_photo|
      front_photo.click if front_photo.displayed?
    end
    sleep 10
    @driver.find_elements(css: '[data-file="back"]').each do |back_photo|
    back_photo.click if back_photo.displayed?
    end
    sleep 10

    @driver.find_elements(css: '.btn.btn_blue.btn_save_educ.ng-binding').each do |save_photo|
      save_photo.click if save_photo.displayed?
    end
    sleep 5
    @wait.until { @driver.find_elements(css: '.acts_block') }
    @driver.find_elements(css: '.btn.btn_green.ng-binding').each do |next_button|
    next_button.click if next_button.displayed?
    end
    sleep 5



end
  def teardown         # close browser
    @driver.quit
  end
end