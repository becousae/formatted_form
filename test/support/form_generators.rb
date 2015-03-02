module FormGenerators
  def concat_form_for_text_field(object, attribute, *args)
    concat_form_for object do |f|
      f.text_field attribute, *args
    end
  end

  def concat_form_for_number_field(object, attribute, *args)
    concat_form_for object do |f|
      f.number_field attribute, *args
    end
  end

  def concat_form_for_file_field(object, attribute, *args)
    concat_form_for object do |f|
      f.file_field attribute, *args
    end
  end

  def concat_form_for_password_field(object, attribute, *args)
    concat_form_for object do |f|
      f.password_field attribute, *args
    end
  end

  def concat_form_for_date_select(object, attribute, *args)
    concat_form_for(object) do |f|
      f.date_select attribute, {}, *args
    end
  end

  def concat_form_for_datetime_select(object, attribute, *args)
    concat_form_for object do |f|
      f.datetime_select attribute, {}, *args
    end
  end

  def concat_form_for_price_field(object, attribute, *args)
    concat_form_for object do |f|
      f.price_field attribute, *args
    end
  end

  def concat_form_for_check_box(object, attribute, *args)
    concat_form_for object do |f|
      f.check_box attribute, *args
    end
  end

  def concat_form_for_radio_button(object, attribute, *args)
    concat_form_for(object) do |f|
      f.radio_button attribute, "check", *args
    end
  end
end
