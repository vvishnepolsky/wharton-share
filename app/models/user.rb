class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@wharton\.upenn\.edu\z/,
                message: "You must use a Wharton email to sign up" }

  has_many :assets
  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :requests

end
