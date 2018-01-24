class AddUserIdToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :user_id, :integer
  end
end
