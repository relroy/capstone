class Flavor < ActiveRecord::Base
  has_many :carted_products
end
