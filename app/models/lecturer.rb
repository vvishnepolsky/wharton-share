class Lecturer < ApplicationRecord

  belongs_to :department
  has_many :assets
end
