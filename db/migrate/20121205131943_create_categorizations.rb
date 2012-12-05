class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :tapa
      t.references :category

      t.timestamps
    end
    add_index :categorizations, :tapa_id
    add_index :categorizations, :category_id
  end
end
