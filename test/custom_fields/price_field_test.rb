require 'test_helper'

class PriceFieldTest < ActionView::TestCase
  def concat_form_for_price_field(object, attribute, *args)
    concat_form_for(object) do |f|
      f.price_field attribute, *args
    end
  end

  test 'should be a number_field input' do
    concat_form_for_price_field(:user, :price)
    assert_select 'form input[type="number"]'
  end

  test 'generates wrapper' do
    concat_form_for_price_field(:user, :price, wrapper_class: 'wrapper')
    assert_select 'form > div.wrapper > input#user_price'
  end

  test 'has minimum set by default' do
    concat_form_for_price_field(:user, :price)
    assert_select 'input[type="number"][min="0"]'
  end

  test 'allows overwriting minimum' do
    concat_form_for_price_field(:user, :price, min: 10)
    assert_select 'input[type="number"][min="10"]'
  end

  test 'allows negative minimum' do
    concat_form_for_price_field(:user, :price, min: -10)
    assert_select 'input[type="number"][min="-10"]'
  end

  test 'formats output value' do
    concat_form_for_price_field(:user, :price, value: 1)
    assert_select 'input#user_price[value="1.00"]'
  end
end
