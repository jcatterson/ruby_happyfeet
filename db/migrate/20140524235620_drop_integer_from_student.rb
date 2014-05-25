class DropIntegerFromStudent < ActiveRecord::Migration
  def change
  	remove_column :students, :integer, :string
  end
end
