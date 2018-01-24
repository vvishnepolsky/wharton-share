class AddIndexesToAssets < ActiveRecord::Migration[5.1]
  def change
  end
  add_index('assets', ['course_id', 'file_type_id', 'user_id'])
end
