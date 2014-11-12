class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total, precision: 5, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
