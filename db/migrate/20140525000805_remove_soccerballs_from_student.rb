class RemoveSoccerballsFromStudent < ActiveRecord::Migration
  def change
  	remove_column :students, :soccerballs, :string
  end
end
