class ChangeTermColumnToText < ActiveRecord::Migration[5.1]
  def change
    change_column(:assets, :term, :text)
  end
end
