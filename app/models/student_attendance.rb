class StudentAttendance < ActiveRecord::Base
  belongs_to :attendance
  belongs_to :student
end
