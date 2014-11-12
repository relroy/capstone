class CreateIcFlavors < ActiveRecord::Migration
  def change
    create_table :ic_flavors do |t|
      t.string :name

      t.timestamps
    end
  end
end
