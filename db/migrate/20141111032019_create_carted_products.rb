class CreateCartedProducts < ActiveRecord::Migration
  def change
    create_table :carted_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :size_id
      t.integer :flavor_id
      t.integer :option_id
      t.integer :container_id
      t.integer :ic_flavor_id
      t.integer :quantity

      t.timestamps
    end
  end
end
