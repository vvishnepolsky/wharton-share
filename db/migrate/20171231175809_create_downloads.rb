class CreateDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :downloads do |t|
      t.integer :user_id
      t.integer :asset_id
      t.timestamps
    end
    add_index('downloads', ['user_id','asset_id'])
  end
end
