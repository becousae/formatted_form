module MiscHelpers
  def concat_form_for(*args, &block)
    concat f_form_for(*args, &(block || proc {}))
  end

  def concat_form_for_text_field(object, attribute, *args)
    concat_form_for(object) do |f|
      f.text_field attribute, *args
    end
  end

  def swap(object, new_values)
    old_values = {}
    new_values.each do |key, value|
      old_values[key] = object.send key
      object.send :"#{key}=", value
    end
    yield
  ensure
    old_values.each do |key, value|
      object.send :"#{key}=", value
    end
  end
end
