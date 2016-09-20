module MainModule

  def register
    find('.btn_reg').click

    sleep 3
    find('#reg_email').set ('test@test.com')
    find('#reg_pwd').set ('qqqqqqqq')
    find('#reg_pwd_conf').set 'qqqqqqqq'
    sleep 10
    find('.btn_reg_first').click
    sleep 3
  end

  def rules
    find('.btn_conf_rules').click
    sleep 3
  end
  def first_dot
    find('#reg_name').set 'Main'
    find('#reg_surname').set 'Doctor'
    find('#ref_female').click


    #find('.btn_reg_avatar').click #choose by yourself

   # find(".btn_reg_avatar").click
    #sleep 10
   # page.execute_script('$("#reg_avatar").data("E:\QA Viktoriia\Изображения\r0X6OluAP7c.jpg")')
    #find(".btn_save_avatar").click

    sleep 10


    find('.select.open_slide_pop').click
    sleep 3

    find('*[data-c="ua"]').click
    sleep 3

    page.find(".inp_search.inp_country input", visible: true)
    find('.inp_search.inp_country input').set ('харьков')
    #binding.pry #stop test
    sleep 3
    page.find('*[data-id="6"]', visible: true)
    find('*[data-id="6"]').click

    sleep 3
    find('#reg_tel').set '666666666'
    sleep 3
    find('.go_next div').click
    sleep 5
  end

  def second_dot

    find('#reg_cval').click
    find('.inp_search.inp_country input').set 'второй'
    sleep 3
    find('*[data-id="5"]').click
    sleep 3

    find('.block_educ').click
    sleep 3
    find('*[data-id="220"]').click
    sleep 3
    page.find(".inp_search.inp_country input", visible: true)
    find('.inp_search.inp_country input').set ('харьков')
    sleep 10
    find('*[data-id="6"]').click

    find('[data-id="2"]').click
    find('*[data-id="3"]').click

    find('.btn.btn_white.btn_upload.ng-binding').click
    sleep 5
    find('*[data-file="front"]').click
    sleep 10
    find('*[data-file="back"]').click
    sleep 10

    find('.btn.btn_blue.btn_save_educ.ng-binding').click
    sleep 5

    find('.btn.btn_green.ng-binding').click
    sleep 5
  end

  def third_dot
#    page.find("#reg_tags", visible: true)
    find('.drop_list input').click
    sleep 3
    find('*[data-id="2"]').click
    find('.choose.choose_educt').click
    find('.inp_search.inp_country input').set 'центр'
    sleep 3
    find('*[data-id="31"]').click
    sleep 3
    find('*[data-id="2010"]').click
    sleep 3
    find('*[data-id="2010"]').click
    sleep 3
    find('*[data-id="28"]').click

    page.find(".go_next", visible: true)
    find('.btn.btn_green.ng-binding').click
    sleep 5
  end

  def fouth_dot
    find('#reg_add_info').set 'Я лучше всех.'
    find('.btn.btn_green.ng-binding').click
    sleep 5
  end

  def fifth_dot
    page.find("#reg_card", visible: true)
    find('#reg_card').click

    find('#reg_card').set '4111111111111111'
    sleep 2
    page.find(".go_next", visible: true)
    find('.btn.btn_green.ng-binding').click
    sleep 5
  end
  def finish
    page.find(".rcb.reg_complet_footer", visible: true)
    find('.btn.btn_green.btn_reg_complet.ng-binding').click
    sleep 5
  end
end
