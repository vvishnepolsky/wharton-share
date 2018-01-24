class CreateUserCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
    add_index('user_courses', ['user_id', 'course_id'])
  end
end
