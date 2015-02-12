module MiscHelpers
  def concat_form_for(*args, &block)
    concat(f_form_for(*args, &(block || proc {})))
  end
end
