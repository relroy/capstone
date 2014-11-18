class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, :through => :carted_products
  belongs_to :user
  validates :user_id, :numericality => true
  validates :status, :presence => true
 

  def sub_total
    sub_total = 0
    carted_products.each do |carted_product|
      sub_total += carted_product.product.price * carted_product.quantity
    
    end
    return sub_total
  end
  def sales_tax
    sub_total = 0
    carted_products.each do |carted_product|
      sub_total += carted_product.product.price * carted_product.quantity
    end
      sales_tax = (sub_total * 0.0625).round(2)
    return sales_tax   
  end
  def total
    total = sub_total + sales_tax
  end
end