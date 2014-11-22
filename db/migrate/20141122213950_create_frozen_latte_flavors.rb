class CreateFrozenLatteFlavors < ActiveRecord::Migration
  def change
    create_table :frozen_latte_flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
