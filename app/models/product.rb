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
  
  def flavor_name
    if syrup_flavor
      return "(#{syrup_flavor.name})"
    elsif smoothie_flavor
      return "(#{smoothie_flavor.name})"
    elsif frostbite_flavor
      return "(#{frostbite_flavor.name})"
    elsif frozen_latte_flavor
      return "(#{frozen_latte_flavor.name})"
    elsif ic_flavor
     return "(#{ic_flavor.name})"
    else
      return ""
    end
  end 
  
end

# def num_to_currency
#     return "$" + price.to_s

# end
  
# def sales_tax
#   @tax = (price * 0.0625).round(2)
#   x = @tax.to_s
#   return "Sales Tax: $" + x
# end
