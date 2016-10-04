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
    Capybara.app_host = 'http://test.secondok.com/#/login'
   # page.driver.browser.navigate.refresh #page roload
    #page.evaluate_script 'window.location.reload()'  #page roload
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

  def test_login
    load_page

    find('#log_email').set('qq@qq.qq')
    find('#log_pwd').set('qqqqqqqq')
    find('.btn.btn_green.btn_enter.ng-binding').click

    actual_test = find('.h_logout.j_link')
    assert(actual_test.visible?)

  end

  def test_logout
    load_page
    test_login

    find('.h_logout.j_link').click

    actual_result = find('.btn.btn_green.btn_enter.ng-binding.inactive')
    assert(actual_result.visible?)
  end

  def test_support
    load_page
    test_login
    sleep 3

    find('.h_help').click
    sleep 5
    find('.btn_acc_help.op_ins_pop.ng-binding').click
    find('#acc_help_subj').set('New message')
    find('#acc_help_quest').set('Help me!')
    find('.btn.btn_green.ng-binding').click
#    find('.itm.ng-binding.ng-scope:contains("Help me!")').click

  end

  def test_edit_profile
    load_page
    test_login

    find('.acc_name.ng-binding').click
    find('.btn.btn_white.ng-binding').click
#    find('.itm.ng-binding:contains("Help me!")').click

  end


  def teardown # close browser
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

end