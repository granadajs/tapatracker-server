class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :tapa

      t.timestamps
    end
    add_index :ratings, :tapa_id
  end
end
