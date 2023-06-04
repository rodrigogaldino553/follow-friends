class ChangeDefaultValueForPostsApproved < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :approved, true
  end
end
