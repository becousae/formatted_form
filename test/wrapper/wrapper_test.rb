require 'test_helper'

class WrapperTest < ActionView::TestCase
  include FormGenerators

  WRAPPERS_TO_TEST.each do |input|
    test "#{input} generates wrapper div by default" do
      send "concat_form_for_#{input}", :user, :name
      assert_select 'form > div'
    end

    test "#{input} add default wrapper class" do
      FormattedForm.default_wrapper_class = 'wrapper_class'
      send "concat_form_for_#{input}", :user, :name
      assert_select 'form > div.wrapper_class'
    end

    test "#{input} passes options from :wrapper to div.wrapper" do
      send "concat_form_for_#{input}", :user, :name, wrapper: { class: 'wrapper_class', id: 'wrapper_id' }
      assert_select 'form > div.wrapper_class'
      assert_select 'form > div#wrapper_id'
    end

    test "#{input} doesn't overwrite default wrapper class with new classes" do
      FormattedForm.default_wrapper_class = 'def_wrapper_class'
      send "concat_form_for_#{input}", :user, :name, wrapper: { class: 'wrapper_class' }
      assert_select 'form > div.def_wrapper_class.wrapper_class'
    end
  end
end
