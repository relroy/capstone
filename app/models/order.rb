class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, :through => :carted_products
  belongs_to :user
  validates :user_id, :numericality => true
  validates :status, :presence => true
 
end
def sub_total
  carted_products = Carted_product.all
  sub_total = 0
  carted_products.each do |carted_product|
    sub_total += carted_product.product.price * carted_product.quantity
  
  end
  return sub_total
end
