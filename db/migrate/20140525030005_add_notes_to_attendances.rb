class AddNotesToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :notes, :string
  end
end
