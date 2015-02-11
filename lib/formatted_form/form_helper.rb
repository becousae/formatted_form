module FormattedForm
  include ActionView::Context
  include ActionView::Helpers::FormHelper

  def f_form_for(*args, &block)
    options = args.extract_options!
    options[:builder] = FormattedForm::FormBuilder
    options[:html] = { class: "formatted_form" }
    form_for(*args << options, &block)
  end

  def url_for(*args)
    "example.com"
  end

  def protect_against_forgery?
    false
  end
end
