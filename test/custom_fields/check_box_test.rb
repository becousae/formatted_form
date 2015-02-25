require 'test_helper'

class CheckBoxTest < ActionView::TestCase
  def concat_form_for_check_box_field(object, attribute, *args)
    concat_form_for(object) do |f|
      f.check_box attribute, *args
    end
  end

  test 'generates check_box with hidden field' do
    concat_form_for_check_box_field :user, :admin
    assert_select 'input#user_admin[type="checkbox"][value="1"]'
    assert_select 'input[name="user[admin]"][type="hidden"][value="0"]'
  end

  test 'allows overwriting values' do
    concat_form_for_check_box_field :user, :admin, {}, "no", "yes"
    assert_select 'input#user_admin[type="checkbox"][value="no"]'
    assert_select 'input[name="user[admin]"][type="hidden"][value="yes"]'
  end

  test 'generates wrapper' do
    concat_form_for_check_box_field(:user, :admin, wrapper_class: 'wrapper')
    assert_select 'form > div.wrapper > input#user_admin'
  end

  test 'generates label' do
    concat_form_for_check_box_field(:user, :admin)
    assert_select 'form > div > input[type="checkbox"] + label[for="user_admin"]'
  end
end
