require 'test_helper'

class LabelTest < ActionView::TestCase
  test 'generates label by default' do
    concat_form_for_text_field :user, :name
    assert_select 'form > div > label[for="user_name"]'
  end

  test 'allows overwriting label text' do
    concat_form_for_text_field :user, :name, label: { text: "label" }
    assert_select 'form > div > label[for="user_name"]', 'label'
  end

  test 'add default class to labels' do
    swap FormattedForm, default_label_class: 'label_class' do
      concat_form_for_text_field :user, :name
      assert_select 'form > div > label[for="user_name"].label_class'
    end
  end

  test 'allows adding extra label classes' do
    swap FormattedForm, default_label_class: 'label_class' do
      concat_form_for_text_field :user, :name, label: { class: 'custom_label' }
      assert_select 'form > div > label[for="user_name"].label_class.custom_label'
    end
  end

  test 'no label when :skip_label is present' do
    concat_form_for_text_field :user, :name, skip_label: true
    assert_select 'form label', false
  end
end
