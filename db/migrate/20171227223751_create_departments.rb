class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string 'department_code'
      t.string 'department_description'
      t.timestamps
    end
  end
end
