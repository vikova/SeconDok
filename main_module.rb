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

  def second_dot
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

  def third_dot
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

  def fouth_dot
    @driver.find_elements(:id, 'reg_add_info').each do |info|
      info.send_keys 'Я лучше всех.' if info.displayed?
    end
    @driver.find_elements(css: '.btn.btn_green.ng-binding').each do |next_button|
      next_button.click if next_button.displayed?
    end
    sleep 5
  end

  def fifth_dot
    @wait.until { @driver.find_elements(css: '.ng-pristine.ng-valid.ng-empty.ng-touched') }
    @driver.find_elements(css: '.ng-pristine.ng-valid.ng-empty.ng-touched').each do |card1|
      card1.click if card1.displayed?
    end

    @driver.find_elements(:id, 'reg_card').each do |card|
      card.send_keys '4111111111111111' if card.displayed?
    end
    sleep 2
    @wait.until { @driver.find_elements(css: '.go_next') }
    @driver.find_elements(css: '.btn.btn_green.ng-binding').each do |next_button1|
      next_button1.click if next_button1.displayed?
    end
    sleep 5
  end
  def finish
    @wait.until { @driver.find_elements(css: '.rcb.reg_complet_footer') }
    @driver.find_elements(css: '.btn.btn_green.btn_reg_complet.ng-binding').each do |next_button1|
      next_button1.click if next_button1.displayed?
    end
    sleep 5
  end
end
