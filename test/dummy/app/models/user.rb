class User
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :cost

  def persisted?
    false
  end
end
