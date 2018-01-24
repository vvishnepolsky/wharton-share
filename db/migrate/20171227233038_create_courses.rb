class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string 'course_code'
      t.string 'course_description'
      t.integer 'department_id'
      t.timestamps
    end
    add_index('courses', 'department_id')
  end
end
