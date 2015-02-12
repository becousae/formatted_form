class ActionView::TestCase
  include MiscHelpers
  include FormattedForm

  setup :set_controller

  def set_controller
    @controller = MockController.new
  end
end
