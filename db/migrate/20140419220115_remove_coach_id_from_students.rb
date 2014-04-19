class RemoveCoachIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :coach_id, :integer
  end
end
