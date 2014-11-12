class AddIdColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :container_id, :integer
    add_column :products, :ic_flavor_id, :integer
    add_column :products, :option_id, :integer
    add_column :products, :size_id, :integer
    add_column :products, :flavor_id, :integer

  end
end
