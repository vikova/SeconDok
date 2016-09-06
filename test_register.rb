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
    @wait.until { @driver.find_elements(css: '.btn.btn_white.btn_reg.ng-binding') }
    @driver.find_element(css: '.btn.btn_white.btn_reg.ng-binding').click

     sleep 3
    @driver.find_element(:id, 'reg_email').send_keys 'test@test.com'
    @driver.find_element(:id, 'reg_pwd').send_keys 'qqqqqqqq'
    @driver.find_element(:id, 'reg_pwd_conf').send_keys 'qqqqqqqq'
     sleep 3
    @driver.find_element(css: '.btn.btn_green.btn_reg_first.ng-binding').click
     sleep 3
    @driver.find_element(css: '.btn.btn_green.btn_conf_rules.ng-binding').click
     sleep 3
    @driver.find_element(:id, 'reg_name').send_keys 'Main'
    @driver.find_element(:id, 'reg_surname').send_keys 'Doctor'
    @driver.find_element(:id, 'ref_female').click


    @driver.find_element(css: '.btn.btn_white.btn_upload.btn_reg_avatar.ng-binding').click
    #@driver.find_element(:id,'reg_done_avatar').send_keys 'E:\QA Viktoriia\Изображения\r0X6OluAP7c.jpg'

     sleep 15


    @driver.find_element(css: '.select.open_slide_pop').click
     sleep 3

    @driver.find_element(css: '[data-id="220"]').click
     sleep 3
    @driver.find_element(css: '.inp_search.inp_country input').send_keys 'харьков'
     sleep 3
    #@driver.find_elements(:css, '.name').first.click
    @driver.find_elements(:css, '.name').each do |city|
      if city.displayed?
      city.click
      break
      end
    end

     sleep 3
    @driver.find_element(:id, 'reg_tel').send_keys '666666666'
     sleep 3
    @driver.find_element(css: '.go_next div').click
     sleep 5


    @wait.until { @driver.find_elements(css: '.ci_btns') }
    @driver.find_element(css: '.block_educ').click
     sleep 3
    @driver.find_elements(css: '[data-id="220"]').each do |country|
      country.click if country.displayed?
    end
      sleep 3
   @driver.find_elements(css: '.inp_search.inp_country input').each do |search|
     search.send_keys 'харьков' if search.displayed?
   end
   sleep 3
    #@driver.find_elements(:css, '.name').first.click
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


   end


  def teardown         # close browser
    @driver.quit
  end
end