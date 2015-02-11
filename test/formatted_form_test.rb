require 'test_helper'

class FormattedFormTest < ActionView::TestCase
  include MiscHelpers

  test "function f_form_for exist" do
    f_form_for :user do |f| end
  end

  test "f_form_for uses right formbuilder" do
    f_form_for :user do |f|
      assert_kind_of FormattedForm::FormBuilder, f
    end
  end

  test 'FormattedForm adds default class to form' do
    concat_form_for(:user)
    assert_select 'form.formatted_form'
  end
end
