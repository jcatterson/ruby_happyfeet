class RemoveNotesFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :notes, :string
  end
end
