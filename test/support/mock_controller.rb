class MockController
  def url_for(*args)
    "example.com"
  end

  def url_options
    {}
  end

  def _routes
    self
  end
end

