class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :flavor
  belongs_to :container
  belongs_to :ic_flavor
  belongs_to :options
  belongs_to :frostbite_flavor
  belongs_to :smoothie_flavor
  belongs_to :syrup_flavor
  belongs_to :frozen_latte_flavor
  # has_many :flavors
  belongs_to :sizes
  validates :quantity, :numericality => true

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
  # def ic_flavor_name
  #   if ic_flavor
  #    return "(#{ic_flavor.name})"
  #   else
  #   return ""
  #   end
  # end 
  # def smoothie_flavor_name
  #   if smoothie_flavor
  #     return "(#{smoothie_flavor.name})"
  #   else
  #     return ""
  #   end
  # end 
  # def syrup_flavor_name
  #   if syrup_flavor
  #     return "(#{syrup_flavor.name})"
  #   else
  #     return ""
  #   end
  # end 
  # def frostbite_flavor_name
  #   if frostbite_flavor
  #     return "(#{frostbite_flavor.name})"
  #   else
  #     return ""
  #   end
  # end 
  # def flavor_options
  #   carted_products.each do |carted_product|
  #     if carted_product.product.category_id = 1
  #       return "(#{syrup_flavor.name})"
  #     end

  #   end  
  # end  
end