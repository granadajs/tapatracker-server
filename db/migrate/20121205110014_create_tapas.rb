class CreateTapas < ActiveRecord::Migration
  def change
    create_table :tapas do |t|
      

      t.timestamps
    end
  end
end
