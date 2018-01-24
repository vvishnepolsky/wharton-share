class AddLecturerToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :lecturer_id, :integer
  end
end
