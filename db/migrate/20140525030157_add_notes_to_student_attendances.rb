class AddNotesToStudentAttendances < ActiveRecord::Migration
  def change
    add_column :student_attendances, :notes, :string
  end
end
