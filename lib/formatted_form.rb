require 'formatted_form/form_helper'
require 'formatted_form/form_builder'

require 'formatted_form/railtie' if defined?(Rails)

module FormattedForm
  mattr_accessor :default_form_class
  @@default_form_class = nil

  mattr_accessor :default_wrapper_class
  @@default_wrapper_class = nil

  mattr_accessor :default_label_class
  @@default_label_class = nil
end
