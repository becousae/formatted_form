module FormattedForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::NumberHelper

    delegate :content_tag, to: :@template

    def initialize(object_name, object, template, options)
      super
    end

    FIELD_HELPERS = %w[text_field number_field file_field password_field]

    FIELD_HELPERS.each do |method_name|
      with_method_name    = "#{method_name}_with_format"
      without_method_name = "#{method_name}_without_format"


      define_method(with_method_name) do |name, options = {}|
        form_group_options = extract_form_group_options(options)

        form_group(form_group_options) do
          block = ActiveSupport::SafeBuffer.new
          block << g_label(name, form_group_options[:label]) if form_group_options[:label]
          block << send(without_method_name, name, options)
        end
      end

      alias_method_chain method_name, :format
    end

    def price_field(name, options = {})
      options[:min] ||= 0

      if object.is_a?(ActiveRecord::Base)
        options[:value] ||= object[name]
      elsif object.respond_to?(name)
        options[:value] ||= object.send name
      end
      options[:value] = number_with_precision(options[:value], precision: 2)

      number_field(name, options)
    end

    def check_box_with_format(name, options = {}, checked_value = '1', unchecked_value = '0')
      form_group_options = extract_form_group_options(options)

      form_group(form_group_options) do
        block = ActiveSupport::SafeBuffer.new
        block << check_box_without_format(name, options, checked_value, unchecked_value)
        block << g_label(name, form_group_options[:label]) if form_group_options[:label]
      end
    end

    alias_method_chain :check_box, :format

    def date_select_with_format(name, options = {}, html_options = {})
      form_group_options = extract_form_group_options(html_options)

      form_group(form_group_options) do
        block = ActiveSupport::SafeBuffer.new
        block << g_label(name, form_group_options[:label]) if form_group_options[:label]
        block << date_select_without_format(name, options, html_options)
      end
    end

    alias_method_chain :date_select, :format

    def form_group(options, &block)
      content_tag(:div, options.except(:label)) do
        yield
      end
    end

    private

    def extract_form_group_options(options = {}, html_options = nil)
      options.symbolize_keys!

      css_options = html_options || options

      wrapper_class = [FormattedForm.default_wrapper_class, css_options.delete(:wrapper_class)].compact
      wrapper_options = css_options.delete(:wrapper)
      label_class = [FormattedForm.default_label_class, css_options.delete(:label_class)].compact
      label_options = css_options.delete(:label)

      form_group_options = {}
      form_group_options[:class] = wrapper_class unless wrapper_class.empty?

      merge_options(form_group_options, wrapper_options)

      unless options.delete(:skip_label)
        form_group_options[:label] = { }
        form_group_options[:label][:class] = label_class unless label_class.empty?

        merge_options(form_group_options[:label], label_options)
      end

      form_group_options
    end

    def g_label(name, options = {})
      label(name, options[:text] || name, options.except(:text))
    end

    def merge_options(h1, h2)
      if h2.is_a? Hash
        h1.merge!(h2) { |key, v1, v2| v1 << v2 }
      end
    end
  end
end
