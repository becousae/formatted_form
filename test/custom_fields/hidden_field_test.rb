require 'test_helper'

class HiddenFieldTest < ActionView::TestCase
  def concat_form_for_hidden_field(object, attribute, options = {})
    concat_form_for(object) do |f|
      f.hidden_field attribute, options
    end
  end

  test 'generates hidden field' do
    concat_form_for_hidden_field :user, :id
    assert_select 'form > input#user_id[type="hidden"]'
  end

  test 'doesn\'t generate wrapper or label' do
    concat_form_for_hidden_field :user, :id
    assert_select 'form > div', false
    assert_select 'form label', false
  end
end
