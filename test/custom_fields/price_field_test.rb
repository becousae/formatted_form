require 'test_helper'

class PriceFieldTest < ActionView::TestCase
  include FormGenerators

  test 'should be a number_field input' do
    concat_form_for_price_field(:user, :price)
    assert_select 'form input[type="number"]'
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
