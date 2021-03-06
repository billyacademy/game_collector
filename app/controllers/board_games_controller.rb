class BoardGamesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :index
  def index
    @board_games = BoardGame.all.limit(10)
  end

  def new
    @board_game = BoardGame.new
  end

  def create
    @board_game = BoardGame.new(board_game_params)
    if @board_game.save
      redirect_to board_games_path, notice: "Board Game Created!"
    else
      render :new
    end
  end
  private

  def board_game_params
    params.require(:board_game).permit(:name,
    :publisher,
    :description,
    :release_date)
  end
end
