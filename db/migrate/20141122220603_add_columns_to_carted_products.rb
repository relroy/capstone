class AddColumnsToCartedProducts < ActiveRecord::Migration
  def change
    add_column :carted_products, :syrup_flavor_id, :integer
    add_column :carted_products, :frostbite_flavor_id, :integer
    add_column :carted_products, :frozen_latte_flavor_id, :integer
    add_column :carted_products, :smoothie_flavor_id, :integer
  end
end
