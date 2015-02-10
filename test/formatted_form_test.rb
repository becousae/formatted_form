require 'test_helper'

class FormattedFormTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, FormattedForm
  end

  test "function f_form_for exist" do
    f_form_for :user do |f|
      assert_kind_of Module, FormattedForm
    end
  end
end
