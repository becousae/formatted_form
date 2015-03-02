# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require 'action_view/test_case'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
# Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# ActionView::RoutingUrlFor.send(:include, ActionDispatch::Routing::UrlFor)

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

LABELS_TO_TEST = %w[
  text_field
  number_field
  file_field
  password_field
  date_select
  datetime_select
  check_box
  price_field
]

WRAPPERS_TO_TEST = %w[
  text_field
  number_field
  file_field
  password_field
  date_select
  datetime_select
  check_box
  price_field
  radio_button
]
