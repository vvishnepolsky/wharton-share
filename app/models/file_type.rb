class FileType < ApplicationRecord

  has_many :assets
  has_many :requests

end
