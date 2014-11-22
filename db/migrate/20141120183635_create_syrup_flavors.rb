class CreateSyrupFlavors < ActiveRecord::Migration
  def change
    create_table :syrup_flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
