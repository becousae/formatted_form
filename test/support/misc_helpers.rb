module MiscHelpers
  def concat_form_for(name, &block)
    concat(f_form_for(name, &(block || proc {})))
  end
end
