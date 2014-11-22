class CreateSmoothieFlavors < ActiveRecord::Migration
  def change
    create_table :smoothie_flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
