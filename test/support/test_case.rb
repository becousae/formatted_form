class ActionView::TestCase
  setup :set_controller

  def set_controller
    @controller = MockController.new
  end
end
