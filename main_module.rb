module MainModule

  def load_page
    #@driver.navigate.to 'http://91.239.235.128/~secondok/#/'
    @driver.navigate.to 'http://secondok.azubko.dev.ideus.biz/#/login'
  end

  def register
    @wait.until { @driver.find_elements(css: '.btn.btn_white.btn_reg.ng-binding') }
    @driver.find_element(css: '.btn.btn_white.btn_reg.ng-binding').click

    sleep 3
    @driver.find_element(:id, 'reg_email').send_keys 'test@test.com'
    @driver.find_element(:id, 'reg_pwd').send_keys 'qqqqqqqq'
    @driver.find_element(:id, 'reg_pwd_conf').send_keys 'qqqqqqqq'
    sleep 3
    @driver.find_element(css: '.btn.btn_green.btn_reg_first.ng-binding').click
    sleep 3
  end

  def rules
    @driver.find_element(css: '.btn.btn_green.btn_conf_rules.ng-binding').click
    sleep 3
  end
  def first_dot
    @driver.find_element(:id, 'reg_name').send_keys 'Main'
    @driver.find_element(:id, 'reg_surname').send_keys 'Doctor'
    @driver.find_element(:id, 'ref_female').click


    @driver.find_element(css: '.btn.btn_white.btn_upload.btn_reg_avatar.ng-binding').click #choose by yourself
    #@driver.find_element(:id,'reg_done_avatar').send_keys 'E:\QA Viktoriia\Изображения\r0X6OluAP7c.jpg'

    sleep 10


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
  end
end
