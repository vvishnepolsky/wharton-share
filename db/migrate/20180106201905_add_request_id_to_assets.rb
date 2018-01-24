class AddRequestIdToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :request_id, :integer
  end
end
