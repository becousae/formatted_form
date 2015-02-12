require 'test_helper'

class FormHelperTest < ActionView::TestCase
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
    assert_select 'form.formatted_form.new_class.new_class2'
  end

  test 'FormattedForm passes options to form' do
    concat_form_for :user,
      namespace:          'namespace',
      url:                '/url',
      method:             'patch',
      remote:             true,
      enforce_utf8:       false,
      html: {
        id: 'custom_form'
      } do |f|
      f.text_field :name, value: ""
    end
    assert_select 'form#custom_form' do
      assert_select ' input#namespace_user_name'
      assert_select '[action="/url"]'
      assert_select '[method="post"]'
      assert_select 'input[name="_method"][value=?]', 'patch'
      assert_select '[data-remote="true"]'
      assert_select 'input[name="utf8"]', false
    end
  end
end
