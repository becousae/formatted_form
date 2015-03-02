require 'test_helper'

class LabelTest < ActionView::TestCase
  include FormGenerators

  LABELS_TO_TEST.each do |input|
    test "#{input} generates label by default" do
      send "concat_form_for_#{input}", :user, :name
      assert_select 'label[for="user_name"]'
    end

    test "#{input} allows overwriting label text" do
      send "concat_form_for_#{input}", :user, :name, label: { text: "label" }
      assert_select 'label[for="user_name"]', 'label'
    end

    test "#{input} add default class to labels" do
      swap FormattedForm, default_label_class: 'label_class' do
        send "concat_form_for_#{input}", :user, :name
        assert_select 'label[for="user_name"].label_class'
      end
    end

    test "#{input} allows adding extra label classes" do
      swap FormattedForm, default_label_class: 'label_class' do
        send "concat_form_for_#{input}", :user, :name, label: { class: 'custom_label' }
        assert_select 'label[for="user_name"].label_class.custom_label'
      end
    end

    test "#{input} no label when :skip_label is present" do
      send "concat_form_for_#{input}", :user, :name, skip_label: true
      assert_select 'label', false
    end
  end
end
