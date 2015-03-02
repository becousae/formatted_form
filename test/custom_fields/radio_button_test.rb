require 'test_helper'

class RadioButtonTest < ActionView::TestCase
  include FormGenerators

  test 'generates right label' do
    concat_form_for_radio_button :user, :admin
    assert_select 'label[for="user_admin_check"]'
  end

  test 'should generate radio buttons' do
    concat_form_for_radio_button :user, :agreed
    assert_select 'input#user_agreed_check[type="radio"]', 1
  end

  test 'generates label with correct text' do
    concat_form_for_radio_button :user, :agreed
    assert_select 'label[for="user_agreed_check"]', 'check'
  end

  test 'generates wrapper' do
    concat_form_for_radio_button :user, :agreed
    assert_select 'form > div > input#user_agreed_check'
  end
end
