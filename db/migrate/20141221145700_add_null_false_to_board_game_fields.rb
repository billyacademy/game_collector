class AddNullFalseToBoardGameFields < ActiveRecord::Migration
  def change
    change_column_null :board_games, :description, true
    change_column_null :board_games, :release_date, true
  end
end
