class CreateLecturers < ActiveRecord::Migration[5.1]
  def change
    create_table :lecturers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :department_id
      t.timestamps
    end
    add_index('lecturers', 'department_id')
  end
end
