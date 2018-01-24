class Course < ApplicationRecord

  belongs_to :department
  has_many :assets
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :requests

  scope :sorted, -> {order(:course_code => :asc)}

  def display_full_code
    dep = self.department.department_code
    course_code = self.course_code
    return "#{dep} #{course_code}"
  end


end
