class Request < ApplicationRecord

  belongs_to :course
  belongs_to :user
  belongs_to :file_type

  scope :open_requests, -> {where(:is_completed => false)}

  def complete_request(completed_by_user_id, asset_id)
    self.update_columns(:closed_by_user_id => completed_by_user_id,
      :asset_id => asset_id, :is_completed => true)
  end

end
