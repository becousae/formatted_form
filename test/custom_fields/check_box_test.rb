require 'test_helper'

class CheckBoxTest < ActionView::TestCase
  include FormGenerators

  test 'generates check_box with hidden field' do
    concat_form_for_check_box :user, :admin
    assert_select 'input#user_admin[type="checkbox"][value="1"]'
    assert_select 'input[name="user[admin]"][type="hidden"][value="0"]'
  end

  test 'allows overwriting values' do
    concat_form_for_check_box :user, :admin, {}, "no", "yes"
    assert_select 'input#user_admin[type="checkbox"][value="no"]'
    assert_select 'input[name="user[admin]"][type="hidden"][value="yes"]'
  end
end
