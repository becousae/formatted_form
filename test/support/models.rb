class Item
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :price

  def persisted?
    false
  end
end

