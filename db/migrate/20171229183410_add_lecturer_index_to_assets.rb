class AddLecturerIndexToAssets < ActiveRecord::Migration[5.1]
  def change
  end
  add_index('assets', ['lecturer_id'])
end
