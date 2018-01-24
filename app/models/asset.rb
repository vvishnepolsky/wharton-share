class Asset < ApplicationRecord

  belongs_to :course
  belongs_to :file_type
  belongs_to :lecturer
  belongs_to :user
  has_one :department, through: :course
  mount_uploader :url, FileUploader

  scope :by_filetype, -> (file_type_id){
    where(["file_type_id = ?", "#{file_type_id}"])
  }

  scope :recent_uploads, ->{order(:created_at => :desc)}

  after_create :add_filename

  def add_filename
    filename = self.url.filename
    self.update_columns(filename: filename)
  end

end
