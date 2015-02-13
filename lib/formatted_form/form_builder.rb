module FormattedForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, to: :@template

    FIELD_HELPERS = %w[text_field]

    FIELD_HELPERS.each do |method_name|
      with_method_name    = "#{method_name}_with_format"
      without_method_name = "#{method_name}_without_format"

      define_method(with_method_name) do |name, options = {}|
        form_group_builder(name, options) do
          send(without_method_name, name, options)
        end
      end

      alias_method_chain method_name, :format
    end


    def form_group(*args, &block)
      options = args.extract_options!
      name = args.first

      content_tag(:div, options.except(:label)) do
        if options[:label]
          g_label(name, options[:label]) + yield
        else
          yield
        end
      end
    end

    def form_group_builder(method, options, html_options = nil)
      options.symbolize_keys!

      css_options = html_options || options

      wrapper_class = [FormattedForm.default_wrapper_class, css_options.delete(:wrapper_class)].compact
      wrapper_options = css_options.delete(:wrapper)
      label_class = [FormattedForm.default_label_class, css_options.delete(:label_class)].compact
      label_options = css_options.delete(:label)

      form_group_options = {}
      form_group_options[:class] = wrapper_class unless wrapper_class.empty?

      if wrapper_options.is_a? Hash
        form_group_options.merge!(wrapper_options) { |key, v1, v2| v1 << v2 }
      end

      unless options.delete(:skip_label)
        form_group_options[:label] = { class: label_class }

        if label_options.is_a? Hash
          form_group_options[:label].merge!(label_options) { |key, v1, v2| v1 << v2 }
        end
      end

      form_group(method, form_group_options) do
        yield
      end
    end

    private

    def g_label(name, options)
      options ||= {}
      label(name, options[:text] || name, options.except(:text))
    end
  end
end
