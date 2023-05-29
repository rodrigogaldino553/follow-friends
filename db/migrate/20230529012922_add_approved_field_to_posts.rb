class AddApprovedFieldToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :approved, :boolean, null: false, default: true
  end
end
