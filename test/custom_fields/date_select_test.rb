require 'test_helper'

class DateSelectTest < ActionView::TestCase
  def concat_form_for_date_select_field(object, attribute, options = {}, html_options = {})
    concat_form_for(object) do |f|
      f.date_select attribute, options, html_options
    end
  end

  test 'date_select is called to generate 3 select boxes' do
    concat_form_for_date_select_field :user, :birth
    assert_select 'select', 3
  end

  test 'generates wrapper' do
    concat_form_for_date_select_field :user, :birth
    assert_select 'form > div > select', 3
  end

  test 'generates label' do
    concat_form_for_date_select_field :user, :birth
    assert_select 'label[for="user_birth"]'
  end
end
