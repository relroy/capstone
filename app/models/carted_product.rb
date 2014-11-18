class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  has_many :containers
  has_many :ic_flavors
  has_many :options
  has_many :flavors
  has_many :sizes

  










  
end