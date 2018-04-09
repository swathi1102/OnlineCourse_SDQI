class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  # validates :grade, :semester, :year, :course_id, :user_id , uniqueness: true

end
