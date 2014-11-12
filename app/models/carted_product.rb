class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  has_many :containers, :through => :products
  has_many :ic_flavors, :through => :products
  has_many :options, :through => :products
  has_many :flavors, :through => :products
  has_many :sizes, :through => :products
end
