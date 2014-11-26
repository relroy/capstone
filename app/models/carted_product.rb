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
end