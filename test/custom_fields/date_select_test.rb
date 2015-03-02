require 'test_helper'

class DateSelectTest < ActionView::TestCase
  include FormGenerators

  test 'date_select is called to generate 3 select boxes' do
    concat_form_for_date_select :user, :birth
    assert_select 'select', 3
  end
end
