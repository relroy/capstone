class AddColumnProductPrice < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, precision: 7, scale: 2
  end
end
