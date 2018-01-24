class Department < ApplicationRecord

  has_many :courses
  has_many :lecturers
  has_many :assets, through: :courses

  scope :sorted, -> {order(:department_code => :asc)}

end
