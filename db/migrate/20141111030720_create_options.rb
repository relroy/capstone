class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
