class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :file_type_id
      t.integer :lecturer_id
      t.string :description
      t.integer :closed_by_user_id
      t.integer :asset_id
      t.boolean :is_completed, :default => false
      t.timestamps
    end
    add_index('requests', 'course_id')
    add_index('requests', 'user_id')
    add_index('requests', 'file_type_id')
    add_index('requests', 'lecturer_id')
  end
end
