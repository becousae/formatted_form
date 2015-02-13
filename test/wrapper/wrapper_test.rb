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

  test 'allows adding extra wrapper classes' do
    FormattedForm.default_wrapper_class = 'wrapper_class'
    concat_form_for :user do |f|
      f.text_field :name, wrapper_class: 'name_wrapper'
    end
    assert_select 'form > div.wrapper_class.name_wrapper > input#user_name'
  end

  test 'passes options from :wrapper to div.wrapper' do
    concat_form_for :user do |f|
      f.text_field :name, wrapper_class: 'wrapper_class', wrapper: { id: 'wrapper_id' }
    end
    assert_select 'form > div#wrapper_id > input#user_name'
  end

  test 'class in :wrapper doesn\'t overwrite :wrapper_class' do
    FormattedForm.default_wrapper_class = 'default_wrapper_class'
    concat_form_for :user do |f|
      f.text_field :name, wrapper_class: 'wrapper_class', wrapper: { class: 'wrapper' }
    end
    assert_select 'form > div.default_wrapper_class.wrapper_class.wrapper > input#user_name'
  end
end
