class Attendance < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :student_attendances, dependent: :destroy

  def name
    self.created_at.to_formatted_s(:long_ordinal) + " " + self.school.name
  end
end
