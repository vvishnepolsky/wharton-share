class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.string 'filename'
      t.integer 'term'
      t.integer 'year'
      t.integer 'file_type_id'
      t.integer 'course_id'
      t.string 'url'
      t.timestamps
    end
    add_index('assets', ['course_id', 'file_type_id'])
  end
end
