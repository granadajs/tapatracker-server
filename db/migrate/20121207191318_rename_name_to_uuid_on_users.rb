class RenameNameToUuidOnUsers < ActiveRecord::Migration
  def up
    rename_column :users, :name, :uuid
  end

  def down
    rename_column :users, :uuid, :name
  end
end
