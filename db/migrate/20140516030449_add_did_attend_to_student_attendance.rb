class AddDidAttendToStudentAttendance < ActiveRecord::Migration
  def change
    add_column :student_attendances, :did_attend, :boolean
  end
end
