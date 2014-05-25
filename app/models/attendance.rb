class Attendance < ActiveRecord::Base
  belongs_to :coach
  has_many :student_attendances, dependent: :destroy
end
