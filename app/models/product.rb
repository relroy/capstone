class Product < ActiveRecord::Base
  has_many :carted_products
  has_many :orders, :through => :carted_products
  has_many :containers
  has_many :ic_flavors
  has_many :options
  has_many :flavors
  has_many :sizes

  validates :name, :presence => true

  validates :price, :numericality => true
  

  
end

def num_to_currency
    return "$" + price.to_s

end
  
def sales_tax
  @tax = (price * 0.0625).round(2)
  x = @tax.to_s
  return "Sales Tax: $" + x
end
