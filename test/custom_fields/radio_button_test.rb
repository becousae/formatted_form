require 'test_helper'

class RadioButtonTest < ActionView::TestCase
  def concat_form_for_radio_button_field(object, attribute, *args)
    concat_form_for(object) do |f|
      f.radio_button attribute, "check", *args
    end
  end

  test 'should generate radio buttons' do
    concat_form_for_radio_button_field :user, :agreed
    assert_select 'input#user_agreed_check[type="radio"]', 1
  end

  test 'generates label with correct text' do
    concat_form_for_radio_button_field :user, :agreed
    assert_select 'label[for="user_agreed_check"]', 'check'
  end

  test 'generates wrapper' do
    concat_form_for_radio_button_field :user, :agreed
    assert_select 'form > div > input#user_agreed_check'
  end
end
