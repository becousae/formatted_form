module FormattedForm
  include ActionView::Context
  include ActionView::Helpers::FormHelper

  def f_form_for(*args, &block)
    form_for(*args, &block)
  end

  def url_for(*args)
    "example.com"
  end

  def protect_against_forgery?
    false
  end
end
