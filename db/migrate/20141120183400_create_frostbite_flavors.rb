class CreateFrostbiteFlavors < ActiveRecord::Migration
  def change
    create_table :frostbite_flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
