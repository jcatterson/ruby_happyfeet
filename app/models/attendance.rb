class Attendance < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :student_attendances, dependent: :destroy
end
