require 'test_helper'

class WrapperTest < ActionView::TestCase
  test 'generates wrapper div by default' do
    concat_form_for :user do |f|
      f.text_field :name
    end
    assert_select 'form > div > input#user_name'
  end

  test 'add default wrapper class' do
    FormattedForm.default_wrapper_class = 'wrapper_class'
    concat_form_for :user do |f|
      f.text_field :name
    end
    assert_select 'form > div.wrapper_class > input#user_name'
  end

  test 'passes options from :wrapper to div.wrapper' do
    concat_form_for :user do |f|
      f.text_field :name, wrapper: { class: 'wrapper_class', id: 'wrapper_id' }
    end
    assert_select 'form > div.wrapper_class > input#user_name'
    assert_select 'form > div#wrapper_id > input#user_name'
  end
end
