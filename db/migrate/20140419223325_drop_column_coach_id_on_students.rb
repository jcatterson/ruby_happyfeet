class DropColumnCoachIdOnStudents < ActiveRecord::Migration
  def change
    remove_column :students, :coach_id
  end
end
