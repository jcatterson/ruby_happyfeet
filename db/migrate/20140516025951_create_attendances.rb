class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :school_id
      t.integer :coach_id
      t.datetime :attendance_date

      t.timestamps
    end
  end
end
