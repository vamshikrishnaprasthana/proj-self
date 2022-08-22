class Order < ApplicationRecord
  has_many :orderitems
  before_save :set_subtotal
  def subtotal
    orderitems.collect{|orderitem| orderitem.valid? ? orderitem.unit_price*orderitem.quantity : 0}.sum
  end
  private
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
