class CreateTapas < ActiveRecord::Migration
  def change
    create_table :tapas do |t|
      t.string :title
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
