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
    FormattedForm.default_form_class = "formatted_form"
    concat_form_for(:user)
    assert_select 'form.formatted_form'
  end

  test 'Formattedform allows adding new formclasses' do
    FormattedForm.default_form_class = 'formatted_form'
    concat_form_for :user, html: { class: %w[new_class new_class2] }, &(proc {})
    assert_select 'form.formatted_form'
    assert_select 'form.new_class'
    assert_select 'form.new_class2'
  end

  test 'FormattedForm passes options to form' do
    concat_form_for :user, url: '/user', html: { id: 'custom_form' }
    assert_select 'form#custom_form'
    assert_select 'form[action="/user"]'
  end
end
