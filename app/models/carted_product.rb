class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :flavor
  belongs_to :containers
  belongs_to :ic_flavors
  belongs_to :options
  # has_many :flavors
  belongs_to :sizes

  validates :quantity, :numericality => true

  def flavor_name
    if flavor
      return "(#{flavor.name})"
    else
      return ""
    end
  end 
  def ic_flavor_name
    if ic_flavor
     return "(#{ic_flavor.name})"
    else
    return ""
    end
  end 










  
end