class Product < ActiveRecord::Base
  has_many :carted_products
  has_many :orders, :through => :carted_products
  has_many :containers
  has_many :ic_flavors
  has_many :options
  has_many :flavors
  has_many :sizes

  
end
