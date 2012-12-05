class AddLocationIdToTapas < ActiveRecord::Migration
  def change
    add_column :tapas, :location_id, :integer
    add_index :tapas, :location_id
  end
end
