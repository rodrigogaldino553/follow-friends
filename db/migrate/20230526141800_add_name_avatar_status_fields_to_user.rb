class AddNameAvatarStatusFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :status, :string
  end
end
