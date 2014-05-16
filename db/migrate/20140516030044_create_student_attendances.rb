class CreateStudentAttendances < ActiveRecord::Migration
  def change
    create_table :student_attendances do |t|
      t.integer :attendance_id
      t.integer :student_id

      t.timestamps
    end
  end
end
