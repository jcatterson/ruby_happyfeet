class AddPaidAndTShirtAndSoccerBallsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :paid, :boolean
    add_column :students, :tshirt, :integer
    add_column :students, :soccerballs, :string
    add_column :students, :integer, :string
  end
end
