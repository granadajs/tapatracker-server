class AddUserIdToTapas < ActiveRecord::Migration
  def change
    add_column :tapas, :user_id, :integer
  end
end
