class AddSoccerballsToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :soccerballs, :integer
  end
end
