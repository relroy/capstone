class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
