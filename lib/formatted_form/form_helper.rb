module FormattedForm
  include ActionView::Context
  include ActionView::Helpers::FormHelper

  def f_form_for(*args, &block)
    options = args.extract_options!
    options[:builder] = FormattedForm::FormBuilder

    options[:html] ||= {}
    options[:html][:class] = [ FormattedForm.default_form_class, options[:html][:class]].compact

    form_for(*args << options, &block)
  end
end
