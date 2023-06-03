class AddQrcodeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :qrcode, :text
  end
end
